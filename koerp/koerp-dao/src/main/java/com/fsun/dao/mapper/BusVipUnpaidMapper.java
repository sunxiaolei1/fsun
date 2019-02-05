package com.fsun.dao.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.entity.BusVipUnpaidCondition;
import com.fsun.domain.model.BusVipUnpaid;

@Mapper
public interface BusVipUnpaidMapper extends BaseMySqlMapper<BusVipUnpaid>{

	/**
	 * 消费明细导出
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> export(BusVipUnpaidCondition condition);
}