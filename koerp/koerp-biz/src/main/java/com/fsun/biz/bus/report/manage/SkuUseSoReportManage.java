package com.fsun.biz.bus.report.manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.biz.common.BaseReportManage;
import com.fsun.dao.report.mapper.SkuUseSoReportMapper;
import com.fsun.domain.report.ReportCondition;

/**
 * @author fsun
 * @date 2019年4月19日
 */
@Component
public class SkuUseSoReportManage extends BaseReportManage{
	
	@Autowired
	private SkuUseSoReportMapper skuUseSoReportMapper;

	@Override
	public List<Map<String, Object>> query(ReportCondition condition) {
		return skuUseSoReportMapper.query(condition);
	}

	@Override
	public List<Map<String, Object>> queryCall(HashMap<String, Object> paramsMap) {
		return skuUseSoReportMapper.queryCall(paramsMap);
	}

}
