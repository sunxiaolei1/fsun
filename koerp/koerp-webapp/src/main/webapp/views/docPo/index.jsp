<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="申请单管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
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
	{field:'po_no',title:'单据编号',width:140,align:'center',sortable:true},	
	{field:'po_type',title:'单据类型',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.docPoType); 
	}},
	{field:'po_status',title:'单据状态',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.docPoStatus); 
	}}	
]];

var columns = [[	
	{field:'from_shop_id',title:'出库店仓',width:240,align:'center',sortable:true, formatter:function(value, row){
		return row.from_shop_name; 
	}},
	{field:'to_shop_id',title:'入库店仓',width:220,align:'center',sortable:true, formatter:function(value, row){
		return row.to_shop_name; 
	}}, 
	{field:'audit_time',title:'审核时间',width:130,align:'center',sortable:true},
	//{field:'expected_time',title:'预期收货时间',width:130,align:'center',sortable:true},	
	/* {field:'print_count',title:'是否打印',width:80,align:'center',sortable:true, formatter:function(value, row){
		return (row.print_count>0?"<span style='color:red;'>是</span>":"否"); 
	}}, */
	{field:'created_name',title:'制单人',width:80,align:'center',sortable:true},
	{field:'created_time',title:'制单时间',width:130,align:'center',sortable:true},
	{field:'memo',title:'备注',width:350,align:'center',sortable:true}			
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
	    sortName:"created_time",
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