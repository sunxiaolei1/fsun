package com.fsun.domain.dto;

import java.util.List;

import com.fsun.domain.model.DocPoDetails;
import com.fsun.domain.model.DocPoHeader;

/**
 * @author fsun
 * @date 2019年3月16日
 */
public class DocPoDto {

	private String poNo;

	private DocPoHeader header;
	
	private List<DocPoDetails> details;
	
	private BusUserDto currentUser;

	public String getPoNo() {
		return poNo;
	}

	public void setPoNo(String poNo) {
		this.poNo = poNo;
	}

	public DocPoHeader getHeader() {
		return header;
	}

	public void setHeader(DocPoHeader header) {
		this.header = header;
	}

	public List<DocPoDetails> getDetails() {
		return details;
	}

	public void setDetails(List<DocPoDetails> details) {
		this.details = details;
	}

	public BusUserDto getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(BusUserDto currentUser) {
		this.currentUser = currentUser;
	}
	
}
