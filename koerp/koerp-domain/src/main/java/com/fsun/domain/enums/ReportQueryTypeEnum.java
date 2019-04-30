package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @ClassName: ReportQueryTypeEnum 
 * @Description: 报表查询类型枚举 
 * @author fsun 
 * @date 2018年4月18日 下午5:10:18 
 *
 */
public enum ReportQueryTypeEnum {

	/**
	 * 领用出库报表
	 */
	SKU_USE_SO("p_sus", "P_USE_SO_REPORT", 2),
	
	/**
	 * 商品出库报表
	 */
	SKU_SO("p_ss", "P_SKU_SO_REPORT", 2),
	
	/**
	 * 销售对账单
	 */
	ORDER("b_bus_order", "T_BUS_ORDER", 1),
	
	/**
	 * 售后单汇总
	 */
	REFUND("b_bus_refund", "T_BUS_REFUND", 1),
	
	
	UNKNOW(null, "未知", 0);
	
	/**
	 * 表的别名
	 */
	private String code;
	
	/**
	 * 数据库表名
	 */
	private String name;
	
	/**
	 * 查询类型(1、 默认sql查询  2、存储过程调用、3、接口调用, 4、其他)
	 */
	private int sqlType;
    
	private ReportQueryTypeEnum(String code, String name, int sqlType) {
		this.code = code;
		this.name = name;
		this.sqlType = sqlType;
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

	public int getSqlType() {
		return sqlType;
	}

	public void setSqlType(int sqlType) {
		this.sqlType = sqlType;
	}

	public static ReportQueryTypeEnum getByCode(String code){
		for (ReportQueryTypeEnum item : ReportQueryTypeEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return ReportQueryTypeEnum.UNKNOW;
	}
	
	public static List<ReportQueryTypeEnum> getAllMoods(){
		List<ReportQueryTypeEnum> gradeList = new ArrayList<ReportQueryTypeEnum>();
		ReportQueryTypeEnum[] md = ReportQueryTypeEnum.values();
		for (ReportQueryTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}
