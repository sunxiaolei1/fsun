package com.fsun.api.report;

import java.util.HashMap;
import java.util.List;

import com.fsun.api.base.BaseContrastApi;
import com.fsun.domain.report.ContrastRefundCondition;

/**
 * @author fsun
 * @date 2019年4月23日
 */
public interface ContrastRefundApi extends BaseContrastApi<ContrastRefundCondition> {
	
	/**
	 * 获取账单明细
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> findPayAccount(ContrastRefundCondition condition);

	

	
}
