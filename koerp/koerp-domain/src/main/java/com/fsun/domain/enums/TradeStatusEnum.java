package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月14日
 */
public enum TradeStatusEnum {

	ORDERED("00", "已下单"),
	PAID("10", "已付款"),
	DELIVERED("20", "已发货"),
	COMPLETED("30", "交易成功"),
	CANCEL("40", "订单取消"),
	CLOSED("60", "交易关闭"),
	UNKNOW(null,"未知");
	
	/** 常量 key */
	private String code;
	/** 常量描述 */
	private String comment;
    
	private TradeStatusEnum(String code, String comment) {
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

	public static TradeStatusEnum getByCode(String code){
		for (TradeStatusEnum item : TradeStatusEnum.values()) {
			if(item.getCode().equals(code)){
				return item;
			}
		}
		return TradeStatusEnum.UNKNOW;
	}
	
	public static List<TradeStatusEnum> getAllMoods(){
		List<TradeStatusEnum> gradeList = new ArrayList<TradeStatusEnum>();
		TradeStatusEnum[] md = TradeStatusEnum.values();
		for (TradeStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
