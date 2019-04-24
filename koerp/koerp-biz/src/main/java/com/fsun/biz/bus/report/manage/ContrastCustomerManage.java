package com.fsun.biz.bus.report.manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.biz.common.BaseContrastManage;
import com.fsun.dao.report.mapper.ContrastCustomerMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.report.ContrastCustomerCondition;
import com.fsun.domain.report.ContrastCustomerModel;
import com.fsun.domain.report.ReportCondition;

/**
 * @author fsun
 * @date 2019年4月23日
 */

@Component
public class ContrastCustomerManage extends BaseContrastManage<ContrastCustomerMapper, 
		ContrastCustomerModel>{
	
	@Autowired
	private ContrastCustomerMapper contrastCustomerMapper;

	public PageModel findMapPage(ContrastCustomerCondition condition) {
		List<HashMap<String, Object>> list = contrastCustomerMapper.selectListMap(condition);
		return new PageModel(list);
	}

	public HashMap<String, Object> findFooter(ContrastCustomerCondition condition) {
		return contrastCustomerMapper.findFooter(condition);
	}

	public List<HashMap<String, Object>> findPayAccount(ContrastCustomerCondition condition) {
		return contrastCustomerMapper.findPayAccount(condition);
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
