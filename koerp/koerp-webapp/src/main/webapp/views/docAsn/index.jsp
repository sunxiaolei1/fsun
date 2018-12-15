<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="入库单管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 89%;">
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
	{field:'id',checkbox:true},
	{field:'sku',title:'SKU',width:80,align:'center',sortable:true},	
	{field:'goods_name',title:'商品名称',width:140,align:'center',sortable:true},
	{field:'ship_id',title:'所属店仓',width:140,align:'center',sortable:true, formatter:function(value, row){
		return row.shop_name; 
	}},   
	{field:'qty',title:'可用数量',width:80,align:'center',formatter:intNumBaseFormat, sortable:true},	
	{field:'lock_qty',title:'冻结数量',width:80,align:'center',formatter:intNumBaseFormat, sortable:true},	
	{field:'damaged_qty',title:'破损数量',width:80,align:'center',formatter:intNumBaseFormat, sortable:true}	
]];

var columns = [[			
	{field:'bar_code',title:'条形码',width:120,align:'center',sortable:true},	
	{field:'brand_code',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode); 
	}},
	{field:'category_code',title:'商品分类',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.categoryCode); 
	}},	
	{field:'property',title:'规格',width:120,align:'center',sortable:true},
	{field:'unit_name',title:'单位',width:60,align:'center',sortable:true},							
	{field:'memo',title:'备注',width:150,align:'center',sortable:true}		
]];

var currDataGrid;

$(function() {
	
	currDataGrid = $("#ordersDataGrid");
	currDataGrid.datagrid({
		width:500,
		height:250,
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    queryParams:{},
	    remoteSort:true,
	    sortName:"sku",
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
	    onDblClickRow:function(rowIndex, rowData){
	    	$(this).datagrid("unselectAll");
			$(this).datagrid("selectRow",rowIndex);
			toDetailView();
	    }
	    
	});
});


</script>
</html>