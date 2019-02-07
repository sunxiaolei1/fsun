package com.fsun.service.busVipUnpaid;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.BusVipUnpaidApi;
import com.fsun.biz.bus.manage.BusCustomerManage;
import com.fsun.biz.bus.manage.BusVipUnpaidManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusVipUnpaidCondition;
import com.fsun.domain.enums.TradeStatusEnum;
import com.fsun.domain.enums.TradeTypeEnum;
import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.BusVipUnpaid;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.VipUnpaidException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2019年1月24日
 */
@Service
public class BusVipUnpaidService implements BusVipUnpaidApi {
	
	@Autowired
	private BusVipUnpaidManage busVipUnpaidManage;
	
	@Autowired
	private BusCustomerManage busCustomerManage;

	@Override
	public BusVipUnpaid load(String id) {
		return busVipUnpaidManage.load(id);
	}

	@Override
	public List<BusVipUnpaid> list(BusVipUnpaidCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageModel findPage(BusVipUnpaidCondition condition) {
		return busVipUnpaidManage.findMapPage(condition);
	}
	
	@Override
	public List<HashMap<String, Object>> exportVip(BusVipUnpaidCondition condition) {
		return busVipUnpaidManage.export(condition);
	}

	@Override
	public List<HashMap<String, Object>> exportUnpaid(BusVipUnpaidCondition condition) {
		return busVipUnpaidManage.export(condition);
	}

	@Transactional
	@Override
	public String save(BusVipUnpaid busVipUnpaid, SysUser currentUser) {		
		Date now = new Date();
		String realname = currentUser.getRealname();
		String customerCode = busVipUnpaid.getCustomerCode();
		BusCustomer busCustomer = busCustomerManage.loadByCode(customerCode);
		if(busCustomer==null){
			throw new VipUnpaidException(SCMErrorEnum.BUS_CUSTOMER_NOT_EXIST);
		}
		
		//会员卡充值金额字段校验
		BigDecimal tradePrice = busVipUnpaid.getTradePrice();
		if(tradePrice.compareTo(BigDecimal.ZERO)==0){
			throw new VipUnpaidException(SCMErrorEnum.BUS_VIP_UNPAID_IS_ZERO);
		}		
		Short tradeType = busVipUnpaid.getTradeType();
		if(TradeTypeEnum.VIP_RACHARGE.getValue().equals(tradeType)){
			BigDecimal giftPrice = busVipUnpaid.getGiftPrice();
			if(giftPrice.multiply(new BigDecimal(2)).compareTo(tradePrice)>0){
				throw new VipUnpaidException(SCMErrorEnum.BUS_VIP_UNPAID_ILLEGAL);
			}
		}

		busVipUnpaid.setUnpaidId(PKMapping.GUUID(PKMapping.bus_vip_unpaid));
		busVipUnpaid.setCreatedTime(now);
		busVipUnpaid.setCreatedName(realname);
		busVipUnpaid.setTradeTime(now);
		busVipUnpaid.setUnusual(false);
		busVipUnpaid.setTradeStatus(Short.valueOf(TradeStatusEnum.COMPLETED.getCode()));
		busVipUnpaidManage.create(busVipUnpaid, false);	
		return busVipUnpaid.getUnpaidId();
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Transactional
	@Override
	public void changeStatus(String[] ids, String status, 
			SysUser currUser, BusVipUnpaidCondition condition) {		
		for (String unpaidId : ids) {
			BusVipUnpaid busVipUnpaid = this.load(unpaidId);
			if(busVipUnpaid==null){
				throw new VipUnpaidException(SCMErrorEnum.BUS_ORDER_UNPAY_NOT_EXIST);
			}		
			if(!this.statusValidator(status, busVipUnpaid)){
				throw new VipUnpaidException(SCMErrorEnum.BUS_ORDER_UNPAY_STATUS_INVALID);
			}	
			//取消单据
			if(TradeStatusEnum.CANCEL.getCode().equals(status)){
				busVipUnpaidManage.cancel(busVipUnpaid, currUser);	
			}				
		}		
	}
	
	/**********************************   私有方法       **********************************/
	
	/**
	 * 验证挂账借款、会员卡充值单据状态是否可用
	 * @param currTradeStatus
	 * @param busVipUnpaid
	 * @return
	 */
	private boolean statusValidator(String currTradeStatus, BusVipUnpaid busVipUnpaid){
		boolean isTrue = true;		
		Short tradeStatus = busVipUnpaid.getTradeStatus();
		switch (TradeStatusEnum.getByCode(currTradeStatus)) {
			case COMPLETED:			
				break;		
			case CANCEL:						
				if(TradeStatusEnum.CANCEL.getCode().equals(tradeStatus)){
					isTrue = false;
				}
				break;				
			case CLOSED:			
				break;	
			default:
				break;
		}
		return isTrue;
	}

}
