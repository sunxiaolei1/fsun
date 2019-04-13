package com.fsun.dao.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusTakeGoods;

@Mapper
public interface BusTakeGoodsMapper extends BaseMySqlMapper<BusTakeGoods>{

	/**
	 * 通过订单号获取订单下商品的提货流水
	 * @param orderId
	 * @return
	 */
	public List<HashMap<String, Object>> getTakeGoodsByOrderId(String orderId);
   
}