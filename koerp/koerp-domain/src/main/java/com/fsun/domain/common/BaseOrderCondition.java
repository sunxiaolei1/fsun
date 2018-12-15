package com.fsun.domain.common;

import java.util.Date;

/**
 * 单据查询共有条件
 * @author fsun
 * @date 2018年12月15日
 */
public class BaseOrderCondition extends SortCondition{

	/**
	 * 下单开始时间
	 */
	private Date startTime;
		
	/**
	 * 下单结束时间
	 */
	private Date endTime;
	
	/**
	 * 模糊查询字段
	 */
	private String q;

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	/**
	 * @return the q
	 */
	public String getQ() {
		return q;
	}

	/**
	 * @param q the q to set
	 */
	public void setQ(String q) {
		this.q = q;
	}
	
}
