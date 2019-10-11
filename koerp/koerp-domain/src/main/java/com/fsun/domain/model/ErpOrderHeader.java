package com.fsun.domain.model;

import java.util.Date;

/**
 * @author fsun
 * @date 2019年10月9日
 */
public class ErpOrderHeader {

	/**
	 * 单据编号--PoNo
	 */
	private String trnNum;
	
	/**
	 * 创建时间--created_time
	 */
	private Date createDate;
	
	/**
	 * 创建人--i_name
	 */
	private String createdBy = "sa";
	
	/**
	 * 发货店仓--from_shop_code
	 */
	private String fromWhse = "1155";
	
	/**
	 * 收货店仓--to_shop_code
	 */
	private String toWhse = "1155";
	
	/**
	 * 发货店仓仓位
	 */
	private String fromSite = "DALS";
	
	/**
	 * 收货店仓仓位
	 */
	private String toSite = "DALS";
	
	/**
	 * 发货时间--expected_time
	 */
	private Date orderDate;
	
	/**
	 * ERP字段固定值--
	 */
	private String stat = "O";

	public String getTrnNum() {
		return trnNum;
	}

	public void setTrnNum(String trnNum) {
		this.trnNum = trnNum;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getFromWhse() {
		return fromWhse;
	}

	public void setFromWhse(String fromWhse) {
		this.fromWhse = fromWhse;
	}

	public String getToWhse() {
		return toWhse;
	}

	public void setToWhse(String toWhse) {
		this.toWhse = toWhse;
	}

	public String getFromSite() {
		return fromSite;
	}

	public void setFromSite(String fromSite) {
		this.fromSite = fromSite;
	}

	public String getToSite() {
		return toSite;
	}

	public void setToSite(String toSite) {
		this.toSite = toSite;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	/**
	 * @return the createdBy
	 */
	public String getCreatedBy() {
		return createdBy;
	}

	/**
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	
}
