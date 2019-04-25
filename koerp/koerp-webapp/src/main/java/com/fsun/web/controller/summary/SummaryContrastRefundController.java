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

import com.fsun.api.report.ContrastRefundApi;
import com.fsun.common.dto.ColumnDto;
import com.fsun.common.utils.ExcelUtil;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.enums.ReportQueryTypeEnum;
import com.fsun.domain.report.ContrastRefundCondition;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 售后单汇总
 * @author fsun
 * @date 2019年4月18日
 */
@Controller
@RequestMapping("/summary/contrast/refund")
public class SummaryContrastRefundController extends BaseController {
	
	@Autowired
	private ContrastRefundApi contrastRefundApi;
	
	/**
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("/summary/contrast/refund/index");
		modelAndView.addObject("queryType", ReportQueryTypeEnum.REFUND.getCode());
		return modelAndView;
	}

	/**
	 * 跳转至订单查看界面
	 */
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("refundId") String refundId) {				
		ModelAndView modelAndView = new ModelAndView("/summary/contrast/refund/toDetailView");
		modelAndView.addObject("refundId", refundId);		
		return modelAndView;
	}
	
	/**
	 * 跳转至账单查看界面
	 */
	@RequestMapping(value="/toPayAccountView")
	public ModelAndView toPayAccountView() {
		ModelAndView modelAndView = new ModelAndView("/summary/contrast/refund/toPayAccountView");
		return modelAndView;
	}
	
	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(ContrastRefundCondition condition) {
		try {			
			PageModel pageModel = contrastRefundApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = contrastRefundApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/payAccount/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPayAccount(ContrastRefundCondition condition) {
		try {
			return success(contrastRefundApi.findPayAccount(condition));
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/**
	 * 导出售后对账单-商品及订单
	 * @param condition
	 * @param request
	 * @param response
	 */
	@RequestMapping("/exportOrders")
	public void exportOrders(ContrastRefundCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			//对得到的参数进行解码 				
			if(condition.getQ()!=null &&!"".equals(condition.getQ())){
				condition.setQ(URLDecoder.decode(condition.getQ(),"utf-8"));
			}
			condition.setQueryType(ReportQueryTypeEnum.REFUND.getCode());
			Map<String, Object> map = contrastRefundApi.exportMap(condition);
			List<HashMap<String, Object>> details = (List<HashMap<String, Object>>) map.get("details");			
			LinkedHashMap<String, String> fieldsMap = (LinkedHashMap<String, String>) map.get("fields");
			List<ColumnDto> columnDtos = (List<ColumnDto>) map.get("columns");
			ExcelUtil.listToExcel(details, fieldsMap, columnDtos, "售后汇总-商品及订单", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 导出售后对账单-账单
	 * @param condition
	 * @param request
	 * @param response
	 */
	@RequestMapping("/exportPayAccounts")
	public void exportPayAccounts(ContrastRefundCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			//对得到的参数进行解码 				
			if(condition.getQ()!=null &&!"".equals(condition.getQ())){
				condition.setQ(URLDecoder.decode(condition.getQ(),"utf-8"));
			}
			List<HashMap<String, Object>> details = contrastRefundApi.findPayAccount(condition);			
			LinkedHashMap<String, String> fieldsMap = new LinkedHashMap<String, String>();
			fieldsMap.put("refund_id", "退货单号");
			fieldsMap.put("order_id", "原订单号");
			fieldsMap.put("buyer_name", "客户名称");
			fieldsMap.put("shop_name", "交易门店");			
			fieldsMap.put("line_no", "行号");
			fieldsMap.put("pay_mode", "支付方式");
			fieldsMap.put("recept_price", "应收金额");			
			fieldsMap.put("pay_price", "应付金额");
			fieldsMap.put("dib_price", "找零金额");
			fieldsMap.put("discount_amount", "优惠金额");
			fieldsMap.put("trade_no", "支付流水号");
			fieldsMap.put("card_no", "支付卡号");
			fieldsMap.put("trade_time", "交易时间");
			ExcelUtil.listToExcel(details, fieldsMap, "售后汇总-账单", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
