package com.fsun.web.controller.summary;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.report.ReportSkuDetailsApi;
import com.fsun.common.utils.ExcelUtil;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.report.ReportSkuDetailsCondition;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 出库商品交易明细查询
 * @author fsun
 * @date 2019年4月20日
 */
@Controller
@RequestMapping("/summary/report/sku/details")
public class SummaryReportSkuDetailsController extends BaseController {
	
	@Autowired
	private ReportSkuDetailsApi reportSkuDetailsApi;

	/**
	 * 通过sku获取领用出库的商品明细
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/so/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(ReportSkuDetailsCondition condition) {
		try {
			PageModel pageModel = reportSkuDetailsApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = reportSkuDetailsApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping("/so/exportExcel")
	public void exportExcel(ReportSkuDetailsCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			//对得到的参数进行解码 				
			/*if(condition.getQ()!=null &&!"".equals(condition.getQ())){
				condition.setQ(URLDecoder.decode(condition.getQ(),"utf-8"));
			}*/
			List<HashMap<String, Object>> details = reportSkuDetailsApi.export(condition);			
			LinkedHashMap<String, String> fieldsMap = new LinkedHashMap<String, String>();
			fieldsMap.put("order_no", "单据编号");
			fieldsMap.put("shop_name", "出库店仓");	
			fieldsMap.put("onsign_name", "客户名称");
			fieldsMap.put("order_mode", "出库事由");			
			fieldsMap.put("sku", "SKU");
			fieldsMap.put("goods_name", "商品名称");			
			fieldsMap.put("unit", "单位");
			fieldsMap.put("ordered_qty", "出库数量");
			fieldsMap.put("price", "销售单价");
			fieldsMap.put("cost_price", "成本价");
			fieldsMap.put("total_price", "销售金额");
			fieldsMap.put("cost_total_price", "成本金额");
			fieldsMap.put("delivery_time", "交易时间");
			ExcelUtil.listToExcel(details, fieldsMap, "领用出库-商品交易明细", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 通过sku获取领用出库的商品明细
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/so/all/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findAllPage(ReportSkuDetailsCondition condition) {
		try {
			condition.setHasAll(true);
			PageModel pageModel = reportSkuDetailsApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping("/so/all/exportExcel")
	public void exportAllExcel(ReportSkuDetailsCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			condition.setHasAll(true);
			List<HashMap<String, Object>> details = reportSkuDetailsApi.export(condition);			
			LinkedHashMap<String, String> fieldsMap = new LinkedHashMap<String, String>();
			fieldsMap.put("order_no", "单据编号");
			fieldsMap.put("trade_type", "交易类型");	
			fieldsMap.put("shop_name", "交易店仓");	
			fieldsMap.put("customer_name", "客户名称");		
			fieldsMap.put("sku", "SKU");
			fieldsMap.put("goods_name", "商品名称");			
			fieldsMap.put("unit", "单位");
			fieldsMap.put("ordered_qty", "交易数量");
			fieldsMap.put("price", "交易单价");
			fieldsMap.put("cost_price", "成本价");
			fieldsMap.put("total_price", "交易金额");
			fieldsMap.put("cost_total_price", "成本金额");
			fieldsMap.put("delivery_time", "交易时间");
			ExcelUtil.listToExcel(details, fieldsMap, "出库商品交易明细", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
