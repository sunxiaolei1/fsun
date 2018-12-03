package com.fsun.web.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.user.SysUserApi;
import com.fsun.domain.entity.SysUserCondition;
import com.fsun.domain.model.SysRole;
import com.fsun.domain.model.SysUser;

@Service
public class ShiroDBRealm extends AuthorizingRealm {

	@Autowired
	private SysUserApi userApi;

	public static final String SESSION_USER_KEY = "user";

	/**
	 * 权限认证
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principalCollection) {
		// 因为非正常退出，即没有显式调用 SecurityUtils.getSubject().logout()
		// (可能是关闭浏览器，或超时)，但此时缓存依旧存在(principals)，所以会自己跑到授权方法里。
		if (!SecurityUtils.getSubject().isAuthenticated()) {
			doClearCache(principalCollection);
			SecurityUtils.getSubject().logout();
			return null;
		}

		SysUser user = (SysUser) SecurityUtils.getSubject().getSession()
				.getAttribute(SESSION_USER_KEY);

		if (user != null) {
			// 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			try {
				List<SysRole> roles = userApi.findRolesByUser(user.getId());
				List<String> roleNames = new ArrayList<>();
				for (SysRole sysRole : roles) {
					roleNames.add(sysRole.getName());
				}
				info.addRoles(roleNames);// 用户角色集合
			
				List<String> permissions = userApi.findPermissionsByUser(user.getId());
				info.addStringPermissions(permissions);// 用户的角色对应的所有权限
				return info;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 登录认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authenticationToken)
			throws AuthenticationException {
		try {
			// UsernamePasswordToken对象用来存放提交的登录信息
			UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

			// 查出是否有此用户
			SysUserCondition condition = new SysUserCondition();
			condition.setUsername(token.getUsername());
			condition.setPassword(String.valueOf(token.getPassword()));
			List<SysUser> list = userApi.list(condition);
			if (list != null && list.size() == 1) {
				SysUser user = list.get(0);
				if (user != null) {
					this.setSession(SESSION_USER_KEY, user);
					return new SimpleAuthenticationInfo(user.getUsername(),
							user.getPassword(), getName());
				}
			} else {
				// 用户名不存在抛出异常
				throw new UnknownAccountException();
			}
		} catch (Exception e) {
			e.printStackTrace();
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
