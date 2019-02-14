package com.fsun.api.bus;

import java.util.List;
/**
 * 订单操作按钮控制接口
 * @author fsun
 * @date 2019年2月13日
 */
public interface OrderButtonsApi {

	/**
	 * 获取要隐藏的按钮集合
	 * @param buttontype
	 * @param object
	 * @param orderId
	 * @return
	 */
	public List<String> getHiddenButtonsMap(String buttontype, String orderId , String refundId);

}
