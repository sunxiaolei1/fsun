package com.fsun.domain.report;
/**
 * @author fsun
 * @date 2019年4月25日
 */
public class ContrastRefundCondition extends ReportCondition{

	/**
	 * 关键字查询字段
	 */
	private String q;
	
	/**
	 * 退货单号
	 */
	private String refundId;
	
	/**
	 * 订单编号
	 */
	private String orderId;
	
	 /**
     * 换发单号
     * 表字段 : bus_refund.barter_order_id
     */
    private String barterOrderId;
	
    /**
     * 退换货类型  1->退货单 2->换退单
     * 表字段 : bus_refund.refund_type
     */
    private Short refundType;

    /**
     * 退单状态，1 已退货 未退款 ，2 已退货 已退款，3 退单完成， 4 退单取消
     * 表字段 : bus_refund.refund_status
     */
    private Short refundStatus;
	
	/**
	 * 交易门店
	 */
	private String shopId;

	/**
	 * 客户编码
	 */
	private String buyerId;
	
	 /**
     * 退换货原因，枚举值 1-发错商品 2-无理由退换货 3-商品质量 4-收到实际商品与描述不符 5-配送产生问题 6-其他
     * 表字段 : bus_refund.refund_reason
     */
    private Short refundReason;
	
	/**
	 * 过滤掉的客户类型逗号分隔的字符串
	 */
	private String notInCustomerTypes;
	
	/**
	 * 过滤掉的客户类型
	 */
	private String[] notInCustomerTypeArr;

	

	public String getNotInCustomerTypes() {
		return notInCustomerTypes;
	}

	public void setNotInCustomerTypes(String notInCustomerTypes) {
		this.notInCustomerTypes = notInCustomerTypes;
		if(notInCustomerTypes!=null && !notInCustomerTypes.equals("")){
			this.notInCustomerTypeArr = notInCustomerTypes.split(",");
		}
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getBarterOrderId() {
		return barterOrderId;
	}

	public void setBarterOrderId(String barterOrderId) {
		this.barterOrderId = barterOrderId;
	}

	public Short getRefundType() {
		return refundType;
	}

	public void setRefundType(Short refundType) {
		this.refundType = refundType;
	}

	public Short getRefundStatus() {
		return refundStatus;
	}

	public void setRefundStatus(Short refundStatus) {
		this.refundStatus = refundStatus;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getRefundId() {
		return refundId;
	}

	public void setRefundId(String refundId) {
		this.refundId = refundId;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public Short getRefundReason() {
		return refundReason;
	}

	public void setRefundReason(Short refundReason) {
		this.refundReason = refundReason;
	}

	public String[] getNotInCustomerTypeArr() {
		return notInCustomerTypeArr;
	}

	public void setNotInCustomerTypeArr(String[] notInCustomerTypeArr) {
		this.notInCustomerTypeArr = notInCustomerTypeArr;
	}

}
