package com.fsun.domain.dto;

import com.fsun.domain.model.BusVip;
import com.fsun.domain.model.BusVipUnpaid;

/**
 * @author fsun
 * @date 2019年2月15日
 */
public class ActiveCardDto {

	/**
	 * 会员卡信息
	 */
	private BusVip busVip;
	
	/**
	 * 充值信息
	 */
	private BusVipUnpaid busVipUnpaid;

	public BusVip getBusVip() {
		return busVip;
	}

	public void setBusVip(BusVip busVip) {
		this.busVip = busVip;
	}

	public BusVipUnpaid getBusVipUnpaid() {
		return busVipUnpaid;
	}

	public void setBusVipUnpaid(BusVipUnpaid busVipUnpaid) {
		this.busVipUnpaid = busVipUnpaid;
	}
	
}
