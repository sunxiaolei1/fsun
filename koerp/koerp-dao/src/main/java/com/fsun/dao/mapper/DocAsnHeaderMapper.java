package com.fsun.dao.mapper;

import java.util.HashMap;
import java.util.List;

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

	/**
	 * 
	 * @param prefix
	 * @return
	 */
	public List<String> getMaxAsnNo(String prefix);
}