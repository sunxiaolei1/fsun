package com.fsun.web.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fsun.api.bus.BusInvSkuApi;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusInvSkuCondition;
import com.fsun.domain.entity.BusInvSkuDetailsCondition;
import com.fsun.domain.model.BusInvSku;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2018年12月13日
 */
@Controller
@RequestMapping("/bus/invSku")
public class BusInvSkuController extends BaseController {

	@Autowired
	private BusInvSkuApi busInvSkuApi;

	@RequestMapping("/index")
	public String index() {
		return "/busInvSku/index";
	}
	
	@RequestMapping("/toChooseSku")
	public String toChooseSku() {
		return "/busCommon/commonChooseInvSku";
	}
	
	@RequestMapping("/toChooseEditSku")
	public ModelAndView toChooseEditSku() {
		ModelAndView modelAndView = new ModelAndView("/busCommon/commonChooseEditInvSku");
		//控制编辑单价权限		
		modelAndView.addObject("hasEditPricePower", super.hasEditPricePower());	
		return modelAndView;
	}	
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("sku") String sku,
		@RequestParam("shopId") String shopId) {		
		ModelAndView modelAndView = new ModelAndView("/busInvSku/operate/detail");
		modelAndView.addObject("sku", sku);
		modelAndView.addObject("shopId", shopId);
		return modelAndView;
	}
	

	/**
	 * 通过sku和门店id获取商品库存明细
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/findDetailsPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findDetailsPage(BusInvSkuDetailsCondition condition) {
		try {
			PageModel pageModel = busInvSkuApi.findDetailsPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busInvSkuApi.findDetailsFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(BusInvSkuCondition condition) {
		try {
			PageModel pageModel = busInvSkuApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busInvSkuApi.findFooter(condition);
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
	public HttpResult findListForPage(BusInvSkuCondition condition) {
		try {
			PageModel pageModel = busInvSkuApi.findListForPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(BusInvSkuCondition condition) {
		try {
			List<BusInvSku> list = busInvSkuApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	
	
}
