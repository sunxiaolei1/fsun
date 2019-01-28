<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<script type="text/javascript"  src="<%=request.getContextPath()%>/jquery-easyui/commons/js/LodopFuncs.js"></script>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="exportExcel()">导出excel</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>

<script type="text/javascript">

//跳转至盘盈入库新增界面
function exportExcel(){	
	var url = "${api}/bus/order/toAddView?orderType="+ orderType;
}


//刷新DataGrid
function reflushDataGrid(){
	query();
}

</script>
