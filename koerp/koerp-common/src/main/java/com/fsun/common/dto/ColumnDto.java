package com.fsun.common.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2019年4月21日
 */
public class ColumnDto {

	/**
	 * 单元格内容
	 */
	private String content;
	
	/**
	 * 字段名称，用户导出表格时反射调用
	 */
	private String fieldName;
	
	/**
	 * 层级目录
	 */
	private Integer cellLevel;
	
	/**
	 * 父节点
	 */
	private String parent;
	
	/**
	 * 是否支持相同行单元格合并
	 */
	private Boolean mergeCell;
	
	/**
	 * 相同行合并唯一性字段
	 */
	private Boolean mergeUnique;
	
	
	/**
	 * 表头字段单元格位置
	 */
	private CellRegionDto cellRegionDto; 
	
	/**
	 * 这个单元格的集合
	 */
	private List<ColumnDto> children = new ArrayList<ColumnDto>();

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public List<ColumnDto> getChildren() {
		return children;
	}

	public void setChildren(List<ColumnDto> children) {
		this.children = children;
	}

	/**
	 * @return the cellRegionDto
	 */
	public CellRegionDto getCellRegionDto() {
		return cellRegionDto;
	}

	/**
	 * @param cellRegionDto the cellRegionDto to set
	 */
	public void setCellRegionDto(CellRegionDto cellRegionDto) {
		this.cellRegionDto = cellRegionDto;
	}

	/**
	 * @return the cellLevel
	 */
	public Integer getCellLevel() {
		return cellLevel;
	}

	/**
	 * @param cellLevel the cellLevel to set
	 */
	public void setCellLevel(Integer cellLevel) {
		this.cellLevel = cellLevel;
	}

	/**
	 * @return the parent
	 */
	public String getParent() {
		return parent;
	}

	/**
	 * @param parent the parent to set
	 */
	public void setParent(String parent) {
		this.parent = parent;
	}

	public Boolean getMergeCell() {
		return mergeCell;
	}

	public void setMergeCell(Boolean mergeCell) {
		this.mergeCell = mergeCell;
	}

	public Boolean getMergeUnique() {
		return mergeUnique;
	}

	public void setMergeUnique(Boolean mergeUnique) {
		this.mergeUnique = mergeUnique;
	}

}
