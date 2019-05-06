<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
	
<div class="easyui-layout" data-options="fit:true" >
	<div data-options="region:'north',split:true, border:false" style="height:160px;overflow:hidden;">
		<div class="fsun-wrap">
			<form id="refundfm">
				<span class="title" style="top: 1px;">基本信息(单号:<span>${asnNo}</span>)</span>	
				<input id="iId" name="iId" hidden="true" />	
				<input id="toShopId" name="toShopId" hidden="true" />	
				<input id="fromShopId" name="fromShopId" hidden="true" />	
				<input id="asnNo" name="asnNo" hidden="true" />
				<table class="nb-formTable">
			        <tr>				           
						<th>申请单号</th>
						<td>
							<input id="poNo" name="poNo" class="easyui-textbox" readOnly style="width:93%;" />
						</td>
						<th>出库单号</th>
						<td>
							<input id="orderNo" name="orderNo" class="easyui-textbox" readOnly style="width:93%;" />
						</td>				
						<th>单据类型</th>
						<td>
							<input id="asnType" name="asnType" class="easyui-combobox" readOnly style="width:90%;" />								
						</td>																				
			        </tr>	
			        <tr>	
			        	<th>入库店仓</th>
						<td>
							<input id="toShopName" name="toShopName" 
								class="easyui-textbox" readOnly style="width:90%;" />							
						</td>
						<th>出库时间</th>
						<td>
							<input id="deliveryTime" name="deliveryTime" class="easyui-datebox" disabled style="width:90%;" />								
						</td>
			        	<th>调退时间</th>
						<td>
							<input id="receivingTime" name="receivingTime" class="easyui-datetimebox" disabled style="width:90%;" />								
						</td>	        		        							        					        		            													        						        											        														        			        		            													        						        									
			        </tr>	        
			        <tr>
			        	<th>出库店仓</th>
						<td>
							<input id="fromShopName" name="fromShopName" data-options="multiline:true" 
								class="easyui-textbox" style="width:90%;height:46px;" readOnly />								
						</td>
			        	<th>备注</th>
						<td colspan="3">
							<input id="memo" name="memo"  data-options="multiline:true" 
								class="easyui-textbox" style="width:75%;height:46px;"/>
						</td>	        	
			        </tr>
				</table>
			</form>			
		</div>
	</div>
	
	<div data-options="region:'center',split:true, border:false" >
		<div id="refunddetailskutoolbar" style="display:none;">
			<span style="float:right;margin-top:2px;">	
				<input id="refundSkuSearcher" class="easyui-searchbox" style="width:250px">
			</span>
			<a href="#" class="easyui-linkbutton" style="visibility:hidden;" iconCls="icon-add" plain="true" onclick="addSkuRow()">添加商品 </a>
		</div>
		<table id="refundDetailDataGrid"></table>
	</div>
</div>
	
<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currRefundDetailData = []; 
var currRefundDetailDataGrid  = $("#refundDetailDataGrid");
var $refundfm = $("#refundfm");
var refundColumns = [[
	//{field:'ck',checkbox:true},
	{field:"sku",title:"SKU", width:70,align:"center"},
	{field:"goodsName",title:"商品名称", width:200,align:"center"},
	{field:"unit",title:"单位",width:50,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.unitCode); 
	}},
	{field:"price",title:"单价", width:70,align:"center",formatter:numBaseFormat},
	{field:"orderQty",title:"申请数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"expectedQty",title:"发货数量", width:70,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"rejectedQty",title:"调退数量", width:70,align:"center",
		styler: function(value, rowData, rowIndex){			
			return 'font-weight:bold;color:red;';	
	    },
	    formatter:function(value, row){
	    	return intNumBaseFormat(row.receiveQty);
	    }
	},
	{field:"receiveQty",title:"收货数量", width:70,align:"center",
		styler: function(value, rowData, rowIndex){			
			return 'font-weight:bold;color:green;';	
	    },
	    formatter:intNumBaseFormat
	},
	{field:"barCode",title:"条形码", width:120,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode); 
	}},
	{field:"categoryCode",title:"商品分类", width:80,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.categoryCode); 
	}},
	{field:'property',title:'规格',width:100,align:'center',sortable:true}
]];

$(function () { 
	
	$('#asnType', $refundfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docAsnTypeData
   	});	
	
	$('#checkStatus', $refundfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docAsnCheckStatusData
   	});
	
	//去除默认的请选择项
	editInitComboxParams($refundfm, "");
	
	//初始化搜索框
	$('#refundSkuSearcher').searchbox({
	     prompt: '输入商品名称、SKU筛选...',
	     searcher: function (value, name) {
	    	 currRefundDetailDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currRefundDetailData);
	     }
	});
	
	currRefundDetailDataGrid.datagrid({
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
	    fitColumns:false,
	    showFooter:true,
	    toolbar: "#refunddetailskutoolbar",
	    columns: refundColumns,
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
			"asnNo":"${asnNo}",
			"asnType": "${asnType}"
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docAsnDto = result.entry;
			
			/***************************              基本信息初始化                        ************************/			
			var header = docAsnDto.header;
			if(header!=null){
				$refundfm.form("load", header);	
			}
			
			var details = docAsnDto.details;	
			if(details!=null && details.length>0){
				currRefundDetailData = details;
				currRefundDetailDataGrid.datagrid("loadData", currRefundDetailData);			
			}	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});	
     
});


</script>