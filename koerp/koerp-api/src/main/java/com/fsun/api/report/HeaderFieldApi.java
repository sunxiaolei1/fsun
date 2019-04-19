package com.fsun.api.report;

import java.util.HashMap;

/**
 * @author fsun
 * @date 2019年4月19日
 */
public interface HeaderFieldApi {

	/**
	 * 获取表头字段集合
	 * @param queryType
	 * @return
	 */
	public HashMap<String, Object> headerFieldMap(String queryType);
	
	
}
