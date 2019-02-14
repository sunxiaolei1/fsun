<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<style type="text/css"> 

.toolbar{
	height:30px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	background: #f3f3f3;
	padding-top:2px;
}

.easyui-textbox, .easyui-combogrid, .easyui-datebox, .easyui-combobox, .easyui-numberbox, .easyui-datetimebox {
	width: 162px;
}

.fsun-wrap {
	border: 1px solid #ccc;
	padding: 15px 5px 5px 5px;
	margin-top: 10px;
}

.fsun-wrap .title {
	position: absolute;
	color: #416AA3;
	font-weight: bold;
	left: 2%;
	line-height: 2em;
	padding: 0 1em;
	background-color: #fff;
}

</style> 

<div id="detailtoolbar" class="toolbar" data-options="region:'center'">	
	<a href="#" id="order_cancel" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="orderCancel()">取消订单</a>
	<a href="#" id="add_order_remark" class="easyui-linkbutton" iconCls="icon-book_open" plain="true" onclick="toAddOrderRemark()">添加备注</a>	
	<a href="#" id="create_refund" class="easyui-linkbutton" iconCls="icon-book_add" plain="true" onclick="toCreateRefund()">创建退货单</a>	
	<a href="#" id="create_barter" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="toCreateBarter()">创建换货单</a>
	<a href="#" id="onekey_refund" class="easyui-linkbutton" iconCls="icon-mouse_add" plain="true" onclick="onekeyRefund()">一键退货</a>
	
	<a href="#" id="repair_refund" class="easyui-linkbutton" iconCls="icon-star" plain="true" onclick="toRepairRefund()">补退款</a>
	<a href="#" id="complete_refund" class="easyui-linkbutton" iconCls="icon-attach" plain="true" onclick="completeRefund()">退货完成</a>	
	<a href="#" id="add_refund_remark" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="toAddRefundRemark()">添加备注</a>
	
	<a href="#" id="order_refresh" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="parent.refreshCurrTab()">刷新</a>			
	<a href="#" id="order_return" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="orderReturn()">返回</a>
</div> 

<script type="text/javascript">

var buttonsMap = {
	"aftersaleRefund": ["order_cancel","repair_refund","complete_refund","add_refund_remark","order_refresh","order_return"],	           
	"aftersaleBarter": ["order_cancel","repair_refund","add_refund_remark","order_refresh","order_return"],
	"docOrder": ["order_cancel","order_refresh","order_return"],
	"docAsn": ["order_cancel","create_refund","order_refresh","order_return"],
	"docPo": ["order_cancel","order_return","order_refresh"],
	"busOrder": ["order_cancel","add_order_remark","create_refund","create_barter","onekey_refund","order_refresh", "order_return"]
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

/**
 * 取消订单
 */
function orderCancel(){
	//获取保存数据
	var saveData = getOrderCancelData();
	if(saveData!=null){		
		if(typeof afterSaveFunc === 'function'){	
			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), null, afterSaveFunc);
		}else{
			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), cancel);
		}		
	}	
}


/**
 * 取消
 */
function orderReturn(){
	parent.closeCurrTab();
}

/**
 * 创建退货单
 */
function orderRefund(){
	
}

</script>