package com.fsun.api.bus;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusInvSkuCondition;
import com.fsun.domain.entity.BusInvSkuDetailsCondition;
import com.fsun.domain.model.BusInvSku;

/**
 * @author fsun
 * @date 2018年12月13日
 */
public interface BusInvSkuApi extends BaseApi<BusInvSku, BusInvSkuCondition> {
	
	/**
	 * 根据sku码判断是否已存在，不允许相同
	 * @param condition
	 * @return
	 */
	public boolean unique(String sku);

	/**
	 * 分页查询
	 * @param condition
	 * @return
	 */
	public PageModel findListForPage(BusInvSkuCondition condition);

	/**
	 * 通过sku和门店id获取库存明细
	 * @param condition
	 * @return
	 */
	public PageModel findDetailsPage(BusInvSkuDetailsCondition condition);
}
