package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fsun
 * @date 2018年12月14日
 */
public enum CustomerTypeEnum {

	NG("NG", "内供客户"),
	VIP("VIP", "会员"),
	JXS("JXS", "经销商"),
	GYS("GYS", "供应商"),
	YWY("YWY", "业务员"),
	SK("SK", "散客"),
	GZ("GZ", "挂账单位"),
	UNKNOW(null,"未知");
	
	/** 常量 key */
	private String code;
	/** 常量描述 */
	private String comment;
    
	private CustomerTypeEnum(String code, String comment) {
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

	public static CustomerTypeEnum getByCode(String code){
		for (CustomerTypeEnum item : CustomerTypeEnum.values()) {
			if(item.getCode().equals(code)){
				return item;
			}
		}
		return CustomerTypeEnum.UNKNOW;
	}
	
	public static List<CustomerTypeEnum> getAllMoods(){
		List<CustomerTypeEnum> gradeList = new ArrayList<CustomerTypeEnum>();
		CustomerTypeEnum[] md = CustomerTypeEnum.values();
		for (CustomerTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
