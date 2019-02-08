package com.fsun.domain.dto;

import java.util.List;

import com.fsun.domain.entity.BusVipUnpaidCondition;
import com.fsun.domain.model.BusVipUnpaid;

/**
 * @author fsun
 * @date 2019年2月8日
 */
public class BusVipUnpaidDto {

	/**
	 * 关联单号
	 */
	private String relationId;

	private BusVipUnpaidCondition header;
	
	private List<BusVipUnpaid> details;

	public String getRelationId() {
		return relationId;
	}

	public void setRelationId(String relationId) {
		this.relationId = relationId;
	}

	public BusVipUnpaidCondition getHeader() {
		return header;
	}

	public void setHeader(BusVipUnpaidCondition header) {
		this.header = header;
	}

	public List<BusVipUnpaid> getDetails() {
		return details;
	}

	public void setDetails(List<BusVipUnpaid> details) {
		this.details = details;
	}
	
}
