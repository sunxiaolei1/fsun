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
	<!-- <a href="#" id="order_accept" class="easyui-linkbutton" iconCls="icon-asterisk_yellow" plain="true" onclick="">受理</a> -->
	<a href="#" id="order_edit_sku" class="easyui-linkbutton" iconCls="icon-asterisk_orange" plain="true" onclick="toChangeSkuView('${sysorderid}')">更改商品</a>	
	<a href="#" id="order_edit_receive_info" class="easyui-linkbutton" iconCls="icon-asterisk_red" plain="true" onclick="toDeliveryDetailView('${sysorderid}')">修改收货信息</a>	
	<a href="#" id="order_complete_refund_order" class="easyui-linkbutton" iconCls="icon-attach" plain="true" onclick="toCompleteRefundView('${refundorderid}')">退货完成</a>
	<a href="#" id="order_close_barter_order" class="easyui-linkbutton" iconCls="icon-bullet_cross" plain="true" onclick="toCloseBarterView('${refundorderid}')">关闭换货单</a>
	<a href="#" id="order_transfer_refund_order" class="easyui-linkbutton" iconCls="icon-arrow_switch_bluegreen" plain="true" onclick="toTransferRefundView('${refundorderid}')">转为退货单</a>
	<a href="#" id="order_activate_renew" class="easyui-linkbutton" iconCls="icon-transmit_red" plain="true" onclick="toActivateRenewView('${refundorderid}')">激活换发</a>
	<a href="#" id="order_close_reissue_order" class="easyui-linkbutton" iconCls="icon-bullet_cross" plain="true" onclick="toCloseReissueView('${sysorderid}')">关闭补发单</a>	
	<a href="#" id="order_reaudit" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="orderReaudit('${sysorderid}')">重新审核</a>	
	<a href="#" id="order_refresh" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="parent.refreshCurrTab()">刷新</a>
	<a href="#" id="order_repair_refund_price" class="easyui-linkbutton" iconCls="icon-star" plain="true" onclick="toCreateCashView('','${refundorderid}')">补退款</a> 
	<a href="#" id="order_add_refund_remark" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="toRefundRemarkView('${refundorderid}')">添加备注</a>
	<a href="#" id="order_add_remark" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="toRenewRemarkView('${sysorderid}')">添加备注</a>	
	<a href="#" id="order_close_refund_order" class="easyui-linkbutton" iconCls="icon-bullet_cross" plain="true" onclick="toCloseRefundView('${refundorderid}')">关闭退货单</a>
	<a href="#" id="order_transfer_barter_order" class="easyui-linkbutton" iconCls="icon-arrow_switch" plain="true" onclick="">转为换货单</a>
	
	<!-- 
	refund 退货单详情 
	<a href="#" id="order_complete_refund_order" class="easyui-linkbutton" iconCls="icon-award_star_silver_3" plain="true" onclick="">退货完成</a>		
	<a href="#" id="order_refresh" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="">刷新</a>
	<a href="#" id="order_repair_refund_price" class="easyui-linkbutton" iconCls="icon-star" plain="true" onclick="">补退款</a> 
	<a href="#" id="order_add_refund_remark" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="">添加备注</a>
	<a href="#" id="order_close_refund_order" class="easyui-linkbutton" iconCls="icon-bullet_cross" plain="true" onclick="">关闭退货单</a>
	<a href="#" id="order_transfer_barter_order" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="">转为换货单</a>
			
	barter 换货单详情 
	<a href="#" id="order_accept" class="easyui-linkbutton" iconCls="icon-asterisk_orange" plain="true" onclick="">受理</a>
	<a href="#" id="order_edit_sku" class="easyui-linkbutton" iconCls="icon-asterisk_orange" plain="true" onclick="">更改商品</a>	
	<a href="#" id="order_edit_receive_info" class="easyui-linkbutton" iconCls="icon-asterisk_red" plain="true" onclick="">修改收货信息</a>
	<a href="#" id="order_complete_refund_order" class="easyui-linkbutton" iconCls="icon-award_star_silver_3" plain="true" onclick="">退货完成</a>
	<a href="#" id="order_close_barter_order" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="">关闭换货单</a>
	<a href="#" id="order_transfer_refund_order" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="">转为退货单</a>
	<a href="#" id="order_activate_renew" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="">激活换发</a>
	<a href="#" id="order_reaudit" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="">重新审核</a>
	<a href="#" id="order_refresh" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="">刷新</a>
	<a href="#" id="order_repair_refund_price" class="easyui-linkbutton" iconCls="icon-star" plain="true" onclick="">补退款</a> 
	<a href="#" id="order_add_refund_remark" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="">添加备注</a>
	
	reissue 补发单详情
	<a href="#" id="order_close_reissue_order" class="easyui-linkbutton" iconCls="icon-bullet_cross" plain="true" onclick="">关闭补发单</a>			
	<a href="#" id="order_reaudit" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="">重新审核</a>
	<a href="#" id="order_refresh" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="">刷新</a>
	<a href="#" id="order_add_remark" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="">添加备注</a>
	-->
	
</div>

<%@include file="../ecCommon/commonOrderFunc.jsp"%>

<script type="text/javascript">

var buttonsMap = {
	"refundos": ["order_complete_refund_order", "order_close_barter_order", "order_refresh", "order_repair_refund_price", 
	             "order_add_refund_remark", "order_close_refund_order", "order_transfer_barter_order"],	           
	"barteros": ["order_edit_sku", "order_edit_receive_info", "order_complete_refund_order",
	            "order_close_barter_order", "order_transfer_refund_order", "order_activate_renew",
	            "order_reaudit", "order_refresh", "order_repair_refund_price","order_add_refund_remark"],
	"reissueos": ["order_close_reissue_order","order_reaudit","order_refresh","order_repair_refund_price","order_add_remark"]
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