package com.fsun.domain.report;

/**
 * 
 * @author fsun
 * @date 2019年4月18日
 */
public class ReportSkuSoCondition extends ReportCondition{

	/**
	 * 出库门店id
	 */
	private String shopId;
	
	/**
	 * 出库事由
	 */
	private String orderMode;

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	/**
	 * @return the orderMode
	 */
	public String getOrderMode() {
		return orderMode;
	}

	/**
	 * @param orderMode the orderMode to set
	 */
	public void setOrderMode(String orderMode) {
		this.orderMode = orderMode;
	}
	
}
