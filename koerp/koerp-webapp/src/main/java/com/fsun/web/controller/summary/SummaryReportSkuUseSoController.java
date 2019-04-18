package com.fsun.web.controller.summary;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.report.SkuUseSoReportApi;
import com.fsun.common.utils.ExcelUtil;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.enums.ReportQueryTypeEnum;
import com.fsun.domain.report.SkuUseSoReportCondition;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 商品领用出库报表
 * @author fsun
 * @date 2019年4月18日
 */
@Controller
@RequestMapping("/summary/report/skuUseSo")
public class SummaryReportSkuUseSoController extends BaseController {
	
	@Autowired
	private SkuUseSoReportApi skuUseSoReportApi;
	
	/**
	 * 跳转至领用出库汇总页面
	 * @return
	 */
	@RequestMapping(value="/index")
	public String index() {
		return "/summary/report/skuUseSo/index";
	}
	
	
	@RequestMapping(value="/list", method = RequestMethod.POST)
	@ResponseBody
	public HttpResult list(SkuUseSoReportCondition condition) {
		try {
			condition.setQueryType(ReportQueryTypeEnum.SKU_USE_SO.getCode());
			return success(skuUseSoReportApi.queryMap(condition));
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping("/exportExcel")
	public void exportExcel(SkuUseSoReportCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String, Object> map = skuUseSoReportApi.exportMap(condition);
			List<HashMap<String, Object>> details = (List<HashMap<String, Object>>) map.get("details");			
			/*LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>();
			fieldMap.put("customer_name", "客户名称");
			fieldMap.put("shop_name", "交易门店");
			fieldMap.put("pay_mode_name", "支付方式");
			fieldMap.put("trade_type_name", "交易类型");
			fieldMap.put("order_id", "销售单号");
			fieldMap.put("trade_status_name", "交易状态");
			fieldMap.put("trade_time", "交易时间");
			fieldMap.put("trade_price", "交易金额");
			fieldMap.put("memo", "备注");*/
			LinkedHashMap<String, String> fieldsMap = (LinkedHashMap<String, String>) map.get("fields");
			ExcelUtil.listToExcel(details, fieldsMap, "领用出库报表", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
