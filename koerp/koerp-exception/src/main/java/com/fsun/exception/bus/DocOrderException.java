package com.fsun.exception.bus;

import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2018年12月15日
 */
public class DocOrderException extends SCMException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5636147737786493549L;

	public DocOrderException(String errorMsg) {
        this(SCMErrorEnum.CUSTOMIZE_ERROR.getErrorCode(), errorMsg);
    }

    public DocOrderException(int errorCode, String errorMsg) {
    	super(errorCode, errorMsg, null);
    }
    
    public DocOrderException(SCMErrorEnum errorEnum) {
        super(errorEnum.getErrorCode(), errorEnum.getErrorMsg(), null);
    }
    
    public DocOrderException(SCMErrorEnum errorEnum, Throwable caused) {
    	super(errorEnum.getErrorCode(), errorEnum.getErrorMsg(), caused);
    }

}

