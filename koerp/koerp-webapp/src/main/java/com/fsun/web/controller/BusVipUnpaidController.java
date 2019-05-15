package com.fsun.web.controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

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
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
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
	
	@RequestMapping(value="/toVipUnpaidView")
	public String toVipUnpaidView() {
		return "/busVip/operate/toVipUnpaidView";
	}
	
	@RequestMapping(value="/toReserveUnpaidView")
	public String toReserveUnpaidView() {
		return "/busVip/operate/toReserveUnpaidView";
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
	
	/**
	 * 保存会员卡充值出现对应客户存在挂账的情况
	 * @param busVipUnpaidDto
	 * @return
	 */
	@RequestMapping(value="/saveEntity", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult saveEntity(@RequestBody BusVipUnpaidDto busVipUnpaidDto) {
		
		BusAccessLogCondition condition = new BusAccessLogCondition();
		condition.setCreatedTime(new Date());
		condition.setExt0("会员卡充值、备用金充值及挂账结款交易记录");
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
	
	/**
	 * 会员开卡
	 * @param activeCardDto
	 * @return
	 */
	@RequestMapping(value="/active", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult active(@RequestBody ActiveCardDto activeCardDto) {
		
		BusAccessLogCondition condition = new BusAccessLogCondition();
		condition.setCreatedTime(new Date());
		condition.setExt0("会员开卡");
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
		
		BusAccessLogCondition busAccessLogCondition = new BusAccessLogCondition();
		busAccessLogCondition.setCreatedTime(new Date());
		busAccessLogCondition.setExt0("交易记录状态变更操作");
		busAccessLogCondition.setIp(request.getRemoteAddr());
		busAccessLogCondition.setRequestStatus((short)200);
		busAccessLogCondition.setRequestType((short)0);
		busAccessLogCondition.setRequestJson(JSON.toJSONString(condition));
		busAccessLogCondition.setExt4("1");
		busAccessLogCondition.setExt2(status);
		try {
			if (!StringUtils.isEmpty(ids)) {
				SysUser user = getCurrentUser();
				busAccessLogCondition.setExt1(user.getUsername());			
				busVipUnpaidApi.changeStatus(ids.split(","), status, user, condition);
				busAccessLogCondition.setRequestId(ids);
				busAccessLogApi.create(busAccessLogCondition);				
				return success(SCMErrorEnum.SUCCESS);
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		} catch (VipUnpaidException e) {
			e.printStackTrace();
			busAccessLogCondition.setRequestStatus((short)-100);
			busAccessLogCondition.setErrorMsg(e.getErrorMsg());			
			busAccessLogApi.create(busAccessLogCondition);
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			busAccessLogCondition.setRequestStatus((short)-100);
			String errorMessage = e.getMessage().length()>800?e.getMessage().substring(0, 800):e.getMessage();
			busAccessLogCondition.setErrorMsg(errorMessage);			
			busAccessLogApi.create(busAccessLogCondition);
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
}
