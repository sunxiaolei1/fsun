package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月14日
 */
public enum TradeFromEnum {

	PC("pc", "PC端"),
	APP("app", "客户端"),
	UNKNOW(null,"未知");
	
	/** 常量 key */
	private String code;
	/** 常量描述 */
	private String comment;
    
	private TradeFromEnum(String code, String comment) {
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

	public static TradeFromEnum getByCode(String code){
		for (TradeFromEnum item : TradeFromEnum.values()) {
			if(item.getCode().equals(code)){
				return item;
			}
		}
		return TradeFromEnum.UNKNOW;
	}
	
	public static List<TradeFromEnum> getAllMoods(){
		List<TradeFromEnum> gradeList = new ArrayList<TradeFromEnum>();
		TradeFromEnum[] md = TradeFromEnum.values();
		for (TradeFromEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
