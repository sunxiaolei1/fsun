package com.fsun.api.base;

import java.util.HashMap;
import java.util.Map;

import com.fsun.domain.common.PageModel;
import com.fsun.domain.report.ReportCondition;

/**
 * @author fsun
 * @date 2019年4月24日
 */
public interface BaseContrastApi<T extends ReportCondition> {

	/**
	 * 查询分页数据
	 * @param condition
	 * @return
	 */
	public PageModel findPage(T condition) ;

	/**
	 * 获取表单合计行
	 * @param condition
	 * @return
	 */
	public HashMap<String, Object> findFooter(T condition);
	
	/**
	 * 导出
	 * @param condition
	 * @return
	 */
	public Map<String, Object> exportMap(T condition);
	
}
