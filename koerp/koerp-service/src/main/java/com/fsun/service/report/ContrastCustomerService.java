package com.fsun.service.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.base.BaseReportApi;
import com.fsun.api.report.ContrastCustomerApi;
import com.fsun.biz.bus.report.manage.ContrastCustomerManage;
import com.fsun.biz.common.BaseReportManage;
import com.fsun.common.dto.ColumnDto;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.enums.ReportConditionFieldEnum;
import com.fsun.domain.report.ContrastCustomerCondition;
import com.fsun.domain.report.HeaderFieldModel;
import com.fsun.domain.report.ReportCondition;
import com.fsun.domain.report.ReportHeaderTree;
import com.fsun.service.common.BaseReportService;

/**
 * @author fsun
 * @date 2019年4月23日
 */
@Service
public class ContrastCustomerService extends BaseReportService<ContrastCustomerCondition> 
		implements ContrastCustomerApi, BaseReportApi<ContrastCustomerCondition> {
	
	@Autowired
	private ContrastCustomerManage contrastCustomerManage;
	
	@Override
	public BaseReportManage getDefaultManage() {
		return this.contrastCustomerManage;
	}
	
	@Override
	public PageModel findPage(ContrastCustomerCondition condition) {
		return contrastCustomerManage.findMapPage(condition);
	}
	
	@Override
	public HashMap<String, Object> findFooter(ContrastCustomerCondition condition) {
		HashMap<String, Object> footer = contrastCustomerManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public Map<String, Object> exportMap(ContrastCustomerCondition condition) {
		List<HashMap<String, Object>> list = contrastCustomerManage.export(condition);
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
	public Map<String, Object> queryMap(ContrastCustomerCondition condition) {
		StringBuffer definedWhere = new StringBuffer(" WHERE 1 = 1 ");
		StringBuffer unionTotal = null;	
		StringBuffer orderBy = new StringBuffer(" ORDER BY " + 
				condition.getAlias() + "." + ReportConditionFieldEnum.QUERY_DATE_TIME.getName() +" ASC ");
		String sortColumn = condition.getSort();
		String sortType = condition.getOrder();
		if(!StringUtils.isEmpty(sortColumn) && !StringUtils.isEmpty(sortType)){
			orderBy = new StringBuffer(" ORDER BY "+ condition.getAlias() +"."+ sortColumn +" "+ sortType +" ");
		}
	
		String customerCode = condition.getCustomerCode();
		if(!StringUtils.isEmpty(customerCode)){
			definedWhere.append(" AND "+ condition.getAlias() +".customer_code = '"+ customerCode +"' ");	
		}
		String notInCustomerTypes = condition.getNotInCustomerTypes();
		if(notInCustomerTypes!=null && !notInCustomerTypes.equals("")){
			String types = StringUtils.collectionToDelimitedString(StringUtils.split(notInCustomerTypes), "','");
			definedWhere.append(" AND "+ condition.getAlias() +".customer_type NOT IN ('"+ types +"') ");				
		}
 		return this.getMapReport(condition, definedWhere, orderBy, unionTotal);
	}

	@Override
	public List<HashMap<String, Object>> findPayAccount(ContrastCustomerCondition condition) {		
		return contrastCustomerManage.findPayAccount(condition);
	}

	@Override
	protected HashMap<String, Object> queryCallInit(ReportCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

}
