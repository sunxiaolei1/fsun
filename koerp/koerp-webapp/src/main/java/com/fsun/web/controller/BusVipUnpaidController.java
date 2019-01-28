package com.fsun.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.bus.BusVipUnpaidApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
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
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
}
