package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品库存交易类型枚举
 * @author fsun
 * @date 2018年12月15日
 */
public enum DocTradeTypeEnum {
	
	ALLOT_SO("11","调拨出库"),
	SHORTAGE_SO("12","盘亏出库"),
	PURCHASE_SO("13","采购退货"),
	SALE_SO("14","销售出库"),
	LOSE_SO("15","报损出库"),
	USE_SO("16","领用出库"),
	ALLOT_SI("21","调拨入库"),
	OVER_SI("22","盘盈入库"),
	PURCHASE_SI("23","采购入库"),
	BACK_SI("24","销退入库"),
	SUNDRY_SI("25","杂收入库"),
	UNKNOW("UNKNOW","未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocTradeTypeEnum(String code, String name) {
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

	public static DocTradeTypeEnum getByName(String code){
		for (DocTradeTypeEnum item : DocTradeTypeEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocTradeTypeEnum.UNKNOW;
	}
	
	public static List<DocTradeTypeEnum> getAllMoods(){
		List<DocTradeTypeEnum> gradeList = new ArrayList<DocTradeTypeEnum>();
		DocTradeTypeEnum[] md = DocTradeTypeEnum.values();
		for (DocTradeTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}