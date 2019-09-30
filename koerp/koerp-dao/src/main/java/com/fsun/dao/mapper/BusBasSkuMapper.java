package com.fsun.dao.mapper;

import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusBasSku;

@Mapper
public interface BusBasSkuMapper extends BaseMySqlMapper<BusBasSku>{

	/**
	 * 获取商品下的物料信息
	 * @param skuId
	 * @return
	 */
	public List<BusBasSku> findMateriels(String skuId);
}