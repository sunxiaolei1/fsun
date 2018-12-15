package com.fsun.domain.dto;

import java.util.List;

import com.fsun.domain.model.DocAsnDetails;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2018年12月15日
 */
public class DocAsnDto {

	private String asnNo;
	
	private DocAsnHeader header;
	
	private List<DocAsnDetails> details;
	
	private SysUser currentUser;

	public DocAsnHeader getHeader() {
		return header;
	}

	public void setHeader(DocAsnHeader header) {
		this.header = header;
	}

	public List<DocAsnDetails> getDetails() {
		return details;
	}

	public void setDetails(List<DocAsnDetails> details) {
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
	 * @return the asnNo
	 */
	public String getAsnNo() {
		return asnNo;
	}

	/**
	 * @param asnNo the asnNo to set
	 */
	public void setAsnNo(String asnNo) {
		this.asnNo = asnNo;
	}
	
}
