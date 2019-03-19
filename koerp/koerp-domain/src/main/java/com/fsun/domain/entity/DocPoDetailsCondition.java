package com.fsun.domain.entity;

import com.fsun.domain.model.DocPoDetails;

/**
 * @author fsun
 * @date 2019年3月16日
 */
public class DocPoDetailsCondition extends DocPoDetails{

	/**
	 * 出库明细主键集合
	 */
	private String[] inPoDetailIds;

	/**
	 * @return the inPoDetailIds
	 */
	public String[] getInPoDetailIds() {
		return inPoDetailIds;
	}

	/**
	 * @param inPoDetailIds the inPoDetailIds to set
	 */
	public void setInPoDetailIds(String[] inPoDetailIds) {
		this.inPoDetailIds = inPoDetailIds;
	}

}
