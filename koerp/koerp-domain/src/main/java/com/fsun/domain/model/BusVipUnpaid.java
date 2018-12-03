package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusVipUnpaid {
    /**
     * 挂账支付Id
     * 表字段 : bus_vip_unpaid.unpaid_id
     */
    private String unpaidId;

    /**
     * 会员Id
     * 表字段 : bus_vip_unpaid.customer_code
     */
    private String customerCode;

    /**
     * 店仓编号
     * 表字段 : bus_vip_unpaid.shop_id
     */
    private String shopId;

    /**
     * 结款方式  1 银行卡，2 现金，3 支付宝，4 微信，5 会员(卡),6(券)，99 其他
     * 表字段 : bus_vip_unpaid.pay_mode
     */
    private Short payMode;

    /**
     * 交易类型  1 挂账，2 挂账结款 3会员卡消费 4会员卡充值
     * 表字段 : bus_vip_unpaid.trade_type
     */
    private Short tradeType;

    /**
     * 交易状态  1 交易成功，2 交易取消 
     * 表字段 : bus_vip_unpaid.trade_status
     */
    private Short tradeStatus;

    /**
     * 订单交易时间
     * 表字段 : bus_vip_unpaid.trade_time
     */
    private Date tradeTime;

    /**
     * 交易金额
     * 表字段 : bus_vip_unpaid.trade_price
     */
    private BigDecimal tradePrice;

    /**
     * 备注信息
     * 表字段 : bus_vip_unpaid.memo
     */
    private String memo;

    /**
     * 订单号
     * 表字段 : bus_vip_unpaid.order_id
     */
    private String orderId;

    /**
     * 创建时间
     * 表字段 : bus_vip_unpaid.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_vip_unpaid.updated_time
     */
    private Date updatedTime;

    /**
     * 
     * 表字段 : bus_vip_unpaid.card_no
     */
    private String cardNo;

    public String getUnpaidId() {
        return unpaidId;
    }

    public void setUnpaidId(String unpaidId) {
        this.unpaidId = unpaidId == null ? null : unpaidId.trim();
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode == null ? null : customerCode.trim();
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId == null ? null : shopId.trim();
    }

    public Short getPayMode() {
        return payMode;
    }

    public void setPayMode(Short payMode) {
        this.payMode = payMode;
    }

    public Short getTradeType() {
        return tradeType;
    }

    public void setTradeType(Short tradeType) {
        this.tradeType = tradeType;
    }

    public Short getTradeStatus() {
        return tradeStatus;
    }

    public void setTradeStatus(Short tradeStatus) {
        this.tradeStatus = tradeStatus;
    }

    public Date getTradeTime() {
        return tradeTime;
    }

    public void setTradeTime(Date tradeTime) {
        this.tradeTime = tradeTime;
    }

    public BigDecimal getTradePrice() {
        return tradePrice;
    }

    public void setTradePrice(BigDecimal tradePrice) {
        this.tradePrice = tradePrice;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
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

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo == null ? null : cardNo.trim();
    }
}