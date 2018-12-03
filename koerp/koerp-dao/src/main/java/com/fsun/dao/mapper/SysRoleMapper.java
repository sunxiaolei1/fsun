package com.fsun.dao.mapper;

import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.SysRole;

@Mapper
public interface SysRoleMapper extends BaseMySqlMapper<SysRole>{

	/**
	 * 用户对应的角色集合
	 * @param userid
	 * @return
	 */
	public List<SysRole> findRolesByUser(String userid);
}