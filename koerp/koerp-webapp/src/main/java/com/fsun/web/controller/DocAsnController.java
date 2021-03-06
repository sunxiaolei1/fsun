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
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocAsnDto;
import com.fsun.domain.entity.DocAsnHeaderCondition;
import com.fsun.domain.enums.DocAsnStatusEnum;
import com.fsun.domain.enums.DocAsnTypeEnum;
import com.fsun.domain.enums.OrderOperateTypeEnum;
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
		return "/docAsn/index";
	}
	
	@RequestMapping("/toAddView")
	public ModelAndView toAddView(@RequestParam("asnType") String asnType) {
		String url = this.getUrlByType(asnType, OrderOperateTypeEnum.ADD.getCode());
		ModelAndView modelAndView = new ModelAndView(url);		
		modelAndView.addObject("asnType", asnType);		
		return modelAndView;
	}	
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("asnNo") String asnNo, 
			@RequestParam("asnType") String asnType) {		
		
		String url = this.getUrlByType(asnType, OrderOperateTypeEnum.EDIT.getCode());
		ModelAndView modelAndView = new ModelAndView(url);
		modelAndView.addObject("asnNo", asnNo);
		modelAndView.addObject("asnType", asnType);
		modelAndView.addObject("cancelStatus", DocAsnStatusEnum.SI_SHQX.getCode());
		return modelAndView;
	}		
	
	@RequestMapping(value="/getInitData", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult getInitData(@RequestParam("asnNo") String asnNo, 
			@RequestParam("asnType") String asnType){
		try {
			BusUserDto currUser = super.getCurrentUser();
			HashMap<String, Object> map = docAsnApi.getInitData(asnNo, asnType, currUser);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
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
		@RequestParam("asnNos") String asnNos, @RequestBody DocAsnHeaderCondition condition) {
		try {
			if (!StringUtils.isEmpty(asnNos)) {
				SysUser user = getCurrentUser();	
				docAsnApi.changeStatus(asnNos.split(","), status, user, condition);
				return success(SCMErrorEnum.SUCCESS);
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		} catch(DocAsnException e){
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
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
			docAsnDto.setCurrentUser(getCurrentUser());
			String asnNo = docAsnApi.saveEntity(docAsnDto);
			return success(asnNo);
		} catch(DocAsnException e){
			e.printStackTrace();
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}

	
	
	
	
	
	/****************************       私有方法            *************************************/
	
	/**
	 * 通过入库类型和操作类型获取对应的查看地址
	 * @param asnType
	 * @param operateType
	 * @return
	 */
	private String getUrlByType(String asnType, String operateType){
		String url = "";
		switch (OrderOperateTypeEnum.getByCode(operateType)) {
			case ADD:	
				switch (DocAsnTypeEnum.getByName(asnType)) {
					case ALLOT_SI:				
						break;		
					case OVER_SI:	
						url = "/docAsn/operate/toAddOverSIView";
						break;	
					case PURCHASE_SI:			
						break;
					case BACK_SI:			
						break;
					case SUNDRY_SI:			
						break;
					default:
						break;
				}
				break;		
			case EDIT:
				switch (DocAsnTypeEnum.getByName(asnType)) {
					case ALLOT_SI:				
						break;		
					case OVER_SI:	
						url = "/docAsn/operate/toEditOverSIView";
						break;	
					case PURCHASE_SI:			
						break;
					case BACK_SI:			
						break;
					case SUNDRY_SI:			
						break;
					default:
						break;
				}
				break;	
			case VIEW:			
				break;
			default:
				break;
		}
		return url;
	}
	
}
