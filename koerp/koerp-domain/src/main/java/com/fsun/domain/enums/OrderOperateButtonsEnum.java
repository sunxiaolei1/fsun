package com.fsun.domain.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * 订单操作按钮集合
 * @author fsun
 *
 */
public enum OrderOperateButtonsEnum {

	UNKNOW("","未知"),	
	REFRESH("order_refresh","刷新"),  //**共用	
	RETURN_ORDER("order_return","返回"), //**共用	
	
	//销售单
	CREATE_REFUND("create_refund","创建退货单"),
	CREATE_BARTER("create_barter","创建换货单"),
	ADD_ORDER_REMARK("add_order_remark","添加备注"),
	CANCEL_ORDER("order_cancel","取消订单"),
	
	//入库单
	CANCEL_DOC_ASN("docAsn_cancel","取消入库单"),
	
	//出库单
	CANCEL_DOC_ORDER("docOrder_cancel","取消出库单"),
		
	//申请单
	CANCEL_DOC_PO("docPo_cancel","取消申请单"),
	UPDATE_DOC_PO("docPo_update","更新申请单"),
	
	
	//退货单、换货单
	REPAIR_REFUND("repair_refund","补退款"),
	COMPLETE_REFUND("complete_refund","退货完成"),
	ONEKEY_REFUND("onekey_refund","一键退货"),
	ADD_REFUND_REMARK("add_refund_remark","添加备注"),
	CANCEL_REFUND("refund_cancel","取消退货单");
	
	/** 常量code */
	private String code;
	/** 常量名称 */
	private String name;
    
	private OrderOperateButtonsEnum(String code, String name) {
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

	public static OrderOperateButtonsEnum getByName(String code){
		for (OrderOperateButtonsEnum item : OrderOperateButtonsEnum.values()) {
			if(code.equals(item.getCode())){
				return item;
			}
		}
		return OrderOperateButtonsEnum.UNKNOW;
	}
	
	public static List<OrderOperateButtonsEnum> getAllMoods(){
		List<OrderOperateButtonsEnum> gradeList = new ArrayList<OrderOperateButtonsEnum>();
		OrderOperateButtonsEnum[] md = OrderOperateButtonsEnum.values();
		for (OrderOperateButtonsEnum item : md) {
			gradeList.add(item);
		}
		return gradeList;
	}
	
	
}
