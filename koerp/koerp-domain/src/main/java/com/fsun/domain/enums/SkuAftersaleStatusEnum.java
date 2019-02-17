package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2019年2月17日
 */
public enum SkuAftersaleStatusEnum {

	UNKNOW(null,"未知"),
	NORMAL((short)10, "交易成功"),
	RETURN((short)20, "退货"),
	EXCHANGE((short)30, "退换");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private SkuAftersaleStatusEnum(Short value, String comment) {
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

	public static SkuAftersaleStatusEnum getByValue(Short value){
		for (SkuAftersaleStatusEnum item : SkuAftersaleStatusEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return SkuAftersaleStatusEnum.UNKNOW;
	}
	
	public static List<SkuAftersaleStatusEnum> getAllMoods(){
		List<SkuAftersaleStatusEnum> gradeList = new ArrayList<>();
		SkuAftersaleStatusEnum[] md = SkuAftersaleStatusEnum.values();
		for (SkuAftersaleStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
