package com.fsun.domain.report;

/**
 * @author fsun
 * @date 2019年4月23日
 */
public class ContrastOrderCondition extends ReportCondition{
	
	/**
	 * 关键字查询字段
	 */
	private String keywords;
	
	/**
	 * 订单编号
	 */
	private String orderId;
	
	 /**
     * 订单类型 1 pos销售订单，2 销售寄存单
     * 表字段 : bus_order.order_type
     */
    private Short orderType;
	
	/**
	 * 交易门店
	 */
	private String shopId;
	
	/**
	 * 交易门店
	 */
	private String carrierId;

	/**
	 * 客户编码
	 */
	private String customerCode;
	
	/**
     * 交易状态[00 已下单，10 已付款，20 已发货，30 交易成功，40 订单取消，60 交易关闭]
     * 表字段 : bus_order.trade_status
     */
    private String tradeStatus;
	
	/**
	 * 过滤掉的客户类型逗号分隔的字符串
	 */
	private String notInCustomerTypes;
	
	/**
	 * 过滤掉的客户类型
	 */
	private String[] notInCustomerTypeArr;

	/**
	 * @return the customerCode
	 */
	public String getCustomerCode() {
		return customerCode;
	}

	/**
	 * @param customerCode the customerCode to set
	 */
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getNotInCustomerTypes() {
		return notInCustomerTypes;
	}

	public void setNotInCustomerTypes(String notInCustomerTypes) {
		this.notInCustomerTypes = notInCustomerTypes;
		if(notInCustomerTypes!=null && !notInCustomerTypes.equals("")){
			this.notInCustomerTypeArr = notInCustomerTypes.split(",");
		}
	}

	/**
	 * @return the orderId
	 */
	public String getOrderId() {
		return orderId;
	}

	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String[] getNotInCustomerTypeArr() {
		return notInCustomerTypeArr;
	}

	public void setNotInCustomerTypeArr(String[] notInCustomerTypeArr) {
		this.notInCustomerTypeArr = notInCustomerTypeArr;
	}

	/**
	 * @return the tradeStatus
	 */
	public String getTradeStatus() {
		return tradeStatus;
	}

	/**
	 * @param tradeStatus the tradeStatus to set
	 */
	public void setTradeStatus(String tradeStatus) {
		this.tradeStatus = tradeStatus;
	}

	/**
	 * @return the shopId
	 */
	public String getShopId() {
		return shopId;
	}

	/**
	 * @param shopId the shopId to set
	 */
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	/**
	 * @return the carrierId
	 */
	public String getCarrierId() {
		return carrierId;
	}

	/**
	 * @param carrierId the carrierId to set
	 */
	public void setCarrierId(String carrierId) {
		this.carrierId = carrierId;
	}

	/**
	 * @return the keywords
	 */
	public String getKeywords() {
		return keywords;
	}

	/**
	 * @param keywords the keywords to set
	 */
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	/**
	 * @return the orderType
	 */
	public Short getOrderType() {
		return orderType;
	}

	/**
	 * @param orderType the orderType to set
	 */
	public void setOrderType(Short orderType) {
		this.orderType = orderType;
	}

}
