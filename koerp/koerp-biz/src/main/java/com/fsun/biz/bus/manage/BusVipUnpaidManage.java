package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.dao.mapper.BusVipUnpaidMapper;
import com.fsun.domain.enums.TradeStatusEnum;
import com.fsun.domain.enums.TradeTypeEnum;
import com.fsun.domain.model.BusVip;
import com.fsun.domain.model.BusVipUnpaid;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2019年1月19日
 */
@Component
public class BusVipUnpaidManage extends CrudManage<BusVipUnpaidMapper, BusVipUnpaid>{
	
	@Autowired
	private BusVipManage busVipManage;
	
	/**
	 * 取消账单
	 * @param busVipUnpaid
	 * @param currUser
	 */
	public void cancel(BusVipUnpaid oldBusVipUnpaid, SysUser currUser){
		Date now = new Date();
		//更新原挂账记录
		oldBusVipUnpaid.setUnusual(true);
		oldBusVipUnpaid.setUpdatedTime(now);
		oldBusVipUnpaid.setUpdatedName(currUser.getRealname());
		this.update(oldBusVipUnpaid);	
		
		//创建挂账或会员卡消费取消交易记录
		BusVipUnpaid busVipUnpaid = new BusVipUnpaid();
		BeanUtils.copyProperties(oldBusVipUnpaid, busVipUnpaid);
		busVipUnpaid.setUnpaidId(PKMapping.GUUID(PKMapping.bus_vip_unpaid));
		busVipUnpaid.setTradeStatus(Short.valueOf(TradeStatusEnum.CANCEL.getCode()));
		busVipUnpaid.setUnusual(true);
		busVipUnpaid.setTradeTime(now);
		busVipUnpaid.setCreatedTime(now);
		busVipUnpaid.setCreatedName(currUser.getRealname());
		busVipUnpaid.setUpdatedTime(null);
		busVipUnpaid.setTradePrice(busVipUnpaid.getTradePrice().negate());
		busVipUnpaid.setGiftPrice(busVipUnpaid.getGiftPrice().negate());
		this.create(busVipUnpaid, true);
	}
	
	/**
	 * 创建消费、充值及取消的交易记录
	 * @param busVipUnpaid
	 * @param isCancel
	 * @return
	 */
	public int create(BusVipUnpaid busVipUnpaid, boolean isCancel){		
		Short tradeType = busVipUnpaid.getTradeType();
		if(TradeTypeEnum.getByValue(tradeType).equals(TradeTypeEnum.VIP_RACHARGE)
			|| TradeTypeEnum.getByValue(tradeType).equals(TradeTypeEnum.VIP_CONSUME)){
			//会员卡充值、消费
			BusVip busVip = busVipManage.getVipByCardNo(busVipUnpaid.getCardNo());
			if(busVip!=null){
				BigDecimal enablePrice = busVipUnpaid.getTradePrice();
				BigDecimal giftPrice = busVipUnpaid.getTradePrice();
				//更新会员卡金额等信息
				busVip.setUpdatedName(busVipUnpaid.getCreatedName());
				busVip.setUpdatedTime(busVipUnpaid.getCreatedTime());
				busVipManage.syncPrice(busVip, enablePrice, giftPrice);
			}
		}
		return super.create(busVipUnpaid);
	}
}
