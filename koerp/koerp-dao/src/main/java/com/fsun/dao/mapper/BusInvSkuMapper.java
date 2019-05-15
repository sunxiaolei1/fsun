package com.fsun.dao.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.dto.InvSkuDto;
import com.fsun.domain.entity.BusInvSkuCondition;
import com.fsun.domain.model.BusInvSku;

@Mapper
public interface BusInvSkuMapper extends BaseMySqlMapper<BusInvSku>{

	/**
	 * 根据条件获取价格策略对应的商品库存明细
	 * @param condition
	 * @return
	 */
	public List<InvSkuDto> selectInvSkuList(BusInvSkuCondition condition);

	/**
	 * 获取库存告警列表
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> getWarningList(BusInvSkuCondition condition);

}