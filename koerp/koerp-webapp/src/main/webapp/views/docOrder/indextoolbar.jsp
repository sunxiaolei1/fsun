<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript"  src="<%=request.getContextPath()%>/jquery-easyui/commons/js/LodopFuncs.js"></script>

<a href="#" class="easyui-linkbutton" iconCls="icon-lorry_delete" plain="true" onclick="toAddView('12')">盘亏出库</a>
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-vcard_edit" plain="true" onclick="toAddView('16')">领用出库</a>
 --><a href="#" class="easyui-linkbutton" iconCls="icon-lorry_error" plain="true" onclick="toAddView('15')">报损出库</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-user_comment" plain="true" onclick="toAllotApplyDialog()">调拨审核</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-2012081511202" plain="true" onclick="toPrintOrderView()">打印</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
 -->
<%@include file="./operate/toPrintOrderView.jsp"%>
<%@include file="./operate/toPrintAllotView.jsp"%>

<script type="text/javascript">

//跳转至盘盈入库新增界面
function toAddView(orderType){
	
	var url = "${api}/doc/order/toAddView?orderType="+ orderType;
	var icon = "icon-add";
	var subtitle = "创建出库单";
	parent.addTab(subtitle, url, icon);	
}

//调拨审核--打开申请单选择页面
function toAllotApplyDialog(){
	var url = "${api}/doc/po/toAllotApplyView";	
	commonDialog("ordersDialog", "可选申请单列表", "95%", "85%", url, "icon-vcard");
}

//调拨审核--打开出库审核页面
function toStockOutAuditView(poDetailIds,toShopId){
	//关闭申请选择页面
	$("#ordersDialog").dialog("destroy");
	//打开出库审核页面
	var url = "${api}/doc/order/toAddView?orderType=11&poDetailIds="+ poDetailIds+"&toShopId="+ toShopId;
	var icon = "icon-cog_edit";
	var subtitle = "出库审核";
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
	var url = "${api}/doc/order/toDetailView?orderNo="+ row.order_no +"&orderType="+ row.order_type +"&buttontype=docOrder";
	var icon = "icon-application_view_detail";
	var subtitle = "出库单("+ row.order_no +")详情";
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
		url : "${api}/doc/order/getInitData",
		data:{
			"orderNo": row.order_no,
			"orderType": row.order_type
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docOrderDto = result.entry;
			if(docOrderDto!=null){
				if(row.order_type=='11'){
					madeAllotView(docOrderDto, reflushDataGrid);
				}else{
					madeOrderView(docOrderDto, reflushDataGrid);
				}
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

//隐藏查询条件
function hide() {
	commonHide("queryDiv", "gridDiv", "100%", currDataGrid);
}

//展开查询条件
function show() {
	commonShow("queryDiv", "gridDiv", "85%", currDataGrid);
}


</script>
