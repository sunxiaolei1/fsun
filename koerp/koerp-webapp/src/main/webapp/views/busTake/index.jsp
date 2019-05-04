<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true" >
	<div title="寄提单列表" data-options="region:'center',split:true,collapsible:false,border:false" style="padding:5px">
		<div class="easyui-layout" data-options="fit:true" >
			<!-- 查询条件 -->
			<%@include file="./searchbar.jsp"%>
			
			<!-- table -->
			<div id="gridDiv" data-options="region:'center',border:false" >
				<table id="ordersDataGrid"> 
				</table>
			</div>
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
	{field:'take_id',title:'单据编号',width:200,align:'center',sortable:true},	
	{field:'order_id',title:'寄存单号',width:140,align:'center',sortable:true},	
	{field:'take_status',title:'单据状态',width:80,align:'center',sortable:true, formatter:function(value, row){
		var spanHeader = "";
		if(value=='30'  || value=='60'){
			spanHeader = "<span style='color:green;'>";
		}else if(value=='40'){
			spanHeader = "<span style='color:red;'>";
		}
		var spanFooter = "</span>";
		return spanHeader + formatter(value, window.parent.busTakeStatus) + spanFooter; 
	}},
	{field:'shop_id',title:'所属店仓',width:200,align:'center',sortable:true, formatter:function(value, row){
		return row.shop_name; 
	}}
]];

var columns = [[			
	{field:'buyer_name',title:'客户名称',width:180,align:'center',sortable:true},	
	{field:'print_count',title:'已打印',width:60,align:'center', sortable:true, formatter:function(value, row){
		return (value>0?"<b style='color:green;'>是</b>":(value==0?"<b style='color:red;'>否</b>":"")); 
	}},
	{field:'take_name',title:'提货人',width:100,align:'center',sortable:true},
	{field:'take_time',title:'提货时间',width:130,align:'center',sortable:true},
	{field:'seller_name',title:'制单人',width:80,align:'center',sortable:true},
	{field:'created_time',title:'制单时间',width:130,align:'center',sortable:true},
	{field:'updated_time',title:'更新时间',width:130,align:'center',sortable:true},
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