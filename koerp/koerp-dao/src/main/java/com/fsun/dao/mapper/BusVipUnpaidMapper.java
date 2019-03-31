package com.fsun.dao.mapper;

import java.util.HashMap;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.entity.BusVipUnpaidCondition;
import com.fsun.domain.model.BusVipUnpaid;

@Mapper
public interface BusVipUnpaidMapper extends BaseMySqlMapper<BusVipUnpaid>{

	/**
	 * 获取金额合计
	 * @param condition
	 * @return
	 */
	public BusVipUnpaid getVipUnpaidAmount(BusVipUnpaidCondition condition);

	/**
	 * 获取表单合计列
	 * @param condition
	 * @return
	 */
	public HashMap<String, Object> findFooter(BusVipUnpaidCondition condition);
}