<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="库存管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 89%;">
			<table id="orderDetailDataGrid"> 
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">

var frozenColumns = [[
	{field:'sku',title:'SKU',width:80,align:'center'},	
	{field:'goods_name',title:'商品名称',width:140,align:'center'},
	{field:'ship_id',title:'所属店仓',width:140,align:'center', formatter:function(value, row){
		return row.shop_name; 
	}},   
	{field:'qty',title:'可用数量',width:60,align:'center',formatter:intNumBaseFormat},	
	{field:'lock_qty',title:'冻结数量',width:60,align:'center',formatter:intNumBaseFormat},	
	{field:'damaged_qty',title:'破损数量',width:60,align:'center',formatter:intNumBaseFormat}	
]];

var columns = [[

	{field:'trade_order_no',title:'单据编号',width:140,align:'center',sortable:true},		
	{field:'trade_type',title:'单据类型',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.docTradeType); 
	}},
	{field:'trade_status',title:'交易状态',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.docTradeStatus); 
	}},	
	//{field:'trade_line_no',title:'行号',width:50,align:'center'},
	{field:'trade_time',title:'交易时间',width:130,align:'center',sortable:true},
	{field:'lot_num',title:'批次号',width:70,align:'center',sortable:true},
	{field:'trade_relation_no',title:'关联单号',width:140,align:'center'}
]];

var currDataGrid;
var footerFirstColumn = "sku";

$(function() {
	
	currDataGrid = $("#orderDetailDataGrid");
	currDataGrid.datagrid({
		view:footerStyleView,
		width:500,
		height:250,
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    queryParams:{
	    	"shopId": "${shopId}",
	    	"sku": "${sku}",
	    	"firstColumn": footerFirstColumn
	    },
	    remoteSort:true,
	    sortName:"trade_time",
        sortOrder:"desc",
        url: "${api}/bus/invSku/findDetailsPage",
	    //idField:"blackid",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
	    fitColumns:false,
	    frozenColumns:frozenColumns,
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    //toolbar:'#tools',
	    singleSelect: true,
	    rowStyler:function(index,row){
        	var rowStyle = "";        	
        	if (row[footerFirstColumn]=="合计:"){//这里是判断哪些行
        		rowStyle = 'font-weight:bold;';  
            }
        	return rowStyle;
		}
	});
});


</script>
</html>