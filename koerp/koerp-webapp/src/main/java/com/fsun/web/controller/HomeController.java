package com.fsun.web.controller;

import java.util.List;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.user.SysUserApi;
import com.fsun.common.utils.MD5Utils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;


@Controller
public class HomeController extends BaseController {
	
	@Autowired
	private SysUserApi userApi;

	/**
	 * 登录
	 * 
	 * @param condition
	 *            查询条件
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public HttpResult login(@Valid SysUser user, BindingResult bindingResult) {
		try {
			if (bindingResult.hasErrors()) {
				List<ObjectError> error = bindingResult.getAllErrors();
				for (ObjectError objectError : error) {
					int errorCode = SCMErrorEnum.INVALID_PARAMS.getErrorCode();
					return failure(errorCode, objectError.getDefaultMessage());
				}
			}						
			UsernamePasswordToken token = new UsernamePasswordToken(
					user.getUsername(), MD5Utils.md5SaltEncode(user.getPassword(), user.getUsername()));
			Subject subject = SecurityUtils.getSubject();
			subject.login(token);

		} catch (IncorrectCredentialsException ice) {
			return failure("密码错误!");

		} catch (UnknownAccountException uae) {
			return failure("用户名或密码错误，请重新输入!");

		} catch (ExcessiveAttemptsException eae) {
			return failure("登录多次错误，请稍后再试!");

		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}

		return success();
	}

	/**
	 * 展示页
	 * 
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
			return "center";
		} else {
			return "redirect:/";
		}
	}

	/**
	 * 退出
	 * 
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		// 使用权限管理工具进行用户的退出，跳出登录，给出提示信息
		SecurityUtils.getSubject().logout();
		return "redirect:/";
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
