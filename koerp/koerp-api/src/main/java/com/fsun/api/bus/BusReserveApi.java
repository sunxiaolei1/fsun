package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseFooterApi;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusReserveCondition;
import com.fsun.domain.model.BusReserve;

/**
 * 备用金管理
 * @author fsun
 * @date 2019年4月15日
 */
public interface BusReserveApi extends BaseFooterApi<BusReserve, BusReserveCondition> {

	/**
	 * 
	 * @param customerCode
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String customerCode, BusUserDto currUser);

}
