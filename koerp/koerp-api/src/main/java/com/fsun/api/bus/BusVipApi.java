package com.fsun.api.bus;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.entity.BusVipCondition;
import com.fsun.domain.model.BusVip;

/**
 * 
 * @author sunxiaolei
 *
 */
public interface BusVipApi extends BaseApi<BusVip, BusVipCondition> {
	
	/**
	 * 根据会员卡号判断是否已存在，不允许会员卡号相同
	 * @param condition
	 * @return
	 */
	public boolean unique(BusVipCondition condition) ;

	/**
	 * 
	 * @param ids
	 * @param enabled
	 */
	public void changeStatus(String[] ids, Boolean enabled);

}
