package com.fsun.api.bus;

import java.util.List;

import com.fsun.api.base.BaseFooterApi;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusPayAccountCondition;
import com.fsun.domain.model.BusPayAccount;

/**
 * @author fsun
 * @date 2019年3月6日
 */
public interface BusPayAccountApi extends BaseFooterApi<BusPayAccount, BusPayAccountCondition> {

	/**
	 * 根据条件获取列表
	 * @param condition
	 * @return
	 */
	public List<BusPayAccount> list(BusPayAccountCondition condition);

	/**
	 * 根据条件获取分页列表
	 * @param condition
	 * @return
	 */
	public PageModel findPage(BusPayAccountCondition condition);

}
