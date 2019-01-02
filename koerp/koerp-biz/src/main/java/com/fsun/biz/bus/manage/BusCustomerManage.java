package com.fsun.biz.bus.manage;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusCustomerMapper;
import com.fsun.domain.entity.BusCustomerCondition;
import com.fsun.domain.model.BusCustomer;
import com.fsun.exception.bus.CustomerException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * 
 * @author sunxiaolei
 *
 */
@Component
public class BusCustomerManage extends CrudManage<BusCustomerMapper, BusCustomer>{

	/**
	 * 生成化客户类型对应客户编号
	 * @param customerType
	 * @return
	 */
	public String initCustomerCode(String customerType) {		  
		List<String> list = mapper.getMaxCode(customerType);
		if(list!=null && list.size()>0){
			String maxCode = list.get(0);
			String num = maxCode.substring(customerType.length());
			return customerType + (Long.valueOf(num) + 1);
		}else{	
			return customerType + "100001";
		}
		
	}

	/**
	 * 通过客户编号获取客户信息
	 * @param customerCode
	 */
	public BusCustomer loadByCode(String customerCode) {
		BusCustomerCondition condition = new BusCustomerCondition();
		condition.setCustomerCode(customerCode);
		List<BusCustomer> list = mapper.selectList(condition);
		if(list!=null && list.size()==1){
			return list.get(0);
		}
		throw new CustomerException(SCMErrorEnum.BUS_CUSTOMER_NOT_EXIST);
	}

}
