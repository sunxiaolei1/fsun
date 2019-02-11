package com.fsun.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.fsun.api.bus.BusAccessLogApi;
import com.fsun.api.bus.BusOrderApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusOrderDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusAccessLogCondition;
import com.fsun.domain.entity.BusOrderCondition;
import com.fsun.domain.enums.OrderOperateTypeEnum;
import com.fsun.domain.enums.OrderStatusEnum;
import com.fsun.domain.enums.OrderTypeEnum;
import com.fsun.domain.enums.PayModeEnum;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.OrderException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2018年12月15日
 */
@Controller
@RequestMapping("/bus/order")
public class BusOrderController extends BaseController {

	@Autowired
	private BusOrderApi busOrderApi;
	
	@Autowired
	private BusAccessLogApi busAccessLogApi;
	
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/index")
	public String index() {
		return "/busOrder/index";
	}
	
	@RequestMapping("/toSetGiftsView")
	public String toSetGiftsView() {
		return "/busOrder/operate/toSetGiftsView";
	}
	
	@RequestMapping("/toPreviewOrder")
	public String toPreviewOrder() {
		return "/busOrder/operate/toPreviewOrder";
	}
	
	@RequestMapping("/toPayModeView")
	public ModelAndView toPayModeView(@RequestParam("payMode") Short payMode) {
		String url = this.getUrlByPayMode(payMode);
		ModelAndView modelAndView = new ModelAndView(url);		
		modelAndView.addObject("payMode", payMode);		
		return modelAndView;
	}

	@RequestMapping("/toAddView")
	public ModelAndView toAddView(@RequestParam("orderType") Short orderType) {
		String url = this.getUrlByType(orderType, OrderOperateTypeEnum.ADD.getCode());
		ModelAndView modelAndView = new ModelAndView(url);		
		modelAndView.addObject("orderType", orderType);		
		return modelAndView;
	}	
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("orderId") String orderId, 
			@RequestParam("orderType") Short orderType) {				
		String url = this.getUrlByType(orderType, OrderOperateTypeEnum.EDIT.getCode());
		ModelAndView modelAndView = new ModelAndView(url);
		modelAndView.addObject("orderId", orderId);
		modelAndView.addObject("cancelStatus", OrderStatusEnum.CANCEL.getCode());	
		return modelAndView;
	}		
	
	@RequestMapping(value="/getInitData", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult getInitData(@RequestParam("orderId") String orderId, 
			@RequestParam("orderType") String orderType){
		try {
			BusUserDto currUser = super.getCurrentUser();
			HashMap<String, Object> map = busOrderApi.getInitData(orderId, orderType, currUser);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(BusOrderCondition condition) {
		try {
			PageModel pageModel = busOrderApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busOrderApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findListForPage", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult findListForPage(BusOrderCondition condition) {
		try {
			PageModel pageModel = busOrderApi.findListForPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(BusOrderCondition condition) {
		try {
			List<BusOrder> list = busOrderApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}


	@RequestMapping(value="/status/{status}", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult changeStatus(@PathVariable("status") String status, 
		@RequestParam("orderIds") String orderIds, @RequestBody BusOrderCondition condition) {
		try {
			if (!StringUtils.isEmpty(orderIds)) {
				SysUser user = getCurrentUser();	
				busOrderApi.changeStatus(orderIds.split(","), status, user, condition);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		}catch(OrderException e){
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/signPrint/{orderId}", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult signPrint(@PathVariable("orderId") String orderId) {
		try {
			if (!StringUtils.isEmpty(orderId)) {		
				busOrderApi.signPrint(orderId);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		}catch(OrderException e){
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/loadEntity/{orderId}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult loadEntity(@PathVariable("orderId") String orderId) {
		try {
			HashMap<String, Object> map = busOrderApi.loadEntity(orderId);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/saveEntity", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult saveEntity(@RequestBody BusOrderDto busOrderDto) {
		
		BusAccessLogCondition condition = new BusAccessLogCondition();
		condition.setCreatedTime(new Date());
		condition.setExt0("销售订单");
		condition.setIp(request.getRemoteAddr());
		condition.setRequestStatus((short)200);
		condition.setRequestType((short)0);
		condition.setRequestId(busOrderDto.getOrderId());
		condition.setRequestJson(JSON.toJSONString(busOrderDto));
		condition.setExt4("1");
		try {	
			BusUserDto currentUser = super.getCurrentUser();
			busOrderDto.setCurrentUser(currentUser);
			
			condition.setExt1(currentUser.getUsername());			
			condition.setRequestJson(JSON.toJSONString(busOrderDto));
			String orderId = busOrderApi.saveEntity(busOrderDto);
			busAccessLogApi.create(condition);
			
			return success(orderId);
		} catch(OrderException e){
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
	
/****************************       私有方法            *************************************/
	
	/**
	 * 通过单据类型和操作类型获取对应的查看地址
	 * @param orderType
	 * @param operateType
	 * @return
	 */
	private String getUrlByType(Short orderType, String operateType){
		String url = "";
		switch (OrderOperateTypeEnum.getByCode(operateType)) {
			case ADD:	
				switch (OrderTypeEnum.getByValue(orderType)) {					
					case ORDER:	
						url = "/busOrder/operate/toAddOrderView";
						break;						
					case TAKE_ORDER:	
						url = "/busOrder/operate/toAddTakeOrderView";
						break;					
					default:
						break;
				}
				break;		
			case EDIT:
				switch (OrderTypeEnum.getByValue(orderType)) {
					case ORDER:	
						url = "/busOrder/operate/toEditOrderView";
						break;						
					case TAKE_ORDER:	
						url = "/busOrder/operate/toEditTakeOrderView";
						break;	
					default:
						break;
				}
				break;	
			case VIEW:			
				break;
			default:
				break;
		}
		return url;
	}
	
	/**
	 * 根据不同的支付方式获取对应的支付页面
	 * @param payMode
	 * @return
	 */
	private String getUrlByPayMode(Short payMode) {
		String url = "";
		switch (PayModeEnum.getByValue(payMode)) {					
			case UNOIN_PAY:	
				url = "/busOrder/operate/toPayModeView";
				break;						
			case CASH_PAY:	
				url = "/busOrder/operate/toCashPayView";
				break;		
			case ALI_PAY:	
				url = "/busOrder/operate/toPayModeView";
				break;		
			case WECHAT_PAY:	
				url = "/busOrder/operate/toPayModeView";
				break;		
			case UNPAY:	
				url = "/busOrder/operate/toUnPayView";
				break;		
			case VIP_PAY:	
				url = "/busOrder/operate/toVipPayView";
				break;	
			case DISCOUNT:	
				url = "/busOrder/operate/toPayModeView";
				break;				
			default:
				break;
		}
		return url;
	}
	
}