package com.fsun.domain.report;
/**
 * @author fsun
 * @date 2019年7月23日
 */
public class ContrastUseSoCondition extends ReportCondition{

	/**
	 * 关键字
	 */
	private String keywords;
	
	/**
	 * 出库单号
	 */
	private String orderNo;
	
	/**
     * 出库单类型  [11 调拨出库, 12 盘亏出库, 13 采购退货, 15 报损出库,16 领用出库]
     */
    private String orderType;
	
	/**
	 * 出库店仓
	 */
	private String fromShopId;
	
	/**
	 * 经办人ID
	 */
	private String carrierId;

	/**
	 * 客户编码
	 */
	private String customerCode;
	
	/**
     * 交易状态[B00 待审核, B10 审核完成, B20 订单出库, B30 出库完成, B90 出库取消]
     */
    private String orderStatus;
    
    /**
     * 领用方式(10 样品 20 品鉴 30 试饮 40 赠送 50 礼品 60 其他)
     */
    private String orderMode;   

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

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getFromShopId() {
		return fromShopId;
	}

	public void setFromShopId(String fromShopId) {
		this.fromShopId = fromShopId;
	}

	public String getCarrierId() {
		return carrierId;
	}

	public void setCarrierId(String carrierId) {
		this.carrierId = carrierId;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderMode() {
		return orderMode;
	}

	public void setOrderMode(String orderMode) {
		this.orderMode = orderMode;
	}
	
}
