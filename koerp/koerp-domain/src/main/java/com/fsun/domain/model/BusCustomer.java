package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusCustomer {
    /**
     * 主键
     * 表字段 : bus_customer.id
     */
    private String id;

    /**
     * 客户编号
     * 表字段 : bus_customer.customer_code
     */
    private String customerCode;

    /**
     * 客户类型(SK:散客, YWY:业务员,GYS:供应商, JXS:经销商, GZ 挂账单位, VIP会员)
     * 表字段 : bus_customer.customer_type
     */
    private String customerType;

    /**
     * 客户名称
     * 表字段 : bus_customer.customer_name
     */
    private String customerName;

    /**
     * 联系人
     * 表字段 : bus_customer.contacts
     */
    private String contacts;

    /**
     * 地址
     * 表字段 : bus_customer.address
     */
    private String address;

    /**
     * 联系方式
     * 表字段 : bus_customer.tel
     */
    private String tel;

    /**
     * 备注
     * 表字段 : bus_customer.memo
     */
    private String memo;

    /**
     * 所属销售代表
     * 表字段 : bus_customer.salesman
     */
    private String salesman;

    /**
     * 信用额度
     * 表字段 : bus_customer.credit_price
     */
    private BigDecimal creditPrice;

    /**
     * 是否可用
     * 表字段 : bus_customer.enabled
     */
    private Boolean enabled;

    /**
     * 创建时间
     * 表字段 : bus_customer.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_customer.updated_time
     */
    private Date updatedTime;

    /**
     * 创建人id
     * 表字段 : bus_customer.created_id
     */
    private String createdId;

    /**
     * 更新人id
     * 表字段 : bus_customer.updated_id
     */
    private String updatedId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode == null ? null : customerCode.trim();
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType == null ? null : customerType.trim();
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts == null ? null : contacts.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getSalesman() {
        return salesman;
    }

    public void setSalesman(String salesman) {
        this.salesman = salesman == null ? null : salesman.trim();
    }

    public BigDecimal getCreditPrice() {
        return creditPrice;
    }

    public void setCreditPrice(BigDecimal creditPrice) {
        this.creditPrice = creditPrice;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
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

    public String getCreatedId() {
        return createdId;
    }

    public void setCreatedId(String createdId) {
        this.createdId = createdId == null ? null : createdId.trim();
    }

    public String getUpdatedId() {
        return updatedId;
    }

    public void setUpdatedId(String updatedId) {
        this.updatedId = updatedId == null ? null : updatedId.trim();
    }
}