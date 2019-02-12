package com.fsun.domain.dto;

import java.util.ArrayList;
import java.util.List;

import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusPayAccount;
import com.fsun.domain.model.BusRefund;
import com.fsun.domain.model.BusRefundGoods;

/**
 * 退货单实体
 * @author fsun
 * @date 2019年2月12日
 */
public class BusRefundDto {

	/**
	 * 退货单号
	 */
	private String refundId;

	/**
	 * 退货单头信息
	 */
	private BusRefund refundHeader;
	
	/**
	 * 退货单明细信息
	 */
	private List<BusRefundGoods> refundDetails = new ArrayList<>();

	/**
	 * 原销售单头信息
	 */
	private BusOrder orderHeader = new BusOrder();
	
	/**
	 * 原销售单明细信息
	 */
	private List<BusGoods> orderDetails = new ArrayList<>();
	
	/**
	 * 退款单信息
	 */
	private List<BusPayAccount> payAccounts = new ArrayList<>();
	
	/**
	 * 当前用户信息
	 */
	private BusUserDto currUser;

	public String getRefundId() {
		return refundId;
	}

	public void setRefundId(String refundId) {
		this.refundId = refundId;
	}

	public BusRefund getRefundHeader() {
		return refundHeader;
	}

	public void setRefundHeader(BusRefund refundHeader) {
		this.refundHeader = refundHeader;
	}

	public List<BusRefundGoods> getRefundDetails() {
		return refundDetails;
	}

	public void setRefundDetails(List<BusRefundGoods> refundDetails) {
		this.refundDetails = refundDetails;
	}

	public BusOrder getOrderHeader() {
		return orderHeader;
	}

	public void setOrderHeader(BusOrder orderHeader) {
		this.orderHeader = orderHeader;
	}

	public List<BusGoods> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<BusGoods> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public BusUserDto getCurrUser() {
		return currUser;
	}

	public void setCurrUser(BusUserDto currUser) {
		this.currUser = currUser;
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
