<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<shiro:hasPermission name="busInvSku:configWarning">
	<a href="#" class="easyui-linkbutton" iconCls="icon-bell_silver" plain="true" onclick="toConfigWarningView('0')">配置库存预警</a>
</shiro:hasPermission>
<shiro:hasPermission name="busInvSku:configAllWarning">
	<a href="#" class="easyui-linkbutton" iconCls="icon-bell" plain="true" onclick="toConfigWarningView('1')">配置库存预警</a>
</shiro:hasPermission>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
 -->
<script type="text/javascript">

//跳转至编辑界面
function toDetailView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}	
	var url = "${api}/bus/invSku/toDetailView?sku="+ rows[0].sku+"&shopId="+ rows[0].shop_id;
	var icon = "icon-application_view_detail";
	var subtitle = rows[0].shop_name +"("+ rows[0].goods_name +")";
	parent.addTab(subtitle, url, icon);	
}

/**
 * 设置库存预警
 */
function toConfigWarningView(isAll){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows==null || rows.length==0) {
		$.messager.alert("提示","请选择至少一行数据！");
		return;
	}	
	var ids = [];
	var isOpen = true;
	if(isAll=='0'){
		var currShopId = '${user.shopId}';
		$.each(rows, function(){
			if(this.shop_id!=currShopId){
				$.messager.alert("提示","请选择自己门店的商品！");
				isOpen = false;
				return;
			}
			ids.push(this.id);
		});
	}else{
		$.each(rows, function(){
			ids.push(this.id);
		});
	}
	
	if(isOpen){
		$("<div></div>").dialog({
	        id: "ordersDialog",
	        title: "设置库存预警",
	        width: '300px',
	        height: '180px',
	        iconCls: "icon-edit",
	        closed: false,
	        cache: false,
	        href: "${api}/bus/invSku/toConfigWarningView",	       
	        modal: true,
	        minimizable: false,
	        maximizable: false,
	        closable: true,
	        collapsible: false,
	        resizable: true,
	        buttons:[
	         	{
	         		text:"确定",iconCls:"icon-disk",
	                handler: function (data) {                     	
	                	if ($setWarningfm.form('validate')) {
	                		var warningQty = $("#warningQty",$setWarningfm).numberspinner("getValue");
	                		var url = "${api}/bus/invSku/configWarning/"+ warningQty +"?ids="+ ids.join(",");
	                		commonPost(url, JSON.stringify({}), function(){
	                			reflushDataGrid();
	                			$('#ordersDialog').dialog("destroy");
	                		});                		
	                  	}           	
	                }
	             },
	             {
	                 text:"关闭",
	                 iconCls:"icon-cancel",
	                 handler:function(){
	                 	$('#ordersDialog').dialog("destroy");
	                 }
	             }
	         ],
	        onClose: function () {
	            $(this).dialog("destroy");
	        }
	    });
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


</script>
