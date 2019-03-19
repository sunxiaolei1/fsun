package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2019年3月19日
 */
public enum DocGoodsTypeEnum {
	
	UNKNOW(null,"未知"),
	NORMAL("1", "正品"),
	SUPPRESS("2", "强压");
	
	/** 常量 key */
	private String value;
	/** 常量描述 */
	private String comment;
    
	private DocGoodsTypeEnum(String value, String comment) {
		this.value = value;
		this.comment = comment;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public static DocGoodsTypeEnum getByValue(String value){
		for (DocGoodsTypeEnum item : DocGoodsTypeEnum.values()) {
			if(item.getValue().equals(value)){
				return item;
			}
		}
		return DocGoodsTypeEnum.UNKNOW;
	}
	
	public static List<DocGoodsTypeEnum> getAllMoods(){
		List<DocGoodsTypeEnum> gradeList = new ArrayList<>();
		DocGoodsTypeEnum[] md = DocGoodsTypeEnum.values();
		for (DocGoodsTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
