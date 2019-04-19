package com.fsun.dao.report.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fsun.dao.config.Mapper;
import com.fsun.dao.mapper.BaseMySqlMapper;
import com.fsun.domain.report.ReportBaseModel;

/**
 * 
 * @author fsun
 * @date 2019年4月18日
 */
@Mapper
public interface BaseReportMapper extends BaseMySqlMapper<ReportBaseModel>{
	
	/**
	 * 默认sql查询
	 * @param model
	 * @return
	 */
	public List<Map<String, Object>> query(ReportBaseModel model);

	/**
	 * 调用存储过程
	 * @param condition
	 * @return
	 */
	public List<Map<String, Object>> queryCall(HashMap<String, Object> paramsMap);
}
