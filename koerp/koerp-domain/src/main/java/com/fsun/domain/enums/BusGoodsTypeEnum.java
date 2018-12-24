package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 销售商品类型
 * @author fsun
 * @date 2018年12月24日
 */
public enum BusGoodsTypeEnum {

	UNKNOW(null,"未知"),
	NORMAL_GOODS((short)1, "正品"),
	FOLLOW_GOODS((short)2, "随货"),
	GIFTS_GOODS((short)3, "赠品");
	
	/** 常量 key */
	private Short value;
	/** 常量描述 */
	private String comment;
    
	private BusGoodsTypeEnum(Short value, String comment) {
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

	public static BusGoodsTypeEnum getByValue(Short value){
		for (BusGoodsTypeEnum item : BusGoodsTypeEnum.values()) {
			if(item.getValue()==value){
				return item;
			}
		}
		return BusGoodsTypeEnum.UNKNOW;
	}
	
	public static List<BusGoodsTypeEnum> getAllMoods(){
		List<BusGoodsTypeEnum> gradeList = new ArrayList<>();
		BusGoodsTypeEnum[] md = BusGoodsTypeEnum.values();
		for (BusGoodsTypeEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
}
