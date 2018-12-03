<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../headerJS.jsp" %>
	
<script type="text/javascript">

var frozenColumns = 
	[[
		{field:'ck',checkbox:true},
   		{field:'extorderid',title:'外部单号',width:130, align:"center",sortable:true},
   		{field:'sysorderid',title:'系统单号',width:130, align:"center",sortable:true}  		
   	]];

var columns = 
    [[
		{field:'companycode',title:'公司代码',width:100,align:'center',sortable:true},
		{field:'shopname',title:'所属店铺',width:130,align:'center',sortable:true},
		{field:"stockcode",title:"仓别代码",width:100,align:'center',sortable:true},		
		{field:'username',title:'买家用户名',align:'center',sortable:true, width:100},
		{field:'channelname',title:'订单来源',align:'center',sortable:true, width:100},
		{field:"orderdatetime",title:"下单时间",align:'center',sortable:true, width:130},
		{field:"paymentdatetime",title:"付款时间",align:'center',sortable:true, width:130},
		{field:"ordertype",title:"订单类型",width:100,align:'center',sortable:true,formatter:function(value, row){
			return formatter(value, window.parent.ecOrdertype);
		}},
		{field:"systemstatus",title:"系统状态",width:100,align:'center',sortable:true,formatter:function(value, row){
			return formatter(value, window.parent.ecSystemstatus);
		}},
		{field:"orderprice",title:"订单金额",width:100,align:'center',sortable:true,formatter:numBaseFormat},
		{field:"payprice",title:"实付金额",width:100,align:'center',sortable:true,formatter:numBaseFormat}		
	]];
	
var currDataGrid;
	
$(function() {
	
	currDataGrid = $("#ordersDataGrid");
	currDataGrid.datagrid({
		width:500,
		height:280,
	    nowrap:true,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    queryParams:{"ordermodel":40},
	    remoteSort:true,
	    sortName:"sysorderid",
        sortOrder:"desc",
	    //idField:"sysorderid",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
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
			detailView();
	    },
        rowStyler:function(index,row){
        	var rowStyle = "";
        	var flowstatus = row.flowstatus;
        	if(flowstatus == -1){
 				rowStyle = rowStyle + "background-color:#FFA07A;";
			}
        	return rowStyle;
		}
	});
});


</script>


<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="销售单管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 79%">
			<table id="ordersDataGrid"></table>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
    <!-- 操作按钮及事件  -->
	<%@include file="./indextoolbar.jsp"%>
</div>

</html>