package com.fsun.biz.bus.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusRefundMapper;
import com.fsun.domain.model.BusRefund;

/**
 * @author fsun
 * @date 2019年2月12日
 */
@Component
public class BusRefundManage extends CrudManage<BusRefundMapper, BusRefund>{

	/**
	 * 初始化退货单号
	 * @param orderId
	 * @param sign
	 * @return
	 */
	public String initRefundId(String orderId, String sign) {
		String prefix = orderId + sign;
		List<String> list = mapper.getMaxRefundId(prefix);
		if(list!=null && list.size()>0){
			String maxRefundId = list.get(0);
			String num = maxRefundId.substring(prefix.length());			
			return prefix + (Integer.parseInt(num) + 1);
		}else{	
			return prefix + "101";
		}
	}

	/**
	 * 获取退货单据实体对象
	 * @param refundId
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String refundId) {
		return mapper.loadEntity(refundId);
	}

}
