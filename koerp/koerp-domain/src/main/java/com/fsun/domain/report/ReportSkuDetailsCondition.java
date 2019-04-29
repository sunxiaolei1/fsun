package com.fsun.domain.report;

/**
 * 商品交易明细查询对象
 * @author fsun
 * @date 2019年4月20日
 */
public class ReportSkuDetailsCondition extends ReportCondition {

	/**
	 * 商品sku
	 */
	private String sku;
	
	/**
	 * 交易类型
	 */
	private String tradeType;
	
	/**
	 * 交易门店
	 */
	private String shopId;

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getTradeType() {
		return tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
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
	
}
