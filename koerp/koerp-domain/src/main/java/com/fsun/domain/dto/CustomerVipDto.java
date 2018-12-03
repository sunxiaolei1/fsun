package com.fsun.domain.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.SysUser;

/**
 * 会员和挂账单位对象
 * @author sunxiaolei
 *
 */
public class CustomerVipDto extends BusCustomer{
	
	/**
	 * 当前用户信息
	 */
	private SysUser currentUser;

	/**
     * 会员编号
     * 表字段 : bus_vip.vip_id
     */
    private String vipId;

    /**
     * 微信号
     * 表字段 : bus_vip.wechat
     */
    private String wechat;

    /**
     * 姓名
     * 表字段 : bus_vip.cn_name
     */
    private String cnName;

    /**
     * 姓别
     * 表字段 : bus_vip.sex
     */
    private String sex;

    /**
     * 出生日期
     * 表字段 : bus_vip.brithday
     */
    private Date brithday;

    /**
     * 邮箱
     * 表字段 : bus_vip.email
     */
    private String email;

    /**
     * 本金比例
     * 表字段 : bus_vip.origin_precent
     */
    private BigDecimal originPrecent;

    /**
     * 入会时间
     * 表字段 : bus_vip.vip_time
     */
    private Date vipTime;

    /**
     * 可用余额
     * 表字段 : bus_vip.enable_price
     */
    private BigDecimal enablePrice;

	public String getVipId() {
		return vipId;
	}

	public void setVipId(String vipId) {
		this.vipId = vipId;
	}

	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getCnName() {
		return cnName;
	}

	public void setCnName(String cnName) {
		this.cnName = cnName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBrithday() {
		return brithday;
	}

	public void setBrithday(Date brithday) {
		this.brithday = brithday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public BigDecimal getOriginPrecent() {
		return originPrecent;
	}

	public void setOriginPrecent(BigDecimal originPrecent) {
		this.originPrecent = originPrecent;
	}

	public Date getVipTime() {
		return vipTime;
	}

	public void setVipTime(Date vipTime) {
		this.vipTime = vipTime;
	}

	public BigDecimal getEnablePrice() {
		return enablePrice;
	}

	public void setEnablePrice(BigDecimal enablePrice) {
		this.enablePrice = enablePrice;
	}

	/**
	 * @return the currentUser
	 */
	public SysUser getCurrentUser() {
		return currentUser;
	}

	/**
	 * @param currentUser the currentUser to set
	 */
	public void setCurrentUser(SysUser currentUser) {
		this.currentUser = currentUser;
	}
    
}
