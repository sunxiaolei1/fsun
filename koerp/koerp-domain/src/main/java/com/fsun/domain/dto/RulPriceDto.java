package com.fsun.domain.dto;

import java.util.List;

import com.fsun.domain.model.BusRulShop;
import com.fsun.domain.model.BusRulSku;

/**
 * 价格策略实体对象
 * @author fsun
 * @date 2018年12月9日
 */
public class RulPriceDto {
	
	private String rulId;
	
	private String rulName;
	
	private Integer sortCode;
	
	private List<BusRulShop> rulShops;
	
	private List<BusRulSku> rulSkus;

	public String getRulId() {
		return rulId;
	}

	public void setRulId(String rulId) {
		this.rulId = rulId;
	}

	public String getRulName() {
		return rulName;
	}

	public void setRulName(String rulName) {
		this.rulName = rulName;
	}

	public Integer getSortCode() {
		return sortCode;
	}

	public void setSortCode(Integer sortCode) {
		this.sortCode = sortCode;
	}

	public List<BusRulShop> getRulShops() {
		return rulShops;
	}

	public void setRulShops(List<BusRulShop> rulShops) {
		this.rulShops = rulShops;
	}

	public List<BusRulSku> getRulSkus() {
		return rulSkus;
	}

	public void setRulSkus(List<BusRulSku> rulSkus) {
		this.rulSkus = rulSkus;
	}
	
}
