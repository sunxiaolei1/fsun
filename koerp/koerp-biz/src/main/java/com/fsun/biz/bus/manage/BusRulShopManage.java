package com.fsun.biz.bus.manage;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusRulShopMapper;
import com.fsun.domain.model.BusRulShop;

/**
 * @author fsun
 * @date 2018年12月13日
 */
@Component
public class BusRulShopManage extends CrudManage<BusRulShopMapper, BusRulShop>{

	/**
	 * 通过策略ID删除对应的门店
	 * @param rulId
	 */
	public void deleteByRulId(String rulId) {
		mapper.deleteByRulId(rulId);
	}

}
