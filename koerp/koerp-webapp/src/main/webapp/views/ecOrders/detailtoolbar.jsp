<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<style>
.toolbar{
	height:30px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	border-bottom:0px;
	background: #f3f3f3;
	padding-top:2px;
}
</style>

<div id="detailtoolbar" class="toolbar" data-options="region:'center'">	
	
	<!-- allos -->
	<!-- <a href="#" id="order_syn" class="easyui-linkbutton" iconCls="icon-arrow_redo" plain="true" onclick="">订单手工同步</a> -->
	<a href="#" id="order_express" class="easyui-linkbutton" iconCls="icon-award_star_silver_3" plain="true" onclick="toAppointExpressView('${sysorderid}')">指定快递</a>
	<a href="#" id="order_edit_sku" class="easyui-linkbutton" iconCls="icon-asterisk_orange" plain="true" onclick="toChangeSkuView('${sysorderid}')">更改商品</a>	
	<a href="#" id="order_edit_receive_info" class="easyui-linkbutton" iconCls="icon-asterisk_red" plain="true" onclick="toDeliveryDetailView('${sysorderid}')">修改收货信息</a>
	<a href="#" id="order_edit_invoice_info" class="easyui-linkbutton" iconCls="icon-asterisk_yellow" plain="true" onclick="toBillDetailView('${sysorderid}')">修改发票信息</a>
	<a href="#" id="order_blacklist" class="easyui-linkbutton" iconCls="icon-report_user" plain="true" onclick="toBlacklistView('${sysorderid}')">列为黑名单</a>
	<a href="#" id="order_create_refund_order" class="easyui-linkbutton" iconCls="icon-book_add" plain="true" onclick="toCreateRefundView('${sysorderid}')">创建退货单</a>
	<a href="#" id="order_create_barter_order" class="easyui-linkbutton" iconCls="icon-book_open" plain="true" onclick="toCreateBarterView('${sysorderid}')">创建换货单</a>
	<a href="#" id="order_create_reissue_order" class="easyui-linkbutton" iconCls="icon-book_go" plain="true" onclick="toCreateReissueView('${sysorderid}')">创建补发单</a>
	<a href="#" id="order_audit_pass" class="easyui-linkbutton" iconCls="icon-cog_go" plain="true" onclick="orderPassAudit('${sysorderid}')">审核通过</a>
	<a href="#" id="order_audit_reject" class="easyui-linkbutton" iconCls="icon-cog_stop" plain="true" onclick="orderRejectAudit('${sysorderid}')">审核驳回</a>
	<a href="#" id="order_reaudit" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="orderReaudit('${sysorderid}')">重新审核</a>
	<a href="#" id="order_refresh" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="orderRefresh('${sysorderid}')">刷新</a>
	<a href="#" id="order_repair_refund_price" class="easyui-linkbutton" iconCls="icon-star" plain="true" onclick="toCreateCashView('${sysorderid}','')">补退款</a> 
	<a href="#" id="order_add_remark" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="toRemarkView('${sysorderid}')">添加备注</a>
	<a href="#" id="order_transfer_order" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="toTransferOrder('${sysorderid}')">转为普通订单</a>
	
</div>

<%@include file="../ecCommon/commonOrderFunc.jsp"%>

<script type="text/javascript">

var buttonsMap = {
	"baseos": ["order_express","order_edit_sku","order_edit_receive_info", "order_edit_invoice_info", 
	           "order_blacklist", "order_create_refund_order", "order_create_barter_order", "order_create_reissue_order", 
	           "order_audit_pass", "order_audit_reject", "order_reaudit", "order_refresh", "order_repair_refund_price", 
	           "order_add_remark", "order_transfer_order"],	           	            
	"expressos": ["order_express", "order_edit_sku", "order_edit_receive_info", "order_edit_invoice_info", 
	              "order_blacklist", "order_reaudit", "order_refresh"],	              
	"lackos": [	"order_edit_sku", "order_edit_receive_info", "order_reaudit", "order_refresh", "order_add_remark" ]
}

$(function() {
    
	var buttontype = "${buttontype}";
    var enablebuttons = buttonsMap[buttontype];
	$("#detailtoolbar").find(".easyui-linkbutton").each(function(){	
		var linkButtonId = $(this).attr("id");
		if(enablebuttons.contains(linkButtonId)){
			//$(this).show();	
		}else{				
			$(this).hide();
		}		
	});
	
	var hiddenButtons = '${hiddenbuttons}';
	$.each(hiddenButtons.split(","), function(){
		if($("#"+this).length>0){
			$("#"+this).hide();
		}
	});
});

</script>