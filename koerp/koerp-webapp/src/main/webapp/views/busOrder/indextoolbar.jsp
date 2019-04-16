<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<script type="text/javascript"  src="<%=request.getContextPath()%>/jquery-easyui/commons/js/LodopFuncs.js"></script>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
<a href="#" class="easyui-linkbutton" iconCls="icon-vcard_add" plain="true" onclick="toAddView('1')">销售出库</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-vcard_key" plain="true" onclick="toAddView('2')">销售寄存</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-page_copy" plain="true" onclick="toCopyOrderView()">复制</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-2012081511202" plain="true" onclick="toPrintOrderView(0)">打印</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<a href="#" class="easyui-linkbutton" iconCls="icon-client" plain="true" onclick="toAddCustomerView()">创建客户</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-memu_visa" plain="true" onclick="toVipActiveView()">会员开卡</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-2012081511202" plain="true" onclick="toVipPrintOrderView()">打印(会员)</a>	
<a href="#" class="easyui-linkbutton" iconCls="icon-2012081511202" plain="true" onclick="toPrintOrderView(1)">打印(零售)</a>
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
 -->
<%@include file="./operate/toPrintOrderView.jsp"%>

<script type="text/javascript">

//跳转至盘盈入库新增界面
function toAddView(orderType){
	
	var url = "${api}/bus/order/toAddView?orderType="+ orderType;
	var icon = "icon-add";
	var subtitle = "创建销售单";
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
	var subtitle = "销售单("+ row.order_id +")详情";
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
	var subtitle = "创建销售单";
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
	commonDialog("ordersDialog", "创建客户", "75%", "65%", 
		"${api}/bus/customer/toDetailView?id=", "icon-client");
}

/*
 * 会员开卡
 */
function toVipActiveView(){
	commonDialog("ordersDialog", "会员开卡", "90%", "88%", 
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
