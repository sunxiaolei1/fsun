package com.fsun.web.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.shiro.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.bus.OverviewApi;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.OverviewCondition;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;


@Controller
public class HomeController extends BaseController {
	
	@Autowired
	private OverviewApi overviewApi;

	/**
	 * 首页 
	 * @return
	 */
	@RequestMapping("/center")
	public String center(ModelMap modelMap) {
		SysUser user = getCurrentUser();		
		if (user != null) {
			//获取用户
			modelMap.addAttribute("user", user);	
			//获取菜单
		    modelMap.addAttribute("sysList", userApi.findMenusByUser(user.getId()));
		    //获取权限
			this.initRolePermissions(modelMap);		
		}
		return "center";	
	}

	/**
	 * 无权限提示页
	 * 
	 * @return
	 */
	@RequestMapping("/403")
	public String unauthorizedRole() {
		return "/403";
	}
	
	
	/**
	 * 首页获取初始化数据
	 * @param condition
	 * @return
	 */
	@RequestMapping(value="/overview/getInitData", method = {RequestMethod.GET})
	@ResponseBody
	public HttpResult getInitData(OverviewCondition condition){
		try {
			BusUserDto currUser = super.getCurrentUser();
			HashMap<String, Object> map = overviewApi.getInitData(condition, currUser);
			return success(map);
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
	}
	
	
	/**
	 * 获取当前用户对应的权限
	 * @param modelMap
	 */
	private void initRolePermissions(ModelMap modelMap) {
		String permissions = "";
		List<String> list = userApi.findPermissionsByUser(getCurrentUser().getId());		
		if(list!=null && list.size()>0){
			permissions = StringUtils.toDelimitedString(list, ",");
		}	
		modelMap.addAttribute("rolerdc", permissions);	
	}
}
