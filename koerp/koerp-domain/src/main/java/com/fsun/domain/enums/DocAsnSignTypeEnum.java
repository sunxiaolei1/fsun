package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2019年3月20日
 */
public enum DocAsnSignTypeEnum {
	
	ALL_SIGN("10","全部收货"),
	PART_SIGN("20","部分收货"),
	ALL_RETURN("30","全部退货"),
	UNKNOW("UNKNOW","未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocAsnSignTypeEnum(String code, String name) {
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

	public static DocAsnSignTypeEnum getByName(String code){
		for (DocAsnSignTypeEnum item : DocAsnSignTypeEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocAsnSignTypeEnum.UNKNOW;
	}
	
	public static List<DocAsnSignTypeEnum> getAllMoods(){
		List<DocAsnSignTypeEnum> gradeList = new ArrayList<DocAsnSignTypeEnum>();
		DocAsnSignTypeEnum[] md = DocAsnSignTypeEnum.values();
		for (DocAsnSignTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
