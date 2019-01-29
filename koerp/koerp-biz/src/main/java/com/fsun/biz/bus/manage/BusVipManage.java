package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusVipMapper;
import com.fsun.domain.entity.BusVipCondition;
import com.fsun.domain.enums.CustomerTypeEnum;
import com.fsun.domain.enums.VipCardTypeEnum;
import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.BusVip;
import com.fsun.exception.bus.VipException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * 
 * @author sunxiaolei
 *
 */
@Component
public class BusVipManage extends CrudManage<BusVipMapper, BusVip>{

	/**
	 * 通过会员编号获取会员卡信息(最高级别的那张卡的信息)
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

	/**
	 * 通过会员卡号获取会员卡信息
	 * @param cardNo
	 * @return
	 */
	public BusVip getVipByCardNo(String cardNo) {		
		if(cardNo!=null && !"".equals(cardNo)){
			BusVipCondition busVipCondition = new BusVipCondition();
			busVipCondition.setCardNo(cardNo);
			busVipCondition.setEnabled(true);
			List<BusVip> list = this.list(busVipCondition);
			if(list!=null && list.size()==1){
				return list.get(0);
			}			
		}
		return null;
	}

	/**
	 * 获取会员卡基本及会员卡交易记录
	 * @param cardNo
	 * @return
	 */
	public HashMap<String, Object> initRachargeData(String cardNo) {
		return mapper.initRachargeData(cardNo);
	}
	
	/**
	 * 会员卡和挂账金额同步
	 * @param busVip
	 * @param tradePrice
	 * @param giftPrice
	 */
	public void syncPrice(BusVip busVip, BigDecimal tradePrice, BigDecimal giftPrice) {				
		//累计可用金额
		if(busVip.getEnablePrice()!=null){
			busVip.setEnablePrice(busVip.getEnablePrice().add(tradePrice));
		}else{
			busVip.setEnablePrice(tradePrice);
		}
		//累计优惠金额
		if(busVip.getGiftPrice()!=null){
			busVip.setGiftPrice(busVip.getGiftPrice().add(giftPrice));
		}else{
			busVip.setGiftPrice(giftPrice);
		}
		//金额校验
		Integer cardType = busVip.getCardType();
		//普通会员可用金额不能为负数
		if(VipCardTypeEnum.DEFAULT_VIP.getValue().equals(cardType)){
			if(busVip.getEnablePrice().compareTo(BigDecimal.ZERO)<0){
				throw new VipException(SCMErrorEnum.BUS_VIP_ENABLE_PRICE_ILLEGAL);
			}
		}	
		if(busVip.getGiftPrice().compareTo(BigDecimal.ZERO)<0){
			throw new VipException(SCMErrorEnum.BUS_VIP_GIFT_PRICE_ILLEGAL);
		}
		this.update(busVip);
	}

	
	/**
	 * 同步会员卡消费优惠
	 * @param cardNo
	 * @param tradePrice
	 * @return
	 */
	public BigDecimal syncGiftPrice(String cardNo, BigDecimal tradePrice) {
		BusVipCondition condition = new BusVipCondition();
		condition.setCardNo(cardNo);
		List<BusVip> list = mapper.selectList(condition);
		if(list!=null && list.size()==1){
			BusVip busVip = list.get(0);
			Integer cardType = busVip.getCardType();
			BigDecimal enablePrice = busVip.getEnablePrice();
			if(VipCardTypeEnum.DEFAULT_VIP.getValue().equals(cardType)){
				if(enablePrice.compareTo(tradePrice)<0){
					throw new VipException(SCMErrorEnum.BUS_VIP_ENABLE_PRICE_ILLEGAL);
				}
			}
			BigDecimal newGiftPrice = BigDecimal.ZERO;
			//计算实际赠送金额
			if(enablePrice.compareTo(BigDecimal.ZERO)>0){
				BigDecimal giftPrice = busVip.getGiftPrice();
				newGiftPrice = tradePrice.multiply(giftPrice).divide(enablePrice, 2, BigDecimal.ROUND_HALF_UP)
					.setScale(2, BigDecimal.ROUND_HALF_UP);
				//扣减之后的可用余额
				BigDecimal newEnablePrice = enablePrice.subtract(tradePrice);
				//当可用余额小于0时实际优惠金 = 赠送金额
				if(newEnablePrice.compareTo(BigDecimal.ZERO)>0){
					if(newGiftPrice.compareTo(giftPrice)>0){
						newGiftPrice = giftPrice;
					}else{
						BigDecimal giftBalance = giftPrice.subtract(newGiftPrice);
						//赠金可用余额大于实际可用余额
						if(giftBalance.compareTo(newEnablePrice)>0){
							//要扣减的赠金=(可用余额-实际扣减本金)
							newGiftPrice = enablePrice.subtract(tradePrice.subtract(newGiftPrice));
						}
					}
				}else{
					newGiftPrice = giftPrice;
				}				
			}
			return newGiftPrice;
		}
		return null;
	}

}
