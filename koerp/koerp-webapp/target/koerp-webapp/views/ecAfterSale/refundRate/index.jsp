<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../headerJS.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/datagrid-detailview.js"></script>

<div class="easyui-layout" style="width:100%;height:100%;"> 
	<div title="退货商品管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 85%">
			<table id="skusDataGrid"></table>
		</div>	
	</div>
</div>

<script type="text/javascript">

var columns = 
    [[
		{field:"CompanyCode",title:"公司代码",width:100,align:'center',sortable:true},		
		{field:"ShopID",title:"店铺编码",width:100,align:'center',sortable:true},
		{field:"ShopName",title:"所属店铺",width:160,align:'center',sortable:true},
		{field:'MaterialCode',title:'货号',width:120,align:'center',sortable:true},
		{field:'CategoryName',title:'品类',width:100,align:'center',sortable:true},
		{field:"MaterialName",title:"商品名称",width:190,align:'center',sortable:true},
		{field:'SaleQty',title:'销售量', width:70,align:'center',formatter:numBaseFormat},
		{field:'RefundQty',title:'退货量', width:70,align:'center',formatter:numBaseFormat},
		{field:'RefundPercent',title:'退货比例', width:70,align:'center'},
		{field:'ChangeQty',title:'换货量', width:70,align:'center',formatter:numBaseFormat},
		{field:'ChangePercent',title:'换货比例', width:70,align:'center'}
	]];

var currDataGrid;

$(function() {
	
	currDataGrid = $("#skusDataGrid");
	currDataGrid.datagrid({
		width:"auto",
		height:"460",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    queryParams:{
	    	"nopage":true
	    },
	    fit:true,//自动大小
	    remoteSort:true,
	    sortName:"sku",
        sortOrder:"asc",
	    //idField:"sku",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,	    
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	   // toolbar:'#toolbar',	   
	    selectOnCheck: true,
	    checkOnSelect: true
	});
	
});

//刷新DataGrid
function reflushDataGrid(){
	query();
}


</script>
</html>