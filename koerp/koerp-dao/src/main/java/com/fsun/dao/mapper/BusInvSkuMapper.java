package com.fsun.dao.mapper;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.dto.InvSkuDto;
import com.fsun.domain.model.BusInvSku;

@Mapper
public interface BusInvSkuMapper extends BaseMySqlMapper<BusInvSku>{

	/**
	 * 通过主键id获取商品库存明细
	 * @param sku
	 * @return
	 */
	public InvSkuDto loadEntity(String sku);

}