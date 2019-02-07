package com.fsun.service.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.user.SysUserApi;
import com.fsun.biz.sys.manage.SysMenuManage;
import com.fsun.biz.sys.manage.SysPowerManage;
import com.fsun.biz.sys.manage.SysRoleManage;
import com.fsun.biz.sys.manage.SysUserManage;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.MenuTreeDto;
import com.fsun.domain.entity.SysUserCondition;
import com.fsun.domain.model.SysMenu;
import com.fsun.domain.model.SysRole;
import com.fsun.domain.model.SysUser;

/**
 * 
 * @author sunxiaolei
 *
 */
@Service
public class SysUserService implements SysUserApi{
	
	@Autowired
	private SysUserManage sysUserManage;
	
	@Autowired
	private SysPowerManage sysPowerManage;
	
	@Autowired
	private SysMenuManage sysMenuManage;
	
	@Autowired
	private SysRoleManage sysRoleManage;

	@Override
	public SysUser load(String id) {
		return sysUserManage.load(id);
	}

	@Override
	public List<SysUser> list(SysUserCondition condition) {
		return sysUserManage.list(condition);
	}

	@Override
	public PageModel findPage(SysUserCondition condition) {		
		return sysUserManage.findMapPage(condition);
	}

	@Transactional
	@Override
	public String save(SysUser sysUser, SysUser currentUser){	
		String id = "";
		if(StringUtils.isEmpty(sysUser.getId())){
			sysUser.setId(StringUtils.getUUID());
			sysUserManage.create(sysUser);
		}else{
			sysUserManage.update(sysUser);
		}		
		return id;
	}

	@Transactional
	@Override
	public int delete(String id) {
		return sysUserManage.delete(id);
	}

	@Override
	public List<String> findPermissionsByUser(String userid) {
		return sysPowerManage.findPermissionsByUser(userid);
	}

	@Override
	public List<SysMenu> findMenusByUser(String userid) {
		return sysMenuManage.findMenusByUser(userid);
	}

	@Override
	public List<SysRole> findRolesByUser(String userid) {
		return sysRoleManage.findRolesByUser(userid);
	}

	@Override
	public List<MenuTreeDto> findMenuTree(String userid, String rootNodeId) {
		
		List<SysMenu> menus = sysMenuManage.findMenusByUser(userid);
		
		List<MenuTreeDto> resultMenus = new ArrayList<>();		
		for(SysMenu menu : menus){	
			if(rootNodeId.equals(menu.getPid())){
				MenuTreeDto parentNode = this.initParentNode(menu);
				this.addChildren(parentNode, menus);
				resultMenus.add(parentNode);
			}			
		}		
		return resultMenus;
	}

	@Override
	public List<MenuTreeDto> findModulesByUser(String userid) {		

		List<SysMenu> menus = sysMenuManage.findMenusByUser(userid);		
		List<MenuTreeDto> list = new ArrayList<>();
		boolean isCurrent = true;
		for (SysMenu sysMenu : menus) {
			if(sysMenu.getPid()==null){
				MenuTreeDto dto = this.initParentNode(sysMenu);			
				dto.setIsCurrent(isCurrent);
				isCurrent = false;
				list.add(dto);	
			}		
		}
		return list;
	}
	
	@Transactional
	@Override
	public void assignShop(String[] ids, String shopId, SysUser user) {
		Date now = new Date();
		for (String id : ids) {
			SysUser sysUser = sysUserManage.load(id);
			if(sysUser!=null){
				sysUser.setShopId(shopId);
				sysUser.setUpdateTime(now);
				sysUser.setUpdateManId(user.getId());
				sysUserManage.update(sysUser);
			}			
		}		
	}
	
	@Transactional
	@Override
	public void updateUser(SysUser sysUser) {
		sysUserManage.update(sysUser);
	}

	
	/***********************************  内部方法     *************************************/
	
	/**
	 * 获取父节点
	 * @return
	 */
	private MenuTreeDto initParentNode(SysMenu sysMenu) {				
		MenuTreeDto rootNode = new MenuTreeDto();
		rootNode.setId(sysMenu.getId());
		rootNode.setText(sysMenu.getName());
		rootNode.setIsleaf(false);
		rootNode.setIconCls("icon-bricks");
		rootNode.setState("open");
		rootNode.setUrl(sysMenu.getUrl());
		rootNode.setIcon(sysMenu.getIconcls());
		return rootNode;		
	}
		
		
	/**
	 * 递归获取子节点
	 * @param parentNode
	 * @param list
	 */
	private void addChildren(MenuTreeDto parentNode, List<SysMenu> list) {
		List<MenuTreeDto> childrenNode = new ArrayList<>();
		for (SysMenu sysMenu : list) {
			if (sysMenu.getPid() != null && sysMenu.getPid().equals(parentNode.getId())) {
				MenuTreeDto childNode = new MenuTreeDto();
				childNode.setId(sysMenu.getId());
				childNode.setText(sysMenu.getName());				
				childNode.setIsleaf(true);
				childNode.setIconCls("icon-bricks");
				childNode.setState("open");
				childNode.setUrl(sysMenu.getUrl());
				childNode.setIcon(sysMenu.getIconcls());
				this.addChildren(childNode, list);
				childrenNode.add(childNode);
			}
		}		
		if(childrenNode.size()>0 && !"0".equals(parentNode.getId())){	
			parentNode.setIconCls("icon-rgb");
			parentNode.setState("closed");					
			parentNode.setIsleaf(false);			
		}	
		parentNode.setChildren(childrenNode);
	}

}
