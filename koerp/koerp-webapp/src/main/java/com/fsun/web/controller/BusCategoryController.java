package com.fsun.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.bus.BusCategoryApi;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.dto.CategoryTreeDto;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * @author fsun
 * @date 2018年12月18日
 */
@Controller
@RequestMapping("/sku/category")
public class BusCategoryController extends BaseController{

	@Autowired
	private BusCategoryApi categoryApi;
	
	/**
	 * 获取分类树
	 * @return
	 */
	@RequestMapping("/getCategoryTree")
	@ResponseBody
	public HttpResult getCategoryTree() {
		try {
			CategoryTreeDto dto = categoryApi.getCategoryTree();
			return success(dto);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
}
