package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocAsnDto;
import com.fsun.domain.entity.DocAsnHeaderCondition;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2018年12月15日
 */
public interface DocAsnApi extends BaseApi<DocAsnHeader, DocAsnHeaderCondition> {
	
	/**
	 * 获取编辑界面初始数据
	 * @param asnNo
	 * @param asnType
	 * @param currentUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String asnNo, String asnType, BusUserDto currUser);

	/**
	 * 查询单个出库单实体
	 * @param asnNo
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String asnNo);
	
	/**
	 * 分页查询
	 * @param condition
	 * @return
	 */
	public PageModel findListForPage(DocAsnHeaderCondition condition);

	/**
	 * 保存出库单实体
	 * @param docAsnDto
	 * @param user
	 * @return
	 */
	public String saveEntity(DocAsnDto docAsnDto);

	/**
	 * 更改单据状态
	 * @param asnNos
	 * @param status
	 * @param user
	 */
	public void changeStatus(String[] asnNos, String status, 
		SysUser user, DocAsnHeaderCondition condition);
	
	

	

}
