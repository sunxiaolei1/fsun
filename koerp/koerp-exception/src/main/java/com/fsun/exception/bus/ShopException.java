package com.fsun.exception.bus;

import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2018年12月9日
 */
public class ShopException extends SCMException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5636147737786493549L;

	public ShopException(String errorMsg) {
        this(SCMErrorEnum.CUSTOMIZE_ERROR.getErrorCode(), errorMsg);
    }

    public ShopException(int errorCode, String errorMsg) {
    	super(errorCode, errorMsg, null);
    }
    
    public ShopException(SCMErrorEnum errorEnum) {
        super(errorEnum.getErrorCode(), errorEnum.getErrorMsg(), null);
    }
    
    public ShopException(SCMErrorEnum errorEnum, Throwable caused) {
    	super(errorEnum.getErrorCode(), errorEnum.getErrorMsg(), caused);
    }

}

