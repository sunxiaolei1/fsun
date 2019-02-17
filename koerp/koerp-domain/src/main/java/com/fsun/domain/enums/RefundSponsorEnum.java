package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2019年2月17日
 */
public enum RefundSponsorEnum {

	UNKNOW(null,"未知"),
	BUYER((short)1, "下单用户"),
	THIRD_PLAT((short)2, "第三方平台"),
	SELLER((short)3, "商户"),
	OTHER((short)4, "其他");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private RefundSponsorEnum(Short value, String comment) {
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

	public static RefundSponsorEnum getByValue(Short value){
		for (RefundSponsorEnum item : RefundSponsorEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return RefundSponsorEnum.UNKNOW;
	}
	
	public static List<RefundSponsorEnum> getAllMoods(){
		List<RefundSponsorEnum> gradeList = new ArrayList<>();
		RefundSponsorEnum[] md = RefundSponsorEnum.values();
		for (RefundSponsorEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
