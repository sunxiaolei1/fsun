package com.fsun.dao.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusRefund;

@Mapper
public interface BusRefundMapper extends BaseMySqlMapper<BusRefund>{

	/**
	 * 获取最大单号
	 * @param prefix
	 * @return
	 */
	public List<String> getMaxRefundId(String prefix);

	/**
	 * 获取退货单据实体对象
	 * @param refundId
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String refundId);
    
}