package com.fsun.exception.bus;

import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * 退货单异常
 * @author fsun
 * @date 2019年2月12日
 */
public class AfterSaleException extends SCMException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5636147737786493549L;

	public AfterSaleException(String errorMsg) {
        this(SCMErrorEnum.CUSTOMIZE_ERROR.getErrorCode(), errorMsg);
    }

    public AfterSaleException(int errorCode, String errorMsg) {
    	super(errorCode, errorMsg, null);
    }
    
    public AfterSaleException(SCMErrorEnum errorEnum) {
        super(errorEnum.getErrorCode(), errorEnum.getErrorMsg(), null);
    }
    
    public AfterSaleException(SCMErrorEnum errorEnum, Throwable caused) {
    	super(errorEnum.getErrorCode(), errorEnum.getErrorMsg(), caused);
    }

}
