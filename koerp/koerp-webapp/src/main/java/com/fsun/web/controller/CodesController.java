package com.fsun.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.base.BasCodesApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BasCodesCondition;
import com.fsun.domain.model.BusBasCodes;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.common.BasCodesException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 数据字典模块
 * @author sunxiaolei
 *
 */
@Controller
@RequestMapping("/sys/codes")
public class CodesController extends BaseController {

	@Autowired
	private BasCodesApi codesApi;

	@RequestMapping("/index")
	public String index() {
		return "/basCodes/index";
	}

	@RequestMapping("/addCode")
	public String addCode() {
		return "/basCodes/add";
	}
	
	@RequestMapping(value="/codeTypes", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult findCodeType() {
		try {
			List<String> list = codesApi.findCodeType();
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(BasCodesCondition condition) {
		try {
			PageModel pageModel = codesApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/list", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult list(BasCodesCondition condition) {
		try {
			List<BusBasCodes> list = codesApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/save", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult save(@RequestBody BusBasCodes sysCodes) {
		try {
			SysUser user = getCurrentUser();			
			codesApi.save(sysCodes, user);
			return success();
		} catch(BasCodesException e){
			e.printStackTrace();
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}

	@RequestMapping(value="/deletes", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult deletes(@RequestParam("ids") String ids) {
		try {
			if (!StringUtils.isEmpty(ids)) {
				codesApi.deletes(ids.split(","));
				return success(SCMErrorEnum.SUCCESS);
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
}
