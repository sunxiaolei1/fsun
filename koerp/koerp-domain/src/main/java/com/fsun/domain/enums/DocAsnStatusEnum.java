package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 入库单状态枚举
 * @author Gang Sun
 *
 */
public enum DocAsnStatusEnum {
	
	SI_DQS("A00","待签收"),
	SI_BFQS("A10","部分收货"),
	SI_WQSH("A20","完全收货"),
	SI_SHWC("A30","收货完成"),
	SI_SHQX("A90","收货取消"),
	SI_JJSH("A91","拒绝收货"),
	UNKNOW("UNKNOW","未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocAsnStatusEnum(String code, String name) {
		this.code = code;
		this.name = name;
	}

	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static DocAsnStatusEnum getByName(String code){
		for (DocAsnStatusEnum item : DocAsnStatusEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocAsnStatusEnum.UNKNOW;
	}
	
	public static List<DocAsnStatusEnum> getAllMoods(){
		List<DocAsnStatusEnum> gradeList = new ArrayList<DocAsnStatusEnum>();
		DocAsnStatusEnum[] md = DocAsnStatusEnum.values();
		for (DocAsnStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}