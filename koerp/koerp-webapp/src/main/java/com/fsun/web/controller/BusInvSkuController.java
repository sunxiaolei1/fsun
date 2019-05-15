package com.fsun.web.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fsun.api.bus.BusBasSkuApi;
import com.fsun.api.bus.BusInvSkuApi;
import com.fsun.common.utils.ExcelUtil;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusInvSkuCondition;
import com.fsun.domain.entity.BusInvSkuDetailsCondition;
import com.fsun.domain.model.BusBasSku;
import com.fsun.domain.model.BusInvSku;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2018年12月13日
 */
@Controller
@RequestMapping("/bus/invSku")
public class BusInvSkuController extends BaseController {

	@Autowired
	private BusInvSkuApi busInvSkuApi;
	
	@Autowired
	private BusBasSkuApi busBasSkuApi;

	@RequestMapping("/index")
	public String index() {
		return "/busInvSku/index";
	}
	
	@RequestMapping("/toChooseSku")
	public String toChooseSku() {
		return "/busCommon/commonChooseInvSku";
	}
	
	@RequestMapping("/toConfigWarningView")
	public String toConfigWarningView() {
		return "/busInvSku/operate/toConfigWarningView";
	}

	@RequestMapping("/toChooseEditSku")
	public ModelAndView toChooseEditSku() {
		ModelAndView modelAndView = new ModelAndView("/busCommon/commonChooseEditInvSku");
		//控制编辑单价权限		
		modelAndView.addObject("hasEditPricePower", super.hasEditPricePower());	
		return modelAndView;
	}	
	
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(@RequestParam("sku") String sku,
		@RequestParam("shopId") String shopId) {		
		ModelAndView modelAndView = new ModelAndView("/busInvSku/operate/detail");
		modelAndView.addObject("sku", sku);
		modelAndView.addObject("shopId", shopId);
		return modelAndView;
	}
	

	/**
	 * 通过sku和门店id获取商品库存明细
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/findDetailsPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findDetailsPage(BusInvSkuDetailsCondition condition) {
		try {
			PageModel pageModel = busInvSkuApi.findDetailsPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busInvSkuApi.findDetailsFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(BusInvSkuCondition condition) {
		try {
			PageModel pageModel = busInvSkuApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = busInvSkuApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}

	@RequestMapping(value="/findListForPage", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult findListForPage(BusInvSkuCondition condition) {
		try {
			PageModel pageModel = busInvSkuApi.findListForPage(condition);
			return success(pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult list(BusInvSkuCondition condition) {
		try {
			List<BusInvSku> list = busInvSkuApi.list(condition);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	@RequestMapping("/exportExcel")
	public void exportInvSkus(BusInvSkuCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			//对得到的参数进行解码 				
			if(condition.getQ()!=null &&!"".equals(condition.getQ())){
				condition.setQ(URLDecoder.decode(condition.getQ(),"utf-8"));
			}	 
			List<HashMap<String, Object>> list = busInvSkuApi.exportInvSku(condition);
			LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>();
			fieldMap.put("sku", "SKU");
			fieldMap.put("goods_name", "商品名称");
			fieldMap.put("shop_name", "所属店仓");
			fieldMap.put("qty", "可用数量");
			fieldMap.put("lock_qty", "冻结数量");
			fieldMap.put("damaged_qty", "破损数量");
			fieldMap.put("take_inv_qty", "寄提库存");
			fieldMap.put("vir_inv_qty", "虚拟库存");	
			fieldMap.put("warning_qty", "库存预警");	
			fieldMap.put("bar_code", "条形码");
			fieldMap.put("brand_name", "品牌");
			fieldMap.put("category_name", "商品分类");
			fieldMap.put("property", "规格");
			fieldMap.put("unit_name", "单位");
			fieldMap.put("memo", "备注");
			ExcelUtil.listToExcel(list, fieldMap, "商品库存汇总表", response);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/details/exportExcel")
	public void exportInvSkuDetails(BusInvSkuDetailsCondition condition,
			HttpServletRequest request, HttpServletResponse response) {
		try {	
			List<HashMap<String, Object>> list = busInvSkuApi.exportInvSkuDetails(condition);
			LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>();
			fieldMap.put("sku", "SKU");
			fieldMap.put("goods_name", "商品名称");
			fieldMap.put("shop_name", "所属店仓");
			fieldMap.put("qty", "可用数量");
			fieldMap.put("lock_qty", "冻结数量");
			fieldMap.put("damaged_qty", "破损数量");
			fieldMap.put("trade_order_no", "单据编号");
			fieldMap.put("trade_type_name", "单据类型");
			fieldMap.put("trade_status_name", "交易状态");
			fieldMap.put("trade_time", "交易时间");
			fieldMap.put("trade_relation_no", "关联单号");
			
			String title = "库存商品交易明细表";
			String sku = condition.getSku();
			if(sku!=null && !sku.equals("")){
				BusBasSku busBasSku = busBasSkuApi.loadBySku(sku);
				if(busBasSku!=null){
					title = "库存商品_"+ busBasSku.getGoodsName() +"_"+ busBasSku.getSku() +"_交易明细表";
				}				
			}			
			ExcelUtil.listToExcel(list, fieldMap, title, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/configWarning/{warningQty}", method = {RequestMethod.POST})
	@ResponseBody
	public HttpResult configWarning(@PathVariable("warningQty") BigDecimal warningQty, 
		@RequestParam("ids") String ids) {
		try {
			if (!StringUtils.isEmpty(ids)) {
				BusUserDto busUserDto = getCurrentUser();	
				busInvSkuApi.configWarning(ids.split(","), warningQty, busUserDto);
				return success(SCMErrorEnum.SUCCESS);
			}
			return failure(SCMErrorEnum.INVALID_PARAMS);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
}
