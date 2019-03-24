package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品库存交易状态枚举
 * @author fsun
 * @date 2018年12月15日
 */
public enum DocTradeStatusEnum {
	
	SI_DQS("A00","待签收"),
	SI_BFQS("A10","部分收货"),
	SI_WQSH("A20","完全收货"),
	SI_SHQX("A90","收货取消"),
	SI_JJSH("A91","拒绝收货"),
	SO_DSH("B00","待审核"),
	SO_SHWC("B10","审核完成"),
	SO_DDCK("B20","订单出库"),
	SO_CKWC("B30","出库完成"),
	SO_CKQX("B90","出库取消"),
	COMPLETED("30", "交易成功"),
	CANCEL("40", "交易取消"),
	UNKNOW("UNKNOW","未知");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private DocTradeStatusEnum(String code, String name) {
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

	public static DocTradeStatusEnum getByName(String code){
		for (DocTradeStatusEnum item : DocTradeStatusEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return DocTradeStatusEnum.UNKNOW;
	}
	
	public static List<DocTradeStatusEnum> getAllMoods(){
		List<DocTradeStatusEnum> gradeList = new ArrayList<DocTradeStatusEnum>();
		DocTradeStatusEnum[] md = DocTradeStatusEnum.values();
		for (DocTradeStatusEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
}