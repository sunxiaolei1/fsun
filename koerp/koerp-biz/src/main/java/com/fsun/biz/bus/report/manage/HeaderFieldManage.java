package com.fsun.biz.bus.report.manage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.dao.report.mapper.HeaderFieldMapper;
import com.fsun.domain.report.HeaderFieldCondition;
import com.fsun.domain.report.HeaderFieldModel;

/**
 * @author fsun
 * @date 2019年4月19日
 */
@Component
public class HeaderFieldManage {
	
	@Autowired
	private HeaderFieldMapper headerFieldMapper;

	/**
	 * 获取表头信息
	 * @param condition
	 * @return
	 */
	public List<HeaderFieldModel> queryHeaderFields(HeaderFieldCondition condition) {
		return headerFieldMapper.queryHeaderFields(condition);
	}

}
