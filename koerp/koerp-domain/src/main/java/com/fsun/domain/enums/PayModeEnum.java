package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月14日
 */
public enum PayModeEnum {

	UNKNOW(null,"未知"),
	UNOIN_PAY((short)1, "扫码"),
	CASH_PAY((short)2, "现金"),
	ALI_PAY((short)3, "支付宝"),
	WECHAT_PAY((short)4, "微信"),
	OTHER((short)5, "其他"),
	UNPAY((short)6, "挂账"),
	VIP_PAY((short)7, "会员卡"),
	TRANSFER_PAY((short)8, "转账"),
	RESERVE_PAY((short)9, "备用金"),
	DISCOUNT((short)100, "活动优惠"),
	TO_ZERO((short)900, "抹零");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private PayModeEnum(Short value, String comment) {
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

	public static PayModeEnum getByValue(Short value){
		for (PayModeEnum item : PayModeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return PayModeEnum.UNKNOW;
	}
	
	public static List<PayModeEnum> getAllMoods(){
		List<PayModeEnum> gradeList = new ArrayList<>();
		PayModeEnum[] md = PayModeEnum.values();
		for (PayModeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
