package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 出库单类型枚举
 * @author fsun
 * @date 2018年12月15日
 */
public enum DocOrderTypeEnum {
	
	ALLOT_SO("11","调拨出库"),
	SHORTAGE_SO("12","盘亏出库"),
	PURCHASE_SO("13","采购退货"),
	LOSE_SO("15","报损出库"),
	USE_SO("16","领用出库"),
	UNKNOW("UNKNOW","未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocOrderTypeEnum(String code, String name) {
		this.code = code;
		this.name = name;
	}

	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static DocOrderTypeEnum getByName(String code){
		for (DocOrderTypeEnum item : DocOrderTypeEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocOrderTypeEnum.UNKNOW;
	}
	
	public static List<DocOrderTypeEnum> getAllMoods(){
		List<DocOrderTypeEnum> gradeList = new ArrayList<DocOrderTypeEnum>();
		DocOrderTypeEnum[] md = DocOrderTypeEnum.values();
		for (DocOrderTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
