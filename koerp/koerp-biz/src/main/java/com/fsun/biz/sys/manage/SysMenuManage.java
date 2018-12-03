package com.fsun.biz.sys.manage;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.SysMenuMapper;
import com.fsun.domain.model.SysMenu;

/**
 * 
 * @author sunxiaolei
 *
 */
@Component
public class SysMenuManage extends CrudManage<SysMenuMapper, SysMenu>{

	/**
	 * 通过用户id获取角色对应的菜单集合
	 * @param userid
	 * @return
	 */
	public List<SysMenu> findMenusByUser(String userid) {
		return mapper.findMenusByUser(userid);
	}

}
