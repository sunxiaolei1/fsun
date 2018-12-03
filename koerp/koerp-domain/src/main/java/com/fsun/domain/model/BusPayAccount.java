package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusPayAccount {
    /**
     * 支付Id
     * 表字段 : bus_pay_account.pay_id
     */
    private String payId;

    /**
     * 行号 赠送的顺序号在后边
     * 表字段 : bus_pay_account.line_no
     */
    private Integer lineNo;

    /**
     * 会员id
     * 表字段 : bus_pay_account.vip_id
     */
    private String vipId;

    /**
     * 店铺id
     * 表字段 : bus_pay_account.shop_id
     */
    private String shopId;

    /**
     * 店铺名
     * 表字段 : bus_pay_account.shop_name
     */
    private String shopName;

    /**
     * 卡号
     * 表字段 : bus_pay_account.card_no
     */
    private String cardNo;

    /**
     * 支付方式 1 银行卡，2 现金，3 支付宝，4 微信，5 会员(卡)，6 券, 7 挂账, 99 其他
     * 表字段 : bus_pay_account.pay_mode
     */
    private Short payMode;

    /**
     * 支付类型  1 充值，2 消费，3 退款 4 充值撤销,5 赠送
     * 表字段 : bus_pay_account.pay_type
     */
    private Short payType;

    /**
     * 积分
     * 表字段 : bus_pay_account.point_fee
     */
    private BigDecimal pointFee;

    /**
     * 银行账户名称
     * 表字段 : bus_pay_account.bank_account_name
     */
    private String bankAccountName;

    /**
     * 银行账户
     * 表字段 : bus_pay_account.bank_account_no
     */
    private String bankAccountNo;

    /**
     * 银行名
     * 表字段 : bus_pay_account.bank_name
     */
    private String bankName;

    /**
     * 买家姓名
     * 表字段 : bus_pay_account.buyer_name
     */
    private String buyerName;

    /**
     * 买家账户
     * 表字段 : bus_pay_account.buyer_account
     */
    private String buyerAccount;

    /**
     * 实付款 不一定存在，实际掏的金额
     * 表字段 : bus_pay_account.pay_price
     */
    private BigDecimal payPrice;

    /**
     * 应收款   必须有值
     * 表字段 : bus_pay_account.recept_price
     */
    private BigDecimal receptPrice;

    /**
     * 找零金额
     * 表字段 : bus_pay_account.dib_price
     */
    private BigDecimal dibPrice;

    /**
     * 溢收金额
     * 表字段 : bus_pay_account.over_amount
     */
    private BigDecimal overAmount;

    /**
     * 优惠金额  赠送金
     * 表字段 : bus_pay_account.discount_amount
     */
    private BigDecimal discountAmount;

    /**
     * 货币代码(人民币 CNY)
     * 表字段 : bus_pay_account.currency
     */
    private String currency;

    /**
     * 充值网银流水
     * 表字段 : bus_pay_account.deposit_bank_no
     */
    private String depositBankNo;

    /**
     * 帐务流水
     * 表字段 : bus_pay_account.account_log_id
     */
    private String accountLogId;

    /**
     * 备注信息
     * 表字段 : bus_pay_account.memo
     */
    private String memo;

    /**
     * 交易编号（订单号）
     * 表字段 : bus_pay_account.order_id
     */
    private String orderId;

    /**
     * 帐务对方邮箱
     * 表字段 : bus_pay_account.other_account_email
     */
    private String otherAccountEmail;

    /**
     * 帐务对方全称
     * 表字段 : bus_pay_account.other_account_fullname
     */
    private String otherAccountFullname;

    /**
     * 帐务对方支付宝用户号
     * 表字段 : bus_pay_account.other_user_id
     */
    private String otherUserId;

    /**
     * 合作者身份id
     * 表字段 : bus_pay_account.partner_id
     */
    private String partnerId;

    /**
     * 卖家支付宝人民币支付帐号
     * 表字段 : bus_pay_account.seller_account
     */
    private String sellerAccount;

    /**
     * 卖家姓名
     * 表字段 : bus_pay_account.seller_name
     */
    private String sellerName;

    /**
     * 支付宝交易流水
     * 表字段 : bus_pay_account.trade_no
     */
    private String tradeNo;

    /**
     * 退款金额
     * 表字段 : bus_pay_account.trade_refund_amount
     */
    private BigDecimal tradeRefundAmount;

    /**
     * 帐务本方支付宝人民币资金帐号(user_id+0156)
     * 表字段 : bus_pay_account.trans_account
     */
    private String transAccount;

    /**
     * 收银员
     * 表字段 : bus_pay_account.cash_name
     */
    private String cashName;

    /**
     * 业务类型
     * 表字段 : bus_pay_account.trans_code_msg
     */
    private String transCodeMsg;

    /**
     * 交易时间
     * 表字段 : bus_pay_account.trade_time
     */
    private Date tradeTime;

    /**
     * 原订单号
     * 表字段 : bus_pay_account.src_order_id
     */
    private String srcOrderId;

    /**
     * 原第三方支付流水号
     * 表字段 : bus_pay_account.src_trade_no
     */
    private String srcTradeNo;

    /**
     * 原账单号
     * 表字段 : bus_pay_account.src_pay_id
     */
    private String srcPayId;

    /**
     * 活动ID
     * 表字段 : bus_pay_account.activity_id
     */
    private String activityId;

    /**
     * 同步状态 00 未同步，99 已同步
     * 表字段 : bus_pay_account.flow_status
     */
    private String flowStatus;

    /**
     * 创建时间
     * 表字段 : bus_pay_account.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_pay_account.updated_time
     */
    private Date updatedTime;

    public String getPayId() {
        return payId;
    }

    public void setPayId(String payId) {
        this.payId = payId == null ? null : payId.trim();
    }

    public Integer getLineNo() {
        return lineNo;
    }

    public void setLineNo(Integer lineNo) {
        this.lineNo = lineNo;
    }

    public String getVipId() {
        return vipId;
    }

    public void setVipId(String vipId) {
        this.vipId = vipId == null ? null : vipId.trim();
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

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo == null ? null : cardNo.trim();
    }

    public Short getPayMode() {
        return payMode;
    }

    public void setPayMode(Short payMode) {
        this.payMode = payMode;
    }

    public Short getPayType() {
        return payType;
    }

    public void setPayType(Short payType) {
        this.payType = payType;
    }

    public BigDecimal getPointFee() {
        return pointFee;
    }

    public void setPointFee(BigDecimal pointFee) {
        this.pointFee = pointFee;
    }

    public String getBankAccountName() {
        return bankAccountName;
    }

    public void setBankAccountName(String bankAccountName) {
        this.bankAccountName = bankAccountName == null ? null : bankAccountName.trim();
    }

    public String getBankAccountNo() {
        return bankAccountNo;
    }

    public void setBankAccountNo(String bankAccountNo) {
        this.bankAccountNo = bankAccountNo == null ? null : bankAccountNo.trim();
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName == null ? null : bankName.trim();
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName == null ? null : buyerName.trim();
    }

    public String getBuyerAccount() {
        return buyerAccount;
    }

    public void setBuyerAccount(String buyerAccount) {
        this.buyerAccount = buyerAccount == null ? null : buyerAccount.trim();
    }

    public BigDecimal getPayPrice() {
        return payPrice;
    }

    public void setPayPrice(BigDecimal payPrice) {
        this.payPrice = payPrice;
    }

    public BigDecimal getReceptPrice() {
        return receptPrice;
    }

    public void setReceptPrice(BigDecimal receptPrice) {
        this.receptPrice = receptPrice;
    }

    public BigDecimal getDibPrice() {
        return dibPrice;
    }

    public void setDibPrice(BigDecimal dibPrice) {
        this.dibPrice = dibPrice;
    }

    public BigDecimal getOverAmount() {
        return overAmount;
    }

    public void setOverAmount(BigDecimal overAmount) {
        this.overAmount = overAmount;
    }

    public BigDecimal getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(BigDecimal discountAmount) {
        this.discountAmount = discountAmount;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency == null ? null : currency.trim();
    }

    public String getDepositBankNo() {
        return depositBankNo;
    }

    public void setDepositBankNo(String depositBankNo) {
        this.depositBankNo = depositBankNo == null ? null : depositBankNo.trim();
    }

    public String getAccountLogId() {
        return accountLogId;
    }

    public void setAccountLogId(String accountLogId) {
        this.accountLogId = accountLogId == null ? null : accountLogId.trim();
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

    public String getOtherAccountEmail() {
        return otherAccountEmail;
    }

    public void setOtherAccountEmail(String otherAccountEmail) {
        this.otherAccountEmail = otherAccountEmail == null ? null : otherAccountEmail.trim();
    }

    public String getOtherAccountFullname() {
        return otherAccountFullname;
    }

    public void setOtherAccountFullname(String otherAccountFullname) {
        this.otherAccountFullname = otherAccountFullname == null ? null : otherAccountFullname.trim();
    }

    public String getOtherUserId() {
        return otherUserId;
    }

    public void setOtherUserId(String otherUserId) {
        this.otherUserId = otherUserId == null ? null : otherUserId.trim();
    }

    public String getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(String partnerId) {
        this.partnerId = partnerId == null ? null : partnerId.trim();
    }

    public String getSellerAccount() {
        return sellerAccount;
    }

    public void setSellerAccount(String sellerAccount) {
        this.sellerAccount = sellerAccount == null ? null : sellerAccount.trim();
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName == null ? null : sellerName.trim();
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo == null ? null : tradeNo.trim();
    }

    public BigDecimal getTradeRefundAmount() {
        return tradeRefundAmount;
    }

    public void setTradeRefundAmount(BigDecimal tradeRefundAmount) {
        this.tradeRefundAmount = tradeRefundAmount;
    }

    public String getTransAccount() {
        return transAccount;
    }

    public void setTransAccount(String transAccount) {
        this.transAccount = transAccount == null ? null : transAccount.trim();
    }

    public String getCashName() {
        return cashName;
    }

    public void setCashName(String cashName) {
        this.cashName = cashName == null ? null : cashName.trim();
    }

    public String getTransCodeMsg() {
        return transCodeMsg;
    }

    public void setTransCodeMsg(String transCodeMsg) {
        this.transCodeMsg = transCodeMsg == null ? null : transCodeMsg.trim();
    }

    public Date getTradeTime() {
        return tradeTime;
    }

    public void setTradeTime(Date tradeTime) {
        this.tradeTime = tradeTime;
    }

    public String getSrcOrderId() {
        return srcOrderId;
    }

    public void setSrcOrderId(String srcOrderId) {
        this.srcOrderId = srcOrderId == null ? null : srcOrderId.trim();
    }

    public String getSrcTradeNo() {
        return srcTradeNo;
    }

    public void setSrcTradeNo(String srcTradeNo) {
        this.srcTradeNo = srcTradeNo == null ? null : srcTradeNo.trim();
    }

    public String getSrcPayId() {
        return srcPayId;
    }

    public void setSrcPayId(String srcPayId) {
        this.srcPayId = srcPayId == null ? null : srcPayId.trim();
    }

    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    public String getFlowStatus() {
        return flowStatus;
    }

    public void setFlowStatus(String flowStatus) {
        this.flowStatus = flowStatus == null ? null : flowStatus.trim();
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