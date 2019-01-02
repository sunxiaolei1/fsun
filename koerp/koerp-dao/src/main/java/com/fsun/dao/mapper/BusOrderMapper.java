package com.fsun.dao.mapper;

import java.util.HashMap;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusOrder;

@Mapper
public interface BusOrderMapper extends BaseMySqlMapper<BusOrder>{

	/**
	 * 获取订单实体(头信息、商品明细、账单信息)
	 * @param orderId
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String orderId);
	
}