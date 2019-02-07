package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月14日
 */
public enum VipCardTypeEnum {

	UNKNOW(null,"未知"),
	DEFAULT_VIP((int)1, "普通会员卡"),
	SILVER_VIP((int)2, "会员银卡"),
	GOLD_VIP((int)3, "会员金卡");
	
	/** 常量 key */
	private Integer value;
	/** 常量描述 */
	private String comment;
    
	private VipCardTypeEnum(Integer value, String comment) {
		this.value = value;
		this.comment = comment;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public static VipCardTypeEnum getByValue(Integer value){
		for (VipCardTypeEnum item : VipCardTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return VipCardTypeEnum.UNKNOW;
	}
	
	public static List<VipCardTypeEnum> getAllMoods(){
		List<VipCardTypeEnum> gradeList = new ArrayList<>();
		VipCardTypeEnum[] md = VipCardTypeEnum.values();
		for (VipCardTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
