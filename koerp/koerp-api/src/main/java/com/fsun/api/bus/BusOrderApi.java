package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusOrderDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusOrderCondition;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2018年12月24日
 */
public interface BusOrderApi extends BaseApi<BusOrder, BusOrderCondition> {

	/**
	 * 初始化单据头信息
	 * @param orderId
	 * @param orderType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String orderId, String orderType, BusUserDto currUser);

	/**
	 * 获取单据头信息列表
	 * @param condition
	 * @return
	 */
	public PageModel findListForPage(BusOrderCondition condition);

	/**
	 * 改变单据状态
	 * @param orderIds
	 * @param status
	 * @param user
	 * @param condition
	 */
	public void changeStatus(String[] orderIds, String status, SysUser user, BusOrderCondition condition);

	/**
	 * 获取销售订单对象
	 * @param orderId
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String orderId);

	/**
	 * 保存销售订单对象
	 * @param busOrderDto
	 * @return
	 */
	public String saveEntity(BusOrderDto busOrderDto);

}
