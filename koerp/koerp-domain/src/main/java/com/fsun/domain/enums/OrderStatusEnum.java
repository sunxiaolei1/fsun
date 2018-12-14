package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月14日
 */
public enum OrderStatusEnum {

	UNCONFIRM("0", "未确认"),
	CONFIRMED("1", "已确认"),
	RECEIPTED("2", "已接配送"),
	PICKUP("3", "已取货"),
	ARRIVED("4", "已配送成功"),
	FINISHED("5", "已完结"),
	CANCEL("6", "已取消"),
	UNKNOW(null,"未知");
	
	/** 常量 key */
	private String code;
	/** 常量描述 */
	private String comment;
    
	private OrderStatusEnum(String code, String comment) {
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

	public static OrderStatusEnum getByCode(String code){
		for (OrderStatusEnum item : OrderStatusEnum.values()) {
			if(item.getCode().equals(code)){
				return item;
			}
		}
		return OrderStatusEnum.UNKNOW;
	}
	
	public static List<OrderStatusEnum> getAllMoods(){
		List<OrderStatusEnum> gradeList = new ArrayList<OrderStatusEnum>();
		OrderStatusEnum[] md = OrderStatusEnum.values();
		for (OrderStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
