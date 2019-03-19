package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2019年3月19日
 */
public enum DocAsnCheckStatusEnum {
	
	UNSIGN("00","未签收"),
	SIGNED("10","已签收"),
	UNKNOW("UNKNOW","未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocAsnCheckStatusEnum(String code, String name) {
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

	public static DocAsnCheckStatusEnum getByName(String code){
		for (DocAsnCheckStatusEnum item : DocAsnCheckStatusEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocAsnCheckStatusEnum.UNKNOW;
	}
	
	public static List<DocAsnCheckStatusEnum> getAllMoods(){
		List<DocAsnCheckStatusEnum> gradeList = new ArrayList<DocAsnCheckStatusEnum>();
		DocAsnCheckStatusEnum[] md = DocAsnCheckStatusEnum.values();
		for (DocAsnCheckStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
