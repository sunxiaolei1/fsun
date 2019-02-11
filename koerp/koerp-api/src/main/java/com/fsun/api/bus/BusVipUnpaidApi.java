package com.fsun.api.bus;

import java.util.HashMap;
import java.util.List;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.BusVipUnpaidDto;
import com.fsun.domain.entity.BusVipUnpaidCondition;
import com.fsun.domain.model.BusVipUnpaid;
import com.fsun.domain.model.SysUser;

/**
 * 
 * @author fsun
 * @date 2019年1月24日
 */
public interface BusVipUnpaidApi extends BaseApi<BusVipUnpaid, BusVipUnpaidCondition> {
	
	/**
	 * 获取客户对应的挂账金额
	 * @param condition
	 * @return
	 */
	public HashMap<String, Object> initUnpaidAmount(BusVipUnpaidCondition condition, 
		BusUserDto busUserDto);

	/**
	 * 保存会员卡充值出现对应客户存在挂账的情况
	 * @param busVipUnpaidDto
	 * @param user
	 */
	public String saveEntity(BusVipUnpaidDto busVipUnpaidDto, BusUserDto currUser);
	
	/**
	 * 取消交易
	 * @param ids
	 * @param tradeStatus
	 * @param currUser
	 */
	public void changeStatus(String[] ids, String tradeStatus, 
		SysUser currUser, BusVipUnpaidCondition condition);

	/**
	 * 会员卡消费明细导出
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> exportVip(BusVipUnpaidCondition condition);

	/**
	 * 挂账消费明细导出
	 * @param condition
	 * @return
	 */
	public List<HashMap<String, Object>> exportUnpaid(BusVipUnpaidCondition condition);

	/**
	 * 获取表单合计列
	 * @param condition
	 * @return
	 */
	public HashMap<String, Object> findFooter(BusVipUnpaidCondition condition);

	

}
