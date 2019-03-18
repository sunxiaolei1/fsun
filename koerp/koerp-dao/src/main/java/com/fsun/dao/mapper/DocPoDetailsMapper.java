package com.fsun.dao.mapper;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.DocPoDetails;

@Mapper
public interface DocPoDetailsMapper extends BaseMySqlMapper<DocPoDetails>{

	/**
	 * 删除明细
	 * @param poNo
	 */
	public void deleteByPoNo(String poNo);
}