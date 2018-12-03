package com.fsun.api.bus;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.entity.BusCustomerCondition;
import com.fsun.domain.model.BusCustomer;

/**
 * 客户对象(供应商、经销商、业务员)管理接口
 * @author sunxiaolei
 *
 */
public interface BusCustomerApi extends BaseApi<BusCustomer, BusCustomerCondition> {

	/**
	 * 批量改变状态
	 * @param ids
	 * @param enabled
	 */
	public void changeStatus(String[] ids, Boolean enabled);
	
}
