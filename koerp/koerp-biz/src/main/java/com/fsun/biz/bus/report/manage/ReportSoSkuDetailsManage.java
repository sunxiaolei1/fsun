package com.fsun.biz.bus.report.manage;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.report.mapper.ReportSoSkuDetailsMapper;
import com.fsun.domain.report.ReportSkuDetailsModel;

/**
 * @author fsun
 * @date 2019年4月20日
 */
@Component
public class ReportSoSkuDetailsManage extends CrudManage<ReportSoSkuDetailsMapper, 
	ReportSkuDetailsModel>{

}
