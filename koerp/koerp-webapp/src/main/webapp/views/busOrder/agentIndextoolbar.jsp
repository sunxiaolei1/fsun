<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript"  src="<%=request.getContextPath()%>/jquery-easyui/commons/js/LodopFuncs.js"></script>

<a href="#" class="easyui-linkbutton" iconCls="icon-vcard_add" plain="true" onclick="toAddView('3')">新增</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-page_copy" plain="true" onclick="toCopyOrderView()">复制</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-2012081511202" plain="true" onclick="toPrintOrderView(0)">打印</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<a href="#" class="easyui-linkbutton" iconCls="icon-client" plain="true" onclick="toAddCustomerView()">创建客户</a>

<%@include file="./operate/toPrintOrderView.jsp"%>

<script type="text/javascript">

//跳转至盘盈入库新增界面
function toAddView(orderType){
	
	var url = "${api}/bus/order/toAddView?orderType="+ orderType;
	var icon = "icon-add";
	var subtitle = "创建代理代发单";
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
	var url = "${api}/bus/order/toDetailView?orderId="+ row.order_id +"&orderType="+ row.order_type +"&buttontype=busOrder";
	var icon = "icon-application_view_detail";
	var subtitle = "代理代发单("+ row.order_id +")详情";
	parent.addTab(subtitle, url, icon);	
}

//跳转至单据复制新增界面
function toCopyOrderView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];
	var url = "${api}/bus/order/toCopyOrderView?orderId="+ row.order_id + "&orderType="+ row.order_type;
	var icon = "icon-page_copy";
	var subtitle = "创建代理代发单";
	parent.addTab(subtitle, url, icon);	
}

function toPrintOrderView(printType){
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
		url : "${api}/bus/order/getInitData",
		data:{
			"orderId": row.order_id,
			"orderType": row.order_type
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docOrderDto = result.entry;
			if(docOrderDto!=null){
				madeOrderView(docOrderDto, reflushDataGrid, printType);
			}		
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
}

//会员卡余额打印
function toVipPrintOrderView(){
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
		url : "${api}/bus/order/getVipPrintOrder",
		data:{
			"orderId": row.order_id,
			"orderType": row.order_type
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docOrderDto = result.entry;
			if(docOrderDto!=null){
				madeOrderView(docOrderDto, reflushDataGrid, 0);
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

/*
 * 创建客户
 */
function toAddCustomerView(){
	commonDialog("ordersDialog", "创建客户", "75%", "325px", 
		"${api}/bus/customer/toDetailView?id=", "icon-client");
}

/*
 * 会员开卡
 */
function toVipActiveView(){
	commonDialog("ordersDialog", "会员开卡", "95%", "380px", 
		"${api}/bus/vipUnpaid/toVipActiveView", "icon-memu_visa");
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
