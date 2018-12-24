<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toAddView('12')">盘亏出库</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toAddView('16')">领用出库</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toAddView('15')">报损出库</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toDetailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>

<script type="text/javascript">

//跳转至盘盈入库新增界面
function toAddView(orderType){
	
	var url = "${api}/doc/order/toAddView?orderType="+ orderType;
	var icon = "icon-add";
	var subtitle = "创建出库单";
	parent.addTab(subtitle, url, icon);	
}

//跳转至编辑界面
function toDetailView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];
	var url = "${api}/doc/order/toDetailView?orderNo="+ row.order_no +"&orderType="+ row.order_type;
	var icon = "icon-edit";
	var subtitle = "出库单("+ row.order_no +")详情";
	parent.addTab(subtitle, url, icon);	
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
	commonShow("queryDiv", "gridDiv", "85%", currDataGrid);
}


</script>