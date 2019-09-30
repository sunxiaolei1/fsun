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
	
	/**
	 * 通过sku获取对应的单个商品
	 * @param sku
	 * @return
	 */
	public BusBasSku loadBySku(String sku) {
		BusBasSkuCondition condition = new BusBasSkuCondition();
		condition.setSku(sku);
		List<BusBasSku> list = mapper.selectList(condition);
		if(list!=null && list.size()==1){
			return list.get(0);
		}
		return null;
	}

	/**
	 * 用于选择商品的分页列表
	 * @param condition
	 * @return
	 */
	public PageModel findPage(BusBasSkuCondition condition) {		
		List<BusBasSku> list = mapper.selectList(condition);
		this.formatSalePrice(list, condition.getTradeType());
		return new PageModel(list);
	}
	
	/**
	 * 用于撤柜退货选择商品(或物料)的分页列表
	 * @param condition
	 * @return
	 */
	public PageModel findRefundPage(BusBasSkuCondition condition) {
		List<BusBasSku> list = mapper.selectList(condition);
		this.formatSalePrice(list, condition.getTradeType());
		return new PageModel(list);
	}
	
	/**
	 * 获取商品下的物料信息
	 * @param skuId
	 * @return
	 */
	public List<BusBasSku> findMateriels(String skuId, String tradeType) {	
		List<BusBasSku> list = mapper.findMateriels(skuId);
		this.formatSalePrice(list, tradeType);
		return list;
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
