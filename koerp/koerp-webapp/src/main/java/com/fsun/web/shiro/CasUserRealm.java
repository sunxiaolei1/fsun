package com.fsun.web.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.fsun.api.bus.BusShopApi;
import com.fsun.api.user.SysUserApi;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.SysUserCondition;
import com.fsun.domain.model.BusShop;
import com.fsun.domain.model.SysRole;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2019年5月23日
 */
/**
 * 用户登录和授权用的realm
 */
@SuppressWarnings("deprecation")
public class CasUserRealm extends CasRealm {

	@Autowired
	private SysUserApi userApi;
	
	@Autowired
	private BusShopApi shopApi;

	public static final String SESSION_USER_KEY = "user";
    
    /**
     * CAS认证 ,验证用户身份
     * 将用户基本信息设置到会话中
     */
	@Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {
        
		//调用CasRealm实现的认证方法,其包含验证ticket、填充CasToken的principal等操作)
        AuthenticationInfo authc = super.doGetAuthenticationInfo(token);
        String username = (String) authc.getPrincipals().getPrimaryPrincipal();
        // 查出是否有此用户信息
		SysUserCondition condition = new SysUserCondition();
		condition.setUsername(username);
		List<SysUser> list = userApi.list(condition);
		if (list != null && list.size() == 1) {
			//黑名单限制
            /*if (Global.NO.equals(user.getLoginFlag())) {
                throw new AuthenticationException("msg:该帐号禁止登录");
            }*/
            //将用户信息放在session
			SysUser user = list.get(0);
			if (user != null) {
				BusUserDto currUser = new BusUserDto();
				BeanUtils.copyProperties(user, currUser);
				
				String shopId = user.getShopId();
				if(shopId!=null && !"".equals(shopId)){
					BusShop currShop = shopApi.load(shopId);
					currUser.setShopCode(currShop.getShopCode());
					currUser.setShopName(currShop.getShopName());
				}
				currUser.setPassword(null);
				this.setSession(SESSION_USER_KEY, currUser);
				return authc;
			}
		}
        return null;      
    }
    
    /**
     * 设置角色和权限信息
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
    	
    	// 因为非正常退出，即没有显式调用 SecurityUtils.getSubject().logout()
		// (可能是关闭浏览器，或超时)，但此时缓存依旧存在(principals)，所以会自己跑到授权方法里。
		if (!SecurityUtils.getSubject().isAuthenticated()) {
			doClearCache(principals);
			SecurityUtils.getSubject().logout();
			return null;
		}
		
		SysUser user = (SysUser) SecurityUtils.getSubject().getSession()
				.getAttribute(SESSION_USER_KEY);

		if (user != null) {
			// 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
			SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();			
			List<SysRole> roles = userApi.findRolesByUser(user.getId());
			List<String> roleNames = new ArrayList<>();
			for (SysRole sysRole : roles) {
				roleNames.add(sysRole.getName());
			}
			authorizationInfo.addRoles(roleNames);// 用户角色集合
		
			List<String> permissions = userApi.findPermissionsByUser(user.getId());
			authorizationInfo.addStringPermissions(permissions);// 用户的角色对应的所有权限
			return authorizationInfo;		
		}
		return null;
    }


    /**
	 * 将用户放到ShiroSession中
	 */
	private void setSession(Object key, Object value) {
		Subject subject = SecurityUtils.getSubject();
		if (null != subject) {
			subject.getSession().setAttribute(key, value);
			System.out.println("Session默认超时时间为["+ subject.getSession().getTimeout() + "]毫秒");
		}
	}
}