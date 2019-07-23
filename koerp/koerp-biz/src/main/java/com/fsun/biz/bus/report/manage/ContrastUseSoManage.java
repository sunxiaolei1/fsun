package com.fsun.biz.bus.report.manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.BaseContrastManage;
import com.fsun.dao.report.mapper.ContrastUseSoMapper;
import com.fsun.domain.report.ContrastUseSoModel;
import com.fsun.domain.report.ReportCondition;

/**
 * @author fsun
 * @date 2019年7月23日
 */

@Component
public class ContrastUseSoManage extends BaseContrastManage<ContrastUseSoMapper, 
	ContrastUseSoModel>{
	
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
