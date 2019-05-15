package com.fsun.dao.mapper;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusOrder;

@Mapper
public interface BusOrderMapper extends BaseMySqlMapper<BusOrder>{

	/**
	 * 获取当前年份各门店对应的销业绩(按月汇总)
	 * @param year
	 * @return
	 */
	public List<HashMap<String, Object>> getSaleQuota(Integer year);

	/**
	 * 获取当前年份商品销售占比
	 * @param year
	 * @return
	 */
	public List<HashMap<String, Object>> getSkusQuota(Integer year);

	/**
	 * 获取当前年份商品销售总额
	 * @param year
	 * @return
	 */
	public BigDecimal getSkusTotalAmount(Integer year);
	
}