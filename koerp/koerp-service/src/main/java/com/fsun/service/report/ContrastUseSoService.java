package com.fsun.service.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.base.BaseReportApi;
import com.fsun.api.report.ContrastUseSoApi;
import com.fsun.biz.bus.report.manage.ContrastUseSoManage;
import com.fsun.biz.common.BaseReportManage;
import com.fsun.common.dto.ColumnDto;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.report.ContrastUseSoCondition;
import com.fsun.domain.report.ReportCondition;
import com.fsun.domain.report.ReportHeaderTree;
import com.fsun.service.common.BaseReportService;

/**
 * @author fsun
 * @date 2019年7月23日
 */
@Service
public class ContrastUseSoService extends BaseReportService<ContrastUseSoCondition> 
	implements ContrastUseSoApi, BaseReportApi<ContrastUseSoCondition> {

	@Autowired
	private ContrastUseSoManage contrastUseSoManage;
	
	@Override
	public BaseReportManage getDefaultManage() {
		return this.contrastUseSoManage;
	}
	
	@Override
	public PageModel findPage(ContrastUseSoCondition condition) {
		return contrastUseSoManage.findMapPage(condition);
	}

	@Override
	public HashMap<String, Object> findFooter(ContrastUseSoCondition condition) {
		HashMap<String, Object> footer = contrastUseSoManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public Map<String, Object> exportMap(ContrastUseSoCondition condition) {
		List<HashMap<String, Object>> list = contrastUseSoManage.export(condition);
		Map<String, Object> reportMap = new HashMap<>();
		reportMap.put("details", list);		
		//获取web表头字段树
		//组装多表头字段目录结构
		List<ReportHeaderTree> headersTree = this.getReportHeaderTree(
			this.getHeaderFields(condition.getQueryType()));		
		//获取所有叶子节点队列
		LinkedHashMap<String, String> fieldsMap = new LinkedHashMap<>();
		this.getLeafsMap(headersTree, fieldsMap);
		reportMap.put("fields", fieldsMap);
		//组装excel表头字段树
		List<ColumnDto> columnDtos = new ArrayList<>();
		this.getExcelColumns(headersTree, columnDtos);
		reportMap.put("columns", columnDtos);
		return reportMap;
	}

	@Override
	public Map<String, Object> queryMap(ContrastUseSoCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected HashMap<String, Object> queryCallInit(ReportCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

}
