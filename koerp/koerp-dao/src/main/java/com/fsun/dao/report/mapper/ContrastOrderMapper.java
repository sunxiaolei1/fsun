package com.fsun.dao.report.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.dao.mapper.BaseMySqlMapper;
import com.fsun.domain.report.ContrastOrderCondition;
import com.fsun.domain.report.ContrastOrderModel;

/**
 * @author fsun
 * @date 2019年4月23日
 */
@Mapper
public interface ContrastOrderMapper extends BaseMySqlMapper<ContrastOrderModel>{

	/**
	 * 获取账单明细
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> findPayAccount(ContrastOrderCondition condition);
}
