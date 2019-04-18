package com.fsun.domain.report;

import java.util.List;

/**
 * 
 * @ClassName: ReportHeaderTree 
 * @Description: 报表表头树 
 * @author fsun 
 * @date 2018年4月13日 下午5:32:30 
 *
 */
public class ReportHeaderTree {

    private String id;
    
    private String parentId;
    	
	private String ename;
	
	private String cname;
	
	private String sortCode;
	
	private Integer fieldLevel;
	
	private Boolean isLeaf;
	
	private String columnNo;
	
	private List<ReportHeaderTree> children;
	
	private HeaderFieldModel attributes;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getSortCode() {
		return sortCode;
	}

	public void setSortCode(String sortCode) {
		this.sortCode = sortCode;
	}

	public Integer getFieldLevel() {
		return fieldLevel;
	}

	public void setFieldLevel(Integer fieldLevel) {
		this.fieldLevel = fieldLevel;
	}

	public Boolean getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(Boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public List<ReportHeaderTree> getChildren() {
		return children;
	}

	public void setChildren(List<ReportHeaderTree> children) {
		this.children = children;
	}

	public HeaderFieldModel getAttributes() {
		return attributes;
	}

	public void setAttributes(HeaderFieldModel attributes) {
		this.attributes = attributes;
	}

	public String getColumnNo() {
		return columnNo;
	}

	public void setColumnNo(String columnNo) {
		this.columnNo = columnNo;
	}

}
