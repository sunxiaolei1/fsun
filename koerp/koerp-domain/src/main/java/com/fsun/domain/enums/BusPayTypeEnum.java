package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2019年2月12日
 */
public enum BusPayTypeEnum {
	
	UNKNOW(null,"未知"),
	COMSUME_PAY((short)1, "消费"),
	REFUND_PAY((short)2, "退款"),
	SUPPLY_PAY((short)3, "补款");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private BusPayTypeEnum(Short value, String comment) {
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

	public static BusPayTypeEnum getByValue(Short value){
		for (BusPayTypeEnum item : BusPayTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return BusPayTypeEnum.UNKNOW;
	}
	
	public static List<BusPayTypeEnum> getAllMoods(){
		List<BusPayTypeEnum> gradeList = new ArrayList<>();
		BusPayTypeEnum[] md = BusPayTypeEnum.values();
		for (BusPayTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}