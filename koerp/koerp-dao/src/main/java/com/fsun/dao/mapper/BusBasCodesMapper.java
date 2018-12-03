package com.fsun.dao.mapper;

import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.BusBasCodes;

@Mapper
public interface BusBasCodesMapper extends BaseMySqlMapper<BusBasCodes>{

	/**
	 * 获取数据类别集合
	 * @return
	 */
	public List<String> findCodeType();
}