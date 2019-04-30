package com.fsun.biz.bus.report.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.report.mapper.ReportSoSkuDetailsMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.report.ReportSkuDetailsCondition;
import com.fsun.domain.report.ReportSkuDetailsModel;

/**
 * @author fsun
 * @date 2019年4月20日
 */
@Component
public class ReportSoSkuDetailsManage extends CrudManage<ReportSoSkuDetailsMapper, 
	ReportSkuDetailsModel>{

	/**
	 * 获取所有的出库商品交易明细
	 * @param condition
	 * @return
	 */
	public PageModel findAllMapPage(ReportSkuDetailsCondition condition) {
		List<HashMap<String, Object>> list = mapper.selectAllMap(condition);
		return new PageModel(list);
	}

	/**
	 * 导出所有的出库商品交易明细
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> exportAll(ReportSkuDetailsCondition condition) {
		return mapper.exportAll(condition);
	}

}
