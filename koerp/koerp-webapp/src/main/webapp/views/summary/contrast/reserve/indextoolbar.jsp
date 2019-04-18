<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<script type="text/javascript"  src="<%=request.getContextPath()%>/jquery-easyui/commons/js/LodopFuncs.js"></script>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportExcel()">导出excel</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>

<script type="text/javascript">

//excel导出
function exportExcel(){	
	var queryParams = initQueryParams();
	var url = "${api}/summary/contrast/reserve/exportExcel?q="+ queryParams.q 
			+ "&tradeType="+ queryParams.tradeType 
			+ "&tradeStatus="+ queryParams.tradeStatus
			+ "&payMode="+ queryParams.payMode 
			+ "&customerCode="+ queryParams.customerCode
			+ "&shopId="+ queryParams.shopId 
			+ "&startDate="+ queryParams.startDate 
			+ "&endDate="+ queryParams.endDate;
	window.open(url); 
}


//刷新DataGrid
function reflushDataGrid(){
	query();
}

</script>
