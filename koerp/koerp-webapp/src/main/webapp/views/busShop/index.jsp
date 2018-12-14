<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="店仓管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
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

var columns = 
    [[	
		{field:'shop_id',checkbox:true},
		{field:'shop_code',title:'店仓编码',width:80,align:'center',sortable:true},	
		{field:'shop_name',title:'店仓名称',width:100,align:'center',sortable:true},
		{field:'address',title:'地址',width:140,align:'center',sortable:true},
		//{field:'position',title:'位置',width:120,align:'center',sortable:true},				
		{field:'contacts',title:'联系人',width:80,align:'center',sortable:true},
		{field:'tel',title:'联系方式',width:120,align:'center',sortable:true},						
		{field:"enabled",title:"状态", width:60,align:'center', formatter:function(value, row){
			return formatter(value, window.parent.isEnable); 
		}},		
		{field:"created_time",title:"创建时间",width:130, align:'center'},
		{field:"updated_time",title:"更新时间",width:130, align:'center'},
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
	    sortName:"shop_code",
        sortOrder:"desc",
	    //idField:"blackid",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
	    fitColumns:true,
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