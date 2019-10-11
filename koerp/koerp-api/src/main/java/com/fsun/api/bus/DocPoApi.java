package com.fsun.api.bus;

import java.util.HashMap;
import java.util.List;

import com.fsun.api.base.BaseApi;
import com.fsun.api.base.BaseOrderCommonApi;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocPoDto;
import com.fsun.domain.entity.DocPoHeaderCondition;
import com.fsun.domain.model.DocPoDetails;
import com.fsun.domain.model.DocPoHeader;

/**
 * @author fsun
 * @date 2019年3月16日
 */
public interface DocPoApi extends BaseOrderCommonApi<DocPoHeader, DocPoHeaderCondition>,
		BaseApi<DocPoHeader, DocPoHeaderCondition> {

	/**
	 * 获取初始化数据
	 * @param poNo
	 * @param poType
	 * @param currUser
	 * @return
	 */
	public HashMap<String, Object> getInitData(String poNo, String poType, BusUserDto currUser);
	
	/**
	 * 根据申请单号获取明细
	 * @param poNo
	 * @return
	 */
	public List<DocPoDetails> details(String poNo);

	/**
	 * 保存申请单实体对象
	 * @param docPoDto
	 * @return
	 */
	public String saveEntity(DocPoDto docPoDto);

	/**
	 * 更新申请单实体对象
	 * @param docPoDto
	 * @return
	 */
	public String updateEntity(DocPoDto docPoDto);

	/**
	 * 通过条件获取申请单号
	 * @param condition
	 * @return
	 */
	public String getPoNosByCondition(DocPoHeaderCondition condition);

}
