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
		{field:'channelname',title:'收货人姓名',align:'center',sortable:true, width:100},
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
	    queryParams:{"ordermodel":50},
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
			view();
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
	var rows = $('#ordersDataGrid').datagrid('getSelections');
	if (rows.length > 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = currDataGrid.datagrid('getSelected');
	if (row) {
		var url = "${api}/ecorder/toDetail/" + row.sysorderid +"?buttontype=baseos";
		var icon = "icon-table";
		var subtitle = "销售单("+ row.sysorderid +")明细";
		parent.addTab(subtitle, url, icon);
	}else{
		$.messager.alert("提示","请选择一行要编辑的销售单！");
	}
	
}

//导出excel
function exportExcel() {
	
	var queryParams = currDataGrid.datagrid("options").queryParams;
	var queryData = formJson($('#queryForm'));
	for(var key in queryData){	
		queryParams[key] = queryData[key];
	}
	var serial_params = $.param(queryParams, true);
 	window.open("<c:out value="${api}"/>/orders/exportOrdersExcel?" + serial_params); 
}

//取消订单
function cancelOrder() {
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];
	$.messager.confirm("确认","是否确认要取消订单号为"+row.sysorderid+"的销售单？",function(sure){
		if(sure) {
			$.ajax({  
		    	async:false,  
		        cache:false,  
		        type:'post', 
		        data:{"sysorderid": row.sysorderid},
		        dataType: "json",  
		        url:"${api}/orders/cancelOrder",		         
		        success:function(result) { //请求成功后处理函数。  
		        	if (result.status) {
						$.messager.alert("提示","操作成功！","info", function(){
							reflushDataGrid();
						});
					} else {
						$.messager.alert("错误",result.message,"error");
					}
		        },error: function () {
		        	$.messager.alert("错误","请求失败","error");
		        }
			});
		}
	});
	
}


</script>


<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="销售单管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 73%">
			<table id="ordersDataGrid"></table>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
	<shiro:hasPermission name="orders:view">  
		<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="view()">查看</a>
	</shiro:hasPermission>
	
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="">添加</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="">修改</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="">删除</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cog_start" plain="true" onclick="">提交财审</a>		
	<a href="#" class="easyui-linkbutton" iconCls="icon-cog_delete" plain="true" onclick="">撤销财审</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cog_go" plain="true" onclick="">财审通过</a>		
	<a href="#" class="easyui-linkbutton" iconCls="icon-cog_stop" plain="true" onclick="">财审驳回</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="">取消订单</a>
	
	<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
</div>

</html>