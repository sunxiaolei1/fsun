package com.fsun.api.bus;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.entity.BusShopCondition;
import com.fsun.domain.model.BusShop;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2018年12月9日
 */
public interface BusShopApi extends BaseApi<BusShop, BusShopCondition>{

	/**
	 * 
	 * @param condition
	 * @return
	 */
	public boolean unique(BusShopCondition condition);

	/**
	 * 
	 * @param ids
	 * @param enabled
	 * @param user
	 */
	public void changeStatus(String[] ids, Boolean enabled, SysUser user);

}
