package com.fsun.domain.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.fsun.domain.common.SortCondition;

/**
 * 
 * @author sunxiaolei
 *
 */
public class BusVipCondition extends SortCondition {
	
	/**
     * 主键
     * 表字段 : bus_vip.id
     */
    private String id;

    /**
     * 客户编号
     * 表字段 : bus_vip.customer_code
     */
    private String customerCode;

    /**
     * 会员卡号
     * 表字段 : bus_vip.card_no
     */
    private String cardNo;

    /**
     * 手机号
     * 表字段 : bus_vip.mobile
     */
    private String mobile;

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
     * 开卡时间
     * 表字段 : bus_vip.vip_time
     */
    private Date vipTime;

    /**
     * 可用余额
     * 表字段 : bus_vip.enable_price
     */
    private BigDecimal enablePrice;

    /**
     * 备注
     * 表字段 : bus_vip.memo
     */
    private String memo;

    /**
     * 是否可用
     * 表字段 : bus_vip.enabled
     */
    private Boolean enabled;

    /**
     * 更新时间
     * 表字段 : bus_vip.updated_time
     */
    private Date updatedTime;

    /**
     * 创建人
     * 表字段 : bus_vip.created_name
     */
    private String createdName;

    /**
     * 更新人
     * 表字段 : bus_vip.updated_name
     */
    private String updatedName;


	/**
	 * 模糊查询
	 */
	private String q;
	
	/**
	 * 客户类型
	 */
	private String customerType;

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}

	public String getCreatedName() {
		return createdName;
	}

	public void setCreatedName(String createdName) {
		this.createdName = createdName;
	}

	public String getUpdatedName() {
		return updatedName;
	}

	public void setUpdatedName(String updatedName) {
		this.updatedName = updatedName;
	}
	
	
}
