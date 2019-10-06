<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript"  src="<%=request.getContextPath()%>/jquery-easyui/commons/js/LodopFuncs.js"></script>

<a href="#" class="easyui-linkbutton" iconCls="icon-lorry_error" plain="true" onclick="toAddView('16')">撤柜退货</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-2012081511202" plain="true" onclick="toPrintOrderView()">打印</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	

<%@include file="./operate/toPrintOrderView.jsp"%>

<script type="text/javascript">

//跳转至盘盈入库新增界面
function toAddView(orderType){
	
	var url = "${api}/bus/refund/toAddView?orderType="+ orderType;
	var icon = "icon-add";
	var subtitle = "创建退货单";
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
	var url = "${api}/bus/refund/toDetailView?orderNo="+ row.order_no +"&orderType="+ row.order_type +"&buttontype=docOrder";
	var icon = "icon-application_view_detail";
	var subtitle = "退货单("+ row.order_no +")详情";
	parent.addTab(subtitle, url, icon);	
}

function toPrintOrderView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];
	if(row.trade_status=="40" || row.trade_status=="60"){
		$.messager.alert("提示","取消或关闭的单据不可打印！");
		return;
	}
	$.ajax({
		type : "GET",
		url : "${api}/bus/refund/getInitData",
		data:{
			"orderNo": row.order_no,
			"orderType": row.order_type
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docOrderDto = result.entry;
			if(docOrderDto!=null){
				madeOrderView(docOrderDto, reflushDataGrid);
			}		
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
}

//刷新DataGrid
function reflushDataGrid(){
	query();
}

</script>
