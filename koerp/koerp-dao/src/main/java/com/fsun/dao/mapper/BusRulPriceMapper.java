package com.fsun.dao.mapper;

import java.util.HashMap;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusRulPrice;

@Mapper
public interface BusRulPriceMapper extends BaseMySqlMapper<BusRulPrice>{

	/**
	 * 获取价格策略实体
	 * @param rulId
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String rulId);
}