package com.fsun.dao.mapper;

import java.util.HashMap;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.DocAsnHeader;

@Mapper
public interface DocAsnHeaderMapper extends BaseMySqlMapper<DocAsnHeader>{

	/**
	 * 获取实体对象
	 * @param asnNo
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String asnNo);
}