package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 订单处理状态
 * @author fsun
 * @date 2019年2月12日
 */
public enum RefundOrderStatusEnum {
	
	UNKNOW(null,"未知"),
	UNSOLVE((short)0, "未处理"),
	SOLVED((short)1, "已处理");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private RefundOrderStatusEnum(Short value, String comment) {
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

	public static RefundOrderStatusEnum getByValue(Short value){
		for (RefundOrderStatusEnum item : RefundOrderStatusEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return RefundOrderStatusEnum.UNKNOW;
	}
	
	public static List<RefundOrderStatusEnum> getAllMoods(){
		List<RefundOrderStatusEnum> gradeList = new ArrayList<>();
		RefundOrderStatusEnum[] md = RefundOrderStatusEnum.values();
		for (RefundOrderStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}