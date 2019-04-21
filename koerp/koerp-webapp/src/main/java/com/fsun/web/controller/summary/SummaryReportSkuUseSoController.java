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
import org.springframework.web.servlet.ModelAndView;

import com.fsun.api.report.SkuUseSoReportApi;
import com.fsun.common.dto.ColumnDto;
import com.fsun.common.utils.ExcelUtil;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.enums.DocTradeTypeEnum;
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
	
	/**
	 * 跳转至领用出库明细汇总页面
	 * @param sku
	 * @return
	 */
	@RequestMapping(value="/toDetailView")
	public ModelAndView toDetailView() {
		ModelAndView modelAndView = new ModelAndView("/summary/report/skuUseSo/detail");
		modelAndView.addObject("tradeType", DocTradeTypeEnum.USE_SO.getCode());
		return modelAndView;
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
			condition.setQueryType(ReportQueryTypeEnum.SKU_USE_SO.getCode());
			Map<String, Object> map = skuUseSoReportApi.exportMap(condition);
			List<HashMap<String, Object>> details = (List<HashMap<String, Object>>) map.get("details");			
			LinkedHashMap<String, String> fieldsMap = (LinkedHashMap<String, String>) map.get("fields");
			List<ColumnDto> columnDtos = (List<ColumnDto>) map.get("columns");
			ExcelUtil.listToExcel(details, fieldsMap, columnDtos, "领用出库报表", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
