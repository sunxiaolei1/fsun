package com.fsun.web.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fsun.api.bus.BusReserveApi;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusReserveCondition;
import com.fsun.domain.enums.CustomerTypeEnum;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 备用金管理
 * @author fsun
 * @date 2019年4月15日
 */
@Controller
@RequestMapping("/bus/reserve")
public class BusReserveController extends BaseController {
	
	@Autowired
	private BusReserveApi busReserveApi;

	@RequestMapping("/index")
	public String index() {
		return "/busReserve/index";
	}	
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("customerCode") String customerCode) {		
		ModelAndView modelAndView = new ModelAndView("/busReserve/operate/toDetailView");
		modelAndView.addObject("customerCode", customerCode);
		return modelAndView;
	}
	
	@RequestMapping(value="/getInitData", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult initData(@RequestParam("customerCode") String customerCode){
		try {
			BusUserDto currUser = super.getCurrentUser();
			HashMap<String, Object> map = busReserveApi.getInitData(customerCode, currUser);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(BusReserveCondition condition) {
		try {
			condition.setCustomerType(CustomerTypeEnum.JXS.getCode());
			PageModel pageModel = busReserveApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busReserveApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
}
