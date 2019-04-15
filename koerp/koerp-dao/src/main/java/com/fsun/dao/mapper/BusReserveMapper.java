package com.fsun.dao.mapper;

import java.util.HashMap;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusReserve;

/**
 * @author fsun
 * @date 2019年4月15日
 */
@Mapper
public interface BusReserveMapper extends BaseMySqlMapper<BusReserve>{

	/**
	 * 获取备用金充值及明细对象
	 * @param customerCode
	 * @return
	 */
	public HashMap<String, Object> getInitData(String customerCode);

}
