package com.fsun.web.controller;

import java.util.Date;
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

import com.alibaba.fastjson.JSON;
import com.fsun.api.bus.BusAccessLogApi;
import com.fsun.api.bus.BusVipUnpaidApi;
import com.fsun.common.utils.ExcelUtil;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.ActiveCardDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.BusVipUnpaidDto;
import com.fsun.domain.entity.BusAccessLogCondition;
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
	
	@Autowired
	private BusAccessLogApi busAccessLogApi;
	
	@Autowired
	private HttpServletRequest request;
	
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
	
	@RequestMapping("/toVipActiveView")
	public String toVipActiveView() {
		return "/busVip/operate/toVipActiveView";
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
			String[] tradeTypes = {"1", "2"};
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
		
		BusAccessLogCondition condition = new BusAccessLogCondition();
		condition.setCreatedTime(new Date());
		condition.setExt0("挂账充值交易记录");
		condition.setIp(request.getRemoteAddr());
		condition.setRequestStatus((short)200);
		condition.setRequestType((short)0);
		condition.setRequestJson(JSON.toJSONString(busVipUnpaid));
		condition.setExt4("1");
		try {
			SysUser user = getCurrentUser();
			
			condition.setExt1(user.getUsername());			
			String unpaidId = busVipUnpaidApi.save(busVipUnpaid, user);		
			condition.setRequestId(unpaidId);
			busAccessLogApi.create(condition);
			
			return success();
		} catch(VipUnpaidException e){
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			condition.setErrorMsg(e.getErrorMsg());			
			busAccessLogApi.create(condition);
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			String errorMessage = e.getMessage().length()>800?e.getMessage().substring(0, 800):e.getMessage();
			condition.setErrorMsg(errorMessage);			
			busAccessLogApi.create(condition);
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}
	
	@RequestMapping(value="/saveEntity", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult saveEntity(@RequestBody BusVipUnpaidDto busVipUnpaidDto) {
		
		BusAccessLogCondition condition = new BusAccessLogCondition();
		condition.setCreatedTime(new Date());
		condition.setExt0("挂账充值交易记录");
		condition.setIp(request.getRemoteAddr());
		condition.setRequestStatus((short)200);
		condition.setRequestType((short)0);
		condition.setRequestJson(JSON.toJSONString(busVipUnpaidDto));
		condition.setExt4("0");
		try {
			BusUserDto currUser = getCurrentUser();	
			
			condition.setExt1(currUser.getUsername());				
			String relationId = busVipUnpaidApi.saveEntity(busVipUnpaidDto, currUser);
			condition.setRequestId(relationId);
			busAccessLogApi.create(condition);
			
			return success(relationId);
		} catch(VipUnpaidException e){
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			condition.setErrorMsg(e.getErrorMsg());			
			busAccessLogApi.create(condition);
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			String errorMessage = e.getMessage().length()>800?e.getMessage().substring(0, 800):e.getMessage();
			condition.setErrorMsg(errorMessage);			
			busAccessLogApi.create(condition);
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}
	
	@RequestMapping(value="/active", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult active(@RequestBody ActiveCardDto activeCardDto) {
		
		BusAccessLogCondition condition = new BusAccessLogCondition();
		condition.setCreatedTime(new Date());
		condition.setExt0("挂账充值交易记录");
		condition.setIp(request.getRemoteAddr());
		condition.setRequestStatus((short)200);
		condition.setRequestType((short)0);
		condition.setRequestJson(JSON.toJSONString(activeCardDto));
		condition.setExt4("1");
		try {
			BusUserDto currUser = getCurrentUser();			
			condition.setExt1(currUser.getUsername());			
			BusVipUnpaid busVipUnpaid = busVipUnpaidApi.active(activeCardDto, currUser);
			if(busVipUnpaid!=null){
				condition.setRequestId(busVipUnpaid.getUnpaidId());
				busAccessLogApi.create(condition);
			}
			return success();
		} catch(VipUnpaidException e){
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			condition.setErrorMsg(e.getErrorMsg());			
			busAccessLogApi.create(condition);
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			String errorMessage = e.getMessage().length()>800?e.getMessage().substring(0, 800):e.getMessage();
			condition.setErrorMsg(errorMessage);			
			busAccessLogApi.create(condition);
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
