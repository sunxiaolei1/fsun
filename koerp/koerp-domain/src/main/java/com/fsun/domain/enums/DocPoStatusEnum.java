package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 要货单状态枚举
 * @author fsun
 * @date 2018年12月16日
 */
public enum DocPoStatusEnum {

	CREATE("00","待审核"),
	AUDIT_PASS("10","审核通过"),
	AUDIT_REFUSE("20","审核拒绝"),
	CANCEL("90","订单取消"),
	UNKNOW(null,"未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocPoStatusEnum(String code, String name) {
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

	public static DocPoStatusEnum getByName(String code){
		for (DocPoStatusEnum item : DocPoStatusEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocPoStatusEnum.UNKNOW;
	}
	
	public static List<DocPoStatusEnum> getAllMoods(){
		List<DocPoStatusEnum> gradeList = new ArrayList<DocPoStatusEnum>();
		DocPoStatusEnum[] md = DocPoStatusEnum.values();
		for (DocPoStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
