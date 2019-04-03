package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 订单中的寄提状态
 * @author fsun
 * @date 2019年4月3日
 */
public enum OrderTakeStatusEnum {
	
	UNTAKE("00", "未提货"),
	PART_TAKE("10", "部分提货"),
	ALL_TAKE("20", "提货完成"),
	UNKNOW(null,"未知");
	
	/** 常量 key */
	private String code;
	/** 常量描述 */
	private String comment;
    
	private OrderTakeStatusEnum(String code, String comment) {
		this.code = code;
		this.comment = comment;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public static OrderTakeStatusEnum getByCode(String code){
		for (OrderTakeStatusEnum item : OrderTakeStatusEnum.values()) {
			if(item.getCode().equals(code)){
				return item;
			}
		}
		return OrderTakeStatusEnum.UNKNOW;
	}
	
	public static List<OrderTakeStatusEnum> getAllMoods(){
		List<OrderTakeStatusEnum> gradeList = new ArrayList<OrderTakeStatusEnum>();
		OrderTakeStatusEnum[] md = OrderTakeStatusEnum.values();
		for (OrderTakeStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}