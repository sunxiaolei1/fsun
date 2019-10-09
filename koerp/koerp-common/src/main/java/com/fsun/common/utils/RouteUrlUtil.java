package com.fsun.common.utils;
/**
 * @author fsun
 * @date 2019年10月10日
 */
public class RouteUrlUtil {

	/**
	 * erp服务地址
	 */
	private static final String ERP_ADDRESS = "http://192.168.0.1:8080/erp";
	
	/**
	 * 创建出库单地址
	 */
	public static final String ERP_CREATE_ORDER_URL = ERP_ADDRESS + "/order/create";
}
