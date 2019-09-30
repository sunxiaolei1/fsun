package com.fsun.api.bus;

import java.util.List;

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
	 * 用于选择商品的分页列表
	 * @param condition
	 * @return
	 */
	public PageModel findListForPage(BusBasSkuCondition condition);
	
	/**
	 * 用于撤柜退货选择商品(或物料)的分页列表
	 * @param condition
	 * @return
	 */
	public PageModel findRefundListForPage(BusBasSkuCondition condition);

	/**
	 * 通过sku获取单个商品明细
	 * @param sku
	 * @return
	 */
	public BusBasSku loadBySku(String sku);

	/**
	 * 获取商品下的物料信息
	 * @param skuId
	 * @return
	 */
	public List<BusBasSku> findMateriels(String skuId, String tradeType);

}
