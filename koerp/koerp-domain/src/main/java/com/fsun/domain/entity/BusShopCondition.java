package com.fsun.domain.entity;

import com.fsun.domain.model.BusShop;

/**
 * @author fsun
 * @date 2018年12月9日
 */
public class BusShopCondition extends BusShop{

	/**
	 * 模糊查询参数
	 */
	private String q;

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}
	
}
