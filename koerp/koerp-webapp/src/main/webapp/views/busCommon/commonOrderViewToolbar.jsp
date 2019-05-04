<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<style type="text/css">

.toolbar{
	height:28px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	border-top:0px;
	border-left:0px;
	border-right:0px;
	background: #f3f3f3;
	padding:2px 0px;
}

</style>

<div id="detailtoolbar" class="toolbar" data-options="region:'north', border:false" >	
    <!-- 销售订单 -->
	<a href="#" id="order_cancel" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="orderCancel()">撤销</a>
	<a href="#" id="add_order_remark" class="easyui-linkbutton" iconCls="icon-book_open" plain="true" onclick="toOrderRemarkView('${orderId}')">添加备注</a>	
	<a href="#" id="order_take" class="easyui-linkbutton" iconCls="icon-user_edit" plain="true" onclick="toCreateTakeView('${orderId}')">创建寄提单</a>	
	<a href="#" id="create_refund" class="easyui-linkbutton" iconCls="icon-book_add" plain="true" onclick="toCreateRefundView('${orderId}')">创建退货单</a>
	<a href="#" id="create_barter" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="toCreateBarterView('${orderId}')">创建换货单</a>
	<a href="#" id="onekey_refund" class="easyui-linkbutton" iconCls="icon-mouse_add" plain="true" onclick="toAllRefundView('${orderId}')">一键退货</a>
	<a href="#" id="take_goods_history" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="toTakeGoodsHistoryView('${orderId}')">寄提详情</a>

	<!-- 入库单 -->	
	<a href="#" id="docAsn_cancel" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="orderCancel()">撤销</a>
	<a href="#" id="create_asn_refund" class="easyui-linkbutton" iconCls="icon-book_add" plain="true" onclick="toCreateAsnRefundView()">创建退货单</a>	
	<a href="#" id="docAsn_sign" class="easyui-linkbutton" iconCls="icon-user_edit" plain="true" onclick="showSignView()">审核</a>
	<a href="#" id="add_si_remark" class="easyui-linkbutton" iconCls="icon-book_open" plain="true" onclick="toSiRemarkView('${asnNo}')">添加备注</a>
	
	<!-- 寄提单 -->
	<a href="#" id="take_out" class="easyui-linkbutton" iconCls="icon-user_go" plain="true" onclick="showTakeOutView()">寄提出库</a>
	<a href="#" id="take_cancel" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="orderCancel()">撤销</a>
	<a href="#" id="add_take_remark" class="easyui-linkbutton" iconCls="icon-book_open" plain="true" onclick="toTakeRemarkView('${takeId}')">添加备注</a>
	
	<!-- 出库单 -->
	<a href="#" id="docOrder_cancel" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="orderCancel()">撤销</a>
	<a href="#" id="add_so_remark" class="easyui-linkbutton" iconCls="icon-book_open" plain="true" onclick="toSoRemarkView('${orderNo}')">添加备注</a>
	
	<!-- 申请单 -->
	<a href="#" id="docPo_cancel" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="orderCancel()">撤销</a>
	<a href="#" id="docPo_update" class="easyui-linkbutton" iconCls="icon-cog_edit" plain="true" onclick="orderUpdate()">更新</a>
	<a href="#" id="add_po_remark" class="easyui-linkbutton" iconCls="icon-book_open" plain="true" onclick="toPoRemarkView('${poNo}')">添加备注</a>
	
	<!-- 退换货单 -->
	<a href="#" id="refund_cancel" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="orderCancel()">撤销</a>
	<a href="#" id="repair_refund" class="easyui-linkbutton" iconCls="icon-star" plain="true" onclick="toRepairRefundView('${refundId}')">补退款</a>
	<a href="#" id="complete_refund" class="easyui-linkbutton" iconCls="icon-attach" plain="true" onclick="completeRefund()">退货完成</a>	
	<a href="#" id="add_refund_remark" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="toRefundRemarkView('${refundId}')">添加备注</a>
	
	<!-- 公共按钮 -->
	<a href="#" id="order_refresh" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="parent.refreshCurrTab()">刷新</a>			
	<a href="#" id="order_return" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="orderReturn()">返回</a>
</div> 

<%@include file="../busCommon/commonOrderFunc.jsp"%>

<script type="text/javascript">

var buttonsMap = {
	//"aftersaleRefund": ["refund_cancel","repair_refund","complete_refund","add_refund_remark","order_refresh","order_return"],	
	"aftersaleRefund": ["refund_cancel","add_refund_remark","order_refresh","order_return"],	           
	"aftersaleBarter": ["refund_cancel","repair_refund","add_refund_remark","order_refresh","order_return"],
	"docOrder": ["docOrder_cancel","add_so_remark","order_refresh","order_return"],
	"docAsn": ["docAsn_sign","docAsn_cancel","create_asn_refund","add_si_remark","order_refresh","order_return"],
	"docPo": ["docPo_cancel","docPo_update","order_return","add_po_remark","order_refresh"],
	"busTake": ["take_cancel", "add_take_remark","take_out","order_refresh", "order_return"],
	"busOrder": ["order_cancel","add_order_remark","order_take","create_refund","onekey_refund","take_goods_history","order_refresh","order_return"]
	//"busOrder": ["order_cancel","add_order_remark","create_refund","create_barter","onekey_refund","order_refresh", "order_return"]
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