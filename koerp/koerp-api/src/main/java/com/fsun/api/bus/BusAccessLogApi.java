package com.fsun.api.bus;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.entity.BusAccessLogCondition;
import com.fsun.domain.model.BusAccessLog;

/**
 * 订单交易操作日志
 * @author fsun
 * @date 2019年2月10日
 */
public interface BusAccessLogApi extends BaseApi<BusAccessLog, BusAccessLogCondition> {

	/**
	 * 创建日志
	 * @param condition
	 */
	public void create(BusAccessLogCondition condition);
}
