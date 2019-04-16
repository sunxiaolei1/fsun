package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseFooterApi;
import com.fsun.api.base.BaseOrderCommonApi;
import com.fsun.domain.dto.BusBarterDto;
import com.fsun.domain.dto.BusRefundDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusRefundCondition;
import com.fsun.domain.model.BusRefund;
import com.fsun.domain.model.SysUser;

/**
 * 售后管理模块操作接口
 * @author fsun
 * @date 2019年2月12日
 */
public interface BusAfterSaleApi extends BaseOrderCommonApi<BusRefund, BusRefundCondition>,
		BaseFooterApi<BusRefund, BusRefundCondition> {
	
	/**
	 * 初始化单据实体
	 * @param refundId
	 * @param orderId
	 * @param refundType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String refundId, String orderId, 
		Short refundType, BusUserDto currUser);
	
	
	
	/**********************************  单据操作      *********************************/

	/**
	 * 创建退货单
	 * @param busRefundDto
	 */
	public String createForRefund(BusRefundDto busRefundDto);

	/**
	 * 创建换货单
	 * @param busBarterDto
	 */
	public String createForBarter(BusBarterDto busBarterDto);

	/**
	 * 处理标记
	 * @param refundId
	 * @param refundStatus
	 * @param memo
	 * @param sysuser
	 */
	public void handleSign(String refundId, Short refundStatus, String memo, SysUser sysuser);

	/**
	 * 整单退初始化数据
	 * @param orderId
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getAllRefundInitData(String orderId, BusUserDto currUser);

}
