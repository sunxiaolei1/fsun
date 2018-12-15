package com.fsun.biz.bus.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.DocOrderHeaderMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.DocOrderHeaderCondition;
import com.fsun.domain.model.DocOrderHeader;

/**
 * @author fsun
 * @date 2018年12月15日
 */
@Component
public class DocOrderHeaderManage extends CrudManage<DocOrderHeaderMapper, DocOrderHeader>{

	/**
	 * 
	 * @param condition
	 * @return
	 */
	public PageModel findPage(DocOrderHeaderCondition condition) {
		List<DocOrderHeader> list = mapper.selectList(condition);
		return new PageModel(list);
	}

	/**
	 * 
	 * @param orderNo
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String orderNo) {
		return mapper.loadEntity(orderNo);
	}

}
