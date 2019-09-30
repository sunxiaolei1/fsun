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

import com.fsun.api.bus.DocPoApi;
import com.fsun.api.bus.OrderButtonsApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocPoDto;
import com.fsun.domain.entity.DocPoHeaderCondition;
import com.fsun.domain.enums.DocPoStatusEnum;
import com.fsun.domain.enums.DocPoTypeEnum;
import com.fsun.domain.enums.OrderOperateTypeEnum;
import com.fsun.domain.model.DocPoDetails;
import com.fsun.domain.model.DocPoHeader;
import com.fsun.exception.bus.AfterSaleException;
import com.fsun.exception.bus.DocPoException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 申请单管理
 * @author fsun
 * @date 2019年3月16日
 */
@Controller
@RequestMapping("/doc/po")
public class DocPoController extends BaseController {

	@Autowired
	private DocPoApi docPoApi;
	
	@Autowired
	private OrderButtonsApi orderButtonsApi;
	
	@RequestMapping("/index")
	public String index() {
		return "/docPo/index";
	}
	
	@RequestMapping("/toAddView")
	public ModelAndView toAddView(@RequestParam("poType") String poType) {
		String url = this.getUrlByType(poType, OrderOperateTypeEnum.ADD.getCode());
		ModelAndView modelAndView = new ModelAndView(url);		
		modelAndView.addObject("poType", poType);	
		//控制编辑单价权限		
		modelAndView.addObject("hasEditPricePower", super.hasEditPricePower());	
		return modelAndView;
	}	
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("poNo") String poNo, 
		@RequestParam("poType") String poType, @RequestParam("buttontype") String buttontype) {				
		String url = this.getUrlByType(poType, OrderOperateTypeEnum.EDIT.getCode());
		ModelAndView modelAndView = new ModelAndView(url);
		modelAndView.addObject("poNo", poNo);
		modelAndView.addObject("cancelStatus", DocPoStatusEnum.CANCEL.getCode());
		//控制编辑单价权限		
		modelAndView.addObject("hasEditPricePower", super.hasEditPricePower());	
		//单据状态权限控制按钮显示
		modelAndView.addObject("buttontype", buttontype);
		List<String> hiddenbuttons = orderButtonsApi.getHiddenButtonsMap(buttontype, poNo, null);
		modelAndView.addObject("hiddenbuttons", StringUtils.join(hiddenbuttons, ","));
		return modelAndView;
	}	
	
	/**
	 * 跳转至调拨申请获取页面
	 * @param poNo
	 * @param poType
	 * @param buttontype
	 * @return
	 */
	@RequestMapping("/toAllotApplyView")
	public ModelAndView toAllotApplyView() {				
		ModelAndView modelAndView = new ModelAndView("/docPo/operate/toAllotApplyView");
		BusUserDto currUser = super.getCurrentUser();
		modelAndView.addObject("currShopId", currUser.getShopId());
		modelAndView.addObject("rejectStatus", DocPoStatusEnum.AUDIT_REJECT.getCode());		
		return modelAndView;
	}
	
	@RequestMapping(value="/getInitData", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult getInitData(@RequestParam("poNo") String poNo, 
			@RequestParam("poType") String poType){
		try {
			BusUserDto currUser = super.getCurrentUser();
			HashMap<String, Object> map = docPoApi.getInitData(poNo, poType, currUser);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(DocPoHeaderCondition condition) {
		try {
			BusUserDto currUser = super.getCurrentUser();
			condition.setToShopId(currUser.getShopId());
			PageModel pageModel = docPoApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findListForPage", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult findListForPage(DocPoHeaderCondition condition) {
		try {
			PageModel pageModel = docPoApi.findListForPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(DocPoHeaderCondition condition) {
		try {
			List<DocPoHeader> list = docPoApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	/**
	 * 跳转至调拨申请明细页面
	 * @param poNo
	 * @param poType
	 * @param buttontype
	 * @return
	 */
	@RequestMapping("/toAllotApplyDetailView")
	public ModelAndView toAllotApplyDetailView() {				
		ModelAndView modelAndView = new ModelAndView("/docPo/operate/toAllotApplyDetailView");
		return modelAndView;
	}
	
	@RequestMapping(value="/details/{poNo}", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult details(@PathVariable("poNo") String poNo) {
		try {
			List<DocPoDetails> list = docPoApi.details(poNo);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	


	@RequestMapping(value="/status/{status}", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult changeStatus(@PathVariable("status") String status, 
		@RequestParam("poNos") String poNos, @RequestBody DocPoHeaderCondition condition) {
		try {
			if (!StringUtils.isEmpty(poNos)) {
				docPoApi.changeStatus(poNos.split(","), status, super.getCurrentUser(), condition);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		}catch(DocPoException e){
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/loadEntity/{poNo}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult loadEntity(@PathVariable("poNo") String poNo) {
		try {
			HashMap<String, Object> map = docPoApi.loadEntity(poNo);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/saveEntity", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult saveEntity(@RequestBody DocPoDto docPoDto) {
		try {
			docPoDto.setCurrentUser(getCurrentUser());			
			String poNo = docPoApi.saveEntity(docPoDto);
			return success(poNo);
		} catch(DocPoException e){
			e.printStackTrace();
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}

	@RequestMapping(value="/updateEntity", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult updateEntity(@RequestBody DocPoDto docPoDto) {
		try {
			docPoDto.setCurrentUser(getCurrentUser());			
			String poNo = docPoApi.updateEntity(docPoDto);
			return success(poNo);
		} catch(DocPoException e){
			e.printStackTrace();
			return failure(SCMException.CODE_SAVE, e.getErrorMsg());
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}		
	}
	
	
/***************************************    修改备注功能        **************************************/
	
	/**
	 * 跳转到修改备注页面
	 * @param takeId
	 * @return
	 */	
	@RequestMapping(value="/toRemarkView/{poNo}", method=RequestMethod.GET)	
	public ModelAndView toRemarkView(@PathVariable("poNo") String poNo) {
		ModelAndView modelAndView = new ModelAndView("/docPo/operate/toRemarkView"); 
		modelAndView.addObject("poNo", poNo);
		modelAndView.addObject("memo", docPoApi.getRemark(poNo));
		return modelAndView;
	}
	
	/**
	 * 获取备注
	 * @param poNo
	 * @return
	 */
	@RequestMapping(value="/getRemark/{poNo}", method=RequestMethod.GET)
	@ResponseBody
	public HttpResult getRemark(@PathVariable("poNo") String poNo) {
		return success(docPoApi.getRemark(poNo));
	}
	
	/**
	 * 追加备注
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/appendRemark", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult appendRemark(@RequestBody DocPoHeaderCondition condition) {
		try {
			return success(docPoApi.appendRemark(condition, super.getCurrentUser()));
		}catch (AfterSaleException e) {
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/****************************       私有方法            *************************************/
	
	/**
	 * 通过申请单类型和操作类型获取对应的查看地址
	 * @param orderType
	 * @param operateType
	 * @return
	 */
	private String getUrlByType(String poType, String operateType){
		String url = "";
		switch (OrderOperateTypeEnum.getByCode(operateType)) {
			case ADD:	
				switch (DocPoTypeEnum.getByName(poType)) {
					case PURCHASE_APPLY:
						url = "/docPo/operate/toAddPurchaseView";
						break;		
					case ALLOT_APPLY:	
						url = "/docPo/operate/toAddAllotView";
						break;	
					default:
						break;
				}
				break;		
			case EDIT:
				switch (DocPoTypeEnum.getByName(poType)) {
					case PURCHASE_APPLY:	
						url = "/docPo/operate/toEditPurchaseView";
						break;		
					case ALLOT_APPLY:	
						url = "/docPo/operate/toEditAllotView";
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
