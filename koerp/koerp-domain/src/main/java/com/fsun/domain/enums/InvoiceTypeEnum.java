package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2019年10月19日
 */
public enum InvoiceTypeEnum {

	UNKNOW(null,"未知"),
	GENERAL((short)0, "普通发票"),
	SPECIAL((short)1, "增值发票");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private InvoiceTypeEnum(Short value, String comment) {
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

	public static InvoiceTypeEnum getByValue(Short value){
		for (InvoiceTypeEnum item : InvoiceTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return InvoiceTypeEnum.UNKNOW;
	}
	
	public static List<InvoiceTypeEnum> getAllMoods(){
		List<InvoiceTypeEnum> gradeList = new ArrayList<>();
		InvoiceTypeEnum[] md = InvoiceTypeEnum.values();
		for (InvoiceTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
