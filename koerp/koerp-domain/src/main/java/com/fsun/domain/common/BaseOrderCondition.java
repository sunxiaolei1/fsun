package com.fsun.domain.common;

import java.util.Date;

import com.fsun.common.utils.DateUtil;

/**
 * 单据查询共有条件
 * @author fsun
 * @date 2018年12月15日
 */
public class BaseOrderCondition extends SortCondition{
	
	/**
	 * 下单结束日期
	 */
	private String startDate;
	
	/**
	 * 下单开始日期
	 */
	private String endDate;

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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
		if(startDate!=null && !"".equals(startDate)){			
			this.startTime = DateUtil.getDateTimeFormat(startDate + " 00:00:00");
		}
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
		if(endDate!=null && !"".equals(endDate)){			
			this.endTime = DateUtil.getDateTimeFormat(endDate + " 23:59:59");
		}
	}
	
}
