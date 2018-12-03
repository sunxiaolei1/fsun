<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script type="text/javascript">

/**
 * 跳转到指定快递页面
 */
function toAppointExpressView(sysorderid){
	var url = "${api}/ecorder/operate/toAppointExpressView/"+sysorderid;	
	commonDialog("ordersDialog", "指定配送快递", "45%", "40%", url, "icon-award_star_silver_3");
}


/**
 * 跳转到修改收货信息页面
 */
function toDeliveryDetailView(sysorderid){
	var url = "${api}/ecorder/operate/toDeliveryDetailView/"+sysorderid;	
	commonDialog("ordersDialog", "修改收货信息", "75%", "58%", url, "icon-asterisk_red");
}

/**
 * 跳转到修改发票信息页面
 */
function toBillDetailView(sysorderid){
	var url = "${api}/ecorder/operate/toBillDetailView/"+sysorderid;	
	commonDialog("ordersDialog", "修改发票信息", "60%", "56%", url, "icon-asterisk_yellow");
}

/**
 * 跳转到修改备注信息页面
 */
function toRemarkView(sysorderid){
	var url = "${api}/ecorder/operate/toRemarkView/"+sysorderid;	
	commonDialog("ordersDialog", "修改备注信息", "60%", "66%", url, "icon-book_red");
}

/**
 * 跳转至列为黑名单页面
 */
function toBlacklistView(sysorderid){
	var url = "${api}/ecorder/operate/toBlacklistView/"+ sysorderid;	
	commonDialog("ordersDialog", "列为黑名单", "50%", "36%", url, "icon-report_user");
}

/**
 * 跳转到一键退货页面
 */
function toOneKeyRefundView(sysorderid){
	var url = "${api}/ecaftersale/refund/toOneKeyRefundView/"+sysorderid;	
	commonDialog("ordersDialog", "一键退货", "95%", "85%", url, "icon-mouse_add");
}

/**
 * 更改商品
 */
function toChangeSkuView(sysorderid){
	
	var url = "${api}/ecdiff/order/skus/toChangeView/" + sysorderid;
	var icon = "icon-asterisk_orange";
	var subtitle = "更改销售单("+sysorderid+")商品";
	parent.addTab(subtitle, url, icon);
}

/**
 * 跳转至创建补退款单页面
 */
function toCreateCashView(sysorderid, refundorderid){
	
	var url = "${api}/eccash/toCreateCashView?sysorderid=" + sysorderid +"&refundorderid="+ refundorderid;
	var currSysorderid = "${sysorderid}";
	if(sysorderid=="" && currSysorderid!=""){
		url = "${api}/eccash/toCreateCashView?sysorderid=" + currSysorderid +"&refundorderid=";
	}	
	var icon = "icon-star";
	var subtitle = "补退款";
	if(sysorderid!=null && sysorderid!=''){
		subtitle = ("销售单("+ sysorderid +")"+ subtitle);
	}else if(refundorderid!=null && refundorderid!=''){
		subtitle = ("退货单("+ refundorderid +")"+ subtitle);
	}	
	parent.addTab(subtitle, url, icon);
}


/**
 * 修改差异单
 */
function toEditDiffOrderView(diffid){
	
	var url = "${api}/ecdiff/order/toEditView/" + diffid;
	var icon = "icon-table";
	var subtitle = "编辑差异单("+diffid+")";
	parent.addTab(subtitle, url, icon);
}

/**
 * 创建退货单
 */
function toCreateRefundView(sysorderid){
	
	var url = "${api}/ecaftersale/refund/toAddView/" + sysorderid;
	var icon = "icon-book_add";
	var subtitle = "创建退货单";
	parent.addTab(subtitle, url, icon);	
}

/**
 * 创建换货单
 */
function toCreateBarterView(sysorderid){
	
	var url = "${api}/ecaftersale/barter/toAddView/" + sysorderid;
	var icon = "icon-book_open";
	var subtitle = "创建换货单";
	parent.addTab(subtitle, url, icon);	
}

/**
 * 创建补发单
 */
function toCreateReissueView(sysorderid){
	var url = "${api}/ecaftersale/reissue/toAddView/" + sysorderid;
	var icon = "icon-book_go";
	var subtitle = "创建补发单";
	parent.addTab(subtitle, url, icon);	
}

/**
 * 审核差异单
 */
function diffAudit(diffid, auditstatus, auditmemo){
	var params = {
		auditstatus: auditstatus,
		auditmemo: auditmemo
	}
	var url = "${api}/ecdiff/order/audit/" + diffid;
	commonPost(url, JSON.stringify(params));
}

/**
 * 订单审核通过
 */
function orderPassAudit(sysorderid){
	$.messager.confirm("确认", "是否需要审核通过？", function (sure) {
	    if (sure) {       	
	    	commonPost("${api}/ecorder/operate/passAudit/"+ sysorderid, {}, function(){
	    		parent.refreshCurrTab();
	    	});
	    }
	});
}

/**
 * 订单审核驳回
 */
function orderRejectAudit(sysorderid){
	$.messager.confirm("确认", "是否需要审核驳回？", function (sure) {
	    if (sure) {       	
	    	commonPost("${api}/ecorder/operate/rejectAudit/"+ sysorderid, {}, function(){
	    		parent.refreshCurrTab();
	    	});
	    }
	});
}


/**
 * 订单重新审核
 */
function orderReaudit(sysorderid){
	$.messager.confirm("确认", "是否需要重新审核？", function (sure) {
	    if (sure) {       	
	    	commonPost("${api}/ecorder/operate/reaudit/"+ sysorderid, {}, function(){
	    		parent.refreshCurrTab();
	    	});
	    }
	});
}

/**
 * 转为普通订单
 */
function toTransferOrder(sysorderid){
	$.messager.confirm("确认", "是否需要转为普通订单？", function (sure) {
	    if (sure) {       	
	    	commonPost("${api}/ecorder/operate/transferOrder/"+ sysorderid, {}, function(newsysorderid){
	    		orderRefresh(newsysorderid);
	    	});
	    }
	});
}

/**
 * 列为黑名单
 */
function toBlacklist(){
	aftersaleOrderCommonSubmit();
}

/**
 * 订单刷新
 */
function orderRefresh(sysorderid){
	var url = "${api}/ecorder/toDetail/" + sysorderid +"?buttontype=baseos";
	var icon = "icon-table";
	var subtitle = "销售单("+ sysorderid +")明细";
	parent.updateCurrTab(url, subtitle, icon);   
}

/**
 * 退货单刷新
 */
function refundOrderRefresh(refundorderid){
	var url = "${api}/ecaftersale/refund/toDetail/" + refundorderid +"?buttontype=refundos";
	var icon = "icon-table";
	var subtitle = "退货单("+ refundorderid +")明细";
	parent.updateCurrTab(url, subtitle, icon);   
}


/**
 * 换货单刷新
 */
function barterOrderRefresh(refundorderid, sendsysorderid){
	var url = "${api}/ecaftersale/barter/toDetail/" 
		+ refundorderid +"?buttontype=barteros&sendsysorderid="+ sendsysorderid;
	var icon = "icon-table";
	var subtitle = "换货单("+ refundorderid +")明细";
	parent.updateCurrTab(url, subtitle, icon);   
}


/**
 * 更新明细(指定快递、发票信息、收货信息)
 */
function updateDetail(){						
	var saveData = getSaveData();	
	if(saveData!=null){
		commonPost(saveData.saveUrl, JSON.stringify(saveData.params), function(sysorderid){
			$.messager.confirm("确认", "是否需要审核通过？", function (sure) {
			    if (sure) {       	
			    	commonPost("${api}/ecorder/operate/passAudit/"+ sysorderid, {}, function(){
			    		parent.refreshCurrTab();
			    	});
			    }else{
			    	parent.refreshCurrTab();
			    }
			});
		});						
	}		
}

/**
 * 追加备注
 */
function updateRemark(){						
	var saveData = getSaveData();	
	if(saveData!=null){
		commonPost(saveData.saveUrl, JSON.stringify(saveData.params), function(sysorderid){
			var tobuyerremark = $("#tobuyerremark", $remarkfm).prop("checked");
			if(tobuyerremark){
				$.messager.confirm("确认", "是否需要审核通过？", function (sure) {
				    if (sure) {       	
				    	commonPost("${api}/ecorder/operate/passAudit/"+ sysorderid, {}, function(){
				    		parent.refreshCurrTab();
				    	});
				    }else{
				    	parent.refreshCurrTab();
				    }
				});
				//orderPassAudit(sysorderid);
			}else{
				parent.refreshCurrTab();
			}			
		});						
	}		
}



/*************************************    售后单操作       *******************************************/


/**
 * 跳转到修改退货备注信息页面
 */
function toRefundRemarkView(refundorderid){
	var url = "${api}/ecaftersale/refund/toRefundRemarkView/"+refundorderid;	
	commonDialog("ordersDialog", "修改备注信息", "60%", "66%", url, "icon-book_red");
}

/**
 * 修改退货备注信息
 */
function updateRefundRemark(){
	aftersaleOrderCommonSubmit();	
}

/**
 * 跳转到修改换发备注信息页面
 */
function toRenewRemarkView(sysorderid){
	var url = "${api}/ecaftersale/barter/toRenewRemarkView/"+sysorderid;	
	commonDialog("ordersDialog", "修改备注信息", "60%", "61%", url, "icon-book_red");
}


/**
 * 修改换发备注
 */
function updateRenewRemark(){
	aftersaleOrderCommonSubmit();
}

/**
 * 跳转至换货单转换为退货单的页面
 */
function toTransferRefundView(refundorderid){
	var url = "${api}/ecaftersale/barter/toTransferRefundView/"+refundorderid;	
	commonDialog("ordersDialog", "转为退货单", "50%", "42%", url, "icon-arrow_switch_bluegreen");
}

/**
 * 换货单转换为退货单
 */
function toTransferRefund(){
	var saveData = getSaveData();	
	if(saveData!=null){
		commonPost(saveData.saveUrl, JSON.stringify(saveData.params),function(refundorderid){
			refundOrderRefresh(refundorderid);
		});						
	}	
}

/**
 * 跳转至退货完成的页面
 */
function toCompleteRefundView(refundorderid){
	var url = "${api}/ecaftersale/refund/toCompleteRefundView/"+ refundorderid;	
	commonDialog("ordersDialog", "退货完成", "50%", "42%", url, "icon-attach");
}

/**
 * 退货完成
 */
function completeRefund(){
	aftersaleOrderCommonSubmit();
}

/**
 * 跳转至关闭换货单的页面
 */
function toCloseBarterView(refundorderid){
	var url = "${api}/ecaftersale/barter/toCloseBarterView/"+ refundorderid;	
	commonDialog("ordersDialog", "关闭换货单", "50%", "42%", url, "icon-bullet_cross");
}

/**
 * 关闭换货单
 */
function closeBarter(){
	aftersaleOrderCommonSubmit();
}

/**
 * 跳转至激活换发的页面
 */
function toActivateRenewView(refundorderid){
	var url = "${api}/ecaftersale/barter/toActivateRenewView/"+ refundorderid;	
	commonDialog("ordersDialog", "激活换发", "50%", "42%", url, "icon-transmit_red");
}

/**
 * 激活换发
 */
function activateRenew(){
	aftersaleOrderCommonSubmit();
}

/**
 * 跳转至关闭退货单的页面
 */
function toCloseRefundView(refundorderid){
	var url = "${api}/ecaftersale/refund/toCloseRefundView/"+ refundorderid;	
	commonDialog("ordersDialog", "关闭退货单", "50%", "42%", url, "icon-bullet_cross");
}

/**
 * 跳转至关闭补发单的页面
 */
function toCloseReissueView(sysorderid){
	var url = "${api}/ecaftersale/reissue/toCloseReissueView/"+ sysorderid;	
	commonDialog("ordersDialog", "关闭补发单", "50%", "42%", url, "icon-bullet_cross");
}

/**
 * 关闭补发单
 */
function closeReissue(){
	aftersaleOrderCommonSubmit();
}


/**
 * 售后单据提交公用方法
 */
function aftersaleOrderCommonSubmit(){
	var saveData = getSaveData();	
	if(saveData!=null){		
		commonPost(saveData.saveUrl, JSON.stringify(saveData.params),function(refundorderid){
			parent.refreshCurrTab();
		});						
	}	
}


</script>