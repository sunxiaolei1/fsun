package com.fsun.web.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.bus.BusVipUnpaidApi;
import com.fsun.common.utils.ExcelUtil;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.BusVipUnpaidDto;
import com.fsun.domain.entity.BusVipUnpaidCondition;
import com.fsun.domain.model.BusVipUnpaid;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.VipUnpaidException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2019年1月24日
 */
@Controller
@RequestMapping("/bus/vipUnpaid")
public class BusVipUnpaidController extends BaseController {
	
	@Autowired
	private BusVipUnpaidApi busVipUnpaidApi;
	
	@RequestMapping(value="/summary/vip/index")
	public String vipIndex() {
		return "/summary/vip/index";
	}
	
	@RequestMapping(value="/summary/unpaid/index")
	public String unpaidIndex() {
		return "/summary/unpaid/index";
	}
	
	@RequestMapping(value="/toVipUnpaidView")
	public String toVipUnpaidView() {
		return "/busVip/operate/toVipUnpaidView";
	}
	
	
	@RequestMapping(value="/initUnpaidAmount", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult initUnpaidAmount(@RequestBody BusVipUnpaidCondition condition) {		
		try {			
			BusUserDto busUserDto = getCurrentUser();	
			HashMap<String, Object> map = busVipUnpaidApi.initUnpaidAmount(condition, busUserDto);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/vip/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findVipPage(BusVipUnpaidCondition condition) {
		try {
			String[] tradeTypes = {"3", "4"};
			condition.setInTradeTypes(tradeTypes);
			PageModel pageModel = busVipUnpaidApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/unpaid/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findUnpaidPage(BusVipUnpaidCondition condition) {
		try {
			String[] tradeTypes = {"1", "2"};
			condition.setInTradeTypes(tradeTypes);
			PageModel pageModel = busVipUnpaidApi.findPage(condition);
			return success(pageModel);
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
			String[] tradeTypes = {"1", "2"};
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
	
	@RequestMapping(value="/save", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult save(@RequestBody BusVipUnpaid busVipUnpaid) {
		try {
			SysUser user = getCurrentUser();			
			busVipUnpaidApi.save(busVipUnpaid, user);
			return success();
		} catch(VipUnpaidException e){
			e.printStackTrace();
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}
	
	@RequestMapping(value="/saveEntity", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult saveEntity(@RequestBody BusVipUnpaidDto busVipUnpaidDto) {
		try {
			BusUserDto currUser = getCurrentUser();			
			String relationId = busVipUnpaidApi.saveEntity(busVipUnpaidDto, currUser);
			return success(relationId);
		} catch(VipUnpaidException e){
			e.printStackTrace();
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}
	


	@RequestMapping(value="/status/{status}", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult changeStatus(@PathVariable("status") String status, 
		@RequestParam("ids") String ids, @RequestBody BusVipUnpaidCondition condition) {
		try {
			if (!StringUtils.isEmpty(ids)) {
				SysUser user = getCurrentUser();	
				busVipUnpaidApi.changeStatus(ids.split(","), status, user, condition);
				return success(SCMErrorEnum.SUCCESS);
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		} catch (VipUnpaidException e) {
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
}
