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

import com.fsun.api.bus.DocAsnApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.DocAsnDto;
import com.fsun.domain.entity.DocAsnHeaderCondition;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.DocAsnException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2018年12月15日
 */
@Controller
@RequestMapping("/doc/asn")
public class DocAsnController extends BaseController {

	@Autowired
	private DocAsnApi docAsnApi;

	@RequestMapping("/index")
	public String index() {
		return "/basSku/index";
	}
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(String asnNo) {		
		ModelAndView modelAndView = new ModelAndView("/basSku/detail");
		modelAndView.addObject("asnNo", asnNo);
		return modelAndView;
	}	
	
	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(DocAsnHeaderCondition condition) {
		try {
			PageModel pageModel = docAsnApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findListForPage", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult findListForPage(DocAsnHeaderCondition condition) {
		try {
			PageModel pageModel = docAsnApi.findListForPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(DocAsnHeaderCondition condition) {
		try {
			List<DocAsnHeader> list = docAsnApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/status/{status}", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult changeStatus(@PathVariable("status") String status, 
		@RequestParam("asnNos") String asnNos) {
		try {
			if (!StringUtils.isEmpty(asnNos)) {
				SysUser user = getCurrentUser();	
				docAsnApi.changeStatus(asnNos.split(","), status, user);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		} catch(DocAsnException e){
			e.printStackTrace();
			return failure(SCMException.CODE_SAVE, e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/loadEntity/{asnNo}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult loadEntity(@PathVariable("asnNo") String asnNo) {
		try {
			HashMap<String, Object> map = docAsnApi.loadEntity(asnNo);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/saveEntity", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult saveEntity(@RequestBody DocAsnDto docAsnDto) {
		try {
			SysUser user = getCurrentUser();			
			String asnNo = docAsnApi.saveEntity(docAsnDto, user);
			return success(asnNo);
		} catch(DocAsnException e){
			e.printStackTrace();
			return failure(SCMException.CODE_SAVE, e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}

}
