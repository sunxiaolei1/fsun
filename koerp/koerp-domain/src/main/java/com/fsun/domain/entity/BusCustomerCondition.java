package com.fsun.domain.entity;

import java.math.BigDecimal;

import com.fsun.domain.common.SortCondition;

/**
 * 客户对象(供应商、经销商、业务员)
 * @author sunxiaolei
 *
 */
public class BusCustomerCondition extends SortCondition{
	
	/**
	 * 模糊查询字段
	 */
	private String q;

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getSalesman() {
		return salesman;
	}

	public void setSalesman(String salesman) {
		this.salesman = salesman;
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

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}
    
}
