package com.fsun.domain.entity;

/**
 * 出库单初始化入参对象
 * @author fsun
 * @date 2019年3月19日
 */
public class DocOrderInitCondition {

	private String orderNo;
	
	private String orderType;
	
	private String toShopId;
	
	private String poDetailIds;
	
	private String[] inPoDetailIds;

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getToShopId() {
		return toShopId;
	}

	public void setToShopId(String toShopId) {
		this.toShopId = toShopId;
	}

	public String getPoDetailIds() {
		return poDetailIds;
	}

	public void setPoDetailIds(String poDetailIds) {
		this.poDetailIds = poDetailIds;
		if(poDetailIds!=null && !poDetailIds.equals("")){
			this.inPoDetailIds = poDetailIds.split(",");
		}
	}

	public String[] getInPoDetailIds() {
		return inPoDetailIds;
	}

	public void setInPoDetailIds(String[] inPoDetailIds) {
		this.inPoDetailIds = inPoDetailIds;
	}
	
}
