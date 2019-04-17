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
import com.fsun.domain.enums.BusTakeStatusEnum;
import com.fsun.domain.model.BusTake;
import com.fsun.exception.bus.AfterSaleException;
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
		ModelAndView modelAndView = new ModelAndView("/busTake/operate/toAddView");
		return modelAndView;
	}	
	
	/**
	 * 跳转至寄提出库新增
	 * @param orderId
	 * @param buttontype
	 * @return
	 */
	@RequestMapping("/toTakeOutView/{orderId}")
	public ModelAndView toTakeOutView(@PathVariable("orderId") String orderId,
		@RequestParam("buttontype") String buttontype, 
			@RequestParam("requestFrom") String requestFrom) {				
		ModelAndView modelAndView = new ModelAndView("/busTake/operate/toTakeOutView");	
		modelAndView.addObject("orderId", orderId);	
		//单据状态权限控制按钮显示
		modelAndView.addObject("buttontype", buttontype);
		//判别请求来自哪里(订单详情页面order还是寄提单新增页面take)
		modelAndView.addObject("requestFrom", requestFrom);		
		List<String> hiddenbuttons = orderButtonsApi.getHiddenButtonsMap(buttontype, orderId, null);
		modelAndView.addObject("hiddenbuttons", StringUtils.join(hiddenbuttons, ","));
		return modelAndView;
	}	
	
	/**
	 * 跳转至提交对应的寄提出库明细预览页面
	 * @return
	 */
	@RequestMapping("/toShowTakeOutView")
	public ModelAndView toShowTakeOutView() {				
		ModelAndView modelAndView = new ModelAndView("/busTake/operate/toShowTakeOutView");	
		return modelAndView;
	}	
	
	/**
	 * 跳转至寄存单对应的寄提出库明细页面
	 * @return
	 */
	@RequestMapping("/toGoodsHistoryView/{orderId}")
	public ModelAndView toGoodsHistoryView(@PathVariable("orderId") String orderId) {				
		ModelAndView modelAndView = new ModelAndView("/busTake/operate/toGoodsHistoryView");	
		modelAndView.addObject("orderId", orderId);
		return modelAndView;
	}

	/**
	 * 查看明细页面
	 * @param takeId
	 * @param buttontype
	 * @return
	 */
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("takeId") String takeId,
		@RequestParam("buttontype") String buttontype) {				
		ModelAndView modelAndView = new ModelAndView("/busTake/operate/toEditView");	
		modelAndView.addObject("takeId", takeId);
		modelAndView.addObject("cancelStatus", BusTakeStatusEnum.CANCEL.getCode());		
		//单据状态权限控制按钮显示
		modelAndView.addObject("buttontype", buttontype);
		List<String> hiddenbuttons = orderButtonsApi.getHiddenButtonsMap(buttontype, null, takeId);
		modelAndView.addObject("hiddenbuttons", StringUtils.join(hiddenbuttons, ","));
		return modelAndView;
	}		
	
	/**
	 * 获取初始化数据
	 * @param condition
	 * @return
	 */
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
	
	/**
	 * 获取寄存单对应的寄提流水
	 * @param orderId
	 * @return
	 */
	@RequestMapping(value="/goodsHistory/{orderId}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult getTakeGoodsByOrderId(@PathVariable("orderId") String orderId) {
		try {
			List<HashMap<String, Object>> list = busTakeApi.getTakeGoodsByOrderId(orderId);
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
				busTakeApi.changeStatus(takeIds.split(","), status, super.getCurrentUser(), condition);
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
	
	@RequestMapping(value="/signPrint/{takeId}", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult signPrint(@PathVariable("takeId") String takeId) {
		try {
			if (!StringUtils.isEmpty(takeId)) {		
				busTakeApi.signPrint(takeId);
				return success(SCMErrorEnum.SUCCESS.getErrorCode());
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		}catch(BusTakeException e){
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
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
	
	/***************************************    修改备注功能        **************************************/
	
	/**
	 * 跳转到修改备注页面
	 * @param takeId
	 * @return
	 */	
	@RequestMapping(value="/toRemarkView/{takeId}", method=RequestMethod.GET)	
	public ModelAndView toRemarkView(@PathVariable("takeId") String takeId) {
		ModelAndView modelAndView = new ModelAndView("/busTake/operate/toRemarkView"); 
		modelAndView.addObject("takeId", takeId);
		modelAndView.addObject("memo", busTakeApi.getRemark(takeId));
		return modelAndView;
	}
	
	/**
	 * 获取备注
	 * @param takeId
	 * @return
	 */
	@RequestMapping(value="/getRemark/{takeId}", method=RequestMethod.GET)
	@ResponseBody
	public HttpResult getRemark(@PathVariable("takeId") String takeId) {
		String memo = busTakeApi.getRemark(takeId);
		return success(memo);
	}
	
	/**
	 * 追加备注
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/appendRemark", method=RequestMethod.POST)
	@ResponseBody
	public HttpResult appendRemark(@RequestBody BusTakeCondition condition) {
		try {
			BusUserDto sysuser = super.getCurrentUser();
			String takeId = busTakeApi.appendRemark(condition, sysuser);			
			return success(takeId);
		}catch (AfterSaleException e) {
			e.printStackTrace();
			return failure(SCMException.CODE_UPDATE, e.getErrorMsg());
		}catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
}
