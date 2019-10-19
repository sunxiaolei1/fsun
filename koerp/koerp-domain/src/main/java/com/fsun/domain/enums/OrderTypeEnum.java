package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月14日
 */
public enum OrderTypeEnum {

	UNKNOW(null,"未知"),
	ORDER((short)1, "销售出库单"),
	TAKE_ORDER((short)2, "销售寄存单"),
	AGENT_ORDER((short)3, "代理代发单");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private OrderTypeEnum(Short value, String comment) {
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

	public static OrderTypeEnum getByValue(Short value){
		for (OrderTypeEnum item : OrderTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return OrderTypeEnum.UNKNOW;
	}
	
	public static List<OrderTypeEnum> getAllMoods(){
		List<OrderTypeEnum> gradeList = new ArrayList<>();
		OrderTypeEnum[] md = OrderTypeEnum.values();
		for (OrderTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
