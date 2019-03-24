package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocOrderDto;
import com.fsun.domain.entity.DocOrderHeaderCondition;
import com.fsun.domain.entity.DocOrderInitCondition;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2018年12月15日
 */
public interface DocOrderApi extends BaseApi<DocOrderHeader, DocOrderHeaderCondition> {

	/**
	 * 获取编辑界面初始数据
	 * @param orderNo
	 * @param orderType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(DocOrderInitCondition condition, BusUserDto currUser);
	
	/***
	 * 分页查询
	 * @param condition
	 * @return
	 */
	public PageModel findListForPage(DocOrderHeaderCondition condition);

	/**
	 * 更改单据状态
	 * @param orderNos
	 * @param status
	 * @param user
	 * @param condition 
	 */
	public void changeStatus(String[] orderNos, String status, 
		SysUser user, DocOrderHeaderCondition condition);

	/**
	 * 查询单个出库单实体
	 * @param orderNo
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String orderNo);

	/**
	 * 保存出库单实体
	 * @param docOrderDto
	 * @param user
	 * @return
	 */
	public String saveEntity(DocOrderDto docOrderDto);
	
}
