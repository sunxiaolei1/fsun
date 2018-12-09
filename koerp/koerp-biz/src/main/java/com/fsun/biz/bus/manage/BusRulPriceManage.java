package com.fsun.biz.bus.manage;

import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusRulPriceMapper;
import com.fsun.domain.dto.RulPriceDto;
import com.fsun.domain.model.BusRulPrice;

/**
 * @author fsun
 * @date 2018年12月9日
 */
@Component
public class BusRulPriceManage extends CrudManage<BusRulPriceMapper, BusRulPrice>{

	/**
	 * 获取价格策略实体
	 * @param rulId
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String rulId) {
		return mapper.loadEntity(rulId);
	}

}
