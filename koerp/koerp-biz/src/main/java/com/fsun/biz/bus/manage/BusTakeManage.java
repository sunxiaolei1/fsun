package com.fsun.biz.bus.manage;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusTakeMapper;
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
	public String initNumber(String orderId, String sign) {
		String prefix = orderId + sign;
		List<String> list = mapper.getMaxNumber(prefix);
		if(list!=null && list.size()>0){
			String maxNumber = list.get(0);
			String num = maxNumber.substring(prefix.length());			
			return prefix + (Integer.parseInt(num) + 1);
		}else{	
			return prefix + "101";
		}
	}

}
