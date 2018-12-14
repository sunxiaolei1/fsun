package com.fsun.biz.bus.manage;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusRulSkuMapper;
import com.fsun.domain.model.BusRulSku;

/**
 * @author fsun
 * @date 2018年12月13日
 */
@Component
public class BusRulSkuManage extends CrudManage<BusRulSkuMapper, BusRulSku>{

	/**
	 * 通过策略ID删除对应的商品
	 * @param rulId
	 */
	public void deleteByRulId(String rulId) {
		mapper.deleteByRulId(rulId);		
	}

}
