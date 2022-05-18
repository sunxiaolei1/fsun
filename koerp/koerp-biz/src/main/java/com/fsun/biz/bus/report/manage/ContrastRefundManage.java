package com.fsun.biz.bus.report.manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.biz.common.BaseContrastManage;
import com.fsun.dao.report.mapper.ContrastRefundMapper;
import com.fsun.domain.report.ContrastRefundCondition;
import com.fsun.domain.report.ContrastRefundModel;
import com.fsun.domain.report.ReportCondition;

/**
 * @author fsun
 * @date 2019年4月23日
 */

@Component
public class ContrastRefundManage extends BaseContrastManage<ContrastRefundMapper, 
		ContrastRefundModel>{
	
	@Autowired
	private ContrastRefundMapper contrastRefundMapper;

	public List<HashMap<String, Object>> findPayAccount(ContrastRefundCondition condition) {
		return contrastRefundMapper.findPayAccount(condition);
	}

	@Override
	public List<Map<String, Object>> query(ReportCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> queryCall(HashMap<String, Object> paramsMap) {
		// TODO Auto-generated method stub
		return null;
	}
	
}