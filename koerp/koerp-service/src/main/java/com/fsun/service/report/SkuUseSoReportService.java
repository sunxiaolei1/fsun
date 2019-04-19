package com.fsun.service.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.report.SkuUseSoReportApi;
import com.fsun.biz.bus.report.manage.SkuUseSoReportManage;
import com.fsun.biz.common.BaseReportManage;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.enums.ReportConditionFieldEnum;
import com.fsun.domain.report.HeaderFieldModel;
import com.fsun.domain.report.ReportCondition;
import com.fsun.domain.report.SkuUseSoReportCondition;
import com.fsun.service.common.BaseReportService;

/**
 * 领用出库报表
 * @author fsun
 * @date 2019年4月18日
 */
@Service
public class SkuUseSoReportService extends BaseReportService<SkuUseSoReportCondition> implements SkuUseSoReportApi {
	
	@Autowired
	private SkuUseSoReportManage skuUseSoReportManage;
	
	@Override
	public BaseReportManage getDefaultManage() {
		return this.skuUseSoReportManage;
	}

	@Override
	public Map<String, Object> queryMap(SkuUseSoReportCondition condition) {
		StringBuffer definedWhere = null;
		StringBuffer unionTotal = null;	
		StringBuffer orderBy = new StringBuffer(" ORDER BY " + 
				condition.getAlias() + "." + ReportConditionFieldEnum.QUERY_DATE_TIME.getName() +" ASC ");
		String sortColumn = condition.getSort();
		String sortType = condition.getOrder();
		if(!StringUtils.isEmpty(sortColumn) && !StringUtils.isEmpty(sortType)){
			orderBy = new StringBuffer(" ORDER BY "+ condition.getAlias() +"."+ sortColumn +" "+ sortType +" ");
		}
 		return this.getMapReport(condition, definedWhere, orderBy, unionTotal);
	}

	@Override
	public Map<String, Object> exportMap(SkuUseSoReportCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> queryCallInit(StringBuffer where, StringBuffer orderBy, ReportCondition condition,
			List<HeaderFieldModel> headerFieldModels) {
		
		HashMap<String, Object> queryParams = new HashMap<String, Object>();
		if(condition instanceof SkuUseSoReportCondition){
			SkuUseSoReportCondition currCondition = (SkuUseSoReportCondition)condition;			
			queryParams.put("shop_id", currCondition.getShopId());
			queryParams.put("start_time", currCondition.getStartTime());		
			queryParams.put("end_time", currCondition.getEndTime());						
		}
		return queryParams;
	}

}
