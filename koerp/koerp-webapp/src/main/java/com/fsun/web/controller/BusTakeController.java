package com.fsun.web.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fsun.api.bus.BusTakeApi;
import com.fsun.api.bus.OrderButtonsApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusTakeDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusTakeCondition;
import com.fsun.domain.model.BusTake;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.BusTakeException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 寄提单管理
 * @author fsun
 * @date 2019年4月3日
 */

@Controller
@RequestMapping("/bus/take")
public class BusTakeController extends BaseController {

	@Autowired
	private BusTakeApi busTakeApi;
	
	@Autowired
	private OrderButtonsApi orderButtonsApi;

	@RequestMapping("/index")
	public String index() {
		return "/busTake/index";
	}
	
	@RequestMapping("/toAddView")
	public ModelAndView toAddView() {
		ModelAndView modelAndView = new ModelAndView("/busTake/toAddView");		
		//控制编辑单价权限		
		modelAndView.addObject("hasEditPricePower", super.hasEditPricePower());	
		return modelAndView;
	}	
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("takeId") String takeId,
		@RequestParam("buttontype") String buttontype) {				
		ModelAndView modelAndView = new ModelAndView("/busTake/toDetailView");	
		modelAndView.addObject("takeId", takeId);
		modelAndView.addObject("cancelStatus", 0);		
		//单据状态权限控制按钮显示
		modelAndView.addObject("buttontype", buttontype);
		List<String> hiddenbuttons = orderButtonsApi.getHiddenButtonsMap(buttontype, takeId, null);
		modelAndView.addObject("hiddenbuttons", StringUtils.join(hiddenbuttons, ","));
		return modelAndView;
	}		
	
	@RequestMapping(value="/getInitData", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult getInitData(BusTakeCondition condition){
		try {
			BusUserDto currUser = super.getCurrentUser();
			HashMap<String, Object> map = busTakeApi.getInitData(condition.getTakeId(), 
				condition.getOrderId(), currUser);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(BusTakeCondition condition) {
		try {
			BusUserDto currUser = super.getCurrentUser();
			condition.setShopId(currUser.getShopId());
			PageModel pageModel = busTakeApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findListForPage", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult findListForPage(BusTakeCondition condition) {
		try {
			PageModel pageModel = busTakeApi.findListForPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(BusTakeCondition condition) {
		try {
			List<BusTake> list = busTakeApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/status/{status}", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult changeStatus(@PathVariable("status") String status, 
		@RequestParam("takeIds") String takeIds, @RequestBody BusTakeCondition condition) {
		try {
			if (!StringUtils.isEmpty(takeIds)) {
				SysUser user = getCurrentUser();	
				busTakeApi.changeStatus(takeIds.split(","), status, user, condition);
				return success(SCMErrorEnum.SUCCESS);
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		} catch(BusTakeException e){
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/loadEntity/{takeId}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult loadEntity(@PathVariable("takeId") String takeId) {
		try {
			HashMap<String, Object> map = busTakeApi.loadEntity(takeId);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/saveEntity", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult saveEntity(@RequestBody BusTakeDto busTakeDto) {
		try {
			busTakeDto.setCurrUser(getCurrentUser());
			String takeId = busTakeApi.saveEntity(busTakeDto);
			return success(takeId);
		} catch(BusTakeException e){
			e.printStackTrace();
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}
	
}
