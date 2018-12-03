package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 审核状态
 * @author sunxiaolei
 *
 */
public enum AuditStatusEnum {

	UNKNOW(null,"未知"),
	DEFAULT((short)0, "--"),
	UNAUDIT((short)10, "待审核"),
	REJECT_AUDIT((short)20, "审核未通过"),
	PASS_AUDIT((short)30, "审核通过"),
	CLOSE((short)40, "关闭");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private AuditStatusEnum(Short value, String comment) {
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

	public static AuditStatusEnum getByValue(Short value){
		for (AuditStatusEnum item : AuditStatusEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return AuditStatusEnum.UNKNOW;
	}
	
	public static List<AuditStatusEnum> getAllMoods(){
		List<AuditStatusEnum> gradeList = new ArrayList<>();
		AuditStatusEnum[] md = AuditStatusEnum.values();
		for (AuditStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
