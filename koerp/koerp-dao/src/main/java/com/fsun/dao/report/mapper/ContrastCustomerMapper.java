package com.fsun.dao.report.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.dao.mapper.BaseMySqlMapper;
import com.fsun.domain.report.ContrastCustomerCondition;
import com.fsun.domain.report.ContrastCustomerModel;

/**
 * @author fsun
 * @date 2019年4月23日
 */
@Mapper
public interface ContrastCustomerMapper extends BaseMySqlMapper<ContrastCustomerModel>{

	/**
	 * 获取账单明细
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> findPayAccount(ContrastCustomerCondition condition);
}
