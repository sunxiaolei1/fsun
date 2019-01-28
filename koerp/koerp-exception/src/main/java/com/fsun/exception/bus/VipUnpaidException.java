package com.fsun.exception.bus;

import com.fsun.exception.common.SCMException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2019年1月24日
 */
public class VipUnpaidException extends SCMException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5636147737786493549L;

	public VipUnpaidException(String errorMsg) {
        this(SCMErrorEnum.CUSTOMIZE_ERROR.getErrorCode(), errorMsg);
    }

    public VipUnpaidException(int errorCode, String errorMsg) {
    	super(errorCode, errorMsg, null);
    }
    
    public VipUnpaidException(SCMErrorEnum errorEnum) {
        super(errorEnum.getErrorCode(), errorEnum.getErrorMsg(), null);
    }
    
    public VipUnpaidException(SCMErrorEnum errorEnum, Throwable caused) {
    	super(errorEnum.getErrorCode(), errorEnum.getErrorMsg(), caused);
    }

}
