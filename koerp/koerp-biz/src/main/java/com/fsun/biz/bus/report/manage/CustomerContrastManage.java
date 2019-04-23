package com.fsun.biz.bus.report.manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.biz.common.BaseReportManage;
import com.fsun.dao.report.mapper.BaseReportMapper;
import com.fsun.dao.report.mapper.CustomerContrastMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.report.CustomerContrastCondition;
import com.fsun.domain.report.ReportCondition;

/**
 * @author fsun
 * @date 2019年4月23日
 */

@Component
public class CustomerContrastManage extends BaseReportManage{
	
	@Autowired
	private CustomerContrastMapper customerContrastMapper;
	
	@Autowired
	private BaseReportMapper baseReportMapper;

	public PageModel findMapPage(CustomerContrastCondition condition) {
		List<Map<String, Object>> list = customerContrastMapper.selectListMap(condition);
		return new PageModel(list);
	}

	public HashMap<String, Object> findFooter(CustomerContrastCondition condition) {
		return customerContrastMapper.findFooter(condition);
	}

	@Override
	public List<Map<String, Object>> query(ReportCondition condition) {
		return baseReportMapper.query(condition);
	}

	@Override
	public List<Map<String, Object>> queryCall(HashMap<String, Object> paramsMap) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
