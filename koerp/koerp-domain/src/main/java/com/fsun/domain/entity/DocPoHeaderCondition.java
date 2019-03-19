package com.fsun.domain.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fsun.domain.common.BaseOrderCondition;

/**
 * @author fsun
 * @date 2019年3月16日
 */
public class DocPoHeaderCondition extends BaseOrderCondition{

	/**
     * PO号
     * 表字段 : doc_po_header.po_no
     */
    private String poNo;
    
    /**
     * 打印次数
     * 表字段 : doc_po_header.print_count
     */
    private Integer printCount;  

    /**
     * 单据类型
     * 表字段 : doc_po_header.po_type
     */
    private String poType;

    /**
     * 单据状态
     * 表字段 : doc_po_header.po_status
     */
    private String poStatus;

    /**
     * 单据来源
     * 表字段 : doc_po_header.po_source
     */
    private String poSource;

    /**
     * 收货店仓id
     * 表字段 : doc_po_header.to_shop_id
     */
    private String toShopId;

    /**
     * 收货店仓名称
     * 表字段 : doc_po_header.to_shop_name
     */
    private String toShopName;

    /**
     * 发货店仓id
     * 表字段 : doc_po_header.from_shop_id
     */
    private String fromShopId;

    /**
     * 发货店仓名称
     * 表字段 : doc_po_header.from_shop_name
     */
    private String fromShopName;

    /**
     * 订单总金额
     * 表字段 : doc_po_header.order_price
     */
    private BigDecimal orderPrice;

    /**
     * 预期到货时间
     * 表字段 : doc_po_header.expected_time
     */
    private Date expectedTime;

    /**
     * 用户自定义1
     * 表字段 : doc_po_header.user_define1
     */
    private String userDefine1;

    /**
     * 用户自定义2
     * 表字段 : doc_po_header.user_define2
     */
    private String userDefine2;

    /**
     * 用户自定义3
     * 表字段 : doc_po_header.user_define3
     */
    private String userDefine3;

    /**
     * 备注
     * 表字段 : doc_po_header.memo
     */
    private String memo;

    /**
     * 描述
     * 表字段 : doc_po_header.descr
     */
    private String descr;

    /**
     * 下单门店id
     * 表字段 : doc_po_header.i_shop_id
     */
    private String iShopId;

    /**
     * 下单人id
     * 表字段 : doc_po_header.i_id
     */
    private String iId;

    /**
     * 下单人名称
     * 表字段 : doc_po_header.i_name
     */
    private String iName;

    /**
     * 下单人地址
     * 表字段 : doc_po_header.i_address
     */
    private String iAddress;

    /**
     * 下单人邮编
     * 表字段 : doc_po_header.i_zip_code
     */
    private String iZipCode;

    /**
     * 下单人联系人
     * 表字段 : doc_po_header.i_contact
     */
    private String iContact;

    /**
     * 下单人电话
     * 表字段 : doc_po_header.i_tel
     */
    private String iTel;

    /**
     * 供应商id
     * 表字段 : doc_po_header.supplier_id
     */
    private String supplierId;

    /**
     * 供应商名称
     * 表字段 : doc_po_header.supplier_name
     */
    private String supplierName;

    /**
     * 供应商地址
     * 表字段 : doc_po_header.supplier_address
     */
    private String supplierAddress;

    /**
     * 供应商邮编
     * 表字段 : doc_po_header.supplier_zip_code
     */
    private String supplierZipCode;

    /**
     * 供应商联系人
     * 表字段 : doc_po_header.supplier_contact
     */
    private String supplierContact;

    /**
     * 供应商电话
     * 表字段 : doc_po_header.supplier_tel
     */
    private String supplierTel;

    /**
     * 体积
     * 表字段 : doc_po_header.volume
     */
    private BigDecimal volume;

    /**
     * 交付时间
     * 表字段 : doc_po_header.receiving_Time
     */
    private Date receivingTime;
    
    /**
     * 审核时间
     * 表字段 : doc_po_header.audit_time
     */
    private Date auditTime;

    /**
     * 创建人
     * 表字段 : doc_po_header.created_name
     */
    private String createdName;

    /**
     * 创建时间
     * 表字段 : doc_po_header.created_time
     */
    private Date createdTime;

    /**
     * 更新人
     * 表字段 : doc_po_header.updated_name
     */
    private String updatedName;

    /**
     * 更新时间
     * 表字段 : doc_po_header.updated_time
     */
    private Date updatedTime;
    
    /**
     * 商品SKU
     */
    private String sku;
    
    /**
     * 包含申请单集合
     */
    List<String> inPoNos;
    
    public String getPoNo() {
        return poNo;
    }

    public void setPoNo(String poNo) {
        this.poNo = poNo == null ? null : poNo.trim();
    }

    public String getPoType() {
        return poType;
    }

    public void setPoType(String poType) {
        this.poType = poType == null ? null : poType.trim();
    }

    public String getPoStatus() {
        return poStatus;
    }

    public void setPoStatus(String poStatus) {
        this.poStatus = poStatus == null ? null : poStatus.trim();
    }

    public String getPoSource() {
        return poSource;
    }

    public void setPoSource(String poSource) {
        this.poSource = poSource == null ? null : poSource.trim();
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

    public BigDecimal getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(BigDecimal orderPrice) {
        this.orderPrice = orderPrice;
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

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr == null ? null : descr.trim();
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

    public BigDecimal getVolume() {
        return volume;
    }

    public void setVolume(BigDecimal volume) {
        this.volume = volume;
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
	 * @return the auditTime
	 */
	public Date getAuditTime() {
		return auditTime;
	}

	/**
	 * @param auditTime the auditTime to set
	 */
	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
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

	/**
	 * @return the sku
	 */
	public String getSku() {
		return sku;
	}

	/**
	 * @param sku the sku to set
	 */
	public void setSku(String sku) {
		this.sku = sku;
	}

	public List<String> getInPoNos() {
		return inPoNos;
	}

	public void setInPoNos(List<String> inPoNos) {
		this.inPoNos = inPoNos;
	}
    
}
