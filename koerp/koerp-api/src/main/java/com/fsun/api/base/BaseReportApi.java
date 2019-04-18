package com.fsun.api.base;

import java.util.Map;

/**
 * 
 * @ClassName: BaseReportService 
 * @Description: 报表接口基类
 * @author fsun 
 * @date 2018年4月17日 下午3:32:23 
 * 
 * @param <T>
 */
public interface BaseReportApi<T> {

	/**
	 * 根据条件查询报表信息集合 
	 * @Title queryMapReport
	 * @param condition
	 * @return Map<String,Object>
	 */
	public Map<String, Object> queryMap(T condition);
	
	/**
	 * 根据条件查询报表信息导出 
	 * @param condition
	 * @return
	 */
	public Map<String, Object> exportMap(T condition);
}
