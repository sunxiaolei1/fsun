package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 出库单状态枚举
 * @author fsun
 * @date 2018年12月15日
 */
public enum DocOrderStatusEnum {
	
	SO_DSH("B00","待审核"),
	SO_SHWC("B10","审核完成"),
	SO_DDCK("B20","订单出库"),
	SO_CKWC("B30","出库完成"),
	SO_CKQX("B90","出库取消"),
	UNKNOW("UNKNOW","未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocOrderStatusEnum(String code, String name) {
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

	public static DocOrderStatusEnum getByName(String code){
		for (DocOrderStatusEnum item : DocOrderStatusEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocOrderStatusEnum.UNKNOW;
	}
	
	public static List<DocOrderStatusEnum> getAllMoods(){
		List<DocOrderStatusEnum> gradeList = new ArrayList<DocOrderStatusEnum>();
		DocOrderStatusEnum[] md = DocOrderStatusEnum.values();
		for (DocOrderStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
