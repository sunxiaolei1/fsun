<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<script type="text/javascript"  src="<%=request.getContextPath()%>/jquery-easyui/commons/js/LodopFuncs.js"></script>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<a href="#" id="order_cancel" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="orderCancel()">撤销</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	  
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportExcel()">导出</a>	 -->

<script type="text/javascript">

//跳转至编辑界面
function toDetailView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];	
	var refundId = row.refund_id;
	var icon = "icon-application_view_detail";
	var url = "${api}/bus/aftersale/refund/toDetailView/"+ refundId +"?buttontype=aftersaleRefund";	
	var subtitle = "退货单("+ refundId +")详情";
	var refundType = row.refund_type;
	if(refundType==2){
		var url = "${api}/bus/aftersale/barter/toDetailView/"+ refundId +"?buttontype=aftersaleBarter";	
		var subtitle = "换货单("+ refundId +")详情";
	}	
	parent.addTab(subtitle, url, icon);	
}

/**
 * 取消订单
 */
function orderCancel(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];
	$.messager.confirm("确认","确认要取消该单据("+ row.refund_id +")?",function(sure){
		if(sure) {		
			commonPost("${api}/bus/aftersale/status/${cancelStatus}?refundIds="+ row.refund_id, 
					JSON.stringify({}), reflushDataGrid);		
		}
	});
}

//刷新DataGrid
function reflushDataGrid(){
	query();
}



</script>
