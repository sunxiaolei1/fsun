package com.fsun.dao.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.DocPoHeader;

@Mapper
public interface DocPoHeaderMapper extends BaseMySqlMapper<DocPoHeader>{

	/**
	 * 
	 * @param prefix
	 * @return
	 */
	public List<String> getMaxPoNo(String prefix);

	/**
	 * 获取实体对象
	 * @param poNo
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String poNo);

}