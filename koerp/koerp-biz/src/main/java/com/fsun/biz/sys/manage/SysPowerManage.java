package com.fsun.biz.sys.manage;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.SysPowerMapper;
import com.fsun.domain.model.SysPower;

@Component
public class SysPowerManage extends CrudManage<SysPowerMapper, SysPower>{

	/**
	 * 获取当前用户对应的权限
	 * @param userid
	 * @return
	 */
	public List<String> findPermissionsByUser(String userid) {
		return mapper.findPermissionsByUser(userid);
	}

}
