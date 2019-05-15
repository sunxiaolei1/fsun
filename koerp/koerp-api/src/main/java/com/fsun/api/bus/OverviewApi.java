package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.OverviewCondition;

/**
 * @author fsun
 * @date 2019年5月14日
 */
public interface OverviewApi {

	/**
	 * 获取初始化数据
	 * @param condition
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(OverviewCondition condition, BusUserDto currUser);

}
