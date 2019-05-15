package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusInvSku {
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
     * 告警阀值
     * 表字段 : bus_inv_sku.warning_qty
     */
    private BigDecimal warningQty;
    
    /**
     * 禁止售卖值
     * 表字段 : bus_inv_sku.disabled_qty
     */
    private BigDecimal disabledQty;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

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
    
	public BigDecimal getWarningQty() {
		return warningQty;
	}

	public void setWarningQty(BigDecimal warningQty) {
		this.warningQty = warningQty;
	}

	public BigDecimal getDisabledQty() {
		return disabledQty;
	}

	public void setDisabledQty(BigDecimal disabledQty) {
		this.disabledQty = disabledQty;
	}

	public BusInvSku() {
		super();
	}

	public BusInvSku(String sku, String shopId, BigDecimal qty, 
		BigDecimal lockQty, BigDecimal damagedQty) {
		super();
		this.sku = sku;
		this.shopId = shopId;
		this.qty = qty;
		this.lockQty = lockQty;
		this.damagedQty = damagedQty;
	}

	public BusInvSku(String id, String sku, String shopId, BigDecimal qty, BigDecimal lockQty, 
		BigDecimal damagedQty, String memo, Date createdTime, Date updatedTime, 
		BigDecimal warningQty, BigDecimal disabledQty) {
		super();
		this.id = id;
		this.sku = sku;
		this.shopId = shopId;
		this.qty = qty;
		this.lockQty = lockQty;
		this.damagedQty = damagedQty;
		this.memo = memo;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
		this.warningQty = warningQty;
		this.disabledQty = disabledQty;
	}
    
    
    
}