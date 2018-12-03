package com.fsun.dao.mapper;

import java.util.List;

import com.fsun.dao.config.Mapper;
import com.fsun.domain.model.SysPower;

@Mapper
public interface SysPowerMapper extends BaseMySqlMapper<SysPower>{

	/**
	 * 获取当前用户对应的权限
	 * @param userid
	 * @return
	 */
	public List<String> findPermissionsByUser(String userid);
}