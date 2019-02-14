package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseFooterApi;
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
public interface BusAfterSaleApi extends BaseFooterApi<BusRefund, BusRefundCondition> {
	
	/**
	 * 初始化单据实体
	 * @param refundId
	 * @param orderId
	 * @param refundType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String refundId, String orderId, 
		String refundType, BusUserDto currUser);

	
	/**
	 * 获取退货单备注页面
	 * @param refundId
	 * @return
	 */
	public String getRefundRemark(String refundId);
	
	
	
	/**********************************  单据操作      *********************************/

	/**
	 * 创建退货单
	 * @param busRefundDto
	 */
	public void createForRefund(BusRefundDto busRefundDto);

	/**
	 * 一键退货
	 * @param busRefundDto
	 */
	public void onekeyRefund(BusRefundDto busRefundDto);

	/**
	 * 创建换货单
	 * @param busBarterDto
	 */
	public void createForBarter(BusBarterDto busBarterDto);

	/**
	 * 改变单据状态
	 * @param split
	 * @param status
	 * @param user
	 * @param condition
	 */
	public void changeStatus(String[] split, String status, SysUser user, BusRefundCondition condition);

	/**
	 * 追加备注
	 * @param condition
	 * @param sysuser
	 * @return
	 */
	public String updateRemark(BusRefundCondition condition, SysUser sysuser);

	/**
	 * 处理标记
	 * @param refundId
	 * @param refundStatus
	 * @param memo
	 * @param sysuser
	 */
	public void handleSign(String refundId, Short refundStatus, String memo, SysUser sysuser);

}
