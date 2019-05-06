<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
	
<div class="fsun-wrap">
	<form id="sofm">
		<span class="title" style="top: 30px;">基本信息</span>		
		<input id="iId" name="iId" hidden="true" />	
		<input id="supplierId" name="supplierId" hidden="true" />
		<input id="supplierAddress" name="supplierAddress" hidden="true" />
		<input id="supplierContact" name="supplierContact" hidden="true" />
		<input id="supplierTel" name="supplierTel" hidden="true" />
		<input id="fromShopId" name="fromShopId" hidden="true" />	
		<input id="orderPrice" name="orderPrice" hidden="true" />			
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">单据编号</th>
				<td>
					<input id="orderNo" name="orderNo" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">单据类型</th>
				<td>
					<input id="orderType" name="orderType" class="easyui-combobox" required readOnly />								
				</td>
				<th width="12%">出库店仓</th>
				<td>
					<input id="fromShopName" name="fromShopName" class="easyui-textbox" readOnly />								
				</td>
				<th width="12%">入库单号</th>
				<td >
					<input id="userDefine1" name="userDefine1" class="easyui-textbox" readOnly />								
				</td>																
	        </tr>	
	        <tr>  
	        	<th width="12%">出库时间</th>
				<td>
					<input id="deliveryTime" name="deliveryTime" class="easyui-datetimebox" editable=false />							
				</td>          
				<th width="12%">供应商</th>
				<td>
					<input id="supplierName" name="supplierName" class="easyui-textbox" readOnly />							
				</td>					
				<th width="12%">收货人</th>
				<td>
					<input id="contacts" name="contacts" class="easyui-textbox" />								
				</td>
	        	<th width="12%">联系方式</th>
				<td>
					<input id="mobile" name="mobile" class="easyui-textbox" />								
				</td>	        									
	        </tr>
	        <tr>
				<th width="12%">收货地址</th>
				<td colspan="3">
					<input id="address" name="address" class="easyui-textbox" 
						data-options="multiline:true"  style="width:400px;height:46px;" />
				</td>
	        	<th width="12%">备注</th>
				<td colspan="3">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:400px;height:46px;" />
				</td>	        	
	        </tr>
		</table>
	</form>			
</div>	
<div style="height: 230px; width: 100%;">
	<div id="sodetailskutoolbar" style="display:none;">
		<span style="float:right;margin-top:2px;">	
			<input id="soSkuSearcher" class="easyui-searchbox" style="width:350px">
		</span>
		<a href="#" class="easyui-linkbutton" style="visibility:hidden;" iconCls="icon-add" plain="true" onclick="addSkuRow()">添加商品 </a>
	</div>
	<table id="soDetailDataGrid"></table>
</div>			

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currSoDetailData = []; 
var currSoDetailDataGrid  = $("#soDetailDataGrid");
var $sofm = $("#sofm");
var soColumns = [[
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
	{field:"orderedQty",title:"采购数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"shippedQty",title:"退货数量", width:80,align:"center",
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
	}}
]];

$(function () { 
	
	$('#orderType', $sofm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docOrderTypeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($sofm, "");
	
	//初始化搜索框
	$('#soSkuSearcher').searchbox({
	     prompt: '输入商品名称、SKU筛选...',
	     searcher: function (value, name) {
	    	 currSoDetailDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currSoDetailData);
	     }
	});
	
	currSoDetailDataGrid.datagrid({
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
	    toolbar: "#sodetailskutoolbar",
	    columns: soColumns,
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
		url : "${api}/doc/order/getInitData",
		data:{
			"orderNo": "${orderNo}",
			"orderType": "${orderType}"
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docOrderDto = result.entry;
			
			/***************************              基本信息初始化                        ************************/
			var header = docOrderDto.header;
			if(header!=null){
				$sofm.form("load", header);	
			}
			
			var details = docOrderDto.details;	
			if(details!=null && details.length>0){
				currSoDetailData = details;
				currSoDetailDataGrid.datagrid("loadData", currSoDetailData);
			}		
	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});

</script>