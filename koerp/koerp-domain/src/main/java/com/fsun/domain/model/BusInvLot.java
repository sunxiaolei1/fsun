package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusInvLot {
    /**
     * id
     * 表字段 : bus_inv_lot.id
     */
    private String id;

    /**
     * sku
     * 表字段 : bus_inv_lot.sku
     */
    private String sku;

    /**
     * 商品名称
     * 表字段 : bus_inv_lot.goods_name
     */
    private String goodsName;

    /**
     * 单据类型
     * 表字段 : bus_inv_lot.trade_type
     */
    private Short tradeType;

    /**
     * 交易单号
     * 表字段 : bus_inv_lot.trade_order_no
     */
    private String tradeOrderNo;

    /**
     * 批次号
     * 表字段 : bus_inv_lot.lot_num
     */
    private String lotNum;

    /**
     * 店铺id
     * 表字段 : bus_inv_lot.shop_id
     */
    private String shopId;

    /**
     * 店铺名称
     * 表字段 : bus_inv_lot.shop_name
     */
    private String shopName;

    /**
     * 库存数量
     * 表字段 : bus_inv_lot.qty
     */
    private BigDecimal qty;

    /**
     * 锁定数量
     * 表字段 : bus_inv_lot.lock_qty
     */
    private BigDecimal lockQty;

    /**
     * 破损数量
     * 表字段 : bus_inv_lot.damaged_qty
     */
    private BigDecimal damagedQty;

    /**
     * 备注
     * 表字段 : bus_inv_lot.memo
     */
    private String memo;

    /**
     * 创建时间
     * 表字段 : bus_inv_lot.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_inv_lot.updated_time
     */
    private Date updatedTime;

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

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Short getTradeType() {
        return tradeType;
    }

    public void setTradeType(Short tradeType) {
        this.tradeType = tradeType;
    }

    public String getTradeOrderNo() {
        return tradeOrderNo;
    }

    public void setTradeOrderNo(String tradeOrderNo) {
        this.tradeOrderNo = tradeOrderNo == null ? null : tradeOrderNo.trim();
    }

    public String getLotNum() {
        return lotNum;
    }

    public void setLotNum(String lotNum) {
        this.lotNum = lotNum == null ? null : lotNum.trim();
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId == null ? null : shopId.trim();
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName == null ? null : shopName.trim();
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
}