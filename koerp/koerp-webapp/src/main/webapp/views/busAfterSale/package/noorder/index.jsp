<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="无单据包裹管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 73%;">
			<table id="ordersDataGrid"> 
			</table>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="">添加</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="">导出</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="view()">查看</a>	
	<a href="#" class="easyui-linkbutton" iconCls="icon-award_star_silver_3" plain="true" onclick="">处理标记</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	  
	<a href="#" class="easyui-linkbutton" iconCls="icon-award_star_silver_3" plain="true" onclick="">生成退货单</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
</div>

<script type="text/javascript">

var frozenColumns = 
	[[
		{field:'ck',checkbox:true},
		{field:'packagestatus',title:'入库状态',width:100, align:"center",sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.ecPackagestatus); 
		}},
		{field:'refundorderid',title:'入库单号',width:130, align:"center",sortable:true},
		{field:'packageid',title:'无人认领单号',width:120, align:"center",sortable:true},
   		{field:'extorderid',title:'外部单号',width:130, align:"center",sortable:true},
   		{field:'sysorderid',title:'系统单号',width:130, align:"center",sortable:true}   		  
   	]];

var columns = 
    [[
		{field:'companycode',title:'公司代码',width:100,align:'center',sortable:true},
		{field:'shopname',title:'所属店铺',width:130,align:'center',sortable:true},
		{field:"stockcode",title:"仓别代码",width:100,align:'center',sortable:true},		
		{field:'poscname',title:'买家姓名',align:'center',sortable:true, width:100},
		{field:'mobileno',title:'联系电话',width:130,align:'center',sortable:true},
		{field:'tel',title:'固定电话',width:130,align:'center',sortable:true},
		{field:'address',title:'地址',width:200,align:'center',sortable:true},
		{field:'expresscode',title:'快递公司',width:100,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.expressCode); 			
		}},
		{field:'expressno',title:'快递单号',width:130,align:'center',sortable:true},		
		{field:"adddatetime",title:"创建时间",align:'center',sortable:true, width:130},
		{field:"remark",title:"备注",align:'center',sortable:true, width:230}
	
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
	    sortName:"packageid",
        sortOrder:"desc",
	    //idField:"refundorderid",
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
			view();
	    },
	    
	});
});


//刷新DataGrid
function reflushDataGrid(){
	query();
}

//隐藏查询条件
function hide() {
	$("#queryDiv").slideUp();
	$('#gridDiv').height("100%");
	
    currDataGrid.datagrid('resize',{   
        height:($(window).height())   
    });
}

//展开查询条件
function show() {
	$("#queryDiv").slideDown();
	$('#gridDiv').height("73%");
	
	currDataGrid.datagrid('resize',{   
		height:($(window).height())   
    });
}


//查询明细
function view(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length > 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = currDataGrid.datagrid('getSelected');
	if (row) {
		var url = "${api}/ecaftersale/package/noorder/toDetail/" + row.packageid;
		var icon = "icon-table";
		var subtitle = "包裹("+ row.packageid +")明细";
		parent.addTab(subtitle, url, icon);
	}else{
		$.messager.alert("提示","请选择一行要编辑的包裹信息！");
	}
	
}


</script>
</html>