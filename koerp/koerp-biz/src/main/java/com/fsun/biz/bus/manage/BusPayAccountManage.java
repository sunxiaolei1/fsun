package com.fsun.biz.bus.manage;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusPayAccountMapper;
import com.fsun.domain.entity.BusPayAccountCondition;
import com.fsun.domain.model.BusPayAccount;

/**
 * @author fsun	
 * @date 2018年12月24日
 */
@Component
public class BusPayAccountManage extends CrudManage<BusPayAccountMapper, BusPayAccount>{

	@Override
	public List<BusPayAccount> listByHeaderId(String headerId) {
		BusPayAccountCondition condition = new BusPayAccountCondition();
		condition.setOrderId(headerId);
		return mapper.selectList(condition);		
	}
	
}
