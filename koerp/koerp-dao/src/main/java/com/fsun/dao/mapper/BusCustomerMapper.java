package com.fsun.dao.mapper;

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
}