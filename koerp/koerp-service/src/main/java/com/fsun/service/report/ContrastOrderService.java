package com.fsun.service.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.base.BaseReportApi;
import com.fsun.api.report.ContrastOrderApi;
import com.fsun.biz.bus.report.manage.ContrastOrderManage;
import com.fsun.biz.common.BaseReportManage;
import com.fsun.common.dto.ColumnDto;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.enums.ReportConditionFieldEnum;
import com.fsun.domain.report.ContrastOrderCondition;
import com.fsun.domain.report.ReportCondition;
import com.fsun.domain.report.ReportHeaderTree;
import com.fsun.service.common.BaseReportService;

/**
 * @author fsun
 * @date 2019年4月23日
 */
@Service
public class ContrastOrderService extends BaseReportService<ContrastOrderCondition> 
		implements ContrastOrderApi, BaseReportApi<ContrastOrderCondition> {
	
	@Autowired
	private ContrastOrderManage contrastOrderManage;
	
	@Override
	public BaseReportManage getDefaultManage() {
		return this.contrastOrderManage;
	}
	
	@Override
	public PageModel findPage(ContrastOrderCondition condition) {
		return contrastOrderManage.findMapPage(condition);
	}
	
	@Override
	public HashMap<String, Object> findFooter(ContrastOrderCondition condition) {
		HashMap<String, Object> footer = contrastOrderManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public Map<String, Object> exportMap(ContrastOrderCondition condition) {
		List<HashMap<String, Object>> list = contrastOrderManage.export(condition);
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
	public Map<String, Object> queryMap(ContrastOrderCondition condition) {
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
	public List<HashMap<String, Object>> findPayAccount(ContrastOrderCondition condition) {		
		return contrastOrderManage.findPayAccount(condition);
	}

	@Override
	protected HashMap<String, Object> queryCallInit(ReportCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

}
