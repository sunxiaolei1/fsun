package com.fsun.domain.model;

import java.math.BigDecimal;

/**
 * @author fsun
 * @date 2019年4月15日
 */
public class BusReserve extends BusCustomer{

	/**
	 * 备用金可用余额
	 */
	private BigDecimal enableReserve;

	/**
	 * @return the enableReserve
	 */
	public BigDecimal getEnableReserve() {
		return enableReserve;
	}

	/**
	 * @param enableReserve the enableReserve to set
	 */
	public void setEnableReserve(BigDecimal enableReserve) {
		this.enableReserve = enableReserve;
	}
	
	
}
