package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 退单状态
 * @author fsun
 * @date 2019年2月12日
 */
public enum RefundStatusEnum {
	
	UNKNOW(null,"未知"),
	RETURN_UNREFUND((short)10, "已退货未退款"),
	RETURN_REFUND((short)20, "已退货已退款"),
	COMPLETE((short)30, "退单完成"),
	CANCEL((short)40, "退单取消");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private RefundStatusEnum(Short value, String comment) {
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

	public static RefundStatusEnum getByValue(Short value){
		for (RefundStatusEnum item : RefundStatusEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return RefundStatusEnum.UNKNOW;
	}
	
	public static List<RefundStatusEnum> getAllMoods(){
		List<RefundStatusEnum> gradeList = new ArrayList<>();
		RefundStatusEnum[] md = RefundStatusEnum.values();
		for (RefundStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
