package com.fsun.exception.bus;

import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * 销售订单类异常
 * @author sunxiaolei
 *
 */
public class OrderException extends SCMException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5636147737786493549L;

	public OrderException(String errorMsg) {
        this(SCMErrorEnum.CUSTOMIZE_ERROR.getErrorCode(), errorMsg);
    }

    public OrderException(int errorCode, String errorMsg) {
    	super(errorCode, errorMsg, null);
    }
    
    public OrderException(SCMErrorEnum errorEnum) {
        super(errorEnum.getErrorCode(), errorEnum.getErrorMsg(), null);
    }
    
    public OrderException(SCMErrorEnum errorEnum, Throwable caused) {
    	super(errorEnum.getErrorCode(), errorEnum.getErrorMsg(), caused);
    }

}