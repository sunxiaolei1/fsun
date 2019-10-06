<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ include file="../../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true" >
	<div title="${param.title}" data-options="region:'center',split:true,collapsible:false, border:false" style="padding:5px">
		<div class="easyui-layout" data-options="fit:true" >
			<!-- 查询条件 -->
			<%@include file="./overViewSearchbar.jsp"%>
			
			<!-- table -->
			<div id="gridDiv" data-options="region:'center', border:false"  >
				<table id="orderDetailDataGrid"></table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

var frozenColumns = [[
	{field:'trade_order_no',title:'单据编号',width:200,align:'center',sortable:true}
]];

var columns = [[
	{field:'trade_type',title:'单据类型',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.docTradeType); 
	}},
	{field:'trade_status',title:'交易状态',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.docTradeStatus); 
	}},	
	{field:'qty',title:'可用数量',width:70,align:'center',
		formatter:intNumBaseFormat, styler:reportNumberStyler},
	/* {field:'lock_qty',title:'冻结数量',width:70,align:'center',
		formatter:intNumBaseFormat, styler:reportNumberStyler}, */	
	{field:'damaged_qty',title:'破损数量',width:70,align:'center',
		formatter:intNumBaseFormat, styler:reportNumberStyler},			
	{field:'trade_time',title:'交易时间',width:130,align:'center',sortable:true}
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
	    fitColumns:true,
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