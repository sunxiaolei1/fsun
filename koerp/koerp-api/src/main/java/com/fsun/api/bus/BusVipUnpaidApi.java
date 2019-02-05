package com.fsun.api.bus;

import java.util.HashMap;
import java.util.List;

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

	/**
	 * 会员卡消费明细导出
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> exportVip(BusVipUnpaidCondition condition);

	/**
	 * 挂账消费明细导出
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> exportUnpaid(BusVipUnpaidCondition condition);

}
