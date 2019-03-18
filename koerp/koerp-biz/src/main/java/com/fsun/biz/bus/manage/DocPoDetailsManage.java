package com.fsun.biz.bus.manage;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.DocPoDetailsMapper;
import com.fsun.domain.model.DocPoDetails;

/**
 * @author fsun
 * @date 2019年3月16日
 */
@Component
public class DocPoDetailsManage extends CrudManage<DocPoDetailsMapper, DocPoDetails>{

	/**
	 * 通过poNo删除明细
	 * @param poNo
	 */
	public void deleteByPoNo(String poNo) {
		mapper.deleteByPoNo(poNo);		
	}

}
