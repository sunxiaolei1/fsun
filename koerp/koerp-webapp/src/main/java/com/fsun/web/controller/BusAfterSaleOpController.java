package com.fsun.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.bus.BusAfterSaleApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.dto.BusBarterDto;
import com.fsun.domain.dto.BusRefundDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusRefundCondition;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.AfterSaleException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 售后管理模块(只做单据操作)
 * @author sunxiaolei
 *
 */
@Controller
@RequestMapping("/bus/aftersale")
public class BusAfterSaleOpController extends BaseController {

	@Autowired
	private BusAfterSaleApi busAfterSaleApi;
	
	/**
	 * 创建退货单
	 * @param busRefundDto
	 * @return
	 */
	@RequestMapping(value="/refund/create", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult createForRefund(@RequestBody BusRefundDto busRefundDto) {
		try {
			BusUserDto currUser = super.getCurrentUser();
			busRefundDto.setCurrUser(currUser);
			busAfterSaleApi.createForRefund(busRefundDto);			
			return success();
		}catch (AfterSaleException e) {
			e.printStackTrace();
			return failure(SCMException.CODE_INSERT, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/**
	 * 一键退货
	 * @param busRefundDto
	 * @return
	 */
	@RequestMapping(value="/refund/onekey", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult onekeyRefund(@RequestBody BusRefundDto busRefundDto) {
		try {
			BusUserDto currUser = super.getCurrentUser();
			busRefundDto.setCurrUser(currUser);
			busAfterSaleApi.onekeyRefund(busRefundDto);			
			return success();
		}catch (AfterSaleException e) {
			e.printStackTrace();
			return failure(SCMException.CODE_BIZ, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/**
	 * 创建换货单
	 * @param busBarterDto
	 * @return
	 */
	@RequestMapping(value="/barter/create", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult createForBarter(@RequestBody BusBarterDto busBarterDto) {
		try {
			BusUserDto currUser = super.getCurrentUser();
			busBarterDto.setCurrUser(currUser);
			busAfterSaleApi.createForBarter(busBarterDto);			
			return success();
		}catch (AfterSaleException e) {
			e.printStackTrace();
			return failure(SCMException.CODE_INSERT, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/**
	 * 改变单据状态(取消、完成)
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/status/{status}", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult changeStatus(@PathVariable("status") Short status, 
		@RequestParam("refundIds") String refundIds, @RequestBody BusRefundCondition condition) {
		try {
			if (!StringUtils.isEmpty(refundIds)) {
				SysUser user = getCurrentUser();	
				busAfterSaleApi.changeStatus(refundIds.split(","), status, user, condition);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		}catch(AfterSaleException e){
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/**
	 * 追加备注
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/refund/updateRemark", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult updateRemark(@RequestBody BusRefundCondition condition) {
		try {
			SysUser sysuser = super.getCurrentUser();
			String refundId = busAfterSaleApi.updateRemark(condition, sysuser);			
			return success(refundId);
		}catch (AfterSaleException e) {
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/**
	 * 处理标记
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/refund/handleSign", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult handleSign(@RequestBody BusRefundCondition condition) {	
		
		SysUser sysuser = super.getCurrentUser();
		List<String> returnRefundIds = new ArrayList<>();
		String[] refundIds = condition.getRefundIds();
		if(refundIds!=null && refundIds.length>0){	
			for (String refundId : refundIds) {
				try {
					busAfterSaleApi.handleSign(refundId, condition.getRefundStatus(), 
						condition.getMemo(), sysuser);						
				}catch (Exception e) {
					returnRefundIds.add(refundId);
					e.printStackTrace();				
				}
			}			
		}	
		return success(StringUtils.join(returnRefundIds, ","));
	}
	
}
