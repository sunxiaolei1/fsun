package com.fsun.biz.sys.manage;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.SysRoleMapper;
import com.fsun.domain.model.SysRole;

@Component
public class SysRoleManage extends CrudManage<SysRoleMapper, SysRole>{

	/**
	 * 用户对应的角色集合
	 * @param userid
	 * @return
	 */
	public List<SysRole> findRolesByUser(String userid) {
		return mapper.findRolesByUser(userid);
	}

}
