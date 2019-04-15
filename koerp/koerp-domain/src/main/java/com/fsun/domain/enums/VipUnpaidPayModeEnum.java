package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2019年1月28日
 */
public enum VipUnpaidPayModeEnum {
	
	UNKNOW(null,"未知"),
	UNOIN_PAY((short)1, "扫码"),
	CASH_PAY((short)2, "现金"),
	ALI_PAY((short)3, "支付宝"),
	WECHAT_PAY((short)4, "微信"),
	OTHERS((short)5, "其他"),
	TRANSFER_PAY((short)8, "转账");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private VipUnpaidPayModeEnum(Short value, String comment) {
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

	public static VipUnpaidPayModeEnum getByValue(Short value){
		for (VipUnpaidPayModeEnum item : VipUnpaidPayModeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return VipUnpaidPayModeEnum.UNKNOW;
	}
	
	public static List<VipUnpaidPayModeEnum> getAllMoods(){
		List<VipUnpaidPayModeEnum> gradeList = new ArrayList<>();
		VipUnpaidPayModeEnum[] md = VipUnpaidPayModeEnum.values();
		for (VipUnpaidPayModeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
