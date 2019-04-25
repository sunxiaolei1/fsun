<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<script type="text/javascript"  src="<%=request.getContextPath()%>/jquery-easyui/commons/js/LodopFuncs.js"></script>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toPayAccountView()">账单查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportPayAccounts()">账单导出</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportOrders('0')">导出(按条件-订单及商品)</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportOrders('1')">导出(全部-订单及商品)</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>

<script type="text/javascript">

//excel导出
function exportOrders(isAll){	
	var queryParams = initQueryParams();
	var url = "${api}/summary/contrast/refund/exportOrders?notInCustomerTypes="+ queryParams.notInCustomerTypes;
	if(isAll=='0'){		
		url += ("&q="+ encodeURI(encodeURI(queryParams.q)) + "&shopId="+ queryParams.shopId
		+ "&buyerId="+ queryParams.buyerId
		+ "&refundStatus="+ queryParams.refundStatus + "&refundType="+ queryParams.refundType
		+ "&startDate="+ queryParams.startDate + "&endDate="+ queryParams.endDate);
	}
	window.open(url); 
}

function exportPayAccounts(){
	var queryParams = initQueryParams();
	var url = "${api}/summary/contrast/refund/exportPayAccounts?notInCustomerTypes="+ queryParams.notInCustomerTypes	
	        + "&q="+ encodeURI(encodeURI(queryParams.q)) + "&shopId="+ queryParams.shopId
			+ "&buyerId="+ queryParams.buyerId
			+ "&refundStatus="+ queryParams.refundStatus + "&refundType="+ queryParams.refundType
			+ "&startDate="+ queryParams.startDate + "&endDate="+ queryParams.endDate;
	window.open(url); 
}

//跳转至编辑界面
function toDetailView(rowData){
	var url = "${api}/summary/contrast/refund/toDetailView?refundId="+ rowData.refund_id;
	var icon = "icon-application_view_detail";
	var subtitle = "退货单("+ rowData.refund_id +")详情";
	parent.addTab(subtitle, url, icon);	
}

//查看明细
function toPayAccountView(){	
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var currRow = rows[0];	
	var queryParams = initQueryParams();
	var url = "${api}/summary/contrast/refund/toPayAccountView?refundId="+ currRow.refund_id
			+ "&buyerName="+ currRow.buyer_name
			+ "&shopName="+ currRow.shop_name;
	commonDialog("ordersDialog", "账单明细", "90%", "80%", url, "icon-book_open");
}

//刷新DataGrid
function reflushDataGrid(){
	query();
}

</script>
