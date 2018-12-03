package com.fsun.api.base;

import java.util.List;

import com.fsun.domain.entity.BasCodesCondition;
import com.fsun.domain.model.BusBasCodes;

/**
 * 
 * @author sunxiaolei
 *
 */
public interface BasCodesApi extends BaseApi<BusBasCodes, BasCodesCondition> {

	/**
	 * 批量删除
	 * @param split
	 */
	public void deletes(String[] split);

	/**
	 * 获取代码类型
	 * @return
	 */
	public List<String> findCodeType();

}
