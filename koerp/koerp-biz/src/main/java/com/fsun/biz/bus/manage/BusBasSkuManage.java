package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusBasSkuMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusBasSkuCondition;
import com.fsun.domain.enums.DocTradeTypeEnum;
import com.fsun.domain.model.BusBasSku;

/**
 * @author fsun
 * @date 2018年12月7日
 */
@Component
public class BusBasSkuManage extends CrudManage<BusBasSkuMapper, BusBasSku>{

	public PageModel findPage(BusBasSkuCondition condition) {		
		List<BusBasSku> list = mapper.selectList(condition);
		this.formatSalePrice(list, condition.getTradeType());
		return new PageModel(list);
	}

	/**
	 * 销售单价格式化（0  销售价 1 成本价 2 分校价）
	 * @param list
	 * @param tradeType
	 */
	private void formatSalePrice(List<BusBasSku> list, String tradeType){
		Integer defaultPrice = DocTradeTypeEnum.getByName(tradeType).getDefaultPrice();
		for (BusBasSku busBasSku : list) {
			BigDecimal salePrice = busBasSku.getOriginSalePrice();		
			if(defaultPrice==1){
				salePrice = busBasSku.getCostPrice();
			}else if(defaultPrice==2){
				salePrice = busBasSku.getMarketPrice();
			}
			busBasSku.setSalePrice(salePrice);
		}	
	}
}
