<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<script type="text/javascript"  src="<%=request.getContextPath()%>/jquery-easyui/commons/js/LodopFuncs.js"></script>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportExcel()">导出excel</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>

<script type="text/javascript">

//excel导出
function exportExcel(){	
	var queryParams = initQueryParams();
	var url = "${api}/summary/report/skuUseSo/exportExcel?shopId="+ queryParams.shopId 
			+ "&startDate="+ queryParams.startDate 
			+ "&endDate="+ queryParams.endDate;
	window.open(url); 
}

//查看明细
function toDetailView(rowData){
	debugger
	var currRow = null;
	if(typeof rowData =='undefined'){
		var rows = currDataGrid.datagrid('getSelections');
		if (rows.length != 1) {
			$.messager.alert("提示","只能选择一行数据！");
			return;
		}
		currRow = rows[0];
	}else{
		currRow = rowData;
	}		
	var queryParams = initQueryParams();
	var url = "${api}/summary/report/skuUseSo/toDetailView?sku="+ currRow.sku
			+ "&goodsName="+ currRow.goods_name
			+ "&shopId="+ queryParams.shopId 
			+ "&startDate="+ queryParams.startDate 
			+ "&endDate="+ queryParams.endDate;
	commonDialog("ordersDialog", "商品交易明细", "95%", "80%", url, "icon-book_open");

}

//刷新DataGrid
function reflushDataGrid(){
	query();
}

</script>
