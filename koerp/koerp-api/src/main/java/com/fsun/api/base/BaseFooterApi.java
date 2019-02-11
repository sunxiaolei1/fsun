package com.fsun.api.base;

import java.util.HashMap;

/**
 * @author fsun
 * @date 2019年2月11日
 */
public interface BaseFooterApi<T,C> extends BaseApi<T, C>{
	
	/**
	 * 获取表单合计行
	 * @param condition
	 * @return
	 */
	public HashMap<String, Object> findFooter(C condition);
}
