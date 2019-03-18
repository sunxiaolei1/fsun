package com.fsun.web.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fsun.api.bus.BusAfterSaleApi;
import com.fsun.api.bus.OrderButtonsApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusRefundCondition;
import com.fsun.domain.enums.RefundStatusEnum;
import com.fsun.domain.enums.RefundTypeEnum;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 售后管理模块(只做查询)
 * @author fsun
 * @date 2019年2月12日
 */
@Controller
@RequestMapping("/bus/aftersale")
public class BusAfterSaleController extends BaseController {
	
	@Autowired
	private BusAfterSaleApi busAfterSaleApi;
	
	@Autowired
	private OrderButtonsApi orderButtonsApi;
	
	/******************************************        refund start        *****************************************/
	
	/**
	 * 跳转至退货单界面
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/refund/index", method=RequestMethod.GET)
	public String refundIndex(ModelMap modelMap) {
		return "/busAfterSale/refund/index";
	}
	
	/**
	 * 跳转到基本退货详情页面
	 * @param sysorderid
	 * @return
	 */
	@RequestMapping(value="/refund/toBaseDetailView/{refundId}", method=RequestMethod.GET)
	public ModelAndView toRefundDetail(@PathVariable("refundId") String refundId) {
		ModelAndView modelAndView = new ModelAndView("/busAfterSale/refund/toSimpleDetailView"); 		
		modelAndView.addObject("refundId", refundId);
		modelAndView.addObject("cancelStatus", RefundStatusEnum.CANCEL.getValue());	
		return modelAndView;
	}
	
	/**
	 * 跳转到退货详情页面
	 * @param sysorderid
	 * @return
	 */
	@RequestMapping(value="/refund/toDetailView/{refundId}", method=RequestMethod.GET)
	public ModelAndView toRefundDetail(@PathVariable("refundId") String refundId, 
		@RequestParam("buttontype") String buttontype) {
		ModelAndView modelAndView = new ModelAndView("/busAfterSale/refund/toDetailView"); 
		modelAndView.addObject("refundId", refundId);
		modelAndView.addObject("buttontype", buttontype);
		modelAndView.addObject("cancelStatus", RefundStatusEnum.CANCEL.getValue());	
		List<String> hiddenbuttons = orderButtonsApi.getHiddenButtonsMap(buttontype, null, refundId);
		modelAndView.addObject("hiddenbuttons", StringUtils.join(hiddenbuttons, ","));
		return modelAndView;
	}
	
	/**
	 * 跳转到修改退货单备注页面
	 * @param refundorderid
	 * @return
	 */	
	@RequestMapping(value="/refund/toRefundRemarkView/{refundId}", method=RequestMethod.GET)	
	public ModelAndView toRefundRemarkView(@PathVariable("refundId") String refundId) {
		ModelAndView modelAndView = new ModelAndView("/busAfterSale/operate/toRefundRemarkView"); 
		modelAndView.addObject("refundId", refundId);
		modelAndView.addObject("memo", busAfterSaleApi.getRefundRemark(refundId));
		return modelAndView;
	}
	
	/**
	 * 获取退货单备注
	 * @param refundorderid
	 * @return
	 */
	@RequestMapping(value="/refund/getRefundRemark/{refundId}", method=RequestMethod.GET)
	@ResponseBody
	public HttpResult getRefundRemark(@PathVariable("refundId") String refundId) {
		String memo = busAfterSaleApi.getRefundRemark(refundId);
		return success(memo);
	}
	
	/**
	 * 退货单列表
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/refund/findPage", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult refundFindPage(BusRefundCondition condition) {
		try {
			BusUserDto currUser = super.getCurrentUser();
			condition.setShopId(currUser.getShopId());	
			condition.setRefundType(RefundTypeEnum.RETURN_ORDER.getValue());
			PageModel pageModel = busAfterSaleApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busAfterSaleApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();			
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/refund/getInitData", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult getRefundInitData(@RequestParam("orderId") String orderId, 
			@RequestParam("refundId") String refundId){
		try {
			BusUserDto currUser = super.getCurrentUser();
			HashMap<String, Object> map = busAfterSaleApi.getInitData(refundId, orderId, 
				RefundTypeEnum.RETURN_ORDER.getValue(), currUser);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/******************************************        refund end     *****************************************/
	

	
	/******************************************        barter start     *****************************************/
	
	/**
	 * 跳转至换货单界面
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/barter/index", method=RequestMethod.GET)
	public String barterIndex(ModelMap modelMap) {
		return "/busAfterSale/barter/index";
	}

	/**
	 * 跳转到换货单详情页面	
	 * @param refundId 换退单号
	 * @param buttontype 按钮类型
	 * @param barterOrderId 换发单号
	 * @return
	 */
	@RequestMapping(value="/barter/toDetailView/{refundId}", method=RequestMethod.GET)
	public ModelAndView toBarterDetailView(
		@PathVariable("refundId") String refundId, 
			@RequestParam("buttontype") String buttontype, 
				@RequestParam("barterOrderId") String barterOrderId) {
		ModelAndView modelAndView = new ModelAndView("/busAfterSale/barter/toDetailView"); 
		modelAndView.addObject("refundId", refundId);
		modelAndView.addObject("barterOrderId", barterOrderId);	
		modelAndView.addObject("cancelStatus", RefundStatusEnum.CANCEL.getValue());	
		modelAndView.addObject("buttontype", buttontype);			
		List<String> hiddenbuttons  = orderButtonsApi.getHiddenButtonsMap(buttontype, barterOrderId, refundId);
		modelAndView.addObject("hiddenbuttons", StringUtils.join(hiddenbuttons, ","));
		return modelAndView;
	}
	
	/**
	 * 换货单列表
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/barter/findPage", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult barterFindPage(BusRefundCondition condition) {
		try {
			BusUserDto currUser = super.getCurrentUser();
			condition.setShopId(currUser.getShopId());
			condition.setRefundType(RefundTypeEnum.EXCHANGE_ORDER.getValue());
			PageModel pageModel = busAfterSaleApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/barter/getInitData", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult getBarterInitData(@RequestParam("orderId") String orderId, 
			@RequestParam("refundId") String refundId){
		try {
			BusUserDto currUser = super.getCurrentUser();
			HashMap<String, Object> map = busAfterSaleApi.getInitData(refundId, orderId, 
				RefundTypeEnum.EXCHANGE_ORDER.getValue(), currUser);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/******************************************        barter end     *****************************************/
	
	/***********************************    共用方法       ***************************************/
	
	
	@RequestMapping("/index")
	public ModelAndView index() {				
		ModelAndView modelAndView = new ModelAndView("/busAfterSale/index");
		modelAndView.addObject("cancelStatus", RefundStatusEnum.CANCEL.getValue());			
		return modelAndView;
	}
	
	/**
	 * 退货单列表
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/findPage", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult findPage(BusRefundCondition condition) {
		try {
			BusUserDto currUser = super.getCurrentUser();
			condition.setShopId(currUser.getShopId());	
			PageModel pageModel = busAfterSaleApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busAfterSaleApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();			
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
}
