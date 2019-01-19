package com.fsun.service.busOrder;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.BusOrderApi;
import com.fsun.biz.bus.manage.BusCustomerManage;
import com.fsun.biz.bus.manage.BusGoodsManage;
import com.fsun.biz.bus.manage.BusOrderManage;
import com.fsun.biz.bus.manage.BusPayAccountManage;
import com.fsun.biz.bus.manage.BusVipUnpaidManage;
import com.fsun.biz.bus.manage.DocOrderHeaderManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusOrderDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusGoodsCondition;
import com.fsun.domain.entity.BusOrderCondition;
import com.fsun.domain.enums.CustomerTypeEnum;
import com.fsun.domain.enums.FlowStatusEnum;
import com.fsun.domain.enums.OrderStatusEnum;
import com.fsun.domain.enums.PayModeEnum;
import com.fsun.domain.enums.PayTypeEnum;
import com.fsun.domain.enums.TradeFromEnum;
import com.fsun.domain.enums.TradeStatusEnum;
import com.fsun.domain.enums.TradeTypeEnum;
import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusPayAccount;
import com.fsun.domain.model.BusVipUnpaid;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.OrderException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.service.common.BaseOrderService;

/**
 * 销售订单接口
 * @author fsun
 * @date 2018年12月24日
 */
@Service
public class BusOrderService extends BaseOrderService implements BusOrderApi {

	@Autowired
	private BusOrderManage busOrderManage;
	
	@Autowired
	private BusGoodsManage busGoodsManage;
	
	@Autowired
	private BusPayAccountManage busPayAccountManage;
	
	@Autowired
	private DocOrderHeaderManage docOrderHeaderManage;
	
	@Autowired
	private BusCustomerManage busCustomerManage;
	
	@Autowired
	private BusVipUnpaidManage busVipUnpaidManage;
	
	@Override
	public BusOrder load(String id) {
		return busOrderManage.load(id);
	}

	@Override
	public List<BusOrder> list(BusOrderCondition condition) {
		return busOrderManage.list(condition);
	}

	@Override
	public PageModel findPage(BusOrderCondition condition) {
		return busOrderManage.findMapPage(condition);
	}

	@Override
	public String save(BusOrder domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, Object> getInitData(String orderId, String orderType, BusUserDto currUser) {
		HashMap<String, Object> map = new HashMap<>();
		if(StringUtils.isEmpty(orderId)){			
			BusOrder header = this.getInitHeader(orderType, currUser);
			map.put("header", header);
		}else{
			map = busOrderManage.loadEntity(orderId);
		}
		return map;
	}

	@Override
	public PageModel findListForPage(BusOrderCondition condition) {
		return busOrderManage.findPage(condition);
	}

	@Transactional
	@Override
	public void changeStatus(String[] orderIds, String status, SysUser user, BusOrderCondition condition) {		
		Date now = new Date();
		for (String orderId : orderIds) {
			BusOrder header = this.load(orderId);
			if(header==null){
				throw new OrderException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
			}		
			if(!orderStatusValidator(status, header)){
				throw new OrderException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
			}
			
			header.setUpdatedTime(now);
			if(OrderStatusEnum.getByCode(status)==OrderStatusEnum.CANCEL){				
				header.setTradeStatus(TradeStatusEnum.CANCEL.getCode());
				header.setFlowStatus(FlowStatusEnum.COMPLETED.getCode());
				BusGoodsCondition condition0 = new BusGoodsCondition();
				condition0.setOrderId(orderId);
				List<BusGoods> details = busGoodsManage.list(condition0);
				for (BusGoods busGoods : details) {
					super.skuStockIn(header, busGoods);
				}
			}
			
			//更新头的状态
			header.setOrderStatus(status);
			header.setUpdatedName(user.getRealname());
			header.setMemo(condition.getMemo());
			busOrderManage.update(header);
			
		}
	}

	@Override
	public HashMap<String, Object> loadEntity(String orderId) {
		return busOrderManage.loadEntity(orderId);
	}

	@Transactional
	@Override
	public String saveEntity(BusOrderDto busOrderDto) {
		String orderId = busOrderDto.getOrderId();
		BusUserDto currUser = busOrderDto.getCurrentUser();
		BusOrder header = busOrderDto.getHeader();		
		//入参基本的校验
		String cashId = header.getCashId();		
		if(!currUser.getId().equals(cashId)){
			throw new OrderException(SCMErrorEnum.USER_ILLEGAL);
		}
				
		if(this.load(orderId)!=null){
			throw new OrderException(SCMErrorEnum.BUS_ORDER_EXISTED);
		}	
		
		String buyerId = header.getBuyerId();
		BusCustomer busCustomer = busCustomerManage.loadByCode(buyerId);
		if(busCustomer==null){
			throw new OrderException(SCMErrorEnum.BUS_CUSTOMER_NOT_EXIST);
		}
		
		List<BusGoods> details = busOrderDto.getDetails();
		if(details==null || details.size()==0){
			throw new OrderException(SCMErrorEnum.BUS_ORDER_DETAIL_NOT_EXIST);
		}
		List<BusPayAccount> payAccounts = busOrderDto.getPayAccounts();
		if(payAccounts==null || payAccounts.size()==0){
			throw new OrderException(SCMErrorEnum.BUS_ORDER_PAYACCOUNT_NOT_EXIST);
		}
		//初始化头信息
		Date now = new Date();
		
		/*header.setOrderType(OrderTypeEnum.ORDER.getValue());	
		header.setPayType(PayTypeEnum.CURR_PAY.getValue());			
		header.setBuyerId(buyerId);
		header.setBuyerName(buyerName);
		header.setCarrierId(carrierId);
		header.setCarrierName(carrierName);
		header.setShopId(shopId);
		header.setShopName(shopName);
		header.setOriginPrice(originPrice);
		header.setOrderPrice(orderPrice);
		header.setDiscountPrice(discountPrice);
		header.setToZeroPrice(toZeroPrice);
		header.setPayPrice(payPrice);
		header.setDibPrice(dibPrice);
		header.setReceptPrice(receptPrice);
		header.setReceiveName(receiveName);
		header.setAddress(address);
		header.setMobile(mobile);
		header.setMemo(memo);
		header.setCashId(cashId);
		header.setCashName(cashName);*/
		
		header.setPosNo("1");
		header.setSettleTime(DateUtil.getNowDate());
		header.setTradeFrom(TradeFromEnum.PC.getCode());
		header.setTradeStatus(TradeStatusEnum.COMPLETED.getCode());
		header.setOrderStatus(OrderStatusEnum.CONFIRMED.getCode());
		header.setFlowStatus(FlowStatusEnum.STOCKOUT.getCode());
		header.setIsValid(true);
		header.setShipPrice(BigDecimal.ZERO);		
		if(PayTypeEnum.UNPAY.getValue().equals(header.getPayType())){
			header.setIsSettlemented(false);
		}else{
			header.setIsSettlemented(true);
		}
		header.setIsInvoice(false);
		header.setOrderTime(now);
		header.setPayTime(now);
		header.setCreatedTime(now);
		header.setCreatedName(currUser.getRealname());

		int lineNo = 1;
		for (BusPayAccount payAccount : payAccounts) {
			payAccount.setPayId(PKMapping.GUUID(PKMapping.bus_pay_account));
			payAccount.setOrderId(orderId);
			payAccount.setLineNo(lineNo++);			
			payAccount.setCreatedTime(now);
			payAccount.setTradeTime(now);
			Short payMode = payAccount.getPayMode();
			if(PayModeEnum.UNPAY.getValue().equals(payMode)){
				if(CustomerTypeEnum.SK.getCode().equals(busCustomer.getCustomerType())){
					throw new OrderException(SCMErrorEnum.BUS_CUSTOMER_UNPAY_DISABLED);
				}
				BusVipUnpaid busVipUnpaid = this.initOrderUnPay(header, payAccount, TradeTypeEnum.UNPAY_CONSUME.getValue());
				busVipUnpaidManage.create(busVipUnpaid);
			}else if(PayModeEnum.VIP_PAY.getValue().equals(payMode)){
				if(!CustomerTypeEnum.VIP.getCode().equals(busCustomer.getCustomerType())){
					throw new OrderException(SCMErrorEnum.BUS_CUSTOMER_NO_VIP);
				}
				BusVipUnpaid busVipUnpaid = this.initOrderUnPay(header, payAccount, TradeTypeEnum.VIP_CONSUME.getValue());
				busVipUnpaidManage.create(busVipUnpaid);
			}
			busPayAccountManage.create(payAccount);
		}		
		
		//初始化商品明细
		/**
		 * 必填字段:
		 * goodsType
		 * productType
		 * skuid, 
		 * parentSkuId, 
		 * totalPrice, 
		 * qty, 
		 * salePrice, 
		 * isGift, 
		 * giftCount, 
		 * giftPrice,
		 * marketPrice,
		 * originSalePrice
		 **/	    
		lineNo = 1;
		Set<BusGoods> apportionDetails = new HashSet<>();
		busOrderManage.initApportionDetails(busOrderDto, apportionDetails);
		for (BusGoods busGoods : apportionDetails) {
			busGoods.setGoodsId(PKMapping.GUUID(PKMapping.bus_goods));
			busGoods.setOrderId(orderId);
			busGoods.setLineNo(lineNo++);			
			busGoods.setCreatedTime(now);
			busGoodsManage.create(busGoods);
			super.skuStockOut(header, busGoods);
		}
		busOrderManage.create(header);		
		return orderId;
	}
	
	/****************************    私有方法          ******************************/
	
	/**
	 * 初始化挂账信息
	 * @param header
	 * @param payAccount
	 * @return
	 */
	private BusVipUnpaid initOrderUnPay(BusOrder header, BusPayAccount payAccount, Short tradeType) {
		BusVipUnpaid busVipUnpaid = new BusVipUnpaid();
		busVipUnpaid.setUnpaidId(PKMapping.GUUID(PKMapping.bus_vip_unpaid));		
		busVipUnpaid.setCustomerCode(header.getBuyerId());
		busVipUnpaid.setGiftPrice(payAccount.getDiscountAmount());
		busVipUnpaid.setOrderId(header.getOrderId());
		busVipUnpaid.setPayMode(payAccount.getPayMode());
		busVipUnpaid.setShopId(header.getShopId());
		busVipUnpaid.setTradePrice(header.getReceptPrice());	
		busVipUnpaid.setTradeTime(payAccount.getTradeTime());
		busVipUnpaid.setCreatedTime(new Date());
		busVipUnpaid.setCardNo(payAccount.getCardNo());
		busVipUnpaid.setTradeType(tradeType);	
		busVipUnpaid.setTradeStatus(Short.valueOf(TradeStatusEnum.COMPLETED.getCode()));
		return busVipUnpaid;
	}

	/**
	 * 验证销售单状态是否可用
	 * @param currAsnStatus
	 * @param oldHeader
	 * @return
	 */
	private boolean orderStatusValidator(String currOrderStatus, BusOrder oldHeader){
		boolean isTrue = true;
		String oldStatus = oldHeader.getOrderStatus();
		String tradeStatus = oldHeader.getTradeStatus();
		String flowStatus = oldHeader.getFlowStatus();
		switch (OrderStatusEnum.getByCode(currOrderStatus)) {
			case UNCONFIRM:			
				break;		
			case CONFIRMED:			
				break;	
			case RECEIPTED:			
				break;
			case PICKUP:			
				break;					
			case ARRIVED:						
				break;	
			case FINISHED:						
				break;
			case CANCEL:						
				if(OrderStatusEnum.CANCEL.getCode().equals(oldStatus) || OrderStatusEnum.FINISHED.getCode().equals(oldStatus)
					|| TradeStatusEnum.CANCEL.getCode().equals(tradeStatus) || TradeStatusEnum.CLOSED.getCode().equals(tradeStatus)
						|| FlowStatusEnum.COMPLETED.getCode().equals(flowStatus)){
					isTrue = false;
				}
				break;
			default:
				break;
		}
		return isTrue;
	}

	/**
	 * 初始化出库单头信息
	 * @param orderType
	 * @param currentUser
	 * @return
	 */
	private BusOrder getInitHeader(String orderType, BusUserDto currUser){
		BusOrder header = new BusOrder();
		String orderId = busOrderManage.initOrderId(orderType, currUser.getShopCode());
		header.setOrderId(orderId);		
		header.setOrderType(Short.valueOf(orderType));
		header.setShopId(currUser.getShopId());
		header.setShopName(currUser.getShopName());
		header.setCashId(currUser.getId());
		header.setCashName(currUser.getRealname());
		header.setPayType(PayTypeEnum.CURR_PAY.getValue());
		header.setIsSettlemented(true);
		return header;
	}
}
