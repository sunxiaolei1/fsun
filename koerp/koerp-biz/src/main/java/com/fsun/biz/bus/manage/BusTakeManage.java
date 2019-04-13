package com.fsun.biz.bus.manage;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusTakeMapper;
import com.fsun.domain.entity.BusTakeCondition;
import com.fsun.domain.model.BusTake;

/**
 * @author fsun
 * @date 2019年4月3日
 */
@Component
public class BusTakeManage extends CrudManage<BusTakeMapper, BusTake>{

	/**
	 * 初始化寄提单号
	 * @param orderId
	 * @return
	 */
	public String initNumber(String orderId, String sign, String shopCode) {
		String prefix = orderId + sign + shopCode;
		List<String> list = mapper.getMaxNumber(prefix);
		if(list!=null && list.size()>0){
			String newPrefix = orderId + sign;
			String num =  list.get(0).substring(newPrefix.length());			
			return newPrefix + (Integer.parseInt(num) + 1);
		}else{	
			return prefix + "01";
		}
	}
	
	@Override
	public List<BusTake> listByHeaderId(String headerId) {
		BusTakeCondition condition = new BusTakeCondition();
		condition.setOrderId(headerId);
		return mapper.selectList(condition);		
	}


}
