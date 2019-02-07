package com.fsun.dao.mapper;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusRulShop;

@Mapper
public interface BusRulShopMapper extends BaseMySqlMapper<BusRulShop>{

	/**
	 * 通过策略ID删除对应的门店
	 * @param rulId
	 */
	public void deleteByRulId(String rulId);
}