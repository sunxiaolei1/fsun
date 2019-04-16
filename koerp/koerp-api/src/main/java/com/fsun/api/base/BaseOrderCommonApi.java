package com.fsun.api.base;

import java.util.HashMap;
import java.util.List;

import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;

/**
 * 单据公共接口抽象
 * @author fsun
 * @date 2019年4月16日
 */
public interface BaseOrderCommonApi<T, C>{

	/**
	 * 获取备注
	 * @param id
	 * @return
	 */
	public String getRemark(String id);
		
	/**
	 * 获取单据对象
	 * @param orderId
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String id);
	
	/**
	 * 获取单据头信息列表
	 * @param condition
	 * @return
	 */
	public PageModel findListForPage(C condition);
	
	/**
	 * 获取列表
	 * @param condition
	 * @return
	 */
	public List<T> list(C condition);

	/**
	 * 改变单据状态
	 * @param orderIds
	 * @param status
	 * @param user
	 * @param condition
	 */
	public void changeStatus(String[] ids, String status, BusUserDto currUser, C condition);

	/**
	 * 标记打印次数
	 * @param orderId
	 */
	public void signPrint(String id);
	
	/**
	 * 追加备注
	 * @param condition
	 * @param sysuser
	 * @return
	 */
	public String appendRemark(C condition, BusUserDto currUser);
		
}
