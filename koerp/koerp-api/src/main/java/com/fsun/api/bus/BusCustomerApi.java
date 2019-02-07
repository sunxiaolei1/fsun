package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusCustomerCondition;
import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.SysUser;

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
	 * @param user 
	 */
	public void changeStatus(String[] ids, Boolean enabled, SysUser user);

	/**
	 * 判别唯一性校验
	 * @param condition
	 * @return
	 */
	public boolean unique(BusCustomerCondition condition);

	/**
	 * 获取挂账结款信息
	 * @param customerCode
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> initUnpaidData(String customerCode, BusUserDto currUser);
	
}
