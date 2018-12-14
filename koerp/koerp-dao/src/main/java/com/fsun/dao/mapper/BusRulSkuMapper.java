package com.fsun.dao.mapper;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusRulSku;

@Mapper
public interface BusRulSkuMapper extends BaseMySqlMapper<BusRulSku>{

	/**
	 * 通过策略ID删除对应的商品
	 * @param rulId
	 */
	public void deleteByRulId(String rulId);
}