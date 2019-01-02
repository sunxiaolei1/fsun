package com.fsun.domain.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.fsun.domain.common.BaseOrderCondition;

/**
 * @author fsun
 * @date 2018年12月24日
 */
public class BusOrderCondition extends BaseOrderCondition {

	/**
     * 订单id
     * 表字段 : bus_order.order_id
     */
    private String orderId;

    /**
     * 订单类型 1 pos销售订单，2 盘亏出库，3 外卖销售订单
     * 表字段 : bus_order.order_type
     */
    private Short orderType;

    /**
     * 付款方式 1->在线付款  2->货到付款,3 挂账
     * 表字段 : bus_order.pay_type
     */
    private Short payType;

    /**
     * 对接平台订单id
     * 表字段 : bus_order.sys_order_id
     */
    private String sysOrderId;

    /**
     * 第三方平台订单id
     * 表字段 : bus_order.ext_order_id
     */
    private String extOrderId;

    /**
     * pos编号
     * 表字段 : bus_order.pos_no
     */
    private String posNo;

    /**
     * 卡类别
     * 表字段 : bus_order.card_type
     */
    private String cardType;

    /**
     * 买家id
     * 表字段 : bus_order.buyer_id
     */
    private String buyerId;

    /**
     * 买家名称
     * 表字段 : bus_order.buyer_name
     */
    private String buyerName;

    /**
     * 经办人编码
     * 表字段 : bus_order.carrier_id
     */
    private String carrierId;

    /**
     * 经办人名称
     * 表字段 : bus_order.carrier_name
     */
    private String carrierName;

    /**
     * 平台id
     * 表字段 : bus_order.plat_id
     */
    private String platId;

    /**
     * 平台
     * 表字段 : bus_order.plat_name
     */
    private String platName;

    /**
     * 平台店铺id
     * 表字段 : bus_order.plat_shop_id
     */
    private String platShopId;

    /**
     * 店铺id
     * 表字段 : bus_order.shop_id
     */
    private String shopId;

    /**
     * 店铺名称
     * 表字段 : bus_order.shop_name
     */
    private String shopName;

    /**
     * 交易来源 wap,app,pc,pos
     * 表字段 : bus_order.trade_from
     */
    private String tradeFrom;

    /**
     * 交易状态[00 已下单，10 已付款，20 已发货，30 交易成功，40 订单取消，60 交易关闭]
     * 表字段 : bus_order.trade_status
     */
    private String tradeStatus;

    /**
     * 订单状态[0 未确认，1 已确认，2已接配送，3已取餐，4已配送成功，5已完结，6已取消]
     * 表字段 : bus_order.order_status
     */
    private String orderStatus;

    /**
     * 退款状态[05 申请取消单,10 申请退款,15 同意取消单,20 同意退款, 25 拒绝取消单,30  拒绝退款, 35 取消单完成,40  退款完成,45 申请取消单取消,50 申请退单取消]
     * 表字段 : bus_order.refund_status
     */
    private String refundStatus;

    /**
     * 退款时间
     * 表字段 : bus_order.refund_time
     */
    private Date refundTime;

    /**
     * 发起退单（退货）角色：1下单用户，2外卖平台系统，3商户，4外卖平台客服，5其他
     * 表字段 : bus_order.refund_sponsor
     */
    private Integer refundSponsor;

    /**
     * 退单类型[0,取消单；1.退单]
     * 表字段 : bus_order.refund_type
     */
    private Integer refundType;

    /**
     * 取消或退单原因
     * 表字段 : bus_order.refund_reason
     */
    private String refundReason;

    /**
     * 流转状态 00 创建，30 出库，40 完成,99 已回传
     * 表字段 : bus_order.flow_status
     */
    private String flowStatus;

    /**
     * 是否有效订单
     * 表字段 : bus_order.is_valid
     */
    private Boolean isValid;

    /**
     * 订单原价
     * 表字段 : bus_order.origin_price
     */
    private BigDecimal originPrice;

    /**
     * 订单总金额
     * 表字段 : bus_order.order_price
     */
    private BigDecimal orderPrice;

    /**
     * 订单运费
     * 表字段 : bus_order.ship_price
     */
    private BigDecimal shipPrice;
    
    /**
     * 表字段 : bus_order.coupon_price
	 * 商品优惠
	 */
    private BigDecimal couponPrice;

    /**
     * 优惠金额
     * 表字段 : bus_order.discount_price
     */
    private BigDecimal discountPrice;

    /**
     * 抹零金额
     * 表字段 : bus_order.to_zero_price
     */
    private BigDecimal toZeroPrice;

    /**
     * 实付款
     * 表字段 : bus_order.pay_price
     */
    private BigDecimal payPrice;

    /**
     * 找零金额
     * 表字段 : bus_order.dib_price
     */
    private BigDecimal dibPrice;

    /**
     * 订单应收款  
     * 表字段 : bus_order.recept_price
     */
    private BigDecimal receptPrice;

    /**
     * 打包费
     * 表字段 : bus_order.package_price
     */
    private BigDecimal packagePrice;

    /**
     * 积分
     * 表字段 : bus_order.point_fee
     */
    private Integer pointFee;

    /**
     * 红包金额
     * 表字段 : bus_order.bonus_price
     */
    private BigDecimal bonusPrice;

    /**
     * 佣金
     * 表字段 : bus_order.rate_price
     */
    private BigDecimal ratePrice;

    /**
     * 是否已结算 0 未结算，1 已生成结算单
     * 表字段 : bus_order.is_settlemented
     */
    private Boolean isSettlemented;

    /**
     * 收件人名称
     * 表字段 : bus_order.receive_name
     */
    private String receiveName;

    /**
     * 省id
     * 表字段 : bus_order.province_id
     */
    private String provinceId;

    /**
     * 省
     * 表字段 : bus_order.province
     */
    private String province;

    /**
     * 市id
     * 表字段 : bus_order.city_id
     */
    private String cityId;

    /**
     * 市
     * 表字段 : bus_order.city
     */
    private String city;

    /**
     * 区id
     * 表字段 : bus_order.district_id
     */
    private String districtId;

    /**
     * 区
     * 表字段 : bus_order.district
     */
    private String district;

    /**
     * 街道(地址)
     * 表字段 : bus_order.address
     */
    private String address;

    /**
     * 地址经度
     * 表字段 : bus_order.longitude_address
     */
    private String longitudeAddress;

    /**
     * 地址维度
     * 表字段 : bus_order.latitude_address
     */
    private String latitudeAddress;

    /**
     * 手机
     * 表字段 : bus_order.mobile
     */
    private String mobile;

    /**
     * 邮编
     * 表字段 : bus_order.zip_code
     */
    private String zipCode;

    /**
     * 订单备注
     * 表字段 : bus_order.memo
     */
    private String memo;

    /**
     * 买家留言
     * 表字段 : bus_order.buyer_notes
     */
    private String buyerNotes;

    /**
     * 卖家留言
     * 表字段 : bus_order.seller_notes
     */
    private String sellerNotes;

    /**
     * 是否开票[0 不开票，1 开票]
     * 表字段 : bus_order.is_invoice
     */
    private Boolean isInvoice;

    /**
     * 是否货票同行[0 不同行，1 同行]
     * 表字段 : bus_order.is_trave
     */
    private Boolean isTrave;

    /**
     * 发票类型[0 普通发票，1 增值发票]
     * 表字段 : bus_order.invoice_type
     */
    private Short invoiceType;

    /**
     * 发票抬头
     * 表字段 : bus_order.invoice_title
     */
    private String invoiceTitle;

    /**
     * 发票内容
     * 表字段 : bus_order.invoice_content
     */
    private String invoiceContent;

    /**
     * 下单时间
     * 表字段 : bus_order.order_time
     */
    private Date orderTime;

    /**
     * 付款时间
     * 表字段 : bus_order.pay_time
     */
    private Date payTime;

    /**
     * 发货时间
     * 表字段 : bus_order.delivery_time
     */
    private Date deliveryTime;

    /**
     * 订单确认时间
     * 表字段 : bus_order.confirm_time
     */
    private Date confirmTime;

    /**
     * 打印次数
     * 表字段 : bus_order.print_count
     */
    private Integer printCount;

    /**
     * 收银员id
     * 表字段 : bus_order.cash_id
     */
    private String cashId;

    /**
     * 收银员
     * 表字段 : bus_order.cash_name
     */
    private String cashName;

    /**
     * 日结时间
     * 表字段 : bus_order.settle_time
     */
    private Date settleTime;

    /**
     * 班次
     * 表字段 : bus_order.shift
     */
    private Short shift;

    /**
     * 读取标志(0: 未读；1已读；2：更新后待读)
     * 表字段 : bus_order.is_read
     */
    private Short isRead;

    /**
     * 创建时间
     * 表字段 : bus_order.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_order.updated_time
     */
    private Date updatedTime;

    /**
     * 
     * 表字段 : bus_order.updated_name
     */
    private String updatedName;

    /**
     * 
     * 表字段 : bus_order.created_name
     */
    private String createdName;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Short getOrderType() {
        return orderType;
    }

    public void setOrderType(Short orderType) {
        this.orderType = orderType;
    }

    public Short getPayType() {
        return payType;
    }

    public void setPayType(Short payType) {
        this.payType = payType;
    }

    public String getSysOrderId() {
        return sysOrderId;
    }

    public void setSysOrderId(String sysOrderId) {
        this.sysOrderId = sysOrderId == null ? null : sysOrderId.trim();
    }

    public String getExtOrderId() {
        return extOrderId;
    }

    public void setExtOrderId(String extOrderId) {
        this.extOrderId = extOrderId == null ? null : extOrderId.trim();
    }

    public String getPosNo() {
        return posNo;
    }

    public void setPosNo(String posNo) {
        this.posNo = posNo == null ? null : posNo.trim();
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType == null ? null : cardType.trim();
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

    public String getCarrierId() {
        return carrierId;
    }

    public void setCarrierId(String carrierId) {
        this.carrierId = carrierId == null ? null : carrierId.trim();
    }

    public String getCarrierName() {
        return carrierName;
    }

    public void setCarrierName(String carrierName) {
        this.carrierName = carrierName == null ? null : carrierName.trim();
    }

    public String getPlatId() {
        return platId;
    }

    public void setPlatId(String platId) {
        this.platId = platId == null ? null : platId.trim();
    }

    public String getPlatName() {
        return platName;
    }

    public void setPlatName(String platName) {
        this.platName = platName == null ? null : platName.trim();
    }

    public String getPlatShopId() {
        return platShopId;
    }

    public void setPlatShopId(String platShopId) {
        this.platShopId = platShopId == null ? null : platShopId.trim();
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

    public String getTradeFrom() {
        return tradeFrom;
    }

    public void setTradeFrom(String tradeFrom) {
        this.tradeFrom = tradeFrom == null ? null : tradeFrom.trim();
    }

    public String getTradeStatus() {
        return tradeStatus;
    }

    public void setTradeStatus(String tradeStatus) {
        this.tradeStatus = tradeStatus == null ? null : tradeStatus.trim();
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus == null ? null : orderStatus.trim();
    }

    public String getRefundStatus() {
        return refundStatus;
    }

    public void setRefundStatus(String refundStatus) {
        this.refundStatus = refundStatus == null ? null : refundStatus.trim();
    }

    public Date getRefundTime() {
        return refundTime;
    }

    public void setRefundTime(Date refundTime) {
        this.refundTime = refundTime;
    }

    public Integer getRefundSponsor() {
        return refundSponsor;
    }

    public void setRefundSponsor(Integer refundSponsor) {
        this.refundSponsor = refundSponsor;
    }

    public Integer getRefundType() {
        return refundType;
    }

    public void setRefundType(Integer refundType) {
        this.refundType = refundType;
    }

    public String getRefundReason() {
        return refundReason;
    }

    public void setRefundReason(String refundReason) {
        this.refundReason = refundReason == null ? null : refundReason.trim();
    }

    public String getFlowStatus() {
        return flowStatus;
    }

    public void setFlowStatus(String flowStatus) {
        this.flowStatus = flowStatus == null ? null : flowStatus.trim();
    }

    public Boolean getIsValid() {
        return isValid;
    }

    public void setIsValid(Boolean isValid) {
        this.isValid = isValid;
    }

    public BigDecimal getOriginPrice() {
        return originPrice;
    }

    public void setOriginPrice(BigDecimal originPrice) {
        this.originPrice = originPrice;
    }

    public BigDecimal getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(BigDecimal orderPrice) {
        this.orderPrice = orderPrice;
    }

    public BigDecimal getShipPrice() {
        return shipPrice;
    }

    public void setShipPrice(BigDecimal shipPrice) {
        this.shipPrice = shipPrice;
    }

    public BigDecimal getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(BigDecimal discountPrice) {
        this.discountPrice = discountPrice;
    }

    public BigDecimal getToZeroPrice() {
        return toZeroPrice;
    }

    public void setToZeroPrice(BigDecimal toZeroPrice) {
        this.toZeroPrice = toZeroPrice;
    }

    public BigDecimal getPayPrice() {
        return payPrice;
    }

    public void setPayPrice(BigDecimal payPrice) {
        this.payPrice = payPrice;
    }

    public BigDecimal getDibPrice() {
        return dibPrice;
    }

    public void setDibPrice(BigDecimal dibPrice) {
        this.dibPrice = dibPrice;
    }

    public BigDecimal getReceptPrice() {
        return receptPrice;
    }

    public void setReceptPrice(BigDecimal receptPrice) {
        this.receptPrice = receptPrice;
    }

    public BigDecimal getPackagePrice() {
        return packagePrice;
    }

    public void setPackagePrice(BigDecimal packagePrice) {
        this.packagePrice = packagePrice;
    }

    public Integer getPointFee() {
        return pointFee;
    }

    public void setPointFee(Integer pointFee) {
        this.pointFee = pointFee;
    }

    public BigDecimal getBonusPrice() {
        return bonusPrice;
    }

    public void setBonusPrice(BigDecimal bonusPrice) {
        this.bonusPrice = bonusPrice;
    }

    public BigDecimal getRatePrice() {
        return ratePrice;
    }

    public void setRatePrice(BigDecimal ratePrice) {
        this.ratePrice = ratePrice;
    }

    public Boolean getIsSettlemented() {
        return isSettlemented;
    }

    public void setIsSettlemented(Boolean isSettlemented) {
        this.isSettlemented = isSettlemented;
    }

    public String getReceiveName() {
        return receiveName;
    }

    public void setReceiveName(String receiveName) {
        this.receiveName = receiveName == null ? null : receiveName.trim();
    }

    public String getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(String provinceId) {
        this.provinceId = provinceId == null ? null : provinceId.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId == null ? null : cityId.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getDistrictId() {
        return districtId;
    }

    public void setDistrictId(String districtId) {
        this.districtId = districtId == null ? null : districtId.trim();
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district == null ? null : district.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getLongitudeAddress() {
        return longitudeAddress;
    }

    public void setLongitudeAddress(String longitudeAddress) {
        this.longitudeAddress = longitudeAddress == null ? null : longitudeAddress.trim();
    }

    public String getLatitudeAddress() {
        return latitudeAddress;
    }

    public void setLatitudeAddress(String latitudeAddress) {
        this.latitudeAddress = latitudeAddress == null ? null : latitudeAddress.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode == null ? null : zipCode.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getBuyerNotes() {
        return buyerNotes;
    }

    public void setBuyerNotes(String buyerNotes) {
        this.buyerNotes = buyerNotes == null ? null : buyerNotes.trim();
    }

    public String getSellerNotes() {
        return sellerNotes;
    }

    public void setSellerNotes(String sellerNotes) {
        this.sellerNotes = sellerNotes == null ? null : sellerNotes.trim();
    }

    public Boolean getIsInvoice() {
        return isInvoice;
    }

    public void setIsInvoice(Boolean isInvoice) {
        this.isInvoice = isInvoice;
    }

    public Boolean getIsTrave() {
        return isTrave;
    }

    public void setIsTrave(Boolean isTrave) {
        this.isTrave = isTrave;
    }

    public Short getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(Short invoiceType) {
        this.invoiceType = invoiceType;
    }

    public String getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(String invoiceTitle) {
        this.invoiceTitle = invoiceTitle == null ? null : invoiceTitle.trim();
    }

    public String getInvoiceContent() {
        return invoiceContent;
    }

    public void setInvoiceContent(String invoiceContent) {
        this.invoiceContent = invoiceContent == null ? null : invoiceContent.trim();
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public Date getConfirmTime() {
        return confirmTime;
    }

    public void setConfirmTime(Date confirmTime) {
        this.confirmTime = confirmTime;
    }

    public Integer getPrintCount() {
        return printCount;
    }

    public void setPrintCount(Integer printCount) {
        this.printCount = printCount;
    }

    public String getCashId() {
        return cashId;
    }

    public void setCashId(String cashId) {
        this.cashId = cashId == null ? null : cashId.trim();
    }

    public String getCashName() {
        return cashName;
    }

    public void setCashName(String cashName) {
        this.cashName = cashName == null ? null : cashName.trim();
    }

    public Date getSettleTime() {
        return settleTime;
    }

    public void setSettleTime(Date settleTime) {
        this.settleTime = settleTime;
    }

    public Short getShift() {
        return shift;
    }

    public void setShift(Short shift) {
        this.shift = shift;
    }

    public Short getIsRead() {
        return isRead;
    }

    public void setIsRead(Short isRead) {
        this.isRead = isRead;
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

    public String getUpdatedName() {
        return updatedName;
    }

    public void setUpdatedName(String updatedName) {
        this.updatedName = updatedName == null ? null : updatedName.trim();
    }

    public String getCreatedName() {
        return createdName;
    }

    public void setCreatedName(String createdName) {
        this.createdName = createdName == null ? null : createdName.trim();
    }

	/**
	 * @return the couponPrice
	 */
	public BigDecimal getCouponPrice() {
		return couponPrice;
	}

	/**
	 * @param couponPrice the couponPrice to set
	 */
	public void setCouponPrice(BigDecimal couponPrice) {
		this.couponPrice = couponPrice;
	}

}
