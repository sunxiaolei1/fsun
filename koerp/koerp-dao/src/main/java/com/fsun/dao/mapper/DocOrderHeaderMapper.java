package com.fsun.dao.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.DocOrderHeader;

@Mapper
public interface DocOrderHeaderMapper extends BaseMySqlMapper<DocOrderHeader>{

	/**
	 * 获取实体对象
	 * @param orderNo
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String orderNo);

	/**
	 * 
	 * @param prefix
	 * @return
	 */
	public List<String> getMaxOrderNo(String prefix);
}