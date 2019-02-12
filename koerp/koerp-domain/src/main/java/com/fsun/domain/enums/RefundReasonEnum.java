package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 退换货原因
 * @author fsun
 * @date 2019年2月12日
 */
public enum RefundReasonEnum {
	
	UNKNOW(null,"未知"),
	GOODS_WRONG((short)1, "发错商品"),
	RETURN_NO_REASON((short)2, "无理由退换货"),
	GOODS_QUALITY((short)3, "商品质量问题"),
	GOODS_DIFF((short)4, "收到实际商品与描述不符"),
	DELIVERY_PROBLEM((short)5, "配送产生问题"),
	OTHER((short)6, "其他");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private RefundReasonEnum(Short value, String comment) {
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

	public static RefundReasonEnum getByValue(Short value){
		for (RefundReasonEnum item : RefundReasonEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return RefundReasonEnum.UNKNOW;
	}
	
	public static List<RefundReasonEnum> getAllMoods(){
		List<RefundReasonEnum> gradeList = new ArrayList<>();
		RefundReasonEnum[] md = RefundReasonEnum.values();
		for (RefundReasonEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
