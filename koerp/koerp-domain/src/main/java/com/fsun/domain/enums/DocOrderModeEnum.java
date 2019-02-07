package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 领用出库事由
 * @author fsun
 * @date 2018年12月16日
 */
public enum DocOrderModeEnum {

	YP("10","样品"),
	PJ("20","品鉴"),
	SY("30","试饮"),
	ZS("40","赠送"),
	LP("50","礼品"),
	QT("60","其他"),
	UNKNOW("UNKNOW","未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocOrderModeEnum(String code, String name) {
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

	public static DocOrderModeEnum getByName(String code){
		for (DocOrderModeEnum item : DocOrderModeEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocOrderModeEnum.UNKNOW;
	}
	
	public static List<DocOrderModeEnum> getAllMoods(){
		List<DocOrderModeEnum> gradeList = new ArrayList<DocOrderModeEnum>();
		DocOrderModeEnum[] md = DocOrderModeEnum.values();
		for (DocOrderModeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}

}
