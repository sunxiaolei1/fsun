package com.fsun.api.bus;

import java.util.HashMap;
import java.util.List;

import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusTakeDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusTakeCondition;
import com.fsun.domain.model.BusTake;
import com.fsun.domain.model.SysUser;

/**
 * 寄提单接口
 * @author fsun
 * @date 2019年4月3日
 */
public interface BusTakeApi {

	/**
	 * 获取分页列表
	 * @param condition
	 * @return
	 */
	public PageModel findPage(BusTakeCondition condition);

	/**
	 * 获取分页列表(Map)
	 * @param condition
	 * @return
	 */
	public PageModel findListForPage(BusTakeCondition condition);

	/**
	 * 获取列表
	 * @param condition
	 * @return
	 */
	public List<BusTake> list(BusTakeCondition condition);
	
	/**
	 * 通过订单号获取订单下商品的提货流水
	 * @param orderId
	 * @return
	 */
	public List<HashMap<String, Object>> getTakeGoodsByOrderId(String orderId);

	/**
	 * 获取单据对象
	 * @param takeId
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String takeId);

	/**
	 * 获取编辑页面初始化对象
	 * @param takeId
	 * @param orderId
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String takeId, String orderId, BusUserDto currUser);

	/**
	 * 保存对象
	 * @param busTakeDto
	 * @return
	 */
	public String saveEntity(BusTakeDto busTakeDto);

	/**
	 * 更新状态
	 * @param split
	 * @param status
	 * @param user
	 * @param condition
	 */
	public void changeStatus(String[] split, String status, 
		SysUser user, BusTakeCondition condition);

	/**
	 * 打印标记
	 * @param orderNo
	 */
	public void signPrint(String takeId);

}
