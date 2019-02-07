package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 入库单类型枚举
 * @author Gang Sun
 *
 */
public enum DocAsnTypeEnum {
	ALLOT_SI("21","调拨入库"),
	OVER_SI("22","盘盈入库"),
	PURCHASE_SI("23","采购入库"),
	BACK_SI("24","销退入库"),	
	SUNDRY_SI("25","杂收入库"),
	UNKNOW("UNKNOW","未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocAsnTypeEnum(String code, String name) {
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

	public static DocAsnTypeEnum getByName(String code){
		for (DocAsnTypeEnum item : DocAsnTypeEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocAsnTypeEnum.UNKNOW;
	}
	
	public static List<DocAsnTypeEnum> getAllMoods(){
		List<DocAsnTypeEnum> gradeList = new ArrayList<DocAsnTypeEnum>();
		DocAsnTypeEnum[] md = DocAsnTypeEnum.values();
		for (DocAsnTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}