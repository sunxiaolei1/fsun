package com.fsun.web.controller.summary;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.report.SummarySkuDetailsApi;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.report.SummarySkuDetailsCondition;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 出库商品交易明细查询
 * @author fsun
 * @date 2019年4月20日
 */
@Controller
@RequestMapping("/summary/sku/details")
public class SummarySkuDetailsController extends BaseController {
	
	@Autowired
	private SummarySkuDetailsApi summarySkuDetailsApi;

	/**
	 * 通过sku获取领用出库的商品明细
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/so/findPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HttpResult findPage(SummarySkuDetailsCondition condition) {
		try {
			PageModel pageModel = summarySkuDetailsApi.findPage(condition);
			if(condition.getFirstColumn()!=null && !"".equals(condition.getFirstColumn()) 
					&& pageModel.getTotal()>0){
				HashMap<String, Object> footer = summarySkuDetailsApi.findFooter(condition);
				return success(pageModel, new Object[]{footer});
			}
			return success(pageModel, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
}
