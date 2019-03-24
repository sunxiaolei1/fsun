package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class DocAsnHeader {
    /**
     * 入库单编号
     * 表字段 : doc_asn_header.asn_no
     */
    private String asnNo;

    /**
     * 外部订单id
     * 表字段 : doc_asn_header.ext_order_no
     */
    private String extOrderNo;

    /**
     * 发货时间
     * 表字段 : doc_asn_header.delivery_time
     */
    private Date deliveryTime;

    /**
     * 审核人id
     * 表字段 : doc_asn_header.check_user_id
     */
    private String checkUserId;

    /**
     * 审核人
     * 表字段 : doc_asn_header.check_name
     */
    private String checkName;

    /**
     * 审核状态 00 未签收，10 已签收
     * 表字段 : doc_asn_header.check_status
     */
    private String checkStatus;

    /**
     * 关联要货单号
     * 表字段 : doc_asn_header.po_no
     */
    private String poNo;

    /**
     * 关联出库单号
     * 表字段 : doc_asn_header.order_no
     */
    private String orderNo;

    /**
     * 单据类型
     * 表字段 : doc_asn_header.asn_type
     */
    private String asnType;

    /**
     * 单据状态
     * 表字段 : doc_asn_header.asn_status
     */
    private String asnStatus;

    /**
     * 单据来源
     * 表字段 : doc_asn_header.asn_source
     */
    private String asnSource;

    /**
     * 订单总金额
     * 表字段 : doc_asn_header.order_price
     */
    private BigDecimal orderPrice;

    /**
     * 收货店仓id
     * 表字段 : doc_asn_header.to_shop_id
     */
    private String toShopId;

    /**
     * 收货店仓名称
     * 表字段 : doc_asn_header.to_shop_name
     */
    private String toShopName;

    /**
     * 发货店仓id
     * 表字段 : doc_asn_header.from_shop_id
     */
    private String fromShopId;

    /**
     * 发货店仓名称
     * 表字段 : doc_asn_header.from_shop_name
     */
    private String fromShopName;

    /**
     * 预期到货时间
     * 表字段 : doc_asn_header.expected_time
     */
    private Date expectedTime;

    /**
     * 体积
     * 表字段 : doc_asn_header.volume
     */
    private BigDecimal volume;

    /**
     * 备注
     * 表字段 : doc_asn_header.memo
     */
    private String memo;

    /**
     * 承运人id
     * 表字段 : doc_asn_header.carrier_id
     */
    private String carrierId;

    /**
     * 承运人姓名
     * 表字段 : doc_asn_header.carrier_name
     */
    private String carrierName;

    /**
     * 装货地
     * 表字段 : doc_asn_header.place_loading
     */
    private String placeLoading;

    /**
     * 卸货地
     * 表字段 : doc_asn_header.place_discharge
     */
    private String placeDischarge;

    /**
     * 付款条款
     * 表字段 : doc_asn_header.pay_terms
     */
    private String payTerms;

    /**
     * 交付条款
     * 表字段 : doc_asn_header.delivery_terms
     */
    private String deliveryTerms;

    /**
     * 描述
     * 表字段 : doc_asn_header.descr
     */
    private String descr;

    /**
     * 车号
     * 表字段 : doc_asn_header.vehicle_no
     */
    private String vehicleNo;

    /**
     * 地址
     * 表字段 : doc_asn_header.address
     */
    private String address;

    /**
     * 手机
     * 表字段 : doc_asn_header.mobile
     */
    private String mobile;

    /**
     * 用户自定义1(用于记录调拨退货入库单号)
     * 表字段 : doc_asn_header.user_define1
     */
    private String userDefine1;

    /**
     * 用户自定义2
     * 表字段 : doc_asn_header.user_define2
     */
    private String userDefine2;

    /**
     * 用户自定义3
     * 表字段 : doc_asn_header.user_define3
     */
    private String userDefine3;

    /**
     * 邮编
     * 表字段 : doc_asn_header.zip_code
     */
    private String zipCode;

    /**
     * 供应商id
     * 表字段 : doc_asn_header.supplier_id
     */
    private String supplierId;

    /**
     * 供应商名称
     * 表字段 : doc_asn_header.supplier_name
     */
    private String supplierName;

    /**
     * 供应商地址
     * 表字段 : doc_asn_header.supplier_address
     */
    private String supplierAddress;

    /**
     * 供应商邮编
     * 表字段 : doc_asn_header.supplier_zip_code
     */
    private String supplierZipCode;

    /**
     * 供应商联系人
     * 表字段 : doc_asn_header.supplier_contact
     */
    private String supplierContact;

    /**
     * 供应商电话
     * 表字段 : doc_asn_header.supplier_tel
     */
    private String supplierTel;

    /**
     * 下单人id
     * 表字段 : doc_asn_header.i_id
     */
    private String iId;

    /**
     * 下单人名称
     * 表字段 : doc_asn_header.i_name
     */
    private String iName;

    /**
     * 下单人地址
     * 表字段 : doc_asn_header.i_address
     */
    private String iAddress;

    /**
     * 下单人邮编
     * 表字段 : doc_asn_header.i_zip_code
     */
    private String iZipCode;

    /**
     * 下单人联系人
     * 表字段 : doc_asn_header.i_contact
     */
    private String iContact;

    /**
     * 下单人电话
     * 表字段 : doc_asn_header.i_tel
     */
    private String iTel;

    /**
     * 交付时间
     * 表字段 : doc_asn_header.receiving_Time
     */
    private Date receivingTime;

    /**
     * 创建人
     * 表字段 : doc_asn_header.created_name
     */
    private String createdName;

    /**
     * 创建时间
     * 表字段 : doc_asn_header.created_time
     */
    private Date createdTime;

    /**
     * 更新人
     * 表字段 : doc_asn_header.updated_name
     */
    private String updatedName;

    /**
     * 更新时间
     * 表字段 : doc_asn_header.updated_time
     */
    private Date updatedTime;
    
    /**
     * 打印次数
     */
    private Integer printCount;

    public String getAsnNo() {
        return asnNo;
    }

    public void setAsnNo(String asnNo) {
        this.asnNo = asnNo == null ? null : asnNo.trim();
    }

    public String getExtOrderNo() {
        return extOrderNo;
    }

    public void setExtOrderNo(String extOrderNo) {
        this.extOrderNo = extOrderNo == null ? null : extOrderNo.trim();
    }

    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getCheckUserId() {
        return checkUserId;
    }

    public void setCheckUserId(String checkUserId) {
        this.checkUserId = checkUserId == null ? null : checkUserId.trim();
    }

    public String getCheckName() {
        return checkName;
    }

    public void setCheckName(String checkName) {
        this.checkName = checkName == null ? null : checkName.trim();
    }

    public String getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(String checkStatus) {
        this.checkStatus = checkStatus == null ? null : checkStatus.trim();
    }

    public String getPoNo() {
        return poNo;
    }

    public void setPoNo(String poNo) {
        this.poNo = poNo == null ? null : poNo.trim();
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public String getAsnType() {
        return asnType;
    }

    public void setAsnType(String asnType) {
        this.asnType = asnType == null ? null : asnType.trim();
    }

    public String getAsnStatus() {
        return asnStatus;
    }

    public void setAsnStatus(String asnStatus) {
        this.asnStatus = asnStatus == null ? null : asnStatus.trim();
    }

    public String getAsnSource() {
        return asnSource;
    }

    public void setAsnSource(String asnSource) {
        this.asnSource = asnSource == null ? null : asnSource.trim();
    }

    public BigDecimal getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(BigDecimal orderPrice) {
        this.orderPrice = orderPrice;
    }

    public String getToShopId() {
        return toShopId;
    }

    public void setToShopId(String toShopId) {
        this.toShopId = toShopId == null ? null : toShopId.trim();
    }

    public String getToShopName() {
        return toShopName;
    }

    public void setToShopName(String toShopName) {
        this.toShopName = toShopName == null ? null : toShopName.trim();
    }

    public String getFromShopId() {
        return fromShopId;
    }

    public void setFromShopId(String fromShopId) {
        this.fromShopId = fromShopId == null ? null : fromShopId.trim();
    }

    public String getFromShopName() {
        return fromShopName;
    }

    public void setFromShopName(String fromShopName) {
        this.fromShopName = fromShopName == null ? null : fromShopName.trim();
    }

    public Date getExpectedTime() {
        return expectedTime;
    }

    public void setExpectedTime(Date expectedTime) {
        this.expectedTime = expectedTime;
    }

    public BigDecimal getVolume() {
        return volume;
    }

    public void setVolume(BigDecimal volume) {
        this.volume = volume;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
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

    public String getPlaceLoading() {
        return placeLoading;
    }

    public void setPlaceLoading(String placeLoading) {
        this.placeLoading = placeLoading == null ? null : placeLoading.trim();
    }

    public String getPlaceDischarge() {
        return placeDischarge;
    }

    public void setPlaceDischarge(String placeDischarge) {
        this.placeDischarge = placeDischarge == null ? null : placeDischarge.trim();
    }

    public String getPayTerms() {
        return payTerms;
    }

    public void setPayTerms(String payTerms) {
        this.payTerms = payTerms == null ? null : payTerms.trim();
    }

    public String getDeliveryTerms() {
        return deliveryTerms;
    }

    public void setDeliveryTerms(String deliveryTerms) {
        this.deliveryTerms = deliveryTerms == null ? null : deliveryTerms.trim();
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr == null ? null : descr.trim();
    }

    public String getVehicleNo() {
        return vehicleNo;
    }

    public void setVehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo == null ? null : vehicleNo.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getUserDefine1() {
        return userDefine1;
    }

    public void setUserDefine1(String userDefine1) {
        this.userDefine1 = userDefine1 == null ? null : userDefine1.trim();
    }

    public String getUserDefine2() {
        return userDefine2;
    }

    public void setUserDefine2(String userDefine2) {
        this.userDefine2 = userDefine2 == null ? null : userDefine2.trim();
    }

    public String getUserDefine3() {
        return userDefine3;
    }

    public void setUserDefine3(String userDefine3) {
        this.userDefine3 = userDefine3 == null ? null : userDefine3.trim();
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode == null ? null : zipCode.trim();
    }

    public String getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(String supplierId) {
        this.supplierId = supplierId == null ? null : supplierId.trim();
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName == null ? null : supplierName.trim();
    }

    public String getSupplierAddress() {
        return supplierAddress;
    }

    public void setSupplierAddress(String supplierAddress) {
        this.supplierAddress = supplierAddress == null ? null : supplierAddress.trim();
    }

    public String getSupplierZipCode() {
        return supplierZipCode;
    }

    public void setSupplierZipCode(String supplierZipCode) {
        this.supplierZipCode = supplierZipCode == null ? null : supplierZipCode.trim();
    }

    public String getSupplierContact() {
        return supplierContact;
    }

    public void setSupplierContact(String supplierContact) {
        this.supplierContact = supplierContact == null ? null : supplierContact.trim();
    }

    public String getSupplierTel() {
        return supplierTel;
    }

    public void setSupplierTel(String supplierTel) {
        this.supplierTel = supplierTel == null ? null : supplierTel.trim();
    }

    public String getiId() {
        return iId;
    }

    public void setiId(String iId) {
        this.iId = iId == null ? null : iId.trim();
    }

    public String getiName() {
        return iName;
    }

    public void setiName(String iName) {
        this.iName = iName == null ? null : iName.trim();
    }

    public String getiAddress() {
        return iAddress;
    }

    public void setiAddress(String iAddress) {
        this.iAddress = iAddress == null ? null : iAddress.trim();
    }

    public String getiZipCode() {
        return iZipCode;
    }

    public void setiZipCode(String iZipCode) {
        this.iZipCode = iZipCode == null ? null : iZipCode.trim();
    }

    public String getiContact() {
        return iContact;
    }

    public void setiContact(String iContact) {
        this.iContact = iContact == null ? null : iContact.trim();
    }

    public String getiTel() {
        return iTel;
    }

    public void setiTel(String iTel) {
        this.iTel = iTel == null ? null : iTel.trim();
    }

    public Date getReceivingTime() {
        return receivingTime;
    }

    public void setReceivingTime(Date receivingTime) {
        this.receivingTime = receivingTime;
    }

    public String getCreatedName() {
        return createdName;
    }

    public void setCreatedName(String createdName) {
        this.createdName = createdName == null ? null : createdName.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getUpdatedName() {
        return updatedName;
    }

    public void setUpdatedName(String updatedName) {
        this.updatedName = updatedName == null ? null : updatedName.trim();
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

	/**
	 * @return the printCount
	 */
	public Integer getPrintCount() {
		return printCount;
	}

	/**
	 * @param printCount the printCount to set
	 */
	public void setPrintCount(Integer printCount) {
		this.printCount = printCount;
	}
}