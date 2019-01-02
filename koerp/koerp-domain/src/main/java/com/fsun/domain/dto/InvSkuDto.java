package com.fsun.domain.dto;

import java.math.BigDecimal;

import com.fsun.domain.model.BusBasSku;

/**
 * 价格策略对应的商品库存明细
 * @author fsun
 * @date 2018年12月13日
 */
public class InvSkuDto extends BusBasSku {

	private BigDecimal salePrice;
	
	private BigDecimal vipPrice;

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
	
}
