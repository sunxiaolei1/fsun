package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @ClassName: ReportFieldTypeEnum 
 * @Description: 字段类型枚举
 * @author fsun 
 * @date 2018年4月23日 上午10:09:03 
 *
 */
public enum ReportFieldTypeEnum {

	/**
	 * 字符型
	 */
	FIELD_STRING("1","STRING"),
	/**
	 * 整型
	 */
	FIELD_LONG("2","LONG"),
	/**
	 * 浮点型
	 */
	FIELD_DOUBLE("3","DOUBLE"),
	
	/**
	 * 布尔型
	 */
	FIELD_BOOLEAN("4","BOOLEAN"),
	
	/**
	 * 日期类型
	 */
	FIELD_DATE("5","DATE"),
	
	UNKNOW(null,"未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private ReportFieldTypeEnum(String code, String name) {
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

	public static ReportFieldTypeEnum getByCode(String code){
		for (ReportFieldTypeEnum item : ReportFieldTypeEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return ReportFieldTypeEnum.UNKNOW;
	}
	
	public static List<ReportFieldTypeEnum> getAllMoods(){
		List<ReportFieldTypeEnum> gradeList = new ArrayList<ReportFieldTypeEnum>();
		ReportFieldTypeEnum[] md = ReportFieldTypeEnum.values();
		for (ReportFieldTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
