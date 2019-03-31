<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
	
<div class="fsun-wrap">
	<form id="refundfm">
		<span class="title" style="top: 30px;">单据基本信息</span>		
		<input id="iId" name="iId" hidden="true" />	
		<input id="toShopId" name="toShopId" hidden="true" />	
		<input id="fromShopId" name="fromShopId" hidden="true" />	
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">单据编号</th>
				<td>
					<input id="asnNo" name="asnNo" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">申请单号</th>
				<td>
					<input id="poNo" name="poNo" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">出库单号</th>
				<td>
					<input id="orderNo" name="orderNo" class="easyui-textbox" readOnly />
				</td>				
				<th width="12%">单据类型</th>
				<td>
					<input id="asnType" name="asnType" class="easyui-combobox" readOnly />								
				</td>																				
	        </tr>	
	        <tr>	
	        	<th width="12%">入库店仓</th>
				<td colspan="3" >
					<input id="toShopName" name="toShopName" 
						class="easyui-textbox" style="width:400px;" readOnly />								
				</td>
				<th width="12%">出库时间</th>
				<td>
					<input id="deliveryTime" name="deliveryTime" class="easyui-datebox" disabled />								
				</td>
	        	<th width="12%">调退时间</th>
				<td>
					<input id="receivingTime" name="receivingTime" class="easyui-datetimebox" disabled />								
				</td>	        		        							        					        		            													        						        											        														        			        		            													        						        									
	        </tr>	        
	        <tr>
	        	<th width="12%">出库店仓</th>
				<td colspan="3" >
					<input id="fromShopName" name="fromShopName" data-options="multiline:true" 
						class="easyui-textbox" style="width:400px;height:46px;" readOnly />								
				</td>
	        	<th width="12%">备注</th>
				<td colspan="3">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:400px;height:46px;"/>
				</td>	        	
	        </tr>
		</table>
	</form>			
</div>	

<div style="height: 250px; width: 100%;">
	<div id="refunddetailskutoolbar" style="display:none;">
		<span style="float:right;margin-top:2px;">	
			<input id="refundSkuSearcher" class="easyui-searchbox" style="width:350px">
		</span>
		<a href="#" class="easyui-linkbutton" style="visibility:hidden;" iconCls="icon-add" plain="true" onclick="addSkuRow()">添加商品 </a>
	</div>
	<table id="refundDetailDataGrid"></table>
</div>					

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currRefundDetailData = []; 
var currRefundDetailDataGrid  = $("#refundDetailDataGrid");
var $refundfm = $("#refundfm");
var refundColumns = [[
	{field:'ck',checkbox:true},
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:200,align:"center"},
	{field:"barCode",title:"条形码", width:140,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode); 
	}},
	{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.categoryCode); 
	}},
	{field:'property',title:'规格',width:120,align:'center',sortable:true},
	{field:"unit",title:"单位",width:70,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.unitCode); 
	}},
	{field:"price",title:"单价", width:80,align:"center",formatter:numBaseFormat},
	{field:"orderQty",title:"申请数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"expectedQty",title:"发货数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"rejectedQty",title:"调退数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){			
			return 'font-weight:bold;color:red;';	
	    },
	    formatter:function(value, row){
	    	return intNumBaseFormat(row.receiveQty);
	    }
	},
	{field:"receiveQty",title:"收货数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){			
			return 'font-weight:bold;color:green;';	
	    },
	    formatter:intNumBaseFormat
	}
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