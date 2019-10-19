package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 配送类型
 * @author fsun
 * @date 2019年10月19日
 */
public enum LogisticsTypeEnum {

	UNKNOW(null,"未知"),
	PLATFORM_DELIVERY((short)1, "平台配送"),
	SELF_DELIVERY((short)2, "自配送"),
	PICKED_UP((short)3, "自提");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private LogisticsTypeEnum(Short value, String comment) {
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

	public static LogisticsTypeEnum getByValue(Short value){
		for (LogisticsTypeEnum item : LogisticsTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return LogisticsTypeEnum.UNKNOW;
	}
	
	public static List<LogisticsTypeEnum> getAllMoods(){
		List<LogisticsTypeEnum> gradeList = new ArrayList<>();
		LogisticsTypeEnum[] md = LogisticsTypeEnum.values();
		for (LogisticsTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
