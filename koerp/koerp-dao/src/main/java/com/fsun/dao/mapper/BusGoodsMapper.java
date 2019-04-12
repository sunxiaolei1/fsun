package com.fsun.dao.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusGoods;

@Mapper
public interface BusGoodsMapper extends BaseMySqlMapper<BusGoods>{

	/**
	 * 通过订单号初始化整单退的退货商品明细
	 * @param orderId
	 * @return
	 */
	public List<HashMap<String, Object>> initAllReturnGoodsByOrderId(String orderId);
}