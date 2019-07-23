package com.fsun.service.busAfterSale;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.BusAfterSaleApi;
import com.fsun.api.bus.BusOrderApi;
import com.fsun.biz.bus.manage.BusGoodsManage;
import com.fsun.biz.bus.manage.BusOrderManage;
import com.fsun.biz.bus.manage.BusPayAccountManage;
import com.fsun.biz.bus.manage.BusRefundGoodsManage;
import com.fsun.biz.bus.manage.BusRefundManage;
import com.fsun.biz.bus.manage.BusVipUnpaidManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusBarterDto;
import com.fsun.domain.dto.BusRefundDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusRefundCondition;
import com.fsun.domain.enums.BusPayTypeEnum;
import com.fsun.domain.enums.OrderOperateButtonsEnum;
import com.fsun.domain.enums.OrderTypeEnum;
import com.fsun.domain.enums.PayModeEnum;
import com.fsun.domain.enums.RefundOrderStatusEnum;
import com.fsun.domain.enums.RefundReasonEnum;
import com.fsun.domain.enums.RefundSponsorEnum;
import com.fsun.domain.enums.RefundStatusEnum;
import com.fsun.domain.enums.RefundTypeEnum;
import com.fsun.domain.enums.SkuAftersaleStatusEnum;
import com.fsun.domain.enums.TradeStatusEnum;
import com.fsun.domain.enums.TradeTypeEnum;
import com.fsun.domain.enums.VipUnpaidPayModeEnum;
import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusPayAccount;
import com.fsun.domain.model.BusRefund;
import com.fsun.domain.model.BusRefundGoods;
import com.fsun.domain.model.BusVipUnpaid;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.AfterSaleException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.service.common.BaseOrderService;

/**
 * 售后单据操作
 * @author fsun
 * @date 2019年2月12日
 */
@Service
public class BusAfterSaleService extends BaseOrderService implements BusAfterSaleApi {
	
	@Autowired
	private BusRefundManage busRefundManage;
	
	@Autowired
	private BusRefundGoodsManage busRefundGoodsManage;
	
	@Autowired
	private BusOrderManage busOrderManage;
	
	@Autowired
	private BusGoodsManage busGoodsManage;
	
	@Autowired
	private BusPayAccountManage busPayAccountManage;
	
	@Autowired
	private BusVipUnpaidManage busVipUnpaidManage;
	
	@Autowired
	private BusOrderApi busOrderApi;

	@Override
	public HashMap<String, Object> findFooter(BusRefundCondition condition) {
		HashMap<String, Object> footer = busRefundManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public BusRefund load(String id) {
		return busRefundManage.load(id);
	}
	
	@Override
	public HashMap<String, Object> getInitData(String refundId, 
			String orderId, Short refundType, BusUserDto currUser) {
		HashMap<String, Object> map = new HashMap<>();
		if(StringUtils.isEmpty(refundId)){			
			map = this.getInitEntity(orderId, refundType, currUser);
		}else{
			map = this.loadEntity(refundId);
		}
		return map;
	}
	
	@Override
	public HashMap<String, Object> getAllRefundInitData(
			String orderId, BusUserDto currUser) {		
		HashMap<String, Object> map = busOrderApi.loadEntity(orderId);
		HashMap<String, Object> orderHeaderMap = (HashMap<String, Object>) map.get("header");
		orderHeaderMap.put("refundReason", RefundReasonEnum.GOODS_QUALITY.getValue());
		orderHeaderMap.put("payMode", VipUnpaidPayModeEnum.CASH_PAY.getValue());		
		//如果是寄存单,通过订单号初始化整单退的退货商品明细
		Short orderType = Short.valueOf(orderHeaderMap.get("orderType").toString());
		if(OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType)){			
			List<HashMap<String, Object>> invSkuList = busGoodsManage.initAllReturnGoodsByOrderId(orderId);
			map.put("details", invSkuList);
		}		
		return map;
	}

	@Override
	public List<BusRefund> list(BusRefundCondition condition) {
		return busRefundManage.list(condition);
	}

	@Override
	public PageModel findPage(BusRefundCondition condition) {
		return busRefundManage.findMapPage(condition);
	}

	@Override
	public String save(BusRefund domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getRemark(String refundId) {
		BusRefund busRefund = this.load(refundId);
		if(busRefund!=null && busRefund.getMemo()!=null){
			return busRefund.getMemo();
		}
		return "";
	}
	
	/**************************************************  单据操作      *************************************************/

	@Transactional
	@Override
	public String createForRefund(BusRefundDto busRefundDto) {
		
		BusUserDto currUser = busRefundDto.getCurrUser();
		BusRefund refundHeader = busRefundDto.getRefundHeader();
		List<BusRefundGoods> refundDetailsList = busRefundDto.getRefundDetails();
		List<BusGoods> orderDetailsList = busRefundDto.getOrderDetails();
		
		BusOrder busOrder = busOrderManage.load(refundHeader.getOrderId());
		//如果是寄提单则需要数据获取对应的订单商品明细
		Short orderType = busOrder.getOrderType();
		if(OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType)){
			orderDetailsList = busGoodsManage.listByHeaderId(refundHeader.getOrderId());
		}	
		//基础验证
		this.baseInfoValidator(refundHeader, busOrder, currUser);	
		//退单公式校验器
		boolean allReturn = this.orderAmountValidater(refundHeader, 
			refundDetailsList, busOrder, orderDetailsList);
		//初始化单头信息
		Date now = new Date();
		BigDecimal refundPrice = refundHeader.getRefundPrice();	
		String refundId = busRefundManage.initRefundId(refundHeader.getOrderId(), RefundTypeEnum.RETURN_ORDER.getSign());
		refundHeader.setRefundId(refundId);
		refundHeader.setAllReturn(allReturn);
		refundHeader.setCreatedName(currUser.getRealname());
		refundHeader.setCreatedTime(now);
		refundHeader.setIsValid(true);
		refundHeader.setDiffPrice(BigDecimal.ZERO);
		refundHeader.setChangePrice(BigDecimal.ZERO);
		refundHeader.setRefundOrderStatus(RefundOrderStatusEnum.SOLVED.getValue());
		if(refundPrice!=null && refundPrice.compareTo(BigDecimal.ZERO)>0){
			refundHeader.setRefundStatus(RefundStatusEnum.RETURN_REFUND.getValue());
		}else{
			refundHeader.setRefundStatus(RefundStatusEnum.RETURN_UNREFUND.getValue());
		}	
		refundHeader.setRefundTime(now);
		refundHeader.setRefundType(RefundTypeEnum.RETURN_ORDER.getValue());
		refundHeader.setSellerId(currUser.getId());
		refundHeader.setSellerName(currUser.getRealname());
		String memo = refundHeader.getMemo();	
		refundHeader.setReason(memo);
		refundHeader.setMemo(super.formatRemark(memo, "", currUser));
		busRefundManage.create(refundHeader);
		
		//创建退货账单
		List<BusPayAccount> busPayAccounts = busRefundDto.getPayAccounts();
		int lineNo = 1;
		for (BusPayAccount payAccount : busPayAccounts) {			
			payAccount.setPayId(PKMapping.GUUID(PKMapping.bus_pay_account));
			payAccount.setOrderId(refundId);
			payAccount.setSrcOrderId(refundHeader.getOrderId());
			payAccount.setLineNo(lineNo++);			
			payAccount.setCreatedTime(now);
			payAccount.setTradeTime(now);
			payAccount.setPayType(BusPayTypeEnum.REFUND_PAY.getValue());
			payAccount.setShopId(refundHeader.getShopId());
			payAccount.setShopName(refundHeader.getShopName());
			busPayAccountManage.create(payAccount);
			//退货挂账结款
			Short payMode = payAccount.getPayMode();
			if(PayModeEnum.UNPAY.getValue().equals(payMode)){
				payAccount.setVipId(refundHeader.getBuyerId());
				BusVipUnpaid busVipUnpaid = this.initOrderUnPay(refundHeader, payAccount, TradeTypeEnum.REFUND_PAYMENT.getValue());
				busVipUnpaidManage.create(busVipUnpaid, false);
			}
		}		
		
		//创建退货商品明细
		lineNo = 1;
		Set<BusRefundGoods> apportionDetails = new HashSet<>();
		busRefundGoodsManage.initApportionDetails(busRefundDto, apportionDetails);
		for (BusRefundGoods busRefundGoods : apportionDetails) {
			busRefundGoods.setGoodsId(PKMapping.GUUID(PKMapping.bus_goods));
			busRefundGoods.setOrderId(refundHeader.getOrderId());
			busRefundGoods.setRefundId(refundId);
			busRefundGoods.setLineNo(lineNo++);			
			busRefundGoods.setCreatedTime(now);
			busRefundGoodsManage.create(busRefundGoods);
			//寄存订单商品不做库存加减
			if(!OrderTypeEnum.TAKE_ORDER.getValue().equals(busOrder.getOrderType())){
				super.skuStockIn(refundHeader, busRefundGoods);
			}else{
				this.synOrderUnTakeQty(orderDetailsList, busRefundGoods, now, true);
			}			
		}			
		//更新原订单
		busOrder.setRefundId(refundId);
		busOrder.setRefundStatus(refundHeader.getRefundStatus());
		busOrder.setRefundType(RefundTypeEnum.RETURN_ORDER.getValue());
		busOrder.setRefundReason(refundHeader.getRefundReason());
		busOrder.setRefundTime(now);
		busOrder.setRefundSponsor(RefundSponsorEnum.SELLER.getValue());
		busOrderManage.update(busOrder);
		return refundId;
	}

	@Override
	public String createForBarter(BusBarterDto busBarterDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public synchronized void changeStatus(String[] refundIds, String status, BusUserDto currUser, BusRefundCondition condition) {
		Date now = new Date();
		for (String refundId : refundIds) {
			BusRefund header = this.load(refundId);
			if(header==null){
				throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_NOT_EXIST);
			}
			String shopId = header.getShopId();
			if(!currUser.getShopId().equals(shopId)){
				throw new AfterSaleException(SCMErrorEnum.BUS_SHOP_ILLEGAL);
			}	
			BusOrder busOrder = busOrderManage.load(header.getOrderId());
			if(busOrder==null){
				throw new AfterSaleException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
			}
			header.setUpdatedTime(now);
			header.setUpdatedName(currUser.getRealname());
			header.setUpdatedTime(now);
			header.setMemo(condition.getMemo());	
			Short newStatus = Short.valueOf(status);
			if(RefundStatusEnum.getByValue(newStatus)==RefundStatusEnum.CANCEL){	
				//校验单据是否可取消退货单
				if(!orderStatusValidator(header, OrderOperateButtonsEnum.CANCEL_REFUND)){
					throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_STATUS_INVALID);
				}
				//还原商品库存
				header.setRefundStatus(newStatus);
				header.setRefundOrderStatus(RefundOrderStatusEnum.SOLVED.getValue());
				List<BusRefundGoods> details = busRefundGoodsManage.listByHeaderId(refundId);
				List<BusGoods> busGoodsList = busGoodsManage.listByHeaderId(header.getOrderId());
				for (BusRefundGoods refundGoods : details) {
					//寄存订单商品不做库存加减
					if(!OrderTypeEnum.TAKE_ORDER.getValue().equals(busOrder.getOrderType())){
						super.skuStockOut(header, refundGoods);
					}else{
						this.synOrderUnTakeQty(busGoodsList, refundGoods, now, false);
					}				
				}				
				List<BusPayAccount> payAccounts = busPayAccountManage.listByHeaderId(refundId);
				for (BusPayAccount busPayAccount : payAccounts) {
					Short payMode = busPayAccount.getPayMode();
					if(PayModeEnum.UNPAY.getValue().equals(payMode)){						
						List<BusVipUnpaid> list = busVipUnpaidManage.listByHeaderId(busPayAccount.getPayId());
						if(list!=null && list.size()==1){
							busVipUnpaidManage.cancel(list.get(0), currUser);
						}else{
							throw new AfterSaleException(SCMErrorEnum.BUS_ORDER_UNPAY_INVALID);
						}
					}
				}
				busOrder.setRefundId(null);
				busOrder.setRefundStatus(null);
				busOrder.setRefundType(null);
				busOrder.setRefundReason(null);
				busOrder.setRefundTime(null);
				busOrder.setRefundSponsor(null);
				busOrderManage.updateEach(busOrder);
			}			
			//更新头的状态
			busRefundManage.update(header);			
		}
		
	}

	@Override
	public String appendRemark(BusRefundCondition condition, BusUserDto currUser) {
		String refundId = condition.getRefundId();
		BusRefund busRefund = busRefundManage.load(refundId);
		//基础验证
		if(busRefund==null){
			throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_NOT_EXIST);
		}
		String shopId = currUser.getShopId(); 
		if(shopId==null || !shopId.equals(busRefund.getShopId())){
			throw new AfterSaleException(SCMErrorEnum.USER_ILLEGAL);
		}
		//订单状态验证
		this.orderStatusIsValid(busRefund, OrderOperateButtonsEnum.ADD_REFUND_REMARK);
		//追击备注
		busRefund.setUpdatedTime(new Date());
		busRefund.setUpdatedName(currUser.getRealname());	
		if(condition.getMemo()==null || condition.getMemo().equals("")){
			throw new AfterSaleException(SCMErrorEnum.INVALID_PARAMS);
		}
		busRefund.setMemo(super.formatRemark(condition.getMemo(), busRefund.getMemo(), currUser));
		busRefundManage.update(busRefund);
		return refundId;
	}

	@Override
	public void handleSign(String refundId, Short refundStatus, String memo, SysUser sysuser) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public PageModel findListForPage(BusRefundCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void signPrint(String id) {
		// TODO Auto-generated method stub
		
	}
	
	/**
	 * 获取单据实体对象
	 * @param refundId
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String refundId) {		
		//获取退货单头和明细
		HashMap<String, Object> refundMap = busRefundManage.loadEntity(refundId);
		HashMap<String, Object> refundHeaderMap = (HashMap<String, Object>) refundMap.get("refundHeader");	
		List<HashMap<String, Object>> refundDetailsList = (List<HashMap<String, Object>>) refundMap.get("refundDetails");
		
		//获取原订单头和明细
		String orderId = (String) refundHeaderMap.get("orderId");
		Short refundType = Short.parseShort(refundHeaderMap.get("refundType")+"");
		HashMap<String, Object> orderMap = busOrderManage.loadEntity(orderId);
		refundMap.put("orderHeader", orderMap.get("header"));
		refundMap.put("orderDetails", orderMap.get("details"));
		List<HashMap<String, Object>> orderDetailsList = (List<HashMap<String, Object>>) orderMap.get("details");
		for (HashMap<String, Object> orderDetails : orderDetailsList) {
			String sku = (String) orderDetails.get("sku");
			Short skuAftersaleStatus = SkuAftersaleStatusEnum.NORMAL.getValue();
			for (HashMap<String, Object> refundDetails : refundDetailsList) {
				String refundSku = (String) refundDetails.get("sku");
				if(refundSku.equals(sku)){
					if(refundType.equals(RefundTypeEnum.RETURN_ORDER.getValue())){
						skuAftersaleStatus = SkuAftersaleStatusEnum.NORMAL.getValue();
					}else if(refundType.equals(RefundTypeEnum.EXCHANGE_ORDER.getValue())){
						skuAftersaleStatus = SkuAftersaleStatusEnum.NORMAL.getValue();
					}
					break;
				}				
			}
			orderDetails.put("skuAftersaleStatus", skuAftersaleStatus);
		}
		//如果是换货单则获取换发单头和明细	
		if(refundType.equals(RefundTypeEnum.EXCHANGE_ORDER.getValue())){
			String barterOrderId = (String) refundHeaderMap.get("barterOrderId");
			HashMap<String, Object> barterMap = busOrderManage.loadEntity(barterOrderId);
			refundMap.put("barterHeader", barterMap.get("header"));
			refundMap.put("barterDetails", barterMap.get("details"));
		}
		return refundMap;
	}


	/**********************************     内部方法         ***************************************/
	
	/**
	 * 初始化实体对象
	 * @param orderId
	 * @param refundType
	 * @param currUser
	 * @return
	 */
	private HashMap<String, Object> getInitEntity(String orderId, Short refundType, BusUserDto currUser) {
		HashMap<String, Object> map = new HashMap<>(); 
		if(RefundTypeEnum.RETURN_ORDER.getValue().equals(refundType)){
			map = busOrderApi.loadEntity(orderId);
			HashMap<String, Object> orderHeaderMap = (HashMap<String, Object>) map.get("header");
			orderHeaderMap.put("refundReason", RefundReasonEnum.GOODS_QUALITY.getValue());
			orderHeaderMap.put("payMode", VipUnpaidPayModeEnum.CASH_PAY.getValue());
		}else if(RefundTypeEnum.EXCHANGE_ORDER.getValue().equals(refundType)){
			
		}
		return map;
	}
	
	/**
	 * 初始化挂账信息
	 * @param header
	 * @param payAccount
	 * @return
	 */
	private BusVipUnpaid initOrderUnPay(BusRefund header, BusPayAccount payAccount, Short tradeType) {
		BusVipUnpaid busVipUnpaid = new BusVipUnpaid();		
		busVipUnpaid.setUnpaidId(PKMapping.GUUID(PKMapping.bus_vip_unpaid));		
		busVipUnpaid.setCustomerCode(header.getBuyerId());		
		busVipUnpaid.setOrderId(header.getRefundId());
		busVipUnpaid.setPayMode(payAccount.getPayMode());
		busVipUnpaid.setShopId(header.getShopId());
		busVipUnpaid.setTradeTime(payAccount.getTradeTime());
		busVipUnpaid.setCreatedTime(new Date());
		busVipUnpaid.setCreatedName(header.getCreatedName());
		busVipUnpaid.setCardNo(payAccount.getCardNo());
		busVipUnpaid.setTradeType(tradeType);
		busVipUnpaid.setPayId(payAccount.getPayId());		
		busVipUnpaid.setUnusual(false);
		busVipUnpaid.setTradeStatus(Short.valueOf(TradeStatusEnum.COMPLETED.getCode()));	
		busVipUnpaid.setGiftPrice(BigDecimal.ZERO);
		busVipUnpaid.setTradePrice(payAccount.getReceptPrice());
		return busVipUnpaid;
	}

	/**
	 * 同步原订单下的可寄提商品库存
	 * @param busGoodsList
	 * @param busRefundGoods
	 * @param now
	 * @param synType true为退货、false为取消退货
	 */
	private void synOrderUnTakeQty(List<BusGoods> busGoodsList, BusRefundGoods busRefundGoods,
			Date now, boolean synType){
		for (BusGoods busGoods : busGoodsList) {
			if (busGoods.getSku().equals(busRefundGoods.getSku())) {
				BigDecimal untakeQty = null;
				if(synType){
					untakeQty = busGoods.getUntakeQty().subtract(busRefundGoods.getQty());
					if(untakeQty.compareTo(BigDecimal.ZERO)<0){
						throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_SKU_QTY_ILLEGAL);
					}
				}else{
					untakeQty = busGoods.getUntakeQty().add(busRefundGoods.getQty());
				}							
				busGoods.setUntakeQty(untakeQty);
				busGoods.setUpdatedTime(now);
				busGoodsManage.update(busGoods);
			}
		}
	}
	
}
