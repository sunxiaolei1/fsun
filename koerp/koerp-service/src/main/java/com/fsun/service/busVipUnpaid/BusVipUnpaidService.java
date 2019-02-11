package com.fsun.service.busVipUnpaid;

import java.math.BigDecimal;
import java.util.ArrayList;
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
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.BusVipUnpaidDto;
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
	public HashMap<String, Object> initUnpaidAmount(BusVipUnpaidCondition condition, 
		BusUserDto busUserDto) {
		
		//存在关联id时直接获取对应的交易信息
		String relationId = condition.getRelationId();
		if(relationId!=null && !"".equals(relationId)){
			return this.getUnpaidAmountByRelationId(relationId, busUserDto);
		}
		
		//判别交易门店与当前用户门店是否一致
		if(!condition.getShopId().equals(busUserDto.getShopId())){
			throw new VipUnpaidException(SCMErrorEnum.USER_ILLEGAL);
		}
		//获取客户对应的挂账欠款
		BusVipUnpaidCondition condition0 = new BusVipUnpaidCondition();
		String[] tradeTypes = {"1", "2"};			
		condition0.setInTradeTypes(tradeTypes);
		condition0.setUnusual(false);
		condition0.setCustomerCode(condition.getCustomerCode());
		BusVipUnpaid busVipUnpaid = busVipUnpaidManage.getVipUnpaidAmount(condition0);
		if(busVipUnpaid!=null){
			BigDecimal unpaidAmount = busVipUnpaid.getTradePrice();
			//若无欠款则返回空
			if(unpaidAmount==null || unpaidAmount.compareTo(BigDecimal.ZERO)>=0){
				return null;
			}
			HashMap<String, Object> map = new HashMap<>();			
			//组装头信息
			HashMap<String, Object> headerMap = new HashMap<>();
			headerMap.put("shopId", busUserDto.getShopId());
			headerMap.put("shopName", busUserDto.getShopName());
			headerMap.put("customerCode", condition.getCustomerCode());
			headerMap.put("customerName", condition.getCustomerName());
			headerMap.put("tradePrice", condition.getTradePrice());
			headerMap.put("giftPrice", condition.getGiftPrice());	
			headerMap.put("cardNo", condition.getCardNo());
			headerMap.put("payMode", condition.getPayMode());
			map.put("header", headerMap);			
			//组装明细信息
			List<HashMap<String, Object>> detailsMap = new ArrayList<>();			
			BigDecimal tradePrice = condition.getTradePrice();
			BigDecimal giftPrice = condition.getGiftPrice();			
			//充值金额大于挂账欠款金额
			if(tradePrice.add(unpaidAmount).compareTo(BigDecimal.ZERO)>0){
				BigDecimal unpaidAbsAmount = unpaidAmount.abs();
				//挂账欠款==实际挂账交易金额
				BigDecimal unpaidTradePrice = unpaidAbsAmount;	
				//充值金额-挂账欠款==实际会员卡交易金额
				BigDecimal vipTradePrice = tradePrice.subtract(unpaidAbsAmount);
				BigDecimal unpaidGiftPrice = null;				
				BigDecimal vipGiftPrice = null;
				if(giftPrice.add(unpaidAmount).compareTo(BigDecimal.ZERO)>=0){					
					unpaidGiftPrice = unpaidAbsAmount;					
					vipGiftPrice = giftPrice.subtract(unpaidAbsAmount);
				}else{
					unpaidGiftPrice = giftPrice;
					vipGiftPrice = BigDecimal.ZERO;
				}			
				//组装挂账交易明细
				HashMap<String, Object> detailUnpaidMap = new HashMap<>();
				detailUnpaidMap.put("shopId", busUserDto.getShopId());	
				detailUnpaidMap.put("shopName", busUserDto.getShopName());				
				detailUnpaidMap.put("customerCode", condition.getCustomerCode());	
				detailUnpaidMap.put("tradePrice", unpaidTradePrice);	
				detailUnpaidMap.put("giftPrice", unpaidGiftPrice);	
				detailUnpaidMap.put("payMode", condition.getPayMode());	
				detailUnpaidMap.put("tradeType", TradeTypeEnum.UNPAY_PAYMENT.getValue());	
				detailUnpaidMap.put("memo", condition.getMemo());	
				detailsMap.add(detailUnpaidMap);				
				//组装会员卡交易明细
				HashMap<String, Object> detailVipMap = new HashMap<>();
				detailVipMap.put("cardNo", condition.getCardNo());
				detailVipMap.put("shopId", busUserDto.getShopId());	
				detailVipMap.put("shopName", busUserDto.getShopName());					
				detailVipMap.put("customerCode", condition.getCustomerCode());	
				detailVipMap.put("tradePrice", vipTradePrice);	
				detailVipMap.put("giftPrice", vipGiftPrice);	
				detailVipMap.put("payMode", condition.getPayMode());	
				detailVipMap.put("tradeType", TradeTypeEnum.VIP_RACHARGE.getValue());	
				detailVipMap.put("memo", condition.getMemo());	
				detailsMap.add(detailVipMap);
			}else{
				//充值金额不大于挂账欠款金额, 组装挂账交易明细
				HashMap<String, Object> detailUnpaidMap = new HashMap<>();
				detailUnpaidMap.put("shopId", busUserDto.getShopId());	
				detailUnpaidMap.put("shopName", busUserDto.getShopName());				
				detailUnpaidMap.put("customerCode", condition.getCustomerCode());	
				detailUnpaidMap.put("tradePrice", condition.getTradePrice());	
				detailUnpaidMap.put("giftPrice", condition.getGiftPrice());	
				detailUnpaidMap.put("payMode", condition.getPayMode());	
				detailUnpaidMap.put("tradeType", TradeTypeEnum.UNPAY_PAYMENT.getValue());	
				detailUnpaidMap.put("memo", condition.getMemo());	
				detailsMap.add(detailUnpaidMap);				
				//组装会员卡交易明细
				HashMap<String, Object> detailVipMap = new HashMap<>();
				detailVipMap.put("cardNo", condition.getCardNo());
				detailVipMap.put("shopId", busUserDto.getShopId());	
				detailVipMap.put("shopName", busUserDto.getShopName());					
				detailVipMap.put("customerCode", condition.getCustomerCode());	
				detailVipMap.put("tradePrice", BigDecimal.ZERO);	
				detailVipMap.put("giftPrice", BigDecimal.ZERO);
				detailVipMap.put("payMode", condition.getPayMode());	
				detailVipMap.put("tradeType", TradeTypeEnum.VIP_RACHARGE.getValue());	
				detailVipMap.put("memo", condition.getMemo());	
				detailsMap.add(detailVipMap);
			}
			map.put("details", detailsMap);
			return map;
		}
		return null;
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
	public HashMap<String, Object> findFooter(BusVipUnpaidCondition condition) {
		HashMap<String, Object> footer = busVipUnpaidManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
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
		String shopId = busVipUnpaid.getShopId();
		if(!currentUser.getShopId().equals(shopId)){
			throw new VipUnpaidException(SCMErrorEnum.USER_ILLEGAL);
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
	
	@Transactional
	@Override
	public String saveEntity(BusVipUnpaidDto busVipUnpaidDto, BusUserDto currUser) {
		Date now = new Date();
		String realname = currUser.getRealname();
		BusVipUnpaidCondition header = busVipUnpaidDto.getHeader();
		String customerCode = header.getCustomerCode();
		BusCustomer busCustomer = busCustomerManage.loadByCode(customerCode);
		if(busCustomer==null){
			throw new VipUnpaidException(SCMErrorEnum.BUS_CUSTOMER_NOT_EXIST);
		}	
		String shopId = header.getShopId();
		if(!currUser.getShopId().equals(shopId)){
			throw new VipUnpaidException(SCMErrorEnum.USER_ILLEGAL);
		}		
		//会员卡充值金额字段校验
		BigDecimal tradePrice = header.getTradePrice();
		if(tradePrice.compareTo(BigDecimal.ZERO)==0){
			throw new VipUnpaidException(SCMErrorEnum.BUS_VIP_UNPAID_IS_ZERO);
		}		
		BigDecimal giftPrice = header.getGiftPrice();
		if(giftPrice.multiply(new BigDecimal(2)).compareTo(tradePrice)>0){
			throw new VipUnpaidException(SCMErrorEnum.BUS_VIP_UNPAID_ILLEGAL);
		}		
		String relationId = this.initRelationId(currUser.getShopCode());
		List<BusVipUnpaid> details = busVipUnpaidDto.getDetails();
		for (BusVipUnpaid busVipUnpaid : details) {
			busVipUnpaid.setUnpaidId(PKMapping.GUUID(PKMapping.bus_vip_unpaid));
			busVipUnpaid.setRelationId(relationId);
			busVipUnpaid.setCreatedTime(now);
			busVipUnpaid.setCreatedName(realname);
			busVipUnpaid.setTradeTime(now);
			busVipUnpaid.setUnusual(false);
			busVipUnpaid.setTradeStatus(Short.valueOf(TradeStatusEnum.COMPLETED.getCode()));
			busVipUnpaidManage.create(busVipUnpaid, false);	
		}
		return relationId;
		
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
			String shopId = busVipUnpaid.getShopId();
			if(!currUser.getShopId().equals(shopId)){
				throw new VipUnpaidException(SCMErrorEnum.BUS_SHOP_ILLEGAL);
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
	
	/**
	 * 初始化关联id
	 * @param shopId
	 * @return
	 */
	private String initRelationId(String shopCode) {
		String uuid = PKMapping.GUUID(PKMapping.bus_vip_unpaid);
		uuid = shopCode + uuid;			
		String relationId = uuid.length()>32 ? uuid.substring(0, 32) : uuid;
		
		BusVipUnpaidCondition condition = new BusVipUnpaidCondition();
		condition.setRelationId(relationId);
		List<BusVipUnpaid> list = busVipUnpaidManage.list(condition);
		if(list!=null && list.size()>0){
			return this.initRelationId(shopCode);
		}
		return relationId;
	}

	/**
	 * 通过关联id获取对应的交易信息
	 * @param relationId
	 * @return
	 */
	private HashMap<String, Object> getUnpaidAmountByRelationId(String relationId, BusUserDto busUserDto) {
		BusVipUnpaidCondition condition = new BusVipUnpaidCondition();
		condition.setRelationId(relationId);
		List<BusVipUnpaid> list = busVipUnpaidManage.list(condition);
		if(list!=null && list.size()>0){
			HashMap<String, Object> map = new HashMap<>();					
			Short payMode = null;
			String cardNo = null;
			BigDecimal tradePrice = BigDecimal.ZERO;
			BigDecimal giftPrice = BigDecimal.ZERO;
			String customerName = "";
			String customerCode = "";			
			//组装明细信息
			List<HashMap<String, Object>> detailsMap = new ArrayList<>();
			for (BusVipUnpaid busVipUnpaid : list) {				
				if(!busVipUnpaid.getShopId().equals(busUserDto.getShopId())){
					throw new VipUnpaidException(SCMErrorEnum.BUS_SHOP_ILLEGAL);
				}
				HashMap<String, Object> detailMap = new HashMap<>();
				if(TradeTypeEnum.VIP_RACHARGE.getValue().equals(busVipUnpaid.getTradeType())){
					payMode = busVipUnpaid.getPayMode();
					cardNo = busVipUnpaid.getCardNo();				
					customerCode = busVipUnpaid.getCustomerCode();
					detailMap.put("cardNo", cardNo);
				}	
				tradePrice = tradePrice.add(busVipUnpaid.getTradePrice());
				giftPrice = giftPrice.add(busVipUnpaid.getGiftPrice());
				
				detailMap.put("unpaidId", busVipUnpaid.getUnpaidId());	
				detailMap.put("shopId", busVipUnpaid.getShopId());	
				detailMap.put("shopName", busUserDto.getShopName());					
				detailMap.put("customerCode", busVipUnpaid.getCustomerCode());	
				detailMap.put("tradePrice", busVipUnpaid.getTradePrice());	
				detailMap.put("giftPrice", busVipUnpaid.getGiftPrice());	
				detailMap.put("payMode", busVipUnpaid.getPayMode());	
				detailMap.put("tradeType", busVipUnpaid.getTradeType());	
				detailMap.put("memo", busVipUnpaid.getMemo());	
				detailsMap.add(detailMap);	
			}	
			map.put("details", detailsMap);
			//判别客户是否存在
			if(customerCode!=null && !customerCode.equals("")){
				BusCustomer busCustomer = busCustomerManage.loadByCode(customerCode);
				if(busCustomer==null){
					throw new VipUnpaidException(SCMErrorEnum.BUS_CUSTOMER_NOT_EXIST);
				}
				customerName = busCustomer.getCustomerName();
			}			
			//组装头信息
			HashMap<String, Object> headerMap = new HashMap<>();
			headerMap.put("shopId", busUserDto.getShopId());
			headerMap.put("shopName", busUserDto.getShopName());
			headerMap.put("customerCode", customerCode);
			headerMap.put("customerName", customerName);
			headerMap.put("tradePrice", tradePrice);
			headerMap.put("giftPrice", giftPrice);	
			headerMap.put("cardNo", cardNo);
			headerMap.put("payMode", payMode);
			map.put("header", headerMap);	
			return map;
		}
		throw new VipUnpaidException(SCMErrorEnum.BUS_ORDER_UNPAY_NOT_EXIST);
	}

}
