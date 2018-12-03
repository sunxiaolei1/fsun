package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class DocOrderHeader {
    /**
     * 订单号
     * 表字段 : doc_order_header.order_no
     */
    private String orderNo;

    /**
     * 单据类型
     * 表字段 : doc_order_header.order_type
     */
    private String orderType;

    /**
     * 单据状态
     * 表字段 : doc_order_header.so_status
     */
    private String soStatus;

    /**
     * 发运路线id
     * 表字段 : doc_order_header.route_id
     */
    private String routeId;

    /**
     * 订单创建时间
     * 表字段 : doc_order_header.order_time
     */
    private Date orderTime;

    /**
     * 订单总金额
     * 表字段 : doc_order_header.order_price
     */
    private BigDecimal orderPrice;

    /**
     * 收货店仓id
     * 表字段 : doc_order_header.to_shop_id
     */
    private String toShopId;

    /**
     * 收货店仓名称
     * 表字段 : doc_order_header.to_shop_name
     */
    private String toShopName;

    /**
     * 发货店仓id
     * 表字段 : doc_order_header.from_shop_id
     */
    private String fromShopId;

    /**
     * 发货店仓名称
     * 表字段 : doc_order_header.from_shop_name
     */
    private String fromShopName;

    /**
     * 预期发货时间
     * 表字段 : doc_order_header.expected_time
     */
    private Date expectedTime;

    /**
     * 用户自定义1
     * 表字段 : doc_order_header.user_define1
     */
    private String userDefine1;

    /**
     * 用户自定义2
     * 表字段 : doc_order_header.user_define2
     */
    private String userDefine2;

    /**
     * 用户自定义3
     * 表字段 : doc_order_header.user_define3
     */
    private String userDefine3;

    /**
     * 释放状态
     * 表字段 : doc_order_header.release_status
     */
    private String releaseStatus;

    /**
     * 订单优先级别
     * 表字段 : doc_order_header.priority
     */
    private String priority;

    /**
     * 承运人id
     * 表字段 : doc_order_header.carrier_id
     */
    private String carrierId;

    /**
     * 承运人姓名
     * 表字段 : doc_order_header.carrier_name
     */
    private String carrierName;

    /**
     * 卸货地
     * 表字段 : doc_order_header.place_discharge
     */
    private String placeDischarge;

    /**
     * 收货人邮编
     * 表字段 : doc_order_header.zip_code
     */
    private String zipCode;

    /**
     * 收货人手机
     * 表字段 : doc_order_header.mobile
     */
    private String mobile;

    /**
     * 收货人地址
     * 表字段 : doc_order_header.receive_address
     */
    private String receiveAddress;

    /**
     * 车号
     * 表字段 : doc_order_header.vehicle_no
     */
    private String vehicleNo;

    /**
     * 收货人id
     * 表字段 : doc_order_header.onsignee_id
     */
    private String onsigneeId;

    /**
     * 收货人
     * 表字段 : doc_order_header.onsign_name
     */
    private String onsignName;

    /**
     * 描述
     * 表字段 : doc_order_header.descr
     */
    private String descr;

    /**
     * 备注
     * 表字段 : doc_order_header.memo
     */
    private String memo;

    /**
     * 下单门店id
     * 表字段 : doc_order_header.i_shop_id
     */
    private String iShopId;

    /**
     * 下单人id
     * 表字段 : doc_order_header.i_id
     */
    private String iId;

    /**
     * 下单人地址
     * 表字段 : doc_order_header.i_address
     */
    private String iAddress;

    /**
     * 下单人邮编
     * 表字段 : doc_order_header.i_zip_code
     */
    private String iZipCode;

    /**
     * 下单人联系人
     * 表字段 : doc_order_header.i_contact
     */
    private String iContact;

    /**
     * 下单人电话
     * 表字段 : doc_order_header.i_tel
     */
    private String iTel;

    /**
     * 供应商id
     * 表字段 : doc_order_header.supplier_id
     */
    private String supplierId;

    /**
     * 供应商名称
     * 表字段 : doc_order_header.supplier_name
     */
    private String supplierName;

    /**
     * 供应商地址
     * 表字段 : doc_order_header.supplier_address
     */
    private String supplierAddress;

    /**
     * 供应商邮编
     * 表字段 : doc_order_header.supplier_zip_code
     */
    private String supplierZipCode;

    /**
     * 供应商联系人
     * 表字段 : doc_order_header.supplier_contact
     */
    private String supplierContact;

    /**
     * 供应商电话
     * 表字段 : doc_order_header.supplier_tel
     */
    private String supplierTel;

    /**
     * 收货人街道(地址)
     * 表字段 : doc_order_header.address
     */
    private String address;

    /**
     * 体积
     * 表字段 : doc_order_header.volume
     */
    private BigDecimal volume;

    /**
     * 发货时间
     * 表字段 : doc_order_header.delivery_time
     */
    private Date deliveryTime;

    /**
     * 创建人
     * 表字段 : doc_order_header.created_name
     */
    private String createdName;

    /**
     * 创建时间
     * 表字段 : doc_order_header.created_time
     */
    private Date createdTime;

    /**
     * 更新人
     * 表字段 : doc_order_header.updated_name
     */
    private String updatedName;

    /**
     * 装货地
     * 表字段 : doc_order_header.place_loading
     */
    private String placeLoading;

    /**
     * 更新时间
     * 表字段 : doc_order_header.updated_time
     */
    private Date updatedTime;

    /**
     * 路径
     * 表字段 : doc_order_header.route
     */
    private String route;

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType == null ? null : orderType.trim();
    }

    public String getSoStatus() {
        return soStatus;
    }

    public void setSoStatus(String soStatus) {
        this.soStatus = soStatus == null ? null : soStatus.trim();
    }

    public String getRouteId() {
        return routeId;
    }

    public void setRouteId(String routeId) {
        this.routeId = routeId == null ? null : routeId.trim();
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
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

    public String getReleaseStatus() {
        return releaseStatus;
    }

    public void setReleaseStatus(String releaseStatus) {
        this.releaseStatus = releaseStatus == null ? null : releaseStatus.trim();
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority == null ? null : priority.trim();
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

    public String getPlaceDischarge() {
        return placeDischarge;
    }

    public void setPlaceDischarge(String placeDischarge) {
        this.placeDischarge = placeDischarge == null ? null : placeDischarge.trim();
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode == null ? null : zipCode.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public void setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress == null ? null : receiveAddress.trim();
    }

    public String getVehicleNo() {
        return vehicleNo;
    }

    public void setVehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo == null ? null : vehicleNo.trim();
    }

    public String getOnsigneeId() {
        return onsigneeId;
    }

    public void setOnsigneeId(String onsigneeId) {
        this.onsigneeId = onsigneeId == null ? null : onsigneeId.trim();
    }

    public String getOnsignName() {
        return onsignName;
    }

    public void setOnsignName(String onsignName) {
        this.onsignName = onsignName == null ? null : onsignName.trim();
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr == null ? null : descr.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getiShopId() {
        return iShopId;
    }

    public void setiShopId(String iShopId) {
        this.iShopId = iShopId == null ? null : iShopId.trim();
    }

    public String getiId() {
        return iId;
    }

    public void setiId(String iId) {
        this.iId = iId == null ? null : iId.trim();
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public BigDecimal getVolume() {
        return volume;
    }

    public void setVolume(BigDecimal volume) {
        this.volume = volume;
    }

    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
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

    public String getPlaceLoading() {
        return placeLoading;
    }

    public void setPlaceLoading(String placeLoading) {
        this.placeLoading = placeLoading == null ? null : placeLoading.trim();
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route == null ? null : route.trim();
    }
}