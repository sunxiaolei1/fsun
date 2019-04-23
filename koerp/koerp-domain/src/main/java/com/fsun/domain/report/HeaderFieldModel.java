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
	
	/**
	 * 字段宽度
	 */
	private String width;
	
	/**
	 * 字段对齐方式
	 */
	private String align;
	
	/**
	 * 是否显示选择框
	 */
	private Boolean checkbox;

	/**
	 * 是否允许该列排序
	 */
	private Boolean sortable;

	/**
	 * 单元样式函数
	 */
	private String styler;

	/**
	 * 自定义字段排序函数
	 */
	private String sorter;

	/**
	 * 格式化
	 */
	private String formatter;
	
	/**
	 * 是否是冻结列
	 */
	private Boolean frozenColumns;
	
	/**
	 * 是否支持相同行单元格合并
	 */
	private Boolean mergeCell;
	
	/**
	 * 相同行合并唯一性字段
	 */
	private Boolean mergeUnique;

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

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public Boolean getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(Boolean checkbox) {
		this.checkbox = checkbox;
	}

	public Boolean getSortable() {
		return sortable;
	}

	public void setSortable(Boolean sortable) {
		this.sortable = sortable;
	}

	public String getStyler() {
		return styler;
	}

	public void setStyler(String styler) {
		this.styler = styler;
	}

	public String getSorter() {
		return sorter;
	}

	public void setSorter(String sorter) {
		this.sorter = sorter;
	}

	public String getFormatter() {
		return formatter;
	}

	public void setFormatter(String formatter) {
		this.formatter = formatter;
	}

	/**
	 * @return the frozenColumns
	 */
	public Boolean getFrozenColumns() {
		return frozenColumns;
	}

	/**
	 * @param frozenColumns the frozenColumns to set
	 */
	public void setFrozenColumns(Boolean frozenColumns) {
		this.frozenColumns = frozenColumns;
	}

	/**
	 * @return the mergeCell
	 */
	public Boolean getMergeCell() {
		return mergeCell;
	}

	/**
	 * @param mergeCell the mergeCell to set
	 */
	public void setMergeCell(Boolean mergeCell) {
		this.mergeCell = mergeCell;
	}

	/**
	 * @return the mergeUnique
	 */
	public Boolean getMergeUnique() {
		return mergeUnique;
	}

	/**
	 * @param mergeUnique the mergeUnique to set
	 */
	public void setMergeUnique(Boolean mergeUnique) {
		this.mergeUnique = mergeUnique;
	}

}
