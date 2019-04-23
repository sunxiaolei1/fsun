package com.fsun.domain.report;

/**
 * @author fsun
 * @date 2019年4月23日
 */
public class CustomerContrastCondition extends ReportCondition{

	/**
	 * 客户编码
	 */
	private String customerCode;
	
	/**
	 * 过滤掉的客户类型逗号分隔的字符串
	 */
	private String notInCustomerTypes;

	/**
	 * @return the customerCode
	 */
	public String getCustomerCode() {
		return customerCode;
	}

	/**
	 * @param customerCode the customerCode to set
	 */
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getNotInCustomerTypes() {
		return notInCustomerTypes;
	}

	public void setNotInCustomerTypes(String notInCustomerTypes) {
		this.notInCustomerTypes = notInCustomerTypes;
	}

}
