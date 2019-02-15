<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toAddView('22')">盘盈入库</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toAddView('23')">采购入库</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
 -->
<script type="text/javascript">

//跳转至盘盈入库新增界面
function toAddView(asnType){
	
	var url = "${api}/doc/asn/toAddView?asnType="+ asnType;
	var icon = "icon-add";
	var subtitle = "创建入库单";
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
	var url = "${api}/doc/asn/toDetailView?asnNo="+ row.asn_no +"&asnType="+ row.asn_type +"&buttontype=docAsn";
	var icon = "icon-application_view_detail";
	var subtitle = "入库单("+ row.asn_no +")详情";
	parent.addTab(subtitle, url, icon);	
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
