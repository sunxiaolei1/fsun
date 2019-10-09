package com.fsun.domain.dto;

import java.util.List;

import com.fsun.domain.model.ErpOrderDetails;
import com.fsun.domain.model.ErpOrderHeader;

/**
 * ERP出库单对象
 * @author fsun
 * @date 2019年10月9日
 */
public class ErpOrderDto {
	
	/**
	 * 单据编号
	 */
	private String orderNo;

	/**
	 * 单据头信息
	 */
	private ErpOrderHeader header;
	
	/**
	 * 单据商品明细
	 */
	private List<ErpOrderDetails> details;

	public ErpOrderHeader getHeader() {
		return header;
	}

	public void setHeader(ErpOrderHeader header) {
		this.header = header;
	}

	public List<ErpOrderDetails> getDetails() {
		return details;
	}

	public void setDetails(List<ErpOrderDetails> details) {
		this.details = details;
	}

	/**
	 * @return the orderNo
	 */
	public String getOrderNo() {
		return orderNo;
	}

	/**
	 * @param orderNo the orderNo to set
	 */
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
}
