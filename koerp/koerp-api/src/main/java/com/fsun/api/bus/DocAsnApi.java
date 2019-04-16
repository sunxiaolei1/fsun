package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseApi;
import com.fsun.api.base.BaseOrderCommonApi;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocAsnDto;
import com.fsun.domain.entity.DocAsnHeaderCondition;
import com.fsun.domain.model.DocAsnHeader;

/**
 * @author fsun
 * @date 2018年12月15日
 */
public interface DocAsnApi extends BaseOrderCommonApi<DocAsnHeader, DocAsnHeaderCondition>,
		BaseApi<DocAsnHeader, DocAsnHeaderCondition> {
	
	/**
	 * 获取编辑界面初始数据
	 * @param asnNo
	 * @param asnType
	 * @param currentUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String asnNo, String asnType, BusUserDto currUser);
	

	/**
	 * 保存出库单实体
	 * @param docAsnDto
	 * @param user
	 * @return
	 */
	public String saveEntity(DocAsnDto docAsnDto);

}
