<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportExcel('1')">导出(商品-汇总)</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportExcel('0')">导出(商品-交易明细)</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>

<script type="text/javascript">

//excel导出
function exportExcel(type){
	
	var url = "${api}/summary/report/skuUseSo/exportExcel?";
	if(type=='0'){
		url = "${api}/summary/report/sku/details/so/exportExcel?tradeType=${tradeType}&";
	}
	var queryParams = initQueryParams();
	url = url + "shopId=" + queryParams.shopId + "&startDate=" + queryParams.startDate 
		+ "&endDate=" + queryParams.endDate;
	window.open(url); 
}

//查看明细
function toDetailView(rowData){
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
