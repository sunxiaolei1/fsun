<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true" >
	<div title="员工列表" data-options="region:'center',split:true,collapsible:false,border:false" style="padding:5px">
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

var columns = 
    [[	
		{field:'id',checkbox:true},
		//{field:'code',title:'用户编码',width:80,align:'center',sortable:true},	
		{field:'username',title:'账号',width:100,align:'center',sortable:true},
		{field:'realname',title:'姓名',width:80,align:'center',sortable:true},
		{field:"shop_id",title:"所属店仓", width:120,align:'center', formatter:function(value, row){
			return row.shop_name; 
		}},
		{field:'email',title:'邮箱',width:120,align:'center',sortable:true},
		{field:'telphone',title:'联系方式',width:120,align:'center',sortable:true},						
		{field:"enabled",title:"状态", width:60,align:'center', formatter:function(value, row){
			return formatter(value, window.parent.isEnable); 
		}}	
	]];

var currDataGrid;

$(function() {
	
	currDataGrid = $("#ordersDataGrid");
	currDataGrid.datagrid({
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    queryParams:{},
	    remoteSort:true,
	    sortName:"username",
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
	    }
	    
	});
});


</script>
</html>