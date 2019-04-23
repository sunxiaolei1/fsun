package com.fsun.api.report;

import java.util.HashMap;

import com.fsun.api.base.BaseReportApi;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.report.CustomerContrastCondition;

/**
 * @author fsun
 * @date 2019年4月23日
 */
public interface CustomerContrastApi extends BaseReportApi<CustomerContrastCondition>{
	
	/**
	 * 分页查询
	 * @param condition
	 * @return
	 */
	public PageModel findPage(CustomerContrastCondition condition);

	/**
	 * 
	 * @param condition
	 * @return
	 */
	public HashMap<String, Object> findFooter(CustomerContrastCondition condition);

	
}
