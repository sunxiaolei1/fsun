package com.fsun.api.bus;

import java.util.HashMap;
import java.util.List;

import com.fsun.domain.dto.RulPriceTreeDto;
import com.fsun.domain.entity.BusRulPriceCondition;
import com.fsun.domain.model.BusRulPrice;

/**
 * @author fsun
 * @date 2018年12月9日
 */
public interface BusRulPriceApi {

	/**
	 * 获取价格策略实体
	 * @param rulId
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String rulId);

	/**
	 * 
	 * @param condition
	 * @return
	 */
	public List<BusRulPrice> list(BusRulPriceCondition condition);

	/**
	 * 获取价格策略树
	 * @param condition
	 * @return
	 */
	public List<RulPriceTreeDto> getRulTree(BusRulPriceCondition condition);

}
