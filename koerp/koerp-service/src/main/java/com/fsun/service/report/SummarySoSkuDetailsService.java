package com.fsun.service.report;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.report.SummarySkuDetailsApi;
import com.fsun.biz.bus.report.manage.SummarySoSkuDetailsManage;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.model.SysUser;
import com.fsun.domain.report.SummarySkuDetailsCondition;
import com.fsun.domain.report.SummarySkuDetailsModel;

/**
 * 出库商品明细汇总
 * @author fsun
 * @date 2019年4月20日
 */
@Service(value="summarySoSkuDetailsService")
public class SummarySoSkuDetailsService implements SummarySkuDetailsApi {

	@Autowired
	private SummarySoSkuDetailsManage summarySoSkuDetailsManage;

	@Override
	public HashMap<String, Object> findFooter(SummarySkuDetailsCondition condition) {
		HashMap<String, Object> footer = summarySoSkuDetailsManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public SummarySkuDetailsModel load(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SummarySkuDetailsModel> list(SummarySkuDetailsCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageModel findPage(SummarySkuDetailsCondition condition) {
		return summarySoSkuDetailsManage.findMapPage(condition);
	}

	@Override
	public String save(SummarySkuDetailsModel domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}