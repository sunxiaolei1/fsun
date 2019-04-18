package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @ClassName: ReportConditionFieldEnum 
 * @Description: 查询条件子段枚举
 * @author fsun 
 * @date 2018年4月14日 上午7:33:23 
 *
 */
public enum ReportConditionFieldEnum {

	QUERY_DATE_TIME("date", "created_time"),
	
	UNKNOW(null,"未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private ReportConditionFieldEnum(String code, String name) {
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

	public static ReportConditionFieldEnum getByCode(String code){
		for (ReportConditionFieldEnum item : ReportConditionFieldEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return ReportConditionFieldEnum.UNKNOW;
	}
	
	public static List<ReportConditionFieldEnum> getAllMoods(){
		List<ReportConditionFieldEnum> gradeList = new ArrayList<ReportConditionFieldEnum>();
		ReportConditionFieldEnum[] md = ReportConditionFieldEnum.values();
		for (ReportConditionFieldEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
