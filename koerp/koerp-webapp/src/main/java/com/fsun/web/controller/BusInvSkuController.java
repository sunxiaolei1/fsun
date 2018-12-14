package com.fsun.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fsun.api.bus.BusInvSkuApi;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.InvSkuDto;
import com.fsun.domain.entity.BusInvSkuCondition;
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
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(String sku) {		
		ModelAndView modelAndView = new ModelAndView("/busInvSku/detail");
		modelAndView.addObject("sku", sku);
		return modelAndView;
	}
	

	@RequestMapping(value="/{sku}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult loadEntity(@PathVariable("sku") String sku) {
		try {
			InvSkuDto invSkuDto = busInvSkuApi.loadEntity(sku);
			return success(invSkuDto);
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
			return success(pageModel);
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
