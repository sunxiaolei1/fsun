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
import com.fsun.api.bus.OrderButtonsApi;
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
import com.fsun.exception.bus.AfterSaleException;
import com.fsun.exception.bus.DocAsnException;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2018年12月15日
 */
@Controller
@RequestMapping("/bus/shopping")
public class BusShoppingController extends BaseController {

	@Autowired
	private DocAsnApi docAsnApi;
	
	@Autowired
	private OrderButtonsApi orderButtonsApi;

	@RequestMapping("/index")
	public String index() {
		return "/busShopping/index";
	}
	
	@RequestMapping("/toShowSignView")
	public String toShowSignView() {
		return "/busShopping/operate/showSignView";
	}

	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("asnNo") String asnNo, 
		@RequestParam("asnType") String asnType, @RequestParam("buttontype") String buttontype) {		

		ModelAndView modelAndView = new ModelAndView("/busShopping/operate/toEditPurchaseSIView");
		modelAndView.addObject("asnNo", asnNo);
		modelAndView.addObject("asnType", asnType);
		modelAndView.addObject("cancelStatus", DocAsnStatusEnum.SI_SHQX.getCode());	
		//控制编辑单价权限		
		modelAndView.addObject("hasEditPricePower", super.hasEditPricePower());	
		//单据状态权限控制按钮显示
		modelAndView.addObject("buttontype", buttontype);
		List<String> hiddenbuttons = orderButtonsApi.getHiddenButtonsMap(buttontype, asnNo, null);
		modelAndView.addObject("hiddenbuttons", StringUtils.join(hiddenbuttons, ","));
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
			BusUserDto currUser = super.getCurrentUser();
			condition.setToShopId(currUser.getShopId());
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
				docAsnApi.changeStatus(asnNos.split(","), status, super.getCurrentUser(), condition);
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

	
	@RequestMapping("/refund/toAddView/{asnNo}")
	public ModelAndView toRefundAddView(@PathVariable("asnNo") String asnNo,
			@RequestParam("asnDetailIds") String asnDetailIds) {
		String url = "/docOrder/operate/toAddPurchaseSoView";
		ModelAndView modelAndView = new ModelAndView(url);		
		modelAndView.addObject("asnNo", asnNo);	
		modelAndView.addObject("asnDetailIds", asnDetailIds);	
		//控制编辑单价权限		
		modelAndView.addObject("hasEditPricePower", super.hasEditPricePower());	
		return modelAndView;
	}
	
	@RequestMapping("/allotRefund/toBaseDetailView/{asnNo}")
	public ModelAndView toRefundAddView(@PathVariable("asnNo") String asnNo) {
		String url = "/docAsn/operate/toAllotRefundSimpleView";
		ModelAndView modelAndView = new ModelAndView(url);		
		modelAndView.addObject("asnNo", asnNo);		
		//控制编辑单价权限		
		modelAndView.addObject("hasEditPricePower", super.hasEditPricePower());	
		return modelAndView;
	}
	
	
	/***************************************    修改备注功能        **************************************/
	
	/**
	 * 跳转到修改备注页面
	 * @param takeId
	 * @return
	 */	
	@RequestMapping(value="/toRemarkView/{asnNo}", method=RequestMethod.GET)	
	public ModelAndView toRemarkView(@PathVariable("asnNo") String asnNo) {
		ModelAndView modelAndView = new ModelAndView("/docAsn/operate/toRemarkView"); 
		modelAndView.addObject("asnNo", asnNo);
		modelAndView.addObject("memo", docAsnApi.getRemark(asnNo));
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
		return success(docAsnApi.getRemark(id));
	}
	
	/**
	 * 追加备注
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/appendRemark", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult appendRemark(@RequestBody DocAsnHeaderCondition condition) {
		try {
			return success(docAsnApi.appendRemark(condition, super.getCurrentUser()));
		}catch (AfterSaleException e) {
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	

}
