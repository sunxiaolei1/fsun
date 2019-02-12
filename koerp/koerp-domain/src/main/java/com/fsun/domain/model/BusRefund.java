package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusRefund {
    /**
     * 退货单号
     * 表字段 : bus_refund.refund_id
     */
    private String refundId;

    /**
     * 原订单号
     * 表字段 : bus_refund.order_id
     */
    private String orderId;

    /**
     * 外部订单号
     * 表字段 : bus_refund.ext_order_id
     */
    private String extOrderId;

    /**
     * 换发单号
     * 表字段 : bus_refund.barter_order_id
     */
    private String barterOrderId;

    /**
     * 买家id
     * 表字段 : bus_refund.buyer_id
     */
    private String buyerId;

    /**
     * 买家名称
     * 表字段 : bus_refund.buyer_name
     */
    private String buyerName;

    /**
     * 卖家id
     * 表字段 : bus_refund.seller_id
     */
    private String sellerId;

    /**
     * 卖家名称
     * 表字段 : bus_refund.seller_name
     */
    private String sellerName;

    /**
     * 店铺id
     * 表字段 : bus_refund.shop_id
     */
    private String shopId;

    /**
     * 店铺名称
     * 表字段 : bus_refund.shop_name
     */
    private String shopName;

    /**
     * 退换货类型  1->退货单 2->换退单
     * 表字段 : bus_refund.refund_type
     */
    private Short refundType;

    /**
     * 退单状态，1 已退货 未退款 ，2 已退货 已退款，3 退单完成， 4 退单取消
     * 表字段 : bus_refund.refund_status
     */
    private Short refundStatus;

    /**
     * 订单处理状态，0 未处理， 1 已处理
     * 表字段 : bus_refund.refund_order_status
     */
    private Short refundOrderStatus;

    /**
     * 退货款理由
     * 表字段 : bus_refund.reason
     */
    private String reason;

    /**
     * 退换货原因，枚举值 1-发错商品 2-无理由退换货 3-商品质量 4-收到实际商品与描述不符 5-配送产生问题 6-其他
     * 表字段 : bus_refund.refund_reason
     */
    private Short refundReason;

    /**
     * 退款金额
     * 表字段 : bus_refund.refund_price
     */
    private BigDecimal refundPrice;

    /**
     * 差异金额
     * 表字段 : bus_refund.diff_price
     */
    private BigDecimal diffPrice;

    /**
     * 变更金额
     * 表字段 : bus_refund.change_price
     */
    private BigDecimal changePrice;

    /**
     * 备注
     * 表字段 : bus_refund.memo
     */
    private String memo;

    /**
     * 是否有效订单
     * 表字段 : bus_refund.is_valid
     */
    private Boolean isValid;

    /**
     * 是否是整单退
     * 表字段 : bus_refund.all_return
     */
    private Boolean allReturn;

    /**
     * 处理时间
     * 表字段 : bus_refund.check_time
     */
    private Date checkTime;

    /**
     * 退款完成时间
     * 表字段 : bus_refund.refund_time
     */
    private Date refundTime;

    /**
     * 创建时间
     * 表字段 : bus_refund.created_time
     */
    private Date createdTime;

    /**
     * 创建人
     * 表字段 : bus_refund.created_name
     */
    private String createdName;

    /**
     * 更新时间
     * 表字段 : bus_refund.updated_time
     */
    private Date updatedTime;

    /**
     * 更新人
     * 表字段 : bus_refund.updated_name
     */
    private String updatedName;

    public String getRefundId() {
        return refundId;
    }

    public void setRefundId(String refundId) {
        this.refundId = refundId == null ? null : refundId.trim();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getExtOrderId() {
        return extOrderId;
    }

    public void setExtOrderId(String extOrderId) {
        this.extOrderId = extOrderId == null ? null : extOrderId.trim();
    }

    public String getBarterOrderId() {
        return barterOrderId;
    }

    public void setBarterOrderId(String barterOrderId) {
        this.barterOrderId = barterOrderId == null ? null : barterOrderId.trim();
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId == null ? null : buyerId.trim();
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName == null ? null : buyerName.trim();
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId == null ? null : sellerId.trim();
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName == null ? null : sellerName.trim();
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

    public Short getRefundType() {
        return refundType;
    }

    public void setRefundType(Short refundType) {
        this.refundType = refundType;
    }

    public Short getRefundStatus() {
        return refundStatus;
    }

    public void setRefundStatus(Short refundStatus) {
        this.refundStatus = refundStatus;
    }

    public Short getRefundOrderStatus() {
        return refundOrderStatus;
    }

    public void setRefundOrderStatus(Short refundOrderStatus) {
        this.refundOrderStatus = refundOrderStatus;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public Short getRefundReason() {
        return refundReason;
    }

    public void setRefundReason(Short refundReason) {
        this.refundReason = refundReason;
    }

    public BigDecimal getRefundPrice() {
        return refundPrice;
    }

    public void setRefundPrice(BigDecimal refundPrice) {
        this.refundPrice = refundPrice;
    }

    public BigDecimal getDiffPrice() {
        return diffPrice;
    }

    public void setDiffPrice(BigDecimal diffPrice) {
        this.diffPrice = diffPrice;
    }

    public BigDecimal getChangePrice() {
        return changePrice;
    }

    public void setChangePrice(BigDecimal changePrice) {
        this.changePrice = changePrice;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public Boolean getIsValid() {
        return isValid;
    }

    public void setIsValid(Boolean isValid) {
        this.isValid = isValid;
    }

    public Boolean getAllReturn() {
        return allReturn;
    }

    public void setAllReturn(Boolean allReturn) {
        this.allReturn = allReturn;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public Date getRefundTime() {
        return refundTime;
    }

    public void setRefundTime(Date refundTime) {
        this.refundTime = refundTime;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getCreatedName() {
        return createdName;
    }

    public void setCreatedName(String createdName) {
        this.createdName = createdName == null ? null : createdName.trim();
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public String getUpdatedName() {
        return updatedName;
    }

    public void setUpdatedName(String updatedName) {
        this.updatedName = updatedName == null ? null : updatedName.trim();
    }
}