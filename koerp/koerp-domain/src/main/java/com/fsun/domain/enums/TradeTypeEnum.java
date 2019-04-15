package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月14日
 */
public enum TradeTypeEnum {
	
	UNKNOW(null,"未知"),
	UNPAY_CONSUME((short)1, "挂账消费"),
	UNPAY_PAYMENT((short)2, "挂账结款"),
	VIP_CONSUME((short)3, "会员卡消费"),
	VIP_RACHARGE((short)4, "会员卡充值"),
	REFUND_PAYMENT((short)5, "退货结款"),
	RESERVE_CONSUME((short)6, "备用金消费"),
	RESERVE_RACHARGE((short)7, "备用金充值");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private TradeTypeEnum(Short value, String comment) {
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

	public static TradeTypeEnum getByValue(Short value){
		for (TradeTypeEnum item : TradeTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return TradeTypeEnum.UNKNOW;
	}
	
	public static List<TradeTypeEnum> getAllMoods(){
		List<TradeTypeEnum> gradeList = new ArrayList<>();
		TradeTypeEnum[] md = TradeTypeEnum.values();
		for (TradeTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	

}
