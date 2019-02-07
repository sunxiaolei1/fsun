package com.fsun.domain.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.fsun.domain.common.SortCondition;

/**
 * @author fsun
 * @date 2018年12月13日
 */
public class BusInvSkuCondition extends SortCondition{
	
	 /**
     * 
     * 表字段 : bus_inv_sku.id
     */
    private String id;

    /**
     * sku
     * 表字段 : bus_inv_sku.sku
     */
    private String sku;

    /**
     * 店铺id
     * 表字段 : bus_inv_sku.shop_id
     */
    private String shopId;

    /**
     * 库存数量
     * 表字段 : bus_inv_sku.qty
     */
    private BigDecimal qty;

    /**
     * 锁定数量
     * 表字段 : bus_inv_sku.lock_qty
     */
    private BigDecimal lockQty;

    /**
     * 破损数量
     * 表字段 : bus_inv_sku.damaged_qty
     */
    private BigDecimal damagedQty;

    /**
     * 备注
     * 表字段 : bus_inv_sku.memo
     */
    private String memo;

    /**
     * 创建时间
     * 表字段 : bus_inv_sku.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_inv_sku.updated_time
     */
    private Date updatedTime;
    
    /**
     * 模糊查询字段
     */
    private String q;
    
    /**
     * 客户编号
     */
    private String customerCode;
    
    /**
     * 可用库存
     */
    private Boolean enabled;
    
    /**
     * 商品分类
     */
    private String categoryCode;

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku == null ? null : sku.trim();
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId == null ? null : shopId.trim();
    }

    public BigDecimal getQty() {
        return qty;
    }

    public void setQty(BigDecimal qty) {
        this.qty = qty;
    }

    public BigDecimal getLockQty() {
        return lockQty;
    }

    public void setLockQty(BigDecimal lockQty) {
        this.lockQty = lockQty;
    }

    public BigDecimal getDamagedQty() {
        return damagedQty;
    }

    public void setDamagedQty(BigDecimal damagedQty) {
        this.damagedQty = damagedQty;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
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

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the q
	 */
	public String getQ() {
		return q;
	}

	/**
	 * @param q the q to set
	 */
	public void setQ(String q) {
		this.q = q;
	}

	/**
	 * @return the customerCode
	 */
	public String getCustomerCode() {
		return customerCode;
	}

	/**
	 * @param customerCode the customerCode to set
	 */
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	/**
	 * @return the categoryCode
	 */
	public String getCategoryCode() {
		return categoryCode;
	}

	/**
	 * @param categoryCode the categoryCode to set
	 */
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	
}
