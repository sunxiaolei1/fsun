package com.fsun.api.bus;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusBasSkuCondition;
import com.fsun.domain.model.BusBasSku;
import com.fsun.domain.model.SysUser;

/**
 * 基础商品操作接口
 * @author fsun
 * @date 2018年12月7日
 */
public interface BusBasSkuApi extends BaseApi<BusBasSku, BusBasSkuCondition> {

	/**
	 * 根据sku码判断是否已存在，不允许相同
	 * @param condition
	 * @return
	 */
	public boolean unique(BusBasSkuCondition condition);

	/**
	 * 
	 * @param split
	 * @param enabled
	 * @param user
	 */
	public void changeStatus(String[] split, Boolean enabled, SysUser user);

	/**
	 * 用于选择商品的分页商品列表
	 * @param condition
	 * @return
	 */
	public PageModel findListForPage(BusBasSkuCondition condition);

	

}
