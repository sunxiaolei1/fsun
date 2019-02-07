package com.fsun.biz.common;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.dao.mapper.BusBasCodesMapper;
import com.fsun.domain.entity.BasCodesCondition;
import com.fsun.domain.model.BusBasCodes;

@Component
public class BasCodesManage extends CrudManage<BusBasCodesMapper, BusBasCodes>{

	/**
	 * 获取数据类别集合
	 * @return
	 */
	public List<String> findCodeType() {
		return mapper.findCodeType();
	}

}
