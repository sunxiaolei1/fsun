package com.fsun.biz.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fsun.domain.report.ReportCondition;

/**
 * @author fsun
 * @date 2019年4月19日
 */
public abstract class BaseReportManage extends BaseManage {

	/**
	 * 
	 * @param condition
	 * @return
	 */
	public abstract List<Map<String, Object>> query(ReportCondition condition);

	/**
	 * 
	 * @param condition
	 * @return
	 */
	public abstract List<Map<String, Object>> queryCall(HashMap<String, Object> paramsMap);

}
