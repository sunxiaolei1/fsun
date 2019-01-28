package com.fsun.dao.mapper;

import java.util.HashMap;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusVip;

@Mapper
public interface BusVipMapper extends BaseMySqlMapper<BusVip>{

	/**
	 * 获取会员卡基本及会员卡交易记录
	 * @param cardNo
	 * @return
	 */
	public HashMap<String, Object> initRachargeData(String cardNo);
}