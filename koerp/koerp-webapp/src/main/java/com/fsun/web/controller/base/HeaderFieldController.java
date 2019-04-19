package com.fsun.web.controller.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.report.HeaderFieldApi;
import com.fsun.domain.common.HttpResult;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2019年4月19日
 */

@Controller
@RequestMapping("/base/header/field")
public class HeaderFieldController extends BaseController{
	
	@Autowired
	HeaderFieldApi headerFieldApi;
	
	@RequestMapping(value="/{queryType}", method = RequestMethod.GET)
	@ResponseBody
	public HttpResult fieldsMap(@PathVariable("queryType") String queryType) {
		try {
			return success(headerFieldApi.headerFieldMap(queryType));
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
}
