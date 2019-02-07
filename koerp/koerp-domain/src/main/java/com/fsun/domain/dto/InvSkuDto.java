package com.fsun.domain.dto;

import java.math.BigDecimal;

import com.fsun.domain.model.BusBasSku;

/**
 * 价格策略对应的商品库存明细
 * @author fsun
 * @date 2018年12月13日
 */
public class InvSkuDto extends BusBasSku {

	/**
	 * 零售价
	 */
	private BigDecimal salePrice;
	
	/**
	 * VIP价
	 */
	private BigDecimal vipPrice;
	
	/**
	 * 内供价
	 */
	private BigDecimal supplyPrice;

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public BigDecimal getVipPrice() {
		return vipPrice;
	}

	public void setVipPrice(BigDecimal vipPrice) {
		this.vipPrice = vipPrice;
	}

	/**
	 * @return the supplyPrice
	 */
	public BigDecimal getSupplyPrice() {
		return supplyPrice;
	}

	/**
	 * @param supplyPrice the supplyPrice to set
	 */
	public void setSupplyPrice(BigDecimal supplyPrice) {
		this.supplyPrice = supplyPrice;
	}
	
}
