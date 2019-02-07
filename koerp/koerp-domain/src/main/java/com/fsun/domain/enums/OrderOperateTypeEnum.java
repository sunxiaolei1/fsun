package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 单据操作类型
 * @author fsun
 * @date 2018年12月20日
 */
public enum OrderOperateTypeEnum {
	
	ADD("add", "新增"),
	EDIT("edit", "编辑"),
	VIEW("view", "查看"),
	UNKNOW(null,"未知");
	
	/** 常量 key */
	private String code;
	/** 常量描述 */
	private String comment;
    
	private OrderOperateTypeEnum(String code, String comment) {
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

	public static OrderOperateTypeEnum getByCode(String code){
		for (OrderOperateTypeEnum item : OrderOperateTypeEnum.values()) {
			if(item.getCode().equals(code)){
				return item;
			}
		}
		return OrderOperateTypeEnum.UNKNOW;
	}
	
	public static List<OrderOperateTypeEnum> getAllMoods(){
		List<OrderOperateTypeEnum> gradeList = new ArrayList<OrderOperateTypeEnum>();
		OrderOperateTypeEnum[] md = OrderOperateTypeEnum.values();
		for (OrderOperateTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}