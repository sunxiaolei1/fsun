package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusRulPrice {
    /**
     * 策略Id
     * 表字段 : bus_rul_price.rul_id
     */
    private String rulId;

    /**
     * 价格策略名称
     * 表字段 : bus_rul_price.rul_name
     */
    private String rulName;

    /**
     * 是否统一折扣
     * 表字段 : bus_rul_price.is_discount
     */
    private Boolean isDiscount;

    /**
     * 折扣
     * 表字段 : bus_rul_price.discount
     */
    private BigDecimal discount;

    /**
     * 优先级
     * 表字段 : bus_rul_price.sort_code
     */
    private Integer sortCode;

    /**
     * 创建时间
     * 表字段 : bus_rul_price.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_rul_price.updated_time
     */
    private Date updatedTime;

    /**
     * 创建人id
     * 表字段 : bus_rul_price.created_id
     */
    private String createdId;

    /**
     * 更新人id
     * 表字段 : bus_rul_price.updated_id
     */
    private String updatedId;

    public String getRulId() {
        return rulId;
    }

    public void setRulId(String rulId) {
        this.rulId = rulId == null ? null : rulId.trim();
    }

    public String getRulName() {
        return rulName;
    }

    public void setRulName(String rulName) {
        this.rulName = rulName == null ? null : rulName.trim();
    }

    public Boolean getIsDiscount() {
        return isDiscount;
    }

    public void setIsDiscount(Boolean isDiscount) {
        this.isDiscount = isDiscount;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public Integer getSortCode() {
        return sortCode;
    }

    public void setSortCode(Integer sortCode) {
        this.sortCode = sortCode;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public String getCreatedId() {
        return createdId;
    }

    public void setCreatedId(String createdId) {
        this.createdId = createdId == null ? null : createdId.trim();
    }

    public String getUpdatedId() {
        return updatedId;
    }

    public void setUpdatedId(String updatedId) {
        this.updatedId = updatedId == null ? null : updatedId.trim();
    }
}