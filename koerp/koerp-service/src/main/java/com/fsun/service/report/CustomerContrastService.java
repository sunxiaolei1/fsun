package com.fsun.service.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.report.CustomerContrastApi;
import com.fsun.biz.bus.report.manage.CustomerContrastManage;
import com.fsun.biz.common.BaseReportManage;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.enums.ReportConditionFieldEnum;
import com.fsun.domain.report.CustomerContrastCondition;
import com.fsun.domain.report.ReportCondition;
import com.fsun.service.common.BaseReportService;

/**
 * @author fsun
 * @date 2019年4月23日
 */
@Service
public class CustomerContrastService extends BaseReportService<CustomerContrastCondition> 
		implements CustomerContrastApi {
	
	@Autowired
	private CustomerContrastManage customerContrastManage;
	
	@Override
	public BaseReportManage getDefaultManage() {
		return this.customerContrastManage;
	}
	
	@Override
	public PageModel findPage(CustomerContrastCondition condition) {
		Map<String, Object> map = this.queryMap(condition);
		if(map.get("details")!=null){
			List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("details");
			return new PageModel(list);
		}
		return new PageModel(new ArrayList<>());
	}
	
	@Override
	public HashMap<String, Object> findFooter(CustomerContrastCondition condition) {
		HashMap<String, Object> footer = customerContrastManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public Map<String, Object> exportMap(CustomerContrastCondition condition) {
		return null;
	}	

	
	@Override
	protected HashMap<String, Object> queryCallInit(ReportCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> queryMap(CustomerContrastCondition condition) {
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

}
