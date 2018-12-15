package com.fsun.domain.dto;

import java.util.List;

import com.fsun.domain.model.DocOrderDetails;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2018年12月15日
 */
public class DocOrderDto {
	
	private String orderNo;

	private DocOrderHeader header;
	
	private List<DocOrderDetails> details;
	
	private SysUser currentUser;

	public DocOrderHeader getHeader() {
		return header;
	}

	public void setHeader(DocOrderHeader header) {
		this.header = header;
	}

	public List<DocOrderDetails> getDetails() {
		return details;
	}

	public void setDetails(List<DocOrderDetails> details) {
		this.details = details;
	}

	/**
	 * @return the currentUser
	 */
	public SysUser getCurrentUser() {
		return currentUser;
	}

	/**
	 * @param currentUser the currentUser to set
	 */
	public void setCurrentUser(SysUser currentUser) {
		this.currentUser = currentUser;
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
