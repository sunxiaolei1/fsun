package com.fsun.domain.report;

/**
 * 
 * @author fsun
 * @date 2019年4月18日
 */
public class SkuUseSoReportCondition extends ReportCondition{

	/**
	 * 出库门店id
	 */
	private String shopId;

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	
}
