package com.fsun.api.user;

import java.util.List;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.dto.MenuTreeDto;
import com.fsun.domain.entity.SysUserCondition;
import com.fsun.domain.model.SysMenu;
import com.fsun.domain.model.SysRole;
import com.fsun.domain.model.SysUser;

/**
 * 用户接口管理
 * @author sunxiaolei
 *
 */
public interface SysUserApi extends BaseApi<SysUser, SysUserCondition> {

	/**
	 * 通过用户id获取角色对应的权限集合
	 * @param userid
	 * @return
	 */
	public List<String> findPermissionsByUser(String userid);

	/**
	 * 通过用户id获取角色对应的菜单集合
	 * @param userid
	 * @return
	 */
	public List<SysMenu> findMenusByUser(String userid);

	/**
	 * 通过用户id获取角色集合
	 * @param id
	 * @return
	 */
	public List<SysRole> findRolesByUser(String userid);

	/**
	 * 获取当前用户菜单树
	 * @param id
	 * @param appId
	 * @return
	 */
	public List<MenuTreeDto> findMenuTree(String userid, String appId);

	/**
	 * 获取当前用户模块列表
	 * @param userid
	 * @return
	 */
	public List<MenuTreeDto> findModulesByUser(String userid);

	/**
	 * 用户批量分配门店
	 * @param split
	 * @param shopId
	 * @param user
	 */
	public void assignShop(String[] ids, String shopId, SysUser user);

	/**
	 * 更新用户信息
	 * @param sysUser
	 */
	public void updateUser(SysUser sysUser);

}
