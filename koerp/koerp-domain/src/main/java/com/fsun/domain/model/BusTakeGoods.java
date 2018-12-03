package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusTakeGoods {
    /**
     * goods_id
     * 表字段 : bus_take_goods.goods_id
     */
    private String goodsId;

    /**
     * 订单id
     * 表字段 : bus_take_goods.order_id
     */
    private String orderId;

    /**
     * 行号
     * 表字段 : bus_take_goods.line_no
     */
    private Integer lineNo;

    /**
     * 商品名称
     * 表字段 : bus_take_goods.goods_name
     */
    private String goodsName;

    /**
     * sku
     * 表字段 : bus_take_goods.sku
     */
    private String sku;

    /**
     * 自提数量
     * 表字段 : bus_take_goods.qty
     */
    private BigDecimal qty;

    /**
     * 实际销售价(销售价、会员价)
     * 表字段 : bus_take_goods.sale_price
     */
    private BigDecimal salePrice;

    /**
     * 是否逻辑删除
     * 表字段 : bus_take_goods.enabled
     */
    private Boolean enabled;

    /**
     * 备注
     * 表字段 : bus_take_goods.memo
     */
    private String memo;

    /**
     * 自提时间
     * 表字段 : bus_take_goods.created_time
     */
    private Date createdTime;

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Integer getLineNo() {
        return lineNo;
    }

    public void setLineNo(Integer lineNo) {
        this.lineNo = lineNo;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku == null ? null : sku.trim();
    }

    public BigDecimal getQty() {
        return qty;
    }

    public void setQty(BigDecimal qty) {
        this.qty = qty;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
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
}