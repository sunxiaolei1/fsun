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
	BUS_ORDER_PAYACCOUNT_NOT_EXIST(2004, "单据账单不存在"),
	BUS_ORDER_PAYACCOUNT_ILLEGAL(2005, "单据账单非法"),
	BUS_ORDER_STATUS_ILLEGAL(2007, "订单处理中，不能重审，请稍后再试!"),
	BUS_ORDER_STATUS_INVALID(2008, "单据状态不可用"),
	BUS_ORDER_UNPAY_INVALID(2009, "单据挂账单异常，请联系管理员"),
	BUS_ORDER_UNPAY_NOT_EXIST(2010, "单据不存在"),
	BUS_ORDER_UNPAY_STATUS_INVALID(2011, "单据状态不可用"),
	BUS_ORDER_ILLEGAL(2012, "单据非法，请联系管理员!"),
	BUS_RELATION_ORDER_NOT_EXIST(2013, "关联单据不存在!"),
	
	BUS_REFUND_NOT_EXIST(3001, "单据不存在"),
	BUS_REFUND_DETAIL_NOT_EXIST(3002, "单据商品不存在"),
	BUS_REFUND_EXISTED(3003, "单据已存在"),
	BUS_REFUND_PAYACCOUNT_NOT_EXIST(3004, "单据账单不存在"),
	BUS_REFUND_PAYACCOUNT_ILLEGAL(3005, "退单金额非法"),
	BUS_REFUND_SKU_QTY_ILLEGAL(3006, "退货商品数量非法"),
	BUS_REFUND_STATUS_ILLEGAL(3007, "订单处理中，不能重审，请稍后再试!"),
	BUS_REFUND_STATUS_INVALID(3008, "单据状态不可用"),
	
	BUS_SKU_NOT_EXIST(8011, "商品不存在"),
	BUS_SKU_EXISTED(8012, "商品已存在"),
	BUS_SKU_ISNULL(8013, "商品sku是空"),
	BUS_SKU_ILLEGAL(8014, "商品库存非法"),
	BUS_VIP_NOT_EXIST(8021, "会员卡不存在"),
	BUS_VIP_EXISTED(8022, "会员卡已存在"),
	BUS_VIP_ENABLE_PRICE_ILLEGAL(8023, "可用金额不能为负数"),
	BUS_VIP_GIFT_PRICE_ILLEGAL(8024, "赠送金额不能为负数"),
	BUS_VIP_ILLEGAL(8025, "会员卡非法"),
	BUS_CUSTOMER_NOT_EXIST(8031, "客户不存在"),
	BUS_CUSTOMER_EXISTED(8032, "客户已存在"),
	BUS_CUSTOMER_UNPAY_DISABLED(8033, "当前客户没有挂账权限"),
	BUS_CUSTOMER_NO_VIP(8034, "当前客户不是会员"),
	BUS_CODES_NOT_EXIST(8041, "要更新的数据不存在"),
	BUS_CODES_EXISTED(8042, "对不起，该数据类别和编码已存在"),
	BUS_SHOP_NOT_EXIST(8051, "店仓不存在"),	
	BUS_SHOP_EXISTED(8052, "店仓已存在"),
	BUS_SHOP_ISNULL(8053, "店仓是空"),
	BUS_SHOP_ILLEGAL(8054, "店仓非法"),
	BUS_VIP_UNPAID_ILLEGAL(8061, "赠送金额不能大于充值金额"),
	BUS_VIP_UNPAID_IS_ZERO(8062, "交易金额不能为零");
	
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
