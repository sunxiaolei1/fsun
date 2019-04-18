package com.fsun.dao.report.mapper;

import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.dao.mapper.BaseMySqlMapper;
import com.fsun.domain.report.HeaderFieldCondition;
import com.fsun.domain.report.HeaderFieldModel;

@Mapper
public interface HeaderFieldMapper extends BaseMySqlMapper<HeaderFieldModel>{

	/**
	 * 
	 * @Title: getHeaderFields 
	 * @Description: 获取表头信息
	 * @param @return 
	 * @return List<HeaderFieldModel>
	 */
	public List<HeaderFieldModel> queryHeaderFields(HeaderFieldCondition condition);
}
