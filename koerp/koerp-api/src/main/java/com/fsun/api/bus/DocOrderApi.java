package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseApi;
import com.fsun.api.base.BaseOrderCommonApi;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocOrderDto;
import com.fsun.domain.entity.DocOrderHeaderCondition;
import com.fsun.domain.entity.DocOrderInitCondition;
import com.fsun.domain.model.DocOrderHeader;

/**
 * @author fsun
 * @date 2018年12月15日
 */
public interface DocOrderApi extends BaseOrderCommonApi<DocOrderHeader, DocOrderHeaderCondition>,
	BaseApi<DocOrderHeader, DocOrderHeaderCondition> {

	/**
	 * 获取编辑界面初始数据
	 * @param orderNo
	 * @param orderType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(DocOrderInitCondition condition, BusUserDto currUser);

	/**
	 * 保存出库单实体
	 * @param docOrderDto
	 * @param user
	 * @return
	 */
	public String saveEntity(DocOrderDto docOrderDto);

	/**
	 * 初始化采购退货信息
	 * @param condition
	 * @param currUser
	 * @return
	 */
	public DocOrderDto getPurchaseSoInitData(
		DocOrderInitCondition condition, BusUserDto currUser);

}
