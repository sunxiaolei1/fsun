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

import com.fsun.api.bus.BusVipUnpaidApi;
import com.fsun.common.utils.ExcelUtil;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusVipUnpaidCondition;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * (备用金、会员卡、挂账)对账单
 * @author fsun
 * @date 2019年4月18日
 */
@Controller
@RequestMapping("/summary/contrast")
public class SummaryContrastVipUnpaidController extends BaseController {
	
	@Autowired
	private BusVipUnpaidApi busVipUnpaidApi;
	
	/**
	 * 会员卡充值消费报表汇总
	 * @return
	 */
	@RequestMapping(value="/vip/index")
	public String vipIndex() {
		return "/summary/contrast/vip/index";
	}
	
	/**
	 * 挂账结款报表汇总
	 * @return
	 */
	@RequestMapping(value="/unpaid/index")
	public String unpaidIndex() {
		return "/summary/contrast/unpaid/index";
	}
	
	/**
	 * 备用金充值消费报表汇总
	 * @return
	 */
	@RequestMapping(value="/reserve/index")
	public String reserveIndex() {
		return "/summary/contrast/reserve/index";
	}
	
	@RequestMapping(value="/vip/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findVipPage(BusVipUnpaidCondition condition) {
		try {
			String[] tradeTypes = {"3", "4"};
			condition.setInTradeTypes(tradeTypes);
			PageModel pageModel = busVipUnpaidApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busVipUnpaidApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/unpaid/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findUnpaidPage(BusVipUnpaidCondition condition) {
		try {
			String[] tradeTypes = {"1", "2", "5"};
			condition.setInTradeTypes(tradeTypes);
			PageModel pageModel = busVipUnpaidApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn())
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busVipUnpaidApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/reserve/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findReservePage(BusVipUnpaidCondition condition) {
		try {
			String[] tradeTypes = {"6", "7"};
			condition.setInTradeTypes(tradeTypes);
			PageModel pageModel = busVipUnpaidApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busVipUnpaidApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping("/vip/exportExcel")
	public void exportVip(BusVipUnpaidCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {	
			String[] tradeTypes = {"3", "4"};
			condition.setInTradeTypes(tradeTypes);
			List<HashMap<String, Object>> list = busVipUnpaidApi.exportVip(condition);
			LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>();
			fieldMap.put("card_no", "会员卡号");
			fieldMap.put("customer_name", "客户名称");
			fieldMap.put("shop_name", "交易门店");
			fieldMap.put("pay_mode_name", "支付方式");
			fieldMap.put("trade_type_name", "交易类型");
			fieldMap.put("order_id", "销售单号");
			fieldMap.put("trade_status_name", "交易状态");
			fieldMap.put("trade_time", "交易时间");
			fieldMap.put("trade_price", "交易金额");
			fieldMap.put("gift_price", "赠送金额");
			fieldMap.put("memo", "备注");
			ExcelUtil.listToExcel(list, fieldMap, "会员卡充值消费明细", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/unpaid/exportExcel")
	public void exportUnpaid(BusVipUnpaidCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			String[] tradeTypes = {"1", "2", "5"};
			condition.setInTradeTypes(tradeTypes);
			List<HashMap<String, Object>> list = busVipUnpaidApi.exportUnpaid(condition);
			LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>();
			fieldMap.put("customer_name", "客户名称");
			fieldMap.put("shop_name", "交易门店");
			fieldMap.put("pay_mode_name", "支付方式");
			fieldMap.put("trade_type_name", "交易类型");
			fieldMap.put("order_id", "销售单号");
			fieldMap.put("trade_status_name", "交易状态");
			fieldMap.put("trade_time", "交易时间");
			fieldMap.put("trade_price", "交易金额");
			fieldMap.put("memo", "备注");
			ExcelUtil.listToExcel(list, fieldMap, "挂账结款消费明细", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/reserve/exportExcel")
	public void exportReserve(BusVipUnpaidCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			String[] tradeTypes = {"6", "7"};
			condition.setInTradeTypes(tradeTypes);
			List<HashMap<String, Object>> list = busVipUnpaidApi.exportReserve(condition);
			LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>();
			fieldMap.put("customer_name", "客户名称");
			fieldMap.put("shop_name", "交易门店");
			fieldMap.put("pay_mode_name", "支付方式");
			fieldMap.put("trade_type_name", "交易类型");
			fieldMap.put("order_id", "销售单号");
			fieldMap.put("trade_status_name", "交易状态");
			fieldMap.put("trade_time", "交易时间");
			fieldMap.put("trade_price", "交易金额");
			fieldMap.put("memo", "备注");
			ExcelUtil.listToExcel(list, fieldMap, "备用金充值消费明细", response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
