package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusVip {
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
     * 卡类型
     */
    private Integer cardType;

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
     * 赠金
     * 表字段 : bus_vip.gift_price
     */
    private BigDecimal giftPrice;

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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode == null ? null : customerCode.trim();
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo == null ? null : cardNo.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat == null ? null : wechat.trim();
    }

    public String getCnName() {
        return cnName;
    }

    public void setCnName(String cnName) {
        this.cnName = cnName == null ? null : cnName.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
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
        this.email = email == null ? null : email.trim();
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
        this.memo = memo == null ? null : memo.trim();
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
        this.createdName = createdName == null ? null : createdName.trim();
    }

    public String getUpdatedName() {
        return updatedName;
    }

    public void setUpdatedName(String updatedName) {
        this.updatedName = updatedName == null ? null : updatedName.trim();
    }

	public Integer getCardType() {
		return cardType;
	}

	public void setCardType(Integer cardType) {
		this.cardType = cardType;
	}

	/**
	 * @return the giftPrice
	 */
	public BigDecimal getGiftPrice() {
		return giftPrice;
	}

	/**
	 * @param giftPrice the giftPrice to set
	 */
	public void setGiftPrice(BigDecimal giftPrice) {
		this.giftPrice = giftPrice;
	}
    
    
}