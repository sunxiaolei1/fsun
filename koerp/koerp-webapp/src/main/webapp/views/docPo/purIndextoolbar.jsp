<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toAddView('10')">要货申请</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-application_osx_go" plain="true" onclick="toERPAudit()">送ERP</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
 -->

<script type="text/javascript">

//跳转至申请单新增界面
function toAddView(poType){
	
	var url = "${api}/doc/po/toAddView?poType="+ poType;
	var icon = "icon-add";
	var subtitle = "创建申请单";
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
	var url = "${api}/doc/po/toDetailView?poNo="+ row.po_no +"&poType="+ row.po_type +"&buttontype=docPo";
	var icon = "icon-application_view_detail";
	var subtitle = "申请单("+ row.po_no +")详情";
	parent.addTab(subtitle, url, icon);	
}

function toERPAudit(){
	
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length > 0) {	
		var poNos = [];
		var enabled = true;
		
		$.each(rows, function(){
			if(this.po_status=='00'){
				poNos.push(this.po_no);
			}else{
				enabled = false;
				$.messager.alert("提示","单据("+ this.po_no +")状态不可用!");
				return false;
			}			
		});
		if(enabled){
			var saveUrl = "${api}/doc/po/status/${toERP}?poNos="+ poNos.join(",");
			commonPost(saveUrl, JSON.stringify({}), reflushDataGrid);	
		}		
	}else{
		$.messager.alert("提示","只能选择至少一行数据！");
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
	commonShow("queryDiv", "gridDiv", "85%", currDataGrid);
}


</script>
