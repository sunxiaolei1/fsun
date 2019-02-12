package com.fsun.domain.dto;

import java.util.ArrayList;
import java.util.List;

import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusOrder;

/**
 * 换货单实体对象
 * @author fsun
 * @date 2019年2月12日
 */
public class BusBarterDto extends BusRefundDto{	
	
	/**
	 * 换发单头信息
	 */
	private BusOrder barterHeader = new BusOrder();
	
	/**
	 * 换发单明细信息
	 */
	private List<BusGoods> barterDetails = new ArrayList<>();

	public BusOrder getBarterHeader() {
		return barterHeader;
	}

	public void setBarterHeader(BusOrder barterHeader) {
		this.barterHeader = barterHeader;
	}

	public List<BusGoods> getBarterDetails() {
		return barterDetails;
	}

	public void setBarterDetails(List<BusGoods> barterDetails) {
		this.barterDetails = barterDetails;
	}

}
