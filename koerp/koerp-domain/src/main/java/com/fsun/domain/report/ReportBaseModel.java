package com.fsun.domain.report;

import com.fsun.domain.common.PageSortCondition;

/**
 * 
 * @ClassName: ReportBaseModel 
 * @Description: 报表sql组装类
 * @author fsun 
 * @date 2018年4月14日 上午6:38:36 
 *
 */
public class ReportBaseModel extends PageSortCondition {
	
	/**
	 * 整条语句
	 */
	private String select;

	/**
	 * 字段及表组装
	 */
	private String from;
	
	/**
	 * 条件组装
	 */
	private String where; 
	
	/**
	 * 排序组装
	 */
	private String orderBy;
	
	/**
	 * 分组组装
	 */
	private String groupBy;
	

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getGroupBy() {
		return groupBy;
	}

	public void setGroupBy(String groupBy) {
		this.groupBy = groupBy;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

}
