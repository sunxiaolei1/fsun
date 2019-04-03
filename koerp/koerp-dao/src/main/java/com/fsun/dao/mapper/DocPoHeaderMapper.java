package com.fsun.dao.mapper;

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
	public List<String> getMaxNumber(String prefix);

}