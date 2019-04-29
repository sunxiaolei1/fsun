package com.fsun.service.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.report.ReportSkuUseSoApi;
import com.fsun.biz.bus.report.manage.ReportSkuUseSoManage;
import com.fsun.biz.common.BaseReportManage;
import com.fsun.common.dto.ColumnDto;
import com.fsun.domain.report.ReportCondition;
import com.fsun.domain.report.ReportHeaderTree;
import com.fsun.domain.report.ReportSkuUseSoCondition;
import com.fsun.service.common.BaseReportService;

/**
 * 领用出库报表
 * @author fsun
 * @date 2019年4月18日
 */
@Service
public class ReportSkuUseSoService extends BaseReportService<ReportSkuUseSoCondition> 
		implements ReportSkuUseSoApi {
	
	@Autowired
	private ReportSkuUseSoManage reportSkuUseSoManage;
	
	@Override
	public BaseReportManage getDefaultManage() {
		return this.reportSkuUseSoManage;
	}

	@Override
	public Map<String, Object> queryMap(ReportSkuUseSoCondition condition) {
		/*StringBuffer definedWhere = null;
		StringBuffer unionTotal = null;	
		StringBuffer orderBy = new StringBuffer(" ORDER BY " + 
				condition.getAlias() + "." + ReportConditionFieldEnum.QUERY_DATE_TIME.getName() +" ASC ");
		String sortColumn = condition.getSort();
		String sortType = condition.getOrder();
		if(!StringUtils.isEmpty(sortColumn) && !StringUtils.isEmpty(sortType)){
			orderBy = new StringBuffer(" ORDER BY "+ condition.getAlias() +"."+ sortColumn +" "+ sortType +" ");
		}
 		return this.getMapReport(condition, definedWhere, orderBy, unionTotal);*/
		return this.getMapReport(condition);
	}

	@Override
	public Map<String, Object> exportMap(ReportSkuUseSoCondition condition) {
		//获取报表集合(headers和details集合)
		Map<String, Object> reportMap = this.getMapReport(condition);
		//获取web表头字段树
		List<ReportHeaderTree> headersTree = (List<ReportHeaderTree>) reportMap.get("headers");
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
	public HashMap<String, Object> queryCallInit(ReportCondition condition) {
		
		HashMap<String, Object> queryParams = new HashMap<String, Object>();
		if(condition instanceof ReportSkuUseSoCondition){
			ReportSkuUseSoCondition currCondition = (ReportSkuUseSoCondition)condition;			
			queryParams.put("shop_id", currCondition.getShopId());
			queryParams.put("start_time", currCondition.getStartTime());		
			queryParams.put("end_time", currCondition.getEndTime());						
		}
		return queryParams;
	}

}
