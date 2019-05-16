package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseFooterApi;
import com.fsun.api.base.BaseOrderCommonApi;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusOrderDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusOrderCondition;
import com.fsun.domain.model.BusOrder;

/**
 * 销售订单接口
 * @author fsun
 * @date 2018年12月24日
 */
public interface BusOrderApi extends BaseOrderCommonApi<BusOrder, BusOrderCondition>,
		BaseFooterApi<BusOrder, BusOrderCondition> {

	/**
	 * 初始化单据头信息
	 * @param orderId
	 * @param orderType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String orderId, 
		Short orderType, BusUserDto currUser);
	
	/**
	 * 获取copy单据并初始化
	 * @param orderId
	 * @param orderType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitCopyOrder(String orderId, 
		Short orderType, BusUserDto currUser);
	
	/**
	 * 获取会员卡余额打印对象
	 * @param orderId
	 * @param orderType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getVipPrintOrder(String orderId, 
		String orderType, BusUserDto currUser);

	/**
	 * 保存销售订单对象
	 * @param busOrderDto
	 * @return
	 */
	public String saveEntity(BusOrderDto busOrderDto);
	
	
	/******************************    售后操作       ***********************************/

	/**
	 * 寄存列表查询
	 * @param condition
	 * @return
	 */
	public PageModel findTakePage(BusOrderCondition condition);

	/**
	 * 修复错误单据(账单缺少优惠)
	 * @param orderIds
	 * @param currUser
	 */
	public void synErrorOrder(String orderIds, BusUserDto currUser);

	/**
	 * 修复分摊错误单据
	 * @param orderIds
	 * @param currUser
	 */
	public void synApportionErrorOrder(String orderIds, BusUserDto currUser);
	

}
