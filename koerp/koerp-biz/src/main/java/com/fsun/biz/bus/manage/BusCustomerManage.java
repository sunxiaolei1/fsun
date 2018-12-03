package com.fsun.biz.bus.manage;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusCustomerMapper;
import com.fsun.domain.model.BusCustomer;

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

}
