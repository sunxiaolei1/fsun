<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toAddView()">添加</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toDetailView()">修改</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="disabledBatch()">禁用</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="enabledBatch()">启用</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a> -->

<script type="text/javascript">


//跳转至新增界面
function toAddView(){		
	commonDialog("ordersDialog", "创建商品", "75%", "85%", 
		"${api}/bus/basSku/toDetailView?skuId=", "icon-add");
}

//跳转至编辑界面
function toDetailView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	commonDialog("ordersDialog", "商品("+ rows[0].goods_name +")明细", "75%", "85%", 
		"${api}/bus/basSku/toDetailView?skuId="+ rows[0].sku_id, "icon-edit");
}

//禁用
function disabledBatch() {
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length>0) {
		changeStatus(rows, "0", "禁用");
	}else{
		$.messager.alert("提示","请选择只少一行数据！");
	}	
}

//启用
function enabledBatch() {
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length>0) {
		changeStatus(rows, "1", "启用");
	}else{
		$.messager.alert("提示","请选择只少一行数据！");
	}	
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
	commonShow("queryDiv", "gridDiv", "89%", currDataGrid);
}

//改变客户状态方法
function changeStatus(rows, status, title){
	var skuIds = new Array();
	$.each(rows,function(){
		skuIds.push(this.sku_id);
	});
	$.messager.confirm("确认","是否确认"+ title +"操作?",function(sure){
		if(sure) {		
			commonPost("${api}/bus/basSku/status/"+ status +"?skuIds="+skuIds.join(","), 
				{}, reflushDataGrid);		
		}
	});
}

</script>
