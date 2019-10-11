package com.fsun.web.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.fsun.api.bus.BusAccessLogApi;
import com.fsun.api.bus.BusOrderApi;
import com.fsun.api.bus.DocPoApi;
import com.fsun.api.bus.ErpOrderApi;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.dto.BusOrderDto;
import com.fsun.domain.dto.ErpOrderDto;
import com.fsun.domain.entity.BusAccessLogCondition;
import com.fsun.domain.entity.DocPoHeaderCondition;
import com.fsun.domain.enums.DocPoStatusEnum;
import com.fsun.domain.enums.DocPoTypeEnum;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.ErpOrderHeader;
import com.fsun.exception.bus.OrderException;
import com.fsun.exception.bus.VipUnpaidException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2019年10月6日
 */
@Controller
@RequestMapping("/rest")
public class RestController extends BaseController {
	
	@Autowired
	private BusOrderApi busOrderApi;
	
	@Autowired
	private DocPoApi docPoApi;
	
	@Autowired
	private ErpOrderApi erpOrderApi;
	
	@Autowired
	private BusAccessLogApi busAccessLogApi;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value="/pos/order/checkout", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult checkout(@RequestBody BusOrderDto busOrderDto) {
		
		BusAccessLogCondition condition = new BusAccessLogCondition();
		condition.setCreatedTime(new Date());
		condition.setExt0("POS销售单上传");
		condition.setIp(request.getRemoteAddr());
		condition.setRequestStatus((short)200);
		condition.setRequestType((short)0);		
		condition.setRequestJson(JSON.toJSONString(busOrderDto));
		condition.setExt4("1");
		try {		
			BusOrder header = busOrderDto.getHeader();
			condition.setExt1(header.getCashName());
			condition.setRequestId(header.getOrderId());
			condition.setRequestJson(JSON.toJSONString(busOrderDto));
			String orderId = busOrderApi.checkout(busOrderDto);
			busAccessLogApi.create(condition);
			
			return success(orderId);
		} catch(OrderException e){
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			condition.setErrorMsg(e.getErrorMsg());			
			busAccessLogApi.create(condition);
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
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
	
	@RequestMapping(value="/pos/order/cancel", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult cancel(@RequestBody BusOrderDto busOrderDto) {
		
		BusAccessLogCondition condition = new BusAccessLogCondition();
		condition.setCreatedTime(new Date());
		condition.setExt0("POS销售单取消");
		condition.setIp(request.getRemoteAddr());
		condition.setRequestStatus((short)200);
		condition.setRequestType((short)0);
		condition.setRequestJson(JSON.toJSONString(busOrderDto));
		condition.setExt4("1");
		try {		
			BusOrder header = busOrderDto.getHeader();
			condition.setExt1(header.getCashName());
			condition.setRequestId(header.getOrderId());
			condition.setRequestJson(JSON.toJSONString(busOrderDto));
			String orderId = busOrderApi.cancel(busOrderDto);
			busAccessLogApi.create(condition);
			
			return success(orderId);
		} catch(OrderException e){
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			condition.setErrorMsg(e.getErrorMsg());			
			busAccessLogApi.create(condition);
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		} catch(VipUnpaidException e){
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			condition.setErrorMsg(e.getErrorMsg());			
			busAccessLogApi.create(condition);
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			String errorMessage = e.getMessage().length()>800?e.getMessage().substring(0, 800):e.getMessage();
			condition.setErrorMsg(errorMessage);			
			busAccessLogApi.create(condition);
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}
	
	@RequestMapping(value="/erp/order/callback", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult saveEntity(@RequestBody ErpOrderDto erpOrderDto) {
		
		BusAccessLogCondition condition = new BusAccessLogCondition();
		condition.setCreatedTime(new Date());
		condition.setExt0("ERP出库单回传");
		condition.setIp(request.getRemoteAddr());
		condition.setRequestStatus((short)200);
		condition.setRequestType((short)0);		
		condition.setRequestJson(JSON.toJSONString(erpOrderDto));
		condition.setExt4("0");
		try {		
			ErpOrderHeader header = erpOrderDto.getHeader();
			condition.setExt1("");		
			condition.setRequestId(header.getTrnNum());
			condition.setRequestJson(JSON.toJSONString(erpOrderDto));
			String orderId = erpOrderApi.transferAsnDto(erpOrderDto);
			busAccessLogApi.create(condition);
			
			return success(orderId);
		} catch(OrderException e){
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			condition.setErrorMsg(e.getErrorMsg());			
			busAccessLogApi.create(condition);
			return failure(SCMException.CODE_BIZ, e.getErrorMsg());
		} catch(VipUnpaidException e){
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			condition.setErrorMsg(e.getErrorMsg());			
			busAccessLogApi.create(condition);
			return failure(SCMException.CODE_BIZ, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			
			condition.setRequestStatus((short)-100);
			String errorMessage = e.getMessage().length()>800?e.getMessage().substring(0, 800):e.getMessage();
			condition.setErrorMsg(errorMessage);			
			busAccessLogApi.create(condition);
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}
	
	@RequestMapping(value="/erp/purPo/list", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult findPurPoList(DocPoHeaderCondition condition) {
		try {		
			condition.setPoType(DocPoTypeEnum.PURCHASE_APPLY.getCode());
			condition.setPoStatus(DocPoStatusEnum.UN_AUDIT.getCode());
			String poNos = docPoApi.getPoNosByCondition(condition);
			return success(poNos);
		} catch (Exception e) {
			e.printStackTrace();			
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}
	

}
