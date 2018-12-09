package com.fsun.web.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fsun.api.bus.BusRulPriceApi;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.dto.RulPriceDto;
import com.fsun.domain.dto.RulPriceTreeDto;
import com.fsun.domain.entity.BusRulPriceCondition;
import com.fsun.domain.model.BusRulPrice;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2018年12月9日
 */
@Controller
@RequestMapping("/bus/rule/price")
public class RulPriceController extends BaseController {

	@Autowired
	private BusRulPriceApi rulPriceApi;

	@RequestMapping("/index")
	public String index() {
		return "/busRulPrice/index";
	}

	@RequestMapping("/toDetailView/{rulId}")
	public ModelAndView toDetailView(@PathVariable("rulId") String rulId) {		
		ModelAndView modelAndView = new ModelAndView("/busRulPrice/detail");
		modelAndView.addObject("rulId", rulId);
		return modelAndView;
	}
	
	@RequestMapping(value="/loadEntity/{rulId}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult load(@PathVariable("rulId") String rulId) {
		try {
			HashMap<String, Object> dto = rulPriceApi.loadEntity(rulId);
			return success(dto);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/**
	 * 获取价格策略树(以所有策略为根节点)
	 * @param condition
	 * @return
	 */
	@RequestMapping("/getRulTree")
	@ResponseBody
	public HttpResult getRulTree(BusRulPriceCondition condition) {
		try {
			List<RulPriceTreeDto> list = rulPriceApi.getRulTree(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(BusRulPriceCondition condition) {
		try {
			List<BusRulPrice> list = rulPriceApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

}