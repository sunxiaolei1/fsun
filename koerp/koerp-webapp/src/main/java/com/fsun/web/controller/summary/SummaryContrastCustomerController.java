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

import com.fsun.api.report.CustomerContrastApi;
import com.fsun.common.dto.ColumnDto;
import com.fsun.common.utils.ExcelUtil;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.enums.ReportQueryTypeEnum;
import com.fsun.domain.report.CustomerContrastCondition;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 客户对账单
 * @author fsun
 * @date 2019年4月18日
 */
@Controller
@RequestMapping("/summary/contrast/customer")
public class SummaryContrastCustomerController extends BaseController {
	
	@Autowired
	private CustomerContrastApi customerContrastApi;
	
	/**
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("/summary/contrast/customer/index");
		modelAndView.addObject("queryType", ReportQueryTypeEnum.CUSTOMER.getCode());
		return modelAndView;
	}
	
	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findVipPage(CustomerContrastCondition condition) {
		try {
			condition.setQueryType(ReportQueryTypeEnum.CUSTOMER.getCode());
			PageModel pageModel = customerContrastApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = customerContrastApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping("/exportExcel")
	public void exportExcel(CustomerContrastCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			condition.setQueryType(ReportQueryTypeEnum.CUSTOMER.getCode());
			Map<String, Object> map = customerContrastApi.exportMap(condition);
			List<HashMap<String, Object>> details = (List<HashMap<String, Object>>) map.get("details");			
			LinkedHashMap<String, String> fieldsMap = (LinkedHashMap<String, String>) map.get("fields");
			List<ColumnDto> columnDtos = (List<ColumnDto>) map.get("columns");
			ExcelUtil.listToExcel(details, fieldsMap, columnDtos, "客户对账单", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
