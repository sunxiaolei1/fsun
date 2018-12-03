package com.fsun.domain.entity;

import javax.validation.constraints.NotNull;

/**
 * 用户查询对象
 * @author sunxiaolei
 *
 */
public class SysUserCondition {
	
	/**
     * 用户ID
     * 表字段 : sys_user.id
     */
    private String id;

    /**
     * 用户帐号
     * 表字段 : sys_user.username
     */
    @NotNull(message = "账号不能为空")
    private String username;

    /**
     * 用户密码
     * 表字段 : sys_user.password
     */
    @NotNull(message = "密码不能为空")
    private String password;

    /**
     * 用户中文名称
     * 表字段 : sys_user.realname
     */
    private String realname;

    /**
     * 是否是系统管理员
     * 表字段 : sys_user.issys
     */
    private Boolean issys;

    /**
     * 状态
     * 表字段 : sys_user.enabled
     */
    private Boolean enabled;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Boolean getIssys() {
		return issys;
	}

	public void setIssys(Boolean issys) {
		this.issys = issys;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
    
}
