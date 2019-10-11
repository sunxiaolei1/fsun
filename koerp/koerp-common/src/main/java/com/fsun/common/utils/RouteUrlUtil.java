package com.fsun.common.utils;
/**
 * @author fsun
 * @date 2019年10月10日
 */
public class RouteUrlUtil {

	/**
	 * erp服务地址
	 */
	private static final String ERP_ADDRESS = "http://localhost:8080/NMS-webapp/rest";
	
	/**
	 * 添加要货单/调拨单
	 */
	public static final String ERP_CREATE_ORDER_URL = ERP_ADDRESS + "/erp/order/create";
	
	/**
	 * 推送要货签收数量
	 */
	public static final String ERP_RECEIVE_ORDER_URL = ERP_ADDRESS + "/erp/order/receive";
	
	/**
	 * 添加退货单
	 */
	public static final String ERP_REFUND_ORDER_URL = ERP_ADDRESS + "/erp/order/refund";
}
