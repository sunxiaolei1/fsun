package com.fsun.common.dto;
/**
 * @author fsun
 * @date 2019年4月21日
 */
public class CellRegionDto {
	
	/*
	 * 是否需要合并单元格
	 */
	private boolean mergeCell;

	/**
	 * 起始行位置
	 */
	private int firstRow;
	
	/**
	 * 终止行位置
	 */
	private int lastRow;
	
	/**
	 * 起始列位置
	 */
	private int firstCol;
	
	/**
	 * 终止列位置
	 */
	private int lastCol;

	public boolean isMergeCell() {
		return mergeCell;
	}

	public void setMergeCell(boolean mergeCell) {
		this.mergeCell = mergeCell;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getLastRow() {
		return lastRow;
	}

	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}

	public int getFirstCol() {
		return firstCol;
	}

	public void setFirstCol(int firstCol) {
		this.firstCol = firstCol;
	}

	public int getLastCol() {
		return lastCol;
	}

	public void setLastCol(int lastCol) {
		this.lastCol = lastCol;
	}
	
}
