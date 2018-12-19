package com.fsun.exception.enums;

import com.fsun.exception.common.SCMException;

/**
 * 异常代码/信息枚举
 * @author sunxiaolei
 *
 */
public enum SCMErrorEnum {

	//成功信息
	SUCCESS(200, "处理成功"), 
	
	//系统默认异常信息
	INVALID_PARAMS(SCMException.CODE_PARAM, "参数为空或者不完整"), 
	SYSTEM_ERROR(SCMException.CODE_UNKNOW, " 系统处理失败"), 
	CUSTOMIZE_ERROR(SCMException.CODE_CUSTOMIZE, " 自定义错误"),
	
	//用户异常信息-10
	NO_LOGIN(1001, "您还未登陆"), 
	USER_DOES_NOT_EXIST(1002, "用户不存在"),
	USER_ID_NOT_NULL(1003, "用户id不能为空"),
	USER_ILLEGAL(1004, "用户非法"),
	
	//单据异常信息-20
	BUS_ORDER_NOT_EXIST(2001, "单据不存在"),
	BUS_ORDER_DETAIL_NOT_EXIST(2002, "单据商品不存在"),
	BUS_ORDER_EXISTED(2003, "单据已存在"),
	BUS_ORDER_STATUS_ILLEGAL(2007, "订单处理中，不能重审，请稍后再试!"),
	BUS_ORDER_STATUS_INVALID(2008, "单据状态不可用"),
	
	BUS_SKU_NOT_EXIST(8011, "商品不存在"),
	BUS_SKU_EXISTED(8012, "商品已存在"),
	BUS_SKU_ISNULL(8013, "商品sku是空"),
	BUS_SKU_ILLEGAL(8014, "商品库存非法"),
	BUS_VIP_NOT_EXIST(8021, "会员卡不存在"),
	BUS_VIP_EXISTED(8022, "会员卡已存在"),
	BUS_CUSTOMER_NOT_EXIST(8031, "客户不存在"),
	BUS_CUSTOMER_EXISTED(8032, "客户已存在"),
	BUS_CODES_NOT_EXIST(8041, "要更新的数据不存在"),
	BUS_CODES_EXISTED(8042, "对不起，该数据类别和编码已存在"),
	BUS_SHOP_NOT_EXIST(8051, "店仓不存在"),	
	BUS_SHOP_EXISTED(8052, "店仓已存在"),
	BUS_SHOP_ISNULL(8053, "店仓是空");

	private int errorCode;
	
	private String errorType;

	private String errorMsg;

	SCMErrorEnum(int errorCode, String errorMsg) {
		this.errorMsg = errorMsg;
		this.errorCode = errorCode;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	/**
	 * @return the errorType
	 */
	public String getErrorType() {
		return errorType;
	}

	/**
	 * @param errorType the errorType to set
	 */
	public void setErrorType(String errorType) {
		this.errorType = errorType;
	}


}
