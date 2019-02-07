package com.fsun.domain.dto;

import java.util.List;

import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusPayAccount;

/**
 * @author fsun
 * @date 2018年12月24日
 */
public class BusOrderDto {

	private String orderId;

	private BusOrder header;
	
	private List<BusPayAccount> payAccounts;
	
	private List<BusGoods> details;
	
	private BusUserDto currentUser;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public BusOrder getHeader() {
		return header;
	}

	public void setHeader(BusOrder header) {
		this.header = header;
	}

	public List<BusGoods> getDetails() {
		return details;
	}

	public void setDetails(List<BusGoods> details) {
		this.details = details;
	}

	public BusUserDto getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(BusUserDto currentUser) {
		this.currentUser = currentUser;
	}

	/**
	 * @return the payAccounts
	 */
	public List<BusPayAccount> getPayAccounts() {
		return payAccounts;
	}

	/**
	 * @param payAccounts the payAccounts to set
	 */
	public void setPayAccounts(List<BusPayAccount> payAccounts) {
		this.payAccounts = payAccounts;
	}
	
}
