package com.fsun.web.controller.base;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.fsun.api.user.SysUserApi;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.common.PageResult;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * 
 * controller基类
 * 
 * @author Gang Sun
 *
 */
public class BaseController {

	public static final String SESSION_USER_KEY = "user";
	
	@Autowired
	protected SysUserApi userApi;

	protected Logger logger = LogManager.getLogger(getClass());

	protected HttpResult success(PageModel pageModel) {
		PageResult pageResult = new PageResult();
		return pageResult.success(pageModel.getPageNum(),
				pageModel.getPageSize(), pageModel.getTotal(),
				pageModel.getRows());
	}
	
	protected HttpResult success(PageModel pageModel, Object footer) {
		PageResult pageResult = new PageResult();
		return pageResult.success(pageModel.getPageNum(),
				pageModel.getPageSize(), pageModel.getTotal(),
				pageModel.getRows(), footer);
	}
	
	protected HttpResult success(PageModel pageModel, int responseCode,
			String message) {
		PageResult pageResult = new PageResult();
		return pageResult.success(pageModel.getPageNum(),
				pageModel.getPageSize(), pageModel.getTotal(),
				pageModel.getRows(), responseCode, message);
	}

	protected HttpResult success() {
		HttpResult result = new HttpResult();
		return result.success();
	}

	protected HttpResult success(Object model) {
		HttpResult result = new HttpResult();
		return result.success(model);
	}

	protected HttpResult success(int responseCode, String message) {
		HttpResult result = new HttpResult();
		return result.success(responseCode, message);
	}

	protected HttpResult success(Object model, int responseCode, String message) {
		HttpResult result = new HttpResult();
		return result.success(model, responseCode, message);
	}

	protected HttpResult failure(String message) {
		HttpResult result = new HttpResult();
		return result.failure(message);
	}

	protected HttpResult failure(int responseCode, String message) {
		HttpResult result = new HttpResult();
		return result.failure(responseCode, message);
	}

	protected HttpResult failure(Object model, int responseCode, String message) {
		HttpResult result = new HttpResult();
		return result.failure(model, responseCode, message);
	}

	protected HttpResult failure(SCMException e) {
		HttpResult result = new HttpResult();
		return result.failure(e);
	}

	protected HttpResult failure(Object model, SCMException e) {
		HttpResult result = new HttpResult();
		return result.failure(model, e);
	}

	protected HttpResult failure(SCMErrorEnum errorEnum) {
		HttpResult result = new HttpResult();
		return result.failure(errorEnum);
	}

	protected HttpResult failure(Object model, SCMErrorEnum errorEnum) {
		HttpResult result = new HttpResult();
		return result.failure(model, errorEnum);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	public BusUserDto getCurrentUser() {
		Subject subject = SecurityUtils.getSubject();
		BusUserDto user = (BusUserDto) subject.getSession().getAttribute(
				SESSION_USER_KEY);
		return user;
	}
	
	/**
	 * 获取当前用户是否可以编辑商品价格的权限
	 * @return
	 */
	protected String hasEditPricePower(){
		String hasEditPricePower = "0";		
		List<String> list = userApi.findPermissionsByUser(getCurrentUser().getId());
		for (String permission : list) {
			if(permission.equals("ORDER_EDIT_SALE_PRICE")){
				hasEditPricePower = "1";
				break;
			}
		}
		return hasEditPricePower;
	}
		
}
