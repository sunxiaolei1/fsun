package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月25日
 */
public enum PayTypeEnum {

	UNKNOW(null,"未知"),
	CURR_PAY((short)1, "在线付款"),
	ARRIVE_PAY((short)2, "货到付款"),
	UNPAY((short)3, "挂账");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private PayTypeEnum(Short value, String comment) {
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

	public static PayTypeEnum getByValue(Short value){
		for (PayTypeEnum item : PayTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return PayTypeEnum.UNKNOW;
	}
	
	public static List<PayTypeEnum> getAllMoods(){
		List<PayTypeEnum> gradeList = new ArrayList<>();
		PayTypeEnum[] md = PayTypeEnum.values();
		for (PayTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
