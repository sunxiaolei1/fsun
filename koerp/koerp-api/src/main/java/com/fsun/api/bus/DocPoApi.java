package com.fsun.api.bus;

import java.util.HashMap;

import com.fsun.api.base.BaseApi;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocPoDto;
import com.fsun.domain.entity.DocPoHeaderCondition;
import com.fsun.domain.model.DocPoHeader;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2019年3月16日
 */
public interface DocPoApi extends BaseApi<DocPoHeader, DocPoHeaderCondition> {

	/**
	 * 获取初始化数据
	 * @param poNo
	 * @param poType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String poNo, String poType, BusUserDto currUser);

	/**
	 * 按条件分页查询
	 * @param condition
	 * @return
	 */
	public PageModel findListForPage(DocPoHeaderCondition condition);

	/**
	 * 修改单据状态
	 * @param poNos
	 * @param status
	 * @param user
	 * @param condition
	 */
	public void changeStatus(String[] poNos, String status, SysUser user, DocPoHeaderCondition condition);

	/**
	 * 获取申请单实体对象
	 * @param poNo
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String poNo);

	/**
	 * 保存申请单实体对象
	 * @param docPoDto
	 * @return
	 */
	public String saveEntity(DocPoDto docPoDto);

}
