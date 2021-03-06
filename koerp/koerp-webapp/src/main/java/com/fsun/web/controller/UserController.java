package com.fsun.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsun.api.user.SysUserApi;
import com.fsun.common.utils.MD5Utils;
import com.fsun.domain.common.HttpResult;
import com.fsun.domain.dto.MenuTreeDto;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.web.controller.base.BaseController;

/**
 * 用户管理模块
 * @author sunxiaolei
 *
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	
	@Autowired
	private SysUserApi userApi;

	/**
	 * 获取用户对应的菜单树
	 * @param
	 * @return
	 */
	@RequestMapping(value="/current/menuTree", method=RequestMethod.GET)
	@ResponseBody
	public HttpResult findMenuTree(String appId) {
		try {		
			SysUser user = getCurrentUser();
			List<MenuTreeDto> list = userApi.findMenuTree(user.getId(), appId);
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return success(new ArrayList<>());
		}
	}
	
	/**
	 * 获取用户对应的模块列表
	 * @return
	 */
	@RequestMapping("/current/modules")
	@ResponseBody
	public HttpResult findModules() {
		try {
			SysUser user = getCurrentUser();
			List<MenuTreeDto> list = userApi.findModulesByUser(user.getId());
			return success(list);
		} catch (Exception e) {
			e.printStackTrace();
			return success(new ArrayList<>());
		}
	}
	
	/**
	 * 保存用户
	 * @param condition
	 * @return
	 */
	@RequestMapping("/savePassword")
	@ResponseBody
	public HttpResult savePassword(@RequestBody SysUser sysUser) {
		try {
			SysUser old = userApi.load(sysUser.getId());
			String newPassword = MD5Utils.md5SaltEncode(sysUser.getPassword(), old.getUsername());
			String oldPassword = MD5Utils.md5SaltEncode(sysUser.getOldPassword(), old.getUsername());
			if(!old.getPassword().equals(oldPassword)){
				return failure(100, "对不起，原密码输入错误，请重新设置！");
			}
			if(old.getPassword().equals(newPassword)) {
				return failure(100, "对不起，新密码不能与老密码相同，请重新设置！");
			}
			sysUser.setPassword(newPassword);
			userApi.updateUser(sysUser);
			return success();
		} catch (Exception e) {
			e.printStackTrace();
			return failure(SCMErrorEnum.SYSTEM_ERROR);
		}
		
	}

	
}
