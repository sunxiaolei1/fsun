package com.fsun.api.bus;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.entity.BusVipUnpaidCondition;
import com.fsun.domain.model.BusVipUnpaid;
import com.fsun.domain.model.SysUser;

/**
 * 
 * @author fsun
 * @date 2019年1月24日
 */
public interface BusVipUnpaidApi extends BaseApi<BusVipUnpaid, BusVipUnpaidCondition> {

	/**
	 * 取消交易
	 * @param ids
	 * @param tradeStatus
	 * @param currUser
	 */
	public void changeStatus(String[] ids, String tradeStatus, 
		SysUser currUser, BusVipUnpaidCondition condition);

}
