package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseFooterApi;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusInvSkuCondition;
import com.fsun.domain.entity.BusInvSkuDetailsCondition;
import com.fsun.domain.model.BusInvSku;

/**
 * @author fsun
 * @date 2018年12月13日
 */
public interface BusInvSkuApi extends BaseFooterApi<BusInvSku, BusInvSkuCondition> {
	
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

	/**
	 * 通过sku和门店id获取库存明细下的合计行
	 * @param condition
	 * @return
	 */
	public HashMap<String, Object> findDetailsFooter(BusInvSkuDetailsCondition condition);
}
