package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusVipMapper;
import com.fsun.domain.entity.BusVipCondition;
import com.fsun.domain.enums.CustomerTypeEnum;
import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.BusVip;

/**
 * 
 * @author sunxiaolei
 *
 */
@Component
public class BusVipManage extends CrudManage<BusVipMapper, BusVip>{

	/**
	 * 通过会员编号获取会员卡信息
	 * @param busCustomer
	 * @return
	 */
	public BusVipCondition getVipCardParams(BusCustomer busCustomer) {
		BusVipCondition busVipCondition = new BusVipCondition();
		if(busCustomer!=null && CustomerTypeEnum.VIP.getCode().equals(busCustomer.getCustomerType())){
			busVipCondition.setCustomerCode(busCustomer.getCustomerCode());
			busVipCondition.setEnabled(true);
			List<BusVip> list = this.list(busVipCondition);
			int maxCardType = 1;
			for (BusVip busVip : list) {
				Integer cardType = busVip.getCardType();
				if(cardType > maxCardType){
					maxCardType = cardType;
				}
				if(busVip.getEnablePrice().compareTo(BigDecimal.ZERO)>0){
					busVipCondition.setHasBalance(true);
				}
			}
			busVipCondition.setCardType(maxCardType);
			return busVipCondition;
		}
		return null;
	}

	

}
