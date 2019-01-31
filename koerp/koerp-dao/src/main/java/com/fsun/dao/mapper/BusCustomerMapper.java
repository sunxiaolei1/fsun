package com.fsun.dao.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusCustomer;

@Mapper
public interface BusCustomerMapper extends BaseMySqlMapper<BusCustomer>{

	/**
	 * 根据customerType获取最大的编码
	 * @param sign
	 * @return
	 */
	public List<String> getMaxCode(String sign);

	/**
	 * 获取结款基本信息及挂账交易记录
	 * @param customerCode
	 * @return
	 */
	public HashMap<String, Object> initUnpaidData(String customerCode);
}