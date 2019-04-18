package com.fsun.domain.report;

/**
 * 
 * @ClassName: HeaderFieldModel 
 * @Description: 存储报表的表头信息
 * @author fsun 
 * @date 2018年4月13日 下午3:31:19 
 *
 */
public class HeaderFieldModel {

	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 父节点ID
	 */
	private String parentId;
	
	/**
	 * 字段英文意思
	 */
	private String ename;
	
	/**
	 * 表字段类型
	 */
	private String fieldType;
	
	/**
	 * 字段中文意思
	 */
	private String cname;
	
	/**
	 * 表名称
	 */
	private String reportType;
	
	/**
	 * 字段目录级别
	 */
	private Integer fieldLevel;
	
	/**
	 * 排序码
	 */
	private String sortCode;
	
	/**
	 * 是否可用
	 */
	private Boolean enabled;
	
	/**
	 * 是否是叶子
	 */
	private Boolean isLeaf;
	
	/**
	 * 列号
	 */
	private String columnNo;

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

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public Integer getFieldLevel() {
		return fieldLevel;
	}

	public void setFieldLevel(Integer fieldLevel) {
		this.fieldLevel = fieldLevel;
	}

	public String getSortCode() {
		return sortCode;
	}

	public void setSortCode(String sortCode) {
		this.sortCode = sortCode;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public Boolean getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(Boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public String getColumnNo() {
		return columnNo;
	}

	public void setColumnNo(String columnNo) {
		this.columnNo = columnNo;
	}

}
