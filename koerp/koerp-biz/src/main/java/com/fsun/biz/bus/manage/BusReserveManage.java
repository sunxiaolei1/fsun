package com.fsun.biz.bus.manage;

import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusReserveMapper;
import com.fsun.domain.model.BusReserve;

/**
 * @author fsun
 * @date 2019年4月15日
 */
@Component
public class BusReserveManage extends CrudManage<BusReserveMapper, BusReserve>{

	/**
	 * 初始化充值及明细
	 * @param customerCode
	 * @return
	 */
	public HashMap<String, Object> getInitData(String customerCode) {
		return mapper.getInitData(customerCode);
	}

}
