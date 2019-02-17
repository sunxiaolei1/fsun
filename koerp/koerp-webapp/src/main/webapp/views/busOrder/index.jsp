<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="销售单管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 84%;">
			<table id="ordersDataGrid"> 
			</table>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
    <!-- 操作按钮及事件  -->
	<%@include file="./indextoolbar.jsp"%>
</div>

<script type="text/javascript">

var frozenColumns = [[
	{field:'ck',checkbox:true},
	{field:'order_id',title:'单据编号',width:140,align:'center',sortable:true},
	{field:'order_type',title:'单据类型',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.orderType); 
	}},
	{field:'trade_status',title:'交易状态',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.tradeStatus); 
	}},
	{field:'refund_status',title:'退货状态',width:100,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.refundStatus); 
	}},
	{field:'shop_id',title:'所属店仓',width:130,align:'center',sortable:true, formatter:function(value, row){
		return row.shop_name; 
	}}
]];

var columns = [[		 
	{field:'order_price',title:'订单金额',width:80,align:'center',formatter:numBaseFormat},
	{field:'coupon_price',title:'商品优惠',width:80,align:'center',formatter:numBaseFormat},
	{field:'discount_price',title:'商家优惠',width:80,align:'center',formatter:numBaseFormat},
	{field:'to_zero_price',title:'抹零金额',width:80,align:'center',formatter:numBaseFormat},
	{field:'pay_price',title:'实付金额',width:80,align:'center',formatter:numBaseFormat},
	{field:'dib_price',title:'找零金额',width:80,align:'center',formatter:numBaseFormat},
	{field:'recept_price',title:'实收金额',width:80,align:'center',formatter:numBaseFormat},
	{field:'print_count',title:'已打印',width:60,align:'center', sortable:true, formatter:function(value, row){
		return (row.print_count>0?"<span style='color:red;'>是</span>":(row.print_count==0?"否":"")); 
	}},
	{field:'buyer_name',title:'客户名称',width:100,align:'center',sortable:true},
	{field:'carrier_name',title:'经办人',width:100,align:'center',sortable:true},
	{field:'order_time',title:'单据时间',width:130,align:'center',sortable:true},
	{field:'cash_name',title:'制单人',width:80,align:'center'},
	{field:'memo',title:'注意事项',width:250,align:'center'}		
]];

var currDataGrid;
var footerFirstColumn = "order_id";

$(function() {
	
	currDataGrid = $("#ordersDataGrid");
	currDataGrid.datagrid({
		view:footerStyleView,
		width:500,
		height:250,
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    queryParams:{firstColumn: footerFirstColumn},
	    remoteSort:true,
	    sortName:"order_time",
        sortOrder:"desc",
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
	    toolbar:'#tools',
	    singleSelect: false,
	    selectOnCheck: true,
	    checkOnSelect: true,
	    rowStyler:function(index,row){
        	var rowStyle = "";        	
        	if (row[footerFirstColumn]=="合计:"){//这里是判断哪些行
        		rowStyle = 'font-weight:bold;';  
            }
        	return rowStyle;
		},
	    onDblClickRow:function(rowIndex, rowData){
	    	$(this).datagrid("unselectAll");
			$(this).datagrid("selectRow",rowIndex);
			toDetailView();
	    }
	    
	});
});


</script>
</html>