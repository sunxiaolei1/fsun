<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看及充值</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	

<script type="text/javascript">

//跳转至挂账信息界面
function toDetailView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];
	var url = "${api}/bus/reserve/toDetailView?customerCode="+ row.customer_code;
	var icon = "icon-money";
	var subtitle = "客户("+ row.customer_name +")备用金交易明细";
	parent.addTab(subtitle, url, icon);	
}

//刷新DataGrid
function reflushDataGrid(){
	currDataGrid.datagrid("clearSelections");
	currDataGrid.datagrid("reload");
}

</script>