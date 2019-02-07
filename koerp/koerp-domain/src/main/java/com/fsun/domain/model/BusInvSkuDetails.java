package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusInvSkuDetails {
    /**
     * id
     * 表字段 : bus_inv_sku_details.id
     */
    private String id;

    /**
     * 单据类型
     * 表字段 : bus_inv_sku_details.trade_type
     */
    private String tradeType;

    /**
     * 交易状态
     * 表字段 : bus_inv_sku_details.trade_status
     */
    private String tradeStatus;

    /**
     * 交易单号
     * 表字段 : bus_inv_sku_details.trade_order_no
     */
    private String tradeOrderNo;

    /**
     * 交易单关联单号(1、采购入库->申请单号,2、调拨入库->调拨出库单号)
     * 表字段 : bus_inv_sku_details.trade_relation_no
     */
    private String tradeRelationNo;

    /**
     * 交易商品明细主键
     * 表字段 : bus_inv_sku_details.trade_order_detail_id
     */
    private String tradeOrderDetailId;

    /**
     * 单据行号
     * 表字段 : bus_inv_sku_details.trade_line_no
     */
    private Integer tradeLineNo;

    /**
     * 交易时间
     * 表字段 : bus_inv_sku_details.trade_time
     */
    private Date tradeTime;

    /**
     * 是否入库批次
     * 表字段 : bus_inv_sku_details.is_pull
     */
    private Short isPull;

    /**
     * 店铺id
     * 表字段 : bus_inv_sku_details.shop_id
     */
    private String shopId;

    /**
     * 店铺名称
     * 表字段 : bus_inv_sku_details.shop_name
     */
    private String shopName;

    /**
     * sku
     * 表字段 : bus_inv_sku_details.sku
     */
    private String sku;

    /**
     * 商品名称
     * 表字段 : bus_inv_sku_details.goods_name
     */
    private String goodsName;

    /**
     * 批次号
     * 表字段 : bus_inv_sku_details.lot_num
     */
    private String lotNum;

    /**
     * 单位
     * 表字段 : bus_inv_sku_details.unit
     */
    private String unit;

    /**
     * 可用数量
     * 表字段 : bus_inv_sku_details.qty
     */
    private BigDecimal qty;

    /**
     * 锁定数量
     * 表字段 : bus_inv_sku_details.lock_qty
     */
    private BigDecimal lockQty;

    /**
     * 破损数量
     * 表字段 : bus_inv_sku_details.damaged_qty
     */
    private BigDecimal damagedQty;

    /**
     * 备注
     * 表字段 : bus_inv_sku_details.memo
     */
    private String memo;

    /**
     * 创建时间
     * 表字段 : bus_inv_sku_details.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_inv_sku_details.updated_time
     */
    private Date updatedTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTradeType() {
        return tradeType;
    }

    public void setTradeType(String tradeType) {
        this.tradeType = tradeType == null ? null : tradeType.trim();
    }

    public String getTradeStatus() {
        return tradeStatus;
    }

    public void setTradeStatus(String tradeStatus) {
        this.tradeStatus = tradeStatus == null ? null : tradeStatus.trim();
    }

    public String getTradeOrderNo() {
        return tradeOrderNo;
    }

    public void setTradeOrderNo(String tradeOrderNo) {
        this.tradeOrderNo = tradeOrderNo == null ? null : tradeOrderNo.trim();
    }

    public String getTradeRelationNo() {
        return tradeRelationNo;
    }

    public void setTradeRelationNo(String tradeRelationNo) {
        this.tradeRelationNo = tradeRelationNo == null ? null : tradeRelationNo.trim();
    }

    public String getTradeOrderDetailId() {
        return tradeOrderDetailId;
    }

    public void setTradeOrderDetailId(String tradeOrderDetailId) {
        this.tradeOrderDetailId = tradeOrderDetailId == null ? null : tradeOrderDetailId.trim();
    }

    public Integer getTradeLineNo() {
        return tradeLineNo;
    }

    public void setTradeLineNo(Integer tradeLineNo) {
        this.tradeLineNo = tradeLineNo;
    }

    public Date getTradeTime() {
        return tradeTime;
    }

    public void setTradeTime(Date tradeTime) {
        this.tradeTime = tradeTime;
    }

    public Short getIsPull() {
        return isPull;
    }

    public void setIsPull(Short isPull) {
        this.isPull = isPull;
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

    public String getLotNum() {
        return lotNum;
    }

    public void setLotNum(String lotNum) {
        this.lotNum = lotNum == null ? null : lotNum.trim();
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
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