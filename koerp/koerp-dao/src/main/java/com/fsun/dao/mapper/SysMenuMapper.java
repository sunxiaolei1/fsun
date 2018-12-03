package com.fsun.dao.mapper;

import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.SysMenu;

@Mapper
public interface SysMenuMapper extends BaseMySqlMapper<SysMenu>{

	/**
	 * 通过用户id获取角色对应的菜单集合
	 * @param userid
	 * @return
	 */
	public List<SysMenu> findMenusByUser(String userid);
}