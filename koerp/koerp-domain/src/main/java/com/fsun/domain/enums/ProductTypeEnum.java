package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月7日
 */
public enum ProductTypeEnum {
	
	UNKNOW(null,"未知"),
	SINGLE((short)0, "单品"),
	PACKAGE((short)1, "套餐"),
	MATERIEL((short)2, "物料");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private ProductTypeEnum(Short value, String comment) {
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

	public static ProductTypeEnum getByValue(Short value){
		for (ProductTypeEnum item : ProductTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return ProductTypeEnum.UNKNOW;
	}
	
	public static List<ProductTypeEnum> getAllMoods(){
		List<ProductTypeEnum> gradeList = new ArrayList<>();
		ProductTypeEnum[] md = ProductTypeEnum.values();
		for (ProductTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}

