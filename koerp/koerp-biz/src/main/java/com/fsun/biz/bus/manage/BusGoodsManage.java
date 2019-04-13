package com.fsun.biz.bus.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusGoodsMapper;
import com.fsun.domain.entity.BusGoodsCondition;
import com.fsun.domain.model.BusGoods;

/**
 * @author fsun
 * @date 2018年12月24日
 */
@Component
public class BusGoodsManage extends CrudManage<BusGoodsMapper, BusGoods>{
	
	@Override
	public List<BusGoods> listByHeaderId(String headerId) {
		BusGoodsCondition condition = new BusGoodsCondition();
		condition.setOrderId(headerId);
		return mapper.selectList(condition);		
	}

	/**
	 * 通过订单号初始化整单退的退货商品明细
	 * @param orderId
	 * @return 
	 */
	public List<HashMap<String, Object>> initAllReturnGoodsByOrderId(String orderId) {
		return mapper.initAllReturnGoodsByOrderId(orderId);
	}

}
