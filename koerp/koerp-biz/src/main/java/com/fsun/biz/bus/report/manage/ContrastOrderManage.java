package com.fsun.biz.bus.report.manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.BaseContrastManage;
import com.fsun.dao.report.mapper.ContrastOrderMapper;
import com.fsun.domain.report.ContrastOrderCondition;
import com.fsun.domain.report.ContrastOrderModel;
import com.fsun.domain.report.ReportCondition;

/**
 * @author fsun
 * @date 2019年4月23日
 */

@Component
public class ContrastOrderManage extends BaseContrastManage<ContrastOrderMapper, 
		ContrastOrderModel>{

	public List<HashMap<String, Object>> findPayAccount(ContrastOrderCondition condition) {
		return this.mapper.findPayAccount(condition);
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
