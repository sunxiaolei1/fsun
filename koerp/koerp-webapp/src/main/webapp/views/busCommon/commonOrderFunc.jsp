<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script type="text/javascript">

/**
 * 取消订单
 */
function orderCancel(){
	$.messager.confirm('操作','确认要撤销？', function(r) {
	    if(r){
	    	var saveData = getOrderCancelData();
	    	if(saveData!=null){		
	    		if(typeof afterSaveFunc === 'function'){	
	    			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), null, afterSaveFunc);
	    		}else{
	    			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), cancel);
	    		}		
	    	}		
	    } 
	});
	
}

/**
 * 驳回单据
 */
function orderReject(){
	$.messager.confirm('操作','确认要驳回？', function(r) {
	    if(r){
	    	var saveData = getRejectData();
	    	if(saveData!=null){		
	    		if(typeof afterSaveFunc === 'function'){	
	    			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), null, afterSaveFunc);
	    		}else{
	    			commonPost(saveData.saveUrl, JSON.stringify(saveData.params));
	    		}		
	    	}	
	    } 
	});
}

/**
 * 更新单据
 */
function orderUpdate(){
	//获取保存数据
	var updateData = getUpdateData();
	if(updateData!=null){		
		if(typeof afterSaveFunc === 'function'){	
			commonPost(updateData.saveUrl, JSON.stringify(updateData.params), null, afterSaveFunc);
		}else{
			commonPost(updateData.saveUrl, JSON.stringify(updateData.params));
		}		
	}
}


/**
 * 返回
 */
function orderReturn(){
	parent.closeCurrTab();
}

/**
 * 跳转到修改备注信息页面
 */
function toOrderRemarkView(orderId){
	var url = "${api}/bus/order/toRemarkView/"+ orderId;	
	commonDialog("ordersDialog", "修改备注", "60%", "66%", url, "icon-book_red");
}

/**
 * 跳转到一键退货页面
 */
function toOneKeyRefundView(orderId){
	var url = "${api}/bus/order/toOneKeyRefundView/"+ orderId;	
	commonDialog("ordersDialog", "一键退货", "95%", "85%", url, "icon-mouse_add");
}

/**
 * 创建退货单
 */
function toCreateRefundView(orderId){
	
	var url = "${api}/bus/order/refund/toAddView/" + orderId;
	var icon = "icon-book_add";
	var subtitle = "创建退货单";
	parent.addTab(subtitle, url, icon);	
}

/**
 * 创建换货单
 */
function toCreateBarterView(orderId){
	
	var url = "${api}/bus/order/barter/toAddView/" + orderId;
	var icon = "icon-book_open";
	var subtitle = "创建换货单";
	parent.addTab(subtitle, url, icon);	
}

/**
 * 更新明细(指定快递、发票信息、收货信息)
 */
function updateDetail(){						
	var saveData = getSaveData();	
	if(saveData!=null){
		commonPost(saveData.saveUrl, JSON.stringify(saveData.params), function(orderId){			
			parent.refreshCurrTab();			    
		});						
	}		
}


/*************************************    售后单操作       *******************************************/


/**
 * 跳转到修改退货备注信息页面
 */
function toRefundRemarkView(refundId){
	var url = "${api}/bus/aftersale/refund/toRemarkView/"+ refundId;	
	commonDialog("ordersDialog", "修改备注信息", "60%", "66%", url, "icon-book_red");
}

/**
 * 修改退货备注信息
 */
function updateRefundRemark(){
	aftersaleOrderCommonSubmit();	
}

/**
 * 退货完成
 */
function completeRefund(){
	aftersaleOrderCommonSubmit();
}

/**
 * 跳转到补退款页面
 */
function toRepairRefundView(refundId){
	var url = "${api}/bus/aftersale/toRepairRefundView/"+ refundId;	
	commonDialog("ordersDialog", "补退款", "60%", "66%", url, "icon-book_red");
}

/**
 * 售后单据提交公用方法
 */
function aftersaleOrderCommonSubmit(){
	var saveData = getSaveData();	
	if(saveData!=null){		
		commonPost(saveData.saveUrl, JSON.stringify(saveData.params),function(refundId){
			parent.refreshCurrTab();
		});						
	}	
}


</script>