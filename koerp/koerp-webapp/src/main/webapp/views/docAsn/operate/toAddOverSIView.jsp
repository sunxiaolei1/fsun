<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<!-- 查询条件 -->
<%@include file="../../addtoolbar.jsp"%>
	
<div class="fsun-wrap">
	<form id="orderfm">
		<span class="title" style="top: 35px;">单据基本信息</span>		
		<input id="iId" name="iId" hidden="true" />	
		<input id="toShopId" name="toShopId" hidden="true" />	
		<input id="orderPrice" name="orderPrice" hidden="true" />	
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">单据编号<span style="color:red;">*</span></th>
				<td>
					<input id="asnNo" name="asnNo" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">单据类型<span style="color:red;">*</span></th>
				<td>
					<input id="asnType" name="asnType" class="easyui-combobox" editable="false" required/>								
				</td>					
				<th width="12%">入库店仓<span style="color:red;">*</span></th>
				<td colspan="3" >
					<input id="toShopName" name="toShopName" class="easyui-textbox" style="width:256px;" readOnly />								
				</td>								
	        </tr>		               		
	        <tr>
	        	<th width="12%">备注</th>
				<td colspan="7">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:800px;height:50px;"/>
				</td>	        	
	        </tr>
		</table>
	</form>			
</div>	
<div style="height: 350px; width: 100%;">
	<div id="detailskutoolbar" style="display:none;">
		<%@include file="./detailskutoolbar.jsp"%>
	</div>
	<table id="orderDetailDataGrid"></table>
</div>					

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currOrderDetailDataGrid;
var $orderfm ;

$(function () { 
	
	$orderfm = $("#orderfm");   		
	currOrderDetailDataGrid = $("#orderDetailDataGrid");
	
	$('#asnType', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docAsnTypeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	currOrderDetailDataGrid.datagrid({
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    idField:"sku",
	    sortName:"sku",
        sortOrder:"asc",	
        pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    toolbar: "#detailskutoolbar",
	    columns:[[
			{field:'ck',checkbox:true},
			{field:"sku",title:"SKU", width:80,align:"center"},
			{field:"goodsName",title:"商品名称", width:140,align:"center"},
			{field:"barCode",title:"条形码", width:140,align:"center"},
			{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
				return formatter(value, window.parent.brandCode); 
			}},
			{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.categoryCode); 
			}},
			{field:'property',title:'规格',width:120,align:'center',sortable:true},
			//{field:"costPrice",title:"成本价", width:80,align:"center",formatter:numBaseFormat},
			{field:"price",title:"单价", width:80,align:"center",formatter:numBaseFormat},
			{field:"receiveQty",title:"数量", width:80,align:"center",
				styler: function(value, rowData, rowIndex){
			    	return 'font-weight:bold;color:green;';
			    },
			    formatter:intNumBaseFormat,
				editor:{
					type:'numberbox',
					options:{					
						min:1,
						precision:0,
						required: true
					}
				}
			},
			{field:"unit",title:"单位",width:70,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.unitCode); 
			}},
			{field:"stockIn",title:"操作",width:80,align:"center", 
				formatter: function(value, row, index){						
					return commonAssemBottonHtml('delOne', index, '删除', 'icon-script_delete');													
				}
			}
	    ]],
	    loadFilter:function(data) { 
	    	//排序拦截器
    		sortFilter($(this), data);
    		//分页拦截器
    		return pagerFilter($(this), data);   
        },
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
	
	$.ajax({
		type : "GET",
		url : "${api}/doc/asn/getInitData",
		data:{
			"asnNo":"",
			"asnType": "22"
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docAsnDto = result.entry;
			
			/***************************              基本信息初始化                        ************************/			
			var header = docAsnDto.header;
			if(header!=null){
				$orderfm.form("load", header);	
			}
			
			var details = docAsnDto.details;	
			if(details!=null && details.length>0){
				currDetailData = details;
				skuListReLoad();
			}		
	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});

/**
 * 删除单个
 */
function delOne(rowIndex){	
	var rowData = currOrderDetailDataGrid.datagrid('getRows')[rowIndex];	
	for(var i in currDetailData) {	
		if(existSku(currDetailData[i], rowData.sku)) {
			currDetailData.splice(i,1);	
			break;
		}
	}	
	currOrderDetailDataGrid.datagrid("deleteRow",rowIndex).datagrid("loadData", currDetailData);
}

//商品列表刷新
function skuListReLoad() {
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);
}

/**
 * 校验并组装保存的数据 
 */
function getSaveData(){
	
	var isValid0 = currOrderDetailDataGrid.datagrid("isValid");		
	var isValid = $orderfm.form('validate');
	if (!isValid || !isValid0){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}			
	currOrderDetailDataGrid.datagrid("acceptChanges");
	var baseInfo = formJson($orderfm);
	
	var saveData = {
	     "params": {
	    	 "asnNo": $("#asnNo",$orderfm).textbox("getValue"),
			 "header": baseInfo,
			 "details": currDetailData
			},
	     "saveUrl": "${api}/doc/asn/saveEntity"
	}
	return saveData;
}

/**
 * 保存成功后触发
 */
function afterSaveFunc(){
	parent.closeCurrTab("reflushDataGrid");
}


</script>


