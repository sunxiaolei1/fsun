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
import com.fsun.biz.bus.manage.BusVipManage;
import com.fsun.biz.bus.manage.BusVipUnpaidManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusOrderDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusOrderCondition;
import com.fsun.domain.enums.BusPayTypeEnum;
import com.fsun.domain.enums.CustomerTypeEnum;
import com.fsun.domain.enums.FlowStatusEnum;
import com.fsun.domain.enums.OrderOperateButtonsEnum;
import com.fsun.domain.enums.OrderStatusEnum;
import com.fsun.domain.enums.OrderTakeStatusEnum;
import com.fsun.domain.enums.OrderTypeEnum;
import com.fsun.domain.enums.PayModeEnum;
import com.fsun.domain.enums.PayTypeEnum;
import com.fsun.domain.enums.TradeFromEnum;
import com.fsun.domain.enums.TradeStatusEnum;
import com.fsun.domain.enums.TradeTypeEnum;
import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusPayAccount;
import com.fsun.domain.model.BusVip;
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
	private BusCustomerManage busCustomerManage;
	
	@Autowired
	private BusVipUnpaidManage busVipUnpaidManage;
	
	@Autowired
	private BusVipManage busVipManage;
	
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
	public PageModel findTakePage(BusOrderCondition condition) {
		condition.setOrderType(OrderTypeEnum.TAKE_ORDER.getValue());
		return busOrderManage.findMapPage(condition);
	}
	
	@Override
	public HashMap<String, Object> findFooter(BusOrderCondition condition) {
		HashMap<String, Object> footer = busOrderManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
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
	public HashMap<String, Object> getInitData(String orderId, Short orderType, BusUserDto currUser) {
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
	public HashMap<String, Object> getInitCopyOrder(String orderId, Short orderType, BusUserDto currUser){
		HashMap<String, Object> map = busOrderManage.loadEntity(orderId);		
		String newOrderId = busOrderManage.initOrderId(orderType, currUser.getShopCode());
		HashMap<String, Object> header = (HashMap<String, Object>) map.get("header");
		header.put("orderId", newOrderId);
		header.put("cashId", currUser.getId());
		header.put("cashName", currUser.getRealname());
		header.put("payType", PayTypeEnum.CURR_PAY.getValue());
		header.put("isSettlemented", true);
		if(OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType)){
			header.put("takeStatus", OrderTakeStatusEnum.UNTAKE.getCode());
		}
		
		List<HashMap<String, Object>> details = (List<HashMap<String, Object>>) map.get("details");
		for (HashMap<String, Object> goodsMap : details) {
			goodsMap.put("totalPartPrice", BigDecimal.ZERO);
			goodsMap.put("partPrice", BigDecimal.ZERO);
			goodsMap.put("discountPrice", BigDecimal.ZERO);
		}
		return map;
	}
	
	@Override
	public HashMap<String, Object> getVipPrintOrder(String orderId, String orderType, BusUserDto currUser){
		HashMap<String, Object> map = busOrderManage.loadEntity(orderId);
		
		List<HashMap<String, Object>> payAccounts = (List<HashMap<String, Object>>) map.get("payAccounts");
		int vipCards = 0;
		String showContent = "";
		for (HashMap<String, Object> payAccountMap : payAccounts) {
			Short payMode = Short.valueOf(payAccountMap.get("payMode")+"");
			if(PayModeEnum.VIP_PAY.getValue().equals(payMode)){
				String cardNo = (String) payAccountMap.get("cardNo");
				if(cardNo!=null && !cardNo.equals("")){
					BusVip busVip = busVipManage.getVipByCardNo(cardNo);
					BigDecimal enablePrice = busVip.getEnablePrice();
					showContent += ("[卡号:"+ cardNo +",余额:"+ enablePrice +"]");
					vipCards++;
				}				
			}
		}
		//追加会员卡余额信息
		if(vipCards>0){
			HashMap<String, Object> header = (HashMap<String, Object>) map.get("header");			
			if(vipCards==1){
				String buyerName = (String) header.get("buyerName");
				header.put("buyerName", buyerName + showContent);
			}else{
				String sellerNotes = (String) header.get("sellerNotes");
				header.put("sellerNotes", sellerNotes + showContent);
			}
		}		
		return map;
	}

	@Override
	public PageModel findListForPage(BusOrderCondition condition) {
		return busOrderManage.findPage(condition);
	}

	@Transactional
	@Override
	public void changeStatus(String[] orderIds, String status, BusUserDto currUser, 
			BusOrderCondition condition) {		
		Date now = new Date();
		for (String orderId : orderIds) {
			BusOrder header = this.load(orderId);
			if(header==null){
				throw new OrderException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
			}
			String shopId = header.getShopId();
			if(!currUser.getShopId().equals(shopId)){
				throw new OrderException(SCMErrorEnum.BUS_SHOP_ILLEGAL);
			}	
			
			if(!orderStatusValidator(status, header)){
				throw new OrderException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
			}
			
			header.setUpdatedTime(now);
			if(OrderStatusEnum.getByCode(status)==OrderStatusEnum.CANCEL){	
				//还原商品库存
				header.setTradeStatus(TradeStatusEnum.CANCEL.getCode());
				header.setFlowStatus(FlowStatusEnum.COMPLETED.getCode());				
				//寄存订单商品不做库存加减
				List<BusGoods> details = busGoodsManage.listByHeaderId(orderId);
				for (BusGoods busGoods : details) {
					if(!OrderTypeEnum.TAKE_ORDER.getValue().equals(header.getOrderType())){										
						super.skuStockIn(header, busGoods);																
					}
					//清除寄提库存
					busGoods.setUntakeQty(BigDecimal.ZERO);
					busGoodsManage.update(busGoods);
				}								
				List<BusPayAccount> payAccounts = busPayAccountManage.listByHeaderId(orderId);
				for (BusPayAccount busPayAccount : payAccounts) {
					Short payMode = busPayAccount.getPayMode();
					if(PayModeEnum.UNPAY.getValue().equals(payMode) || PayModeEnum.VIP_PAY.getValue().equals(payMode) 
							|| PayModeEnum.RESERVE_PAY.getValue().equals(payMode)){						
						List<BusVipUnpaid> list = busVipUnpaidManage.listByHeaderId(busPayAccount.getPayId());
						if(list!=null && list.size()==1){
							busVipUnpaidManage.cancel(list.get(0), currUser);
						}else{
							throw new OrderException(SCMErrorEnum.BUS_ORDER_UNPAY_INVALID);
						}
					}
				}
			}			
			//更新头的状态
			header.setOrderStatus(status);
			header.setUpdatedName(currUser.getRealname());
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
		
		header.setPrintCount(0);
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
		header.setUpdatedTime(now);
		header.setUpdatedName(currUser.getRealname());
		int lineNo = 1;
		for (BusPayAccount payAccount : payAccounts) {
			payAccount.setPayId(PKMapping.GUUID(PKMapping.bus_pay_account));
			payAccount.setOrderId(orderId);
			payAccount.setLineNo(lineNo++);			
			payAccount.setCreatedTime(now);
			payAccount.setTradeTime(now);
			payAccount.setShopId(currUser.getShopId());
			payAccount.setShopName(currUser.getShopName());
			payAccount.setPayType(BusPayTypeEnum.COMSUME_PAY.getValue());			
			Short payMode = payAccount.getPayMode();
			if(PayModeEnum.UNPAY.getValue().equals(payMode)){
				if(CustomerTypeEnum.SK.getCode().equals(busCustomer.getCustomerType())){
					throw new OrderException(SCMErrorEnum.BUS_CUSTOMER_UNPAY_DISABLED);
				}
				payAccount.setVipId(busCustomer.getCustomerCode());
				BusVipUnpaid busVipUnpaid = this.initOrderUnPay(header, payAccount, TradeTypeEnum.UNPAY_CONSUME.getValue());
				busVipUnpaidManage.create(busVipUnpaid, false);
			}else if(PayModeEnum.VIP_PAY.getValue().equals(payMode)){
				if(!CustomerTypeEnum.VIP.getCode().equals(busCustomer.getCustomerType())){
					throw new OrderException(SCMErrorEnum.BUS_CUSTOMER_NO_VIP);
				}
				payAccount.setVipId(busCustomer.getCustomerCode());
				BusVipUnpaid busVipUnpaid = this.initOrderUnPay(header, payAccount, TradeTypeEnum.VIP_CONSUME.getValue());
				busVipUnpaidManage.create(busVipUnpaid, false);
			}else if(PayModeEnum.RESERVE_PAY.getValue().equals(payMode)){
				if(!CustomerTypeEnum.JXS.getCode().equals(busCustomer.getCustomerType())){
					throw new OrderException(SCMErrorEnum.BUS_CUSTOMER_NO_AGENT);
				}
				payAccount.setVipId(busCustomer.getCustomerCode());
				BusVipUnpaid busVipUnpaid = this.initOrderUnPay(header, payAccount, TradeTypeEnum.RESERVE_CONSUME.getValue());
				busVipUnpaidManage.create(busVipUnpaid, false);
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
			BigDecimal calcTotalPrice = busGoods.getQty().subtract(busGoods.getGiftCount()).
				multiply(busGoods.getSalePrice()).setScale(2, BigDecimal.ROUND_HALF_UP);;
			if(busGoods.getTotalPrice().compareTo(calcTotalPrice)!=0){
				throw new OrderException(SCMErrorEnum.BUS_SKU_AMOUNT_ILLEGAL);
			}
			busGoods.setGoodsId(PKMapping.GUUID(PKMapping.bus_goods));
			busGoods.setOrderId(orderId);
			busGoods.setLineNo(lineNo++);			
			busGoods.setCreatedTime(now);
			//寄存订单商品不做库存加减
			if(!OrderTypeEnum.TAKE_ORDER.getValue().equals(header.getOrderType())){				
				super.skuStockOut(header, busGoods);
				busGoods.setUntakeQty(BigDecimal.ZERO);
			}else{
				busGoods.setUntakeQty(busGoods.getQty());
			}			
			busGoodsManage.create(busGoods);
		}
		busOrderManage.create(header);		
		return orderId;
	}
	
	@Override
	public void signPrint(String orderId) {
		BusOrder header = busOrderManage.load(orderId);	
		if(header==null){
			throw new OrderException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
		}	
		String tradeStatus = header.getTradeStatus();
		if(TradeStatusEnum.CANCEL.getCode().equals(tradeStatus) 
			|| TradeStatusEnum.CLOSED.getCode().equals(tradeStatus)){
			throw new OrderException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
		}
		//累加打印次数
		int printCount = (header.getPrintCount()!=null?header.getPrintCount():0);
		header.setPrintCount(++printCount);
		busOrderManage.update(header);
		
	}
	
	@Override
	public String getRemark(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String appendRemark(BusOrderCondition condition, BusUserDto currUser) {
		
		String orderId = condition.getOrderId();	
		BusOrder busOrder = busOrderManage.load(orderId);	
		//基础验证
		this.baseInfoValidator(busOrder, currUser);
		//订单状态验证
		this.orderStatusIsValid(busOrder, OrderOperateButtonsEnum.ADD_ORDER_REMARK);
		//追击备注
		busOrder.setUpdatedTime(new Date());
		busOrder.setUpdatedName(currUser.getRealname());	
		if(condition.getMemo()==null || condition.getMemo().equals("")){
			throw new OrderException(SCMErrorEnum.INVALID_PARAMS);
		}
		busOrder.setMemo(super.formatRemark(condition.getMemo(), busOrder.getMemo(), currUser));
		busOrderManage.update(busOrder);
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
		
		String cardNo = payAccount.getCardNo();
		busVipUnpaid.setUnpaidId(PKMapping.GUUID(PKMapping.bus_vip_unpaid));		
		busVipUnpaid.setCustomerCode(header.getBuyerId());		
		busVipUnpaid.setOrderId(header.getOrderId());
		busVipUnpaid.setPayMode(payAccount.getPayMode());
		busVipUnpaid.setShopId(header.getShopId());
		busVipUnpaid.setTradeTime(payAccount.getTradeTime());
		busVipUnpaid.setCreatedTime(new Date());
		busVipUnpaid.setCreatedName(header.getCreatedName());
		busVipUnpaid.setCardNo(cardNo);
		busVipUnpaid.setTradeType(tradeType);
		busVipUnpaid.setPayId(payAccount.getPayId());		
		busVipUnpaid.setUnusual(false);
		busVipUnpaid.setTradeStatus(Short.valueOf(TradeStatusEnum.COMPLETED.getCode()));	
		busVipUnpaid.setGiftPrice(payAccount.getDiscountAmount());
		busVipUnpaid.setTradePrice(payAccount.getReceptPrice());
		busVipUnpaid.setMemo(header.getSellerNotes());
		if(TradeTypeEnum.VIP_CONSUME.getValue().equals(tradeType)){			
			if(cardNo!=null && !cardNo.equals("")){
				BigDecimal giftPrice = busVipManage.syncGiftPrice(cardNo, busVipUnpaid.getTradePrice());
				if(giftPrice!=null){
					busVipUnpaid.setGiftPrice(giftPrice.negate());
					busVipUnpaid.setTradePrice(busVipUnpaid.getTradePrice().negate());					
					//更新账单优惠金额
					payAccount.setDiscountAmount(giftPrice);					
					//更新订单优惠金额,实付金额、实收金额
					header.setDiscountPrice(header.getDiscountPrice().add(giftPrice));					
					header.setReceptPrice(header.getReceptPrice().subtract(giftPrice));
					header.setPayPrice(header.getPayPrice().subtract(giftPrice));
				}else{
					throw new OrderException(SCMErrorEnum.BUS_VIP_ILLEGAL);
				}			
			}			
		}else if(TradeTypeEnum.RESERVE_CONSUME.getValue().equals(tradeType)){									
			busVipUnpaid.setGiftPrice(BigDecimal.ZERO);
			busVipUnpaid.setTradePrice(busVipUnpaid.getTradePrice().negate());										
		}else if(TradeTypeEnum.UNPAY_CONSUME.getValue().equals(tradeType)){
			busVipUnpaid.setGiftPrice(BigDecimal.ZERO);
			busVipUnpaid.setTradePrice(payAccount.getReceptPrice().negate());
		}		
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
		Short orderType = oldHeader.getOrderType();
		String takeStatus = oldHeader.getTakeStatus();
		Short refundStatus = oldHeader.getRefundStatus();
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
				//如果是寄存单类型，只要寄提过就不能取消单据
        		if(OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType)){
        			if(!OrderTakeStatusEnum.UNTAKE.getCode().equals(takeStatus)){
        				isTrue = false; 
        			}
        		}
        		if(refundStatus!=null){
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
	private BusOrder getInitHeader(Short orderType, BusUserDto currUser){
		BusOrder header = new BusOrder();
		String orderId = busOrderManage.initOrderId(orderType, currUser.getShopCode());
		header.setOrderId(orderId);		
		header.setOrderType(orderType);
		header.setShopId(currUser.getShopId());
		header.setShopName(currUser.getShopName());
		header.setCashId(currUser.getId());
		header.setCashName(currUser.getRealname());
		header.setPayType(PayTypeEnum.CURR_PAY.getValue());
		header.setIsSettlemented(true);
		if(OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType)){
			header.setTakeStatus(OrderTakeStatusEnum.UNTAKE.getCode());
		}
		return header;
	}

}
