<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="差异单管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 79%">
			<table id="ordersDataGrid"></table>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
	<shiro:hasPermission name="orders:view">  
		<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="view()">查看</a>
	</shiro:hasPermission>
	
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
</div>
	
<script type="text/javascript">

var frozenColumns = 
	[[
		{field:'ck',checkbox:true},
		{field:"auditstatus",title:"审核状态",width:100,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.ecAuditstatus); 
		}},
   		{field:'extorderid',title:'外部单号',width:130, align:"center",sortable:true},
   		{field:'sysorderid',title:'原系统单号',width:130, align:"center",sortable:true},
   		{field:'diffid',title:'差异单号',width:130, align:"center",sortable:true}
   	]];

var columns = 
    [[
		{field:'companycode',title:'公司代码',width:100,align:'center',sortable:true},
		{field:'shopname',title:'所属店铺',width:160,align:'center',sortable:true},
		{field:"stockcode",title:"仓别代码",width:100,align:'center',sortable:true},		
		{field:"originalorderprice",title:"原订单金额",width:100,align:'center',sortable:true,formatter:numBaseFormat},
		{field:"originalpayprice",title:"原实付金额",width:100,align:'center',sortable:true,formatter:numBaseFormat},
		{field:"neworderprice",title:"新订单金额",width:100,align:'center',sortable:true,formatter:numBaseFormat},
		{field:"difforderprice",title:"金额差异",width:100,align:'center',sortable:true,formatter:numBaseFormat},
		{field:"changeprice",title:"调整后差异",width:100,align:'center',sortable:true,formatter:numBaseFormat},
		{field:"addcname",title:"创建人",width:100,align:'center',sortable:true},
		{field:"adddatetime",title:"创建时间",width:140,align:'center',sortable:true}
	
	]];
	
var currDataGrid;

$(function() {
	
	currDataGrid = $("#ordersDataGrid");
	currDataGrid.datagrid({
		width:500,
		height:250,
	    nowrap:true,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	    
	    remoteSort:true,
	    sortName:"diffid",
        sortOrder:"desc",
	    //idField:"diffid",
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
	    }
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
	$('#gridDiv').height("79%");
	
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
		var url = "${api}/ecdiff/order/toDetail/" + row.diffid;
		var icon = "icon-table";
		var subtitle = "差异单("+ row.diffid +")明细";
		parent.addTab(subtitle, url, icon);
	}else{
		$.messager.alert("提示","请选择一行要编辑的差异单！");
	}
	
}

/* //查看订单明细
function view1(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length > 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = currDataGrid.datagrid('getSelected');
	if (row) {
		$("<div></div>").dialog({
			id:"ordersDialog",
		    title:"&nbsp;差异单明细",
		    width:"98%",
		    height:"96%",
		    iconCls:"icon-add",
		    closed:false,
		    cache:false,
		    href:"${api}/ecdiff/order/toDetail/" + row.diffid,	   
		    modal:true,
		    minimizable:false,//定义是否显示最小化按钮。
	        maximizable:false,//定义是否显示最大化按钮
	        closable:true,
	        resizable:true,//定义对话框是否可调整尺寸
	        collapsible: true,//是否可折叠的	        
	        onLoad:function(){
	        	$('#ordersDialog').window('center');		        	
	        	//$("#ordersDialog").css({"overflow-y":"hidden"}); //禁用纵向滚动条
			},
	        onClose:function(){
	        	$(this).dialog("destroy");
	        }
		});	 
	}else{
		$.messager.alert("提示","请选择一行要编辑的差异单！");
	}
} */


</script>
</html>