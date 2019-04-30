package com.fsun.dao.report.mapper;

import java.util.HashMap;
import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.dao.mapper.BaseMySqlMapper;
import com.fsun.domain.report.ReportSkuDetailsCondition;
import com.fsun.domain.report.ReportSkuDetailsModel;

/**
 * @author fsun
 * @date 2019年4月20日
 */
@Mapper
public interface ReportSoSkuDetailsMapper extends BaseMySqlMapper<ReportSkuDetailsModel>{

	/**
	 * 获取所有的出库商品交易明细
	 * @param condition
	 * @return
	 */
	List<HashMap<String, Object>> selectAllMap(ReportSkuDetailsCondition condition);

	/**
	 * 导出所有的出库商品交易明细
	 * @param condition
	 * @return
	 */
	List<HashMap<String, Object>> exportAll(ReportSkuDetailsCondition condition);

}
