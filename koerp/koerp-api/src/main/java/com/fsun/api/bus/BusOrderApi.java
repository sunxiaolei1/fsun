package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseFooterApi;
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
public interface BusOrderApi extends BaseFooterApi<BusOrder, BusOrderCondition> {

	/**
	 * 初始化单据头信息
	 * @param orderId
	 * @param orderType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String orderId, Short orderType, BusUserDto currUser);
	
	/**
	 * 获取copy单据并初始化
	 * @param orderId
	 * @param orderType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitCopyOrder(String orderId, Short orderType, BusUserDto currUser);
	
	/**
	 * 获取会员卡余额打印对象
	 * @param orderId
	 * @param orderType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getVipPrintOrder(String orderId, String orderType, BusUserDto currUser);

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
	 * 标记打印次数
	 * @param orderId
	 */
	public void signPrint(String orderId);
	
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
	
	
	/******************************    售后操作       ***********************************/

	/**
	 * 追加备注
	 * @param condition
	 * @param currUser
	 */
	public void appendRemark(BusOrderCondition condition, BusUserDto currUser);

	/**
	 * 寄存列表查询
	 * @param condition
	 * @return
	 */
	public PageModel findTakePage(BusOrderCondition condition);
	

}
