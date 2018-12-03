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
	ORDER_NOT_EXIST(2001, "单据不存在"),
	ORDER_DETAIL_NOT_EXIST(2002, "单据商品不存在"),
	DIFF_ORDER_NOT_EXIST(2003, "差异单不存在"),
	DIFF_ORDER_DETAIL_NOT_EXIST(2004, "差异单商品不存在"),
	DIFF_ORDER_STATUS_ILLEGAL(2005, "差异单状态非法"),
	ORDER_AMOUNT_ILLEGAL(2006, "单据金额非法"),
	ORDER_STATUS_ILLEGAL(2007, "订单处理中，不能重审，请稍后再试!"),
	ORDER_STATUS_INVALID(2008, "单据状态不可用"),
	
	//售后单异常信息-21
	REFUND_ORDER_NOT_EXIST(2101, "退货单不存在"),
	REFUND_ORDER_DETAIL_NOT_EXIST(2102, "退货单商品不存在"),
	REISSUE_ORDER_NOT_EXIST(2103, "补发单不存在"),
	REISSUE_ORDER_DETAIL_NOT_EXIST(2104, "补发单商品不存在"),
	REFUND_ORDER_DETAIL_ILLEGAL(2105, "退货单商品非法"),
	REFUND_ORDER_STATUS_ILLEGAL(2106, "退货单状态非法"),
	
	//活动信息异常-30
	PROMO_NOT_EXIST(3001, "活动不存在"),
	PROMO_SKU_DETAIL_NOT_EXIST(3002, "参与活动的商品不存在"),
	PROMO_GIFT_SKU_NOT_EXIST(3003, "赠送商品不存在"),
	PROMO_STATUS_ILLEGAL(3004, "活动状态非法"),
	
	//黑名单异常
	BLACK_USER_EXIST(4001, "黑名单已存在");

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
