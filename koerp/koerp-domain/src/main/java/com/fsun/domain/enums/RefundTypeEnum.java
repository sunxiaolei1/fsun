package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 退单类型枚举
 * @author fsun
 * @date 2019年2月12日
 */
public enum RefundTypeEnum {

	UNKNOW(null, "", "未知"),
	RETURN_ORDER((short)1, "TH","退货单"),
	EXCHANGE_ORDER((short)2, "HT", "换退单");
	
	/** 常量 key */
	private Short value;
	
	/** 常量描述 */
	private String sign;
	
	/** 常量描述 */
	private String comment;
    
	private RefundTypeEnum(Short value, String sign, String comment) {
		this.value = value;
		this.sign = sign;
		this.comment = comment;
	}

	public Short getValue() {
		return value;
	}

	public void setValue(Short value) {
		this.value = value;
	}
	
	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
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
