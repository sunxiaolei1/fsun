package com.fsun.api.report;

import java.util.HashMap;
import java.util.List;

import com.fsun.api.base.BaseFooterApi;
import com.fsun.domain.report.ReportSkuDetailsCondition;
import com.fsun.domain.report.ReportSkuDetailsModel;

/**
 * @author fsun
 * @date 2019年4月20日
 */
public interface ReportSkuDetailsApi extends BaseFooterApi<ReportSkuDetailsModel, 
	ReportSkuDetailsCondition>{

	/**
	 * 导出商品交易明细
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> export(ReportSkuDetailsCondition condition);

}
