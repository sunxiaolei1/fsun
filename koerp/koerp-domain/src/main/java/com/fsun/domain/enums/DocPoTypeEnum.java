package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 要货单类型枚举
 * @author fsun
 * @date 2018年12月15日
 */
public enum DocPoTypeEnum {
	
	PURCHASE_APPLY("10","采购申请"),
	ALLOT_APPLY("20","调拨申请"),
	UNKNOW(null,"未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocPoTypeEnum(String code, String name) {
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

	public static DocPoTypeEnum getByName(String code){
		for (DocPoTypeEnum item : DocPoTypeEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocPoTypeEnum.UNKNOW;
	}
	
	public static List<DocPoTypeEnum> getAllMoods(){
		List<DocPoTypeEnum> gradeList = new ArrayList<DocPoTypeEnum>();
		DocPoTypeEnum[] md = DocPoTypeEnum.values();
		for (DocPoTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}