package com.fsun.service.report;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.report.ReportSkuDetailsApi;
import com.fsun.biz.bus.report.manage.ReportSoSkuDetailsManage;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.model.SysUser;
import com.fsun.domain.report.ReportSkuDetailsCondition;
import com.fsun.domain.report.ReportSkuDetailsModel;

/**
 * 出库商品明细汇总
 * @author fsun
 * @date 2019年4月20日
 */
@Service(value="reportSoSkuDetailsService")
public class ReportSoSkuDetailsService implements ReportSkuDetailsApi {

	@Autowired
	private ReportSoSkuDetailsManage reportSoSkuDetailsManage;

	@Override
	public HashMap<String, Object> findFooter(ReportSkuDetailsCondition condition) {
		HashMap<String, Object> footer = reportSoSkuDetailsManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public ReportSkuDetailsModel load(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReportSkuDetailsModel> list(ReportSkuDetailsCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageModel findPage(ReportSkuDetailsCondition condition) {
		return reportSoSkuDetailsManage.findMapPage(condition);
	}

	@Override
	public String save(ReportSkuDetailsModel domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HashMap<String, Object>> export(ReportSkuDetailsCondition condition) {
		return reportSoSkuDetailsManage.export(condition);
	}
	
}