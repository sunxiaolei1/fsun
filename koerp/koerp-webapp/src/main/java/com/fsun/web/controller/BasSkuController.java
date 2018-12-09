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

import com.fsun.api.bus.BusBasSkuApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusBasSkuCondition;
import com.fsun.domain.model.BusBasSku;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.BasSkuException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

@Controller
@RequestMapping("/bus/basSku")
public class BasSkuController extends BaseController {

	@Autowired
	private BusBasSkuApi busBasSkuApi;

	@RequestMapping("/index")
	public String index() {
		return "/basSku/index";
	}
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(String skuId) {		
		ModelAndView modelAndView = new ModelAndView("/basSku/detail");
		modelAndView.addObject("skuId", skuId);
		return modelAndView;
	}
	
	@RequestMapping("/toChooseSku")
	public String toChooseSku() {
		return "/busCommon/commonChooseSku";
	}
	
	
	
	@RequestMapping(value="/{skuId}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult load(@PathVariable("skuId") String skuId) {
		try {
			BusBasSku busBasSku = busBasSkuApi.load(skuId);
			return success(busBasSku);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
   /**
    * 根据sku码判断是否已存在，不允许相同
    * @param id
    * @param sku
    * @return
    */
    @ResponseBody
    @RequestMapping(value = "/unique", method = {RequestMethod.GET})
    public HttpResult unique(BusBasSkuCondition condition) {  
    	try {
    		boolean isUnique = busBasSkuApi.unique(condition);
    		return success(isUnique);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
    }

	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(BusBasSkuCondition condition) {
		try {
			PageModel pageModel = busBasSkuApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findListForPage", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult findListForPage(BusBasSkuCondition condition) {
		try {
			PageModel pageModel = busBasSkuApi.findListForPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(BusBasSkuCondition condition) {
		try {
			List<BusBasSku> list = busBasSkuApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/save", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult save(@RequestBody BusBasSku busBasSku) {
		try {
			SysUser user = getCurrentUser();			
			String skuId = busBasSkuApi.save(busBasSku, user);
			return success(skuId);
		} catch(BasSkuException e){
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
		@RequestParam("skuIds") String skuIds) {
		try {
			if (!StringUtils.isEmpty(skuIds)) {
				SysUser user = getCurrentUser();	
				busBasSkuApi.changeStatus(skuIds.split(","), enabled, user);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
}
