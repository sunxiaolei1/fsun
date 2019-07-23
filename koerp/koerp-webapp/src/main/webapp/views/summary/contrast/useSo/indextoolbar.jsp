<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportOrders('0')">导出(按条件-订单及商品)</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportOrders('1')">导出(全部-订单及商品)</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>

<script type="text/javascript">

//excel导出
function exportOrders(isAll){	
	var queryParams = initQueryParams();
	var url = "${api}/summary/contrast/useSo/exportOrders?orderType="+ queryParams.orderType;
	if(isAll=='0'){		
		url = url + ("&keywords=" + encodeURI(encodeURI(queryParams.keywords)) 		
			+ "&customerCode="+ queryParams.customerCode + "&carrierId="+ queryParams.carrierId
			+ "&fromShopId="+ queryParams.fromShopId
			+ "&orderStatus="+ queryParams.orderStatus + "&orderMode="+ queryParams.orderMode
			+ "&startDate="+ queryParams.startDate + "&endDate="+ queryParams.endDate);	
	}
	
	window.open(url); 
}

//跳转至编辑界面
function toDetailView(rowData){
	var url = "${api}/summary/contrast/useSo/toDetailView?orderNo="
		+ rowData.order_no +"&orderType="+ rowData.order_type +"&buttontype=docOrder";
	var icon = "icon-application_view_detail";
	var subtitle = "出库单("+ rowData.order_no +")详情";
	parent.addTab(subtitle, url, icon);	
}

//刷新DataGrid
function reflushDataGrid(){
	query();
}

</script>
