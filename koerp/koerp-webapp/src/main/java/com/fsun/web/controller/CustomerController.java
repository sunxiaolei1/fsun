package com.fsun.web.controller;

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

import com.fsun.api.bus.BusCustomerApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusCustomerCondition;
import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.CustomerException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 客户管理模块
 * @author sunxiaolei
 *
 */
@Controller
@RequestMapping("/bus/customer")
public class CustomerController extends BaseController {

	@Autowired
	private BusCustomerApi customerApi;

	@RequestMapping("/index")
	public String index() {
		return "/busCustomer/index";
	}

	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(String id) {		
		ModelAndView modelAndView = new ModelAndView("/busCustomer/detail");
		modelAndView.addObject("id", id);
		return modelAndView;
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult load(@PathVariable("id") String id) {
		try {
			BusCustomer busCustomer = customerApi.load(id);
			return success(busCustomer);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(BusCustomerCondition condition) {
		try {
			PageModel pageModel = customerApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(BusCustomerCondition condition) {
		try {
			List<BusCustomer> list = customerApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/save", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult save(@RequestBody BusCustomer busCustomer) {
		try {
			SysUser user = getCurrentUser();			
			customerApi.save(busCustomer, user);
			return success();
		} catch(CustomerException e){
			e.printStackTrace();
			return failure(SCMException.CODE_SAVE, e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}

	@RequestMapping(value="/status/{enabled}", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult changeStatus(@PathVariable("enabled") Boolean enabled, 
		@RequestParam("ids") String ids) {
		try {
			if (!StringUtils.isEmpty(ids)) {
				customerApi.changeStatus(ids.split(","), enabled);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

}
