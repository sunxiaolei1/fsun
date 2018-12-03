<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="detailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toAddView()">添加</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toEditView()">修改</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="delOrders()">删除</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="cancelOrders()">取消订单</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-cog" plain="true" onclick="submitOrders()">提交确认</a>		
<a href="#" class="easyui-linkbutton" iconCls="icon-cog_add" plain="true" onclick="confirmOrders()">确认订单</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>

<script type="text/javascript">


//查询明细
function detailView(){	
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	commonDetailView(rows[0], "${api}/ecorder/toDetail/", "buttontype=baseos", "销售单", parent.addTab);	
}

//跳转至新增界面
function toAddView(){
	
	parent.addTab("创建订单", "${api}/ecorder/store/toEditView?sysorderid=", "icon-table");
}

//跳转至编辑界面
function toEditView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];
	parent.addTab("编辑订单(系统单号:"+row.sysorderid+")", "${api}/ecorder/store/toEditView?sysorderid="+ row.sysorderid, "icon-table");
}

//取消订单
function cancelOrders() {
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];
	$.messager.confirm("确认","是否确认要取消订单号为"+ row.sysorderid +"?",function(sure){
		if(sure) {		
			commonPost("${api}/ecorder/cancelOrders", 
				{"sysorderid": row.sysorderid}, reflushDataGrid());		
		}
	});
}

//刷新DataGrid
function reflushDataGrid(){
	query();
}


//隐藏查询条件
function hide() {
	commonHide("queryDiv", "gridDiv", "100%", currDataGrid);
}

//展开查询条件
function show() {
	commonShow("queryDiv", "gridDiv", "79%", currDataGrid);
}

</script>
