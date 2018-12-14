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

import com.fsun.api.bus.BusShopApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusShopCondition;
import com.fsun.domain.model.BusShop;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.ShopException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2018年12月9日
 */
@Controller
@RequestMapping("/bus/shop")
public class BusShopController extends BaseController {

	@Autowired
	private BusShopApi shopApi;

	@RequestMapping("/index")
	public String index() {
		return "/busShop/index";
	}

	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(String shopId) {		
		ModelAndView modelAndView = new ModelAndView("/busShop/detail");
		modelAndView.addObject("shopId", shopId);
		return modelAndView;
	}
	
	@RequestMapping("/toSelectList")
	public String toSelectList() {		
		return "/busCommon/commonShopList";
	}
	
	@RequestMapping("/toSelect")
	public String toSelect() {		
		return "/busCommon/commonShopSelect";
	}
	
	
	/**
    * 根据店仓编号判断是否已存在，不允许相同
    * @param id
    * @param shopCode
    * @return
    */
    @ResponseBody
    @RequestMapping(value = "/unique", method = {RequestMethod.GET})
    public HttpResult unique(BusShopCondition condition) {  
    	try {
    		boolean isUnique = shopApi.unique(condition);
    		return success(isUnique);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
    }
	
	@RequestMapping(value="/{shopId}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult load(@PathVariable("shopId") String shopId) {
		try {
			BusShop busShop = shopApi.load(shopId);
			return success(busShop);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(BusShopCondition condition) {
		try {
			PageModel pageModel = shopApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(BusShopCondition condition) {
		try {
			List<BusShop> list = shopApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/save", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult save(@RequestBody BusShop busShop) {
		try {
			SysUser user = getCurrentUser();			
			shopApi.save(busShop, user);
			return success();
		} catch(ShopException e){
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
		@RequestParam("shopIds") String shopIds) {
		try {
			if (!StringUtils.isEmpty(shopIds)) {
				SysUser user = getCurrentUser();	
				shopApi.changeStatus(shopIds.split(","), enabled, user);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

}