package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月14日
 */
public enum FlowStatusEnum {

	CREATED("00", "创建"),
	STOCKOUT("30", "出库"),
	COMPLETED("40", "完成"),
	RETURNED("99", "已回传"),
	UNKNOW(null,"未知");
	
	/** 常量 key */
	private String code;
	/** 常量描述 */
	private String comment;
    
	private FlowStatusEnum(String code, String comment) {
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

	public static FlowStatusEnum getByCode(String code){
		for (FlowStatusEnum item : FlowStatusEnum.values()) {
			if(item.getCode().equals(code)){
				return item;
			}
		}
		return FlowStatusEnum.UNKNOW;
	}
	
	public static List<FlowStatusEnum> getAllMoods(){
		List<FlowStatusEnum> gradeList = new ArrayList<FlowStatusEnum>();
		FlowStatusEnum[] md = FlowStatusEnum.values();
		for (FlowStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
