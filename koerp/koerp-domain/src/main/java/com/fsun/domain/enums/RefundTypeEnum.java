package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 退单类型枚举
 * @author fsun
 * @date 2019年2月12日
 */
public enum RefundTypeEnum {

	UNKNOW(null,"未知"),
	RETURN_ORDER((short)1, "退货单"),
	EXCHANGE_ORDER((short)2, "换退单");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private RefundTypeEnum(Short value, String comment) {
		this.value = value;
		this.comment = comment;
	}

	public Short getValue() {
		return value;
	}

	public void setValue(Short value) {
		this.value = value;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public static RefundTypeEnum getByValue(Short value){
		for (RefundTypeEnum item : RefundTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return RefundTypeEnum.UNKNOW;
	}
	
	public static List<RefundTypeEnum> getAllMoods(){
		List<RefundTypeEnum> gradeList = new ArrayList<>();
		RefundTypeEnum[] md = RefundTypeEnum.values();
		for (RefundTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
