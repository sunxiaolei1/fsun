package com.fsun.biz.bus.manage;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusBasSkuMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusBasSkuCondition;
import com.fsun.domain.model.BusBasSku;

/**
 * @author fsun
 * @date 2018年12月7日
 */
@Component
public class BusBasSkuManage extends CrudManage<BusBasSkuMapper, BusBasSku>{

	public PageModel findPage(BusBasSkuCondition condition) {
		List<BusBasSku> list = mapper.selectList(condition);
		return new PageModel(list);
	}

}
