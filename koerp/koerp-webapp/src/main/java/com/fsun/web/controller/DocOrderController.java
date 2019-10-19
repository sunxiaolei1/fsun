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

import com.fsun.api.bus.DocOrderApi;
import com.fsun.api.bus.OrderButtonsApi;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocOrderDto;
import com.fsun.domain.entity.DocOrderHeaderCondition;
import com.fsun.domain.entity.DocOrderInitCondition;
import com.fsun.domain.enums.DocOrderStatusEnum;
import com.fsun.domain.enums.DocOrderTypeEnum;
import com.fsun.domain.enums.OrderOperateTypeEnum;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.exception.bus.AfterSaleException;
import com.fsun.exception.bus.DocOrderException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2018年12月15日
 */
@Controller
@RequestMapping("/doc/order")
public class DocOrderController extends BaseController {

	@Autowired
	private DocOrderApi docOrderApi;

	@Autowired
	private OrderButtonsApi orderButtonsApi;
	
	@RequestMapping("/index")
	public String index() {
		return "/docOrder/index";
	}
	
	@RequestMapping("/allot/index")
	public String allotIndex() {
		return "/docOrder/allotIndex";
	}
	
	@RequestMapping("/agent/index")
	public ModelAndView agentIndex() {
		ModelAndView modelAndView = new ModelAndView("/docOrder/agentIndex");		
		modelAndView.addObject("toERP", DocOrderStatusEnum.SO_CKWC.getCode());			
		return modelAndView;
	}
	
	@RequestMapping("/toAddView")
	public ModelAndView toAddView(@RequestParam("orderType") String orderType) {
		String url = this.getUrlByType(orderType, OrderOperateTypeEnum.ADD.getCode());
		ModelAndView modelAndView = new ModelAndView(url);		
		modelAndView.addObject("orderType", orderType);
		//控制编辑单价权限		
		modelAndView.addObject("hasEditPricePower", super.hasEditPricePower());	
		return modelAndView;
	}	
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("orderNo") String orderNo, 
		@RequestParam("orderType") String orderType, @RequestParam("buttontype") String buttontype) {				
		String url = this.getUrlByType(orderType, OrderOperateTypeEnum.EDIT.getCode());
		ModelAndView modelAndView = new ModelAndView(url);
		modelAndView.addObject("orderNo", orderNo);
		modelAndView.addObject("cancelStatus", DocOrderStatusEnum.SO_CKQX.getCode());
		//控制编辑单价权限		
		modelAndView.addObject("hasEditPricePower", super.hasEditPricePower());	
		//单据状态权限控制按钮显示
		modelAndView.addObject("buttontype", buttontype);
		List<String> hiddenbuttons = orderButtonsApi.getHiddenButtonsMap(buttontype, orderNo, null);
		modelAndView.addObject("hiddenbuttons", StringUtils.join(hiddenbuttons, ","));
		return modelAndView;
	}		
	
	@RequestMapping(value="/getInitData", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult getInitData(DocOrderInitCondition condition){
		try {
			BusUserDto currUser = super.getCurrentUser();
			HashMap<String, Object> map = docOrderApi.getInitData(condition, currUser);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(DocOrderHeaderCondition condition) {
		try {
			//BusUserDto currUser = super.getCurrentUser();
			//condition.setFromShopId(currUser.getShopId());
			PageModel pageModel = docOrderApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/findMorePage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findMorePage(DocOrderHeaderCondition condition) {
		try {
			//BusUserDto currUser = super.getCurrentUser();
			//condition.setFromShopId(currUser.getShopId());
			String[] orderTypes = new String[]{
				DocOrderTypeEnum.SHORTAGE_SO.getCode(), 
				DocOrderTypeEnum.PURCHASE_SO.getCode(), 
				DocOrderTypeEnum.LOSE_SO.getCode(),
				//DocOrderTypeEnum.USE_SO.getCode()
			};
			condition.setOrderTypes(orderTypes);
			PageModel pageModel = docOrderApi.findPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findListForPage", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult findListForPage(DocOrderHeaderCondition condition) {
		try {
			PageModel pageModel = docOrderApi.findListForPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(DocOrderHeaderCondition condition) {
		try {
			List<DocOrderHeader> list = docOrderApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}


	@RequestMapping(value="/status/{status}", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult changeStatus(@PathVariable("status") String status, 
		@RequestParam("orderNos") String orderNos, @RequestBody DocOrderHeaderCondition condition) {
		try {
			if (!StringUtils.isEmpty(orderNos)) {
				docOrderApi.changeStatus(orderNos.split(","), status, super.getCurrentUser(), condition);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		}catch(DocOrderException e){
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/signPrint/{orderNo}", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult signPrint(@PathVariable("orderNo") String orderNo) {
		try {
			if (!StringUtils.isEmpty(orderNo)) {		
				docOrderApi.signPrint(orderNo);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		}catch(DocOrderException e){
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/loadEntity/{orderNo}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult loadEntity(@PathVariable("orderNo") String orderNo) {
		try {
			HashMap<String, Object> map = docOrderApi.loadEntity(orderNo);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	@RequestMapping(value="/saveEntity", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult saveEntity(@RequestBody DocOrderDto docOrderDto) {
		try {
			docOrderDto.setCurrentUser(getCurrentUser());			
			String orderNo = docOrderApi.saveEntity(docOrderDto);
			return success(orderNo);
		} catch(DocOrderException e){
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
	@RequestMapping(value="/toRemarkView/{orderNo}", method=RequestMethod.GET)	
	public ModelAndView toRemarkView(@PathVariable("orderNo") String orderNo) {
		ModelAndView modelAndView = new ModelAndView("/docOrder/operate/toRemarkView"); 
		modelAndView.addObject("orderNo", orderNo);
		modelAndView.addObject("memo", docOrderApi.getRemark(orderNo));
		return modelAndView;
	}
	
	/**
	 * 获取备注
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getRemark/{id}", method=RequestMethod.GET)
	@ResponseBody
	public HttpResult getRemark(@PathVariable("id") String id) {
		return success(docOrderApi.getRemark(id));
	}
	
	/**
	 * 追加备注
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/appendRemark", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult appendRemark(@RequestBody DocOrderHeaderCondition condition) {
		try {
			return success(docOrderApi.appendRemark(condition, super.getCurrentUser()));
		}catch (AfterSaleException e) {
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	/******************************          采购退货                          *************************************/
	
	@RequestMapping(value="/purchaseSo/toBaseDetailView/{orderNo}", method = {RequestMethod.GET})
	public ModelAndView toPurchaseSoBaseDetailView(@PathVariable("orderNo") String orderNo){
		ModelAndView modelAndView = new ModelAndView("/docOrder/operate/toPurchaseSoSimpleView"); 		
		modelAndView.addObject("orderNo", orderNo);
		modelAndView.addObject("cancelStatus", DocOrderStatusEnum.SO_CKQX.getCode());	
		return modelAndView;
	}
	
	@RequestMapping(value="/purchaseSo/getInitData", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult getPurchaseSoInitData(DocOrderInitCondition condition){
		try {
			BusUserDto currUser = super.getCurrentUser();
			DocOrderDto docOrderDto = docOrderApi.getPurchaseSoInitData(condition, currUser);
			return success(docOrderDto);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}	
	
	
	/****************************       私有方法            *************************************/
	
	/**
	 * 通过出库类型和操作类型获取对应的查看地址
	 * @param orderType
	 * @param operateType
	 * @return
	 */
	private String getUrlByType(String orderType, String operateType){
		String url = "";
		switch (OrderOperateTypeEnum.getByCode(operateType)) {
			case ADD:	
				switch (DocOrderTypeEnum.getByName(orderType)) {
					case ALLOT_SO:		
						url = "/docOrder/operate/toStockOutAuditView";
						break;		
					case SHORTAGE_SO:	
						url = "/docOrder/operate/toAddShortageSoView";
						break;	
					case PURCHASE_SO:			
						break;
					case LOSE_SO:	
						url = "/docOrder/operate/toAddShortageSoView";
						break;
					case USE_SO:
						url = "/docOrder/operate/toAddUseSoView";
						break;
					case AGENT_SO:
						url = "/docOrder/operate/toAddAgentSoView";
						break;
					default:
						break;
				}
				break;		
			case EDIT:
				switch (DocOrderTypeEnum.getByName(orderType)) {
					case ALLOT_SO:
						url = "/docOrder/operate/toEditStockOutView";
						break;		
					case SHORTAGE_SO:	
						url = "/docOrder/operate/toEditShortageSoView";
						break;	
					case PURCHASE_SO:
						url = "/docOrder/operate/toEditPurchaseSoView";
						break;
					case LOSE_SO:
						url = "/docOrder/operate/toEditShortageSoView";
						break;
					case USE_SO:
						url = "/docOrder/operate/toEditUseSoView";
						break;
					case AGENT_SO:
						url = "/docOrder/operate/toEditAgentSoView";
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
