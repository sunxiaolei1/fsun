package com.fsun.web.controller.summary;

import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fsun.api.report.ContrastUseSoApi;
import com.fsun.common.dto.ColumnDto;
import com.fsun.common.utils.ExcelUtil;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.enums.ReportQueryTypeEnum;
import com.fsun.domain.report.ContrastUseSoCondition;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 客户对账单-领用出库
 * @author fsun
 * @date 2019年4月18日
 */
@Controller
@RequestMapping("/summary/contrast/useSo")
public class SummaryContrastUseSoController extends BaseController {
	
	@Autowired
	private ContrastUseSoApi contrastUseSoApi;
	
	/**
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("/summary/contrast/useSo/index");
		modelAndView.addObject("queryType", ReportQueryTypeEnum.USE_SO.getCode());
		return modelAndView;
	}

	/**
	 * 跳转至订单查看界面
	 */
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("orderNo") String orderNo) {				
		ModelAndView modelAndView = new ModelAndView("/summary/contrast/useSo/toDetailView");
		modelAndView.addObject("orderNo", orderNo);		
		return modelAndView;
	}
	
	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(ContrastUseSoCondition condition) {
		try {			
			PageModel pageModel = contrastUseSoApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = contrastUseSoApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	/**
	 * 导出对账单-商品及订单
	 * @param condition
	 * @param request
	 * @param response
	 */
	@RequestMapping("/exportOrders")
	public void exportOrders(ContrastUseSoCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			//对得到的参数进行解码 				
			if(condition.getKeywords()!=null &&!"".equals(condition.getKeywords())){
				condition.setKeywords(URLDecoder.decode(condition.getKeywords(),"utf-8"));
			}
			condition.setQueryType(ReportQueryTypeEnum.USE_SO.getCode());
			Map<String, Object> map = contrastUseSoApi.exportMap(condition);
			List<HashMap<String, Object>> details = (List<HashMap<String, Object>>) map.get("details");			
			LinkedHashMap<String, String> fieldsMap = (LinkedHashMap<String, String>) map.get("fields");
			List<ColumnDto> columnDtos = (List<ColumnDto>) map.get("columns");
			ExcelUtil.listToExcel(details, fieldsMap, columnDtos, "领用出库汇总-商品及订单", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
