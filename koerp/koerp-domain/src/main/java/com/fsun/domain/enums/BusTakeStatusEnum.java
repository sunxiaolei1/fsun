package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 提货状态
 * @author fsun
 * @date 2019年4月3日
 */
public enum BusTakeStatusEnum {

	TAKED("30", "已提货"),
	CANCEL("40", "提货取消"),
	COMPLETE("60", "交易完成"),
	UNKNOW(null,"未知");
	
	/** 常量 key */
	private String code;
	/** 常量描述 */
	private String comment;
    
	private BusTakeStatusEnum(String code, String comment) {
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

	public static BusTakeStatusEnum getByCode(String code){
		for (BusTakeStatusEnum item : BusTakeStatusEnum.values()) {
			if(item.getCode().equals(code)){
				return item;
			}
		}
		return BusTakeStatusEnum.UNKNOW;
	}
	
	public static List<BusTakeStatusEnum> getAllMoods(){
		List<BusTakeStatusEnum> gradeList = new ArrayList<BusTakeStatusEnum>();
		BusTakeStatusEnum[] md = BusTakeStatusEnum.values();
		for (BusTakeStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
