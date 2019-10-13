package com.fsun.service.common;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fsun.biz.bus.manage.BusInvSkuDetailsManage;
import com.fsun.biz.bus.manage.BusInvSkuManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.common.utils.HttpRequestUtils;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.RouteUrlUtil;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.ErpOrderDto;
import com.fsun.domain.enums.CustomerTypeEnum;
import com.fsun.domain.enums.DocAsnTypeEnum;
import com.fsun.domain.enums.DocOrderTypeEnum;
import com.fsun.domain.enums.DocTradeStatusEnum;
import com.fsun.domain.enums.DocTradeTypeEnum;
import com.fsun.domain.enums.FlowStatusEnum;
import com.fsun.domain.enums.OrderOperateButtonsEnum;
import com.fsun.domain.enums.RefundStatusEnum;
import com.fsun.domain.enums.TradeStatusEnum;
import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusInvSku;
import com.fsun.domain.model.BusInvSkuDetails;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusRefund;
import com.fsun.domain.model.BusRefundGoods;
import com.fsun.domain.model.BusTake;
import com.fsun.domain.model.BusTakeGoods;
import com.fsun.domain.model.DocAsnDetails;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.DocOrderDetails;
import com.fsun.domain.model.DocOrderDetailsMateriel;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.domain.model.DocPoDetails;
import com.fsun.domain.model.DocPoHeader;
import com.fsun.domain.model.ErpOrderDetails;
import com.fsun.domain.model.ErpOrderHeader;
import com.fsun.exception.bus.AfterSaleException;
import com.fsun.exception.bus.DocAsnException;
import com.fsun.exception.bus.DocOrderException;
import com.fsun.exception.bus.DocPoException;
import com.fsun.exception.bus.OrderException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.github.pagehelper.StringUtil;

/**
 * 单据基础类
 * @author fsun
 * @date 2018年12月19日
 */
public abstract class BaseOrderService extends BaseOrderValidatorService {

	@Autowired
	private BusInvSkuManage busInvSkuManage;
	
	@Autowired
	private BusInvSkuDetailsManage busInvSkuDetailsManage;
	
	 /**
     * 销售单商品出库存
     * @param orderHeader
     * @param docOrderDetails
     * @return
     */
    protected BusInvSku skuStockOut(BusOrder header, BusGoods busGoods) {
    	//计算库存
    	BusInvSku busInvSku = this.getInitInvSku(header.getShopId(), busGoods);
    	   	
    	BusInvSkuDetails busInvSkuDetails = this.getInitInvSkuDetails(header, busGoods);    	   	
    	busInvSkuDetails.setDamagedQty(BigDecimal.ZERO); 	
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(busGoods.getQty().negate());  
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockOut(busInvSku); 
	} 

    /**
     * 销售单商品入库存
     * @param header
     * @param busGoods
     * @return
     */
	protected BusInvSku skuStockIn(BusOrder header, BusGoods busGoods) {
		//计算库存
    	BusInvSku busInvSku = this.getInitInvSku(header.getShopId(), busGoods);
    	   	
    	BusInvSkuDetails busInvSkuDetails = this.getInitInvSkuDetails(header, busGoods);    	   	
    	
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockIn(busInvSku); 
	}

	
	/**
	 * 入库单入库存
	 * @param asnHeader
	 * @param docAsnDetails
	 * @return
	 */
    protected BusInvSku skuStockIn(DocAsnHeader asnHeader, DocAsnDetails docAsnDetails){    	
    	//计算库存
    	BusInvSku busInvSku = this.getInitInvSku(asnHeader.getToShopId(), docAsnDetails);
    	   	
    	BusInvSkuDetails busInvSkuDetails = this.getInitInvSkuDetails(asnHeader, docAsnDetails);
   
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockIn(busInvSku);   	
    }  
    
    
    /**
     * 入库单出库存
     * @param asnHeader
     * @param docAsnDetails
     * @return
     */
    protected BusInvSku skuStockOut(DocAsnHeader asnHeader, DocAsnDetails docAsnDetails){    	
    	//计算库存
    	BusInvSku busInvSku = this.getInitInvSku(asnHeader.getToShopId(), docAsnDetails);
    	   	
    	BusInvSkuDetails busInvSkuDetails = this.getInitInvSkuDetails(asnHeader, docAsnDetails);    	
    	busInvSkuDetails.setDamagedQty(docAsnDetails.getDamagedQty().negate()); 	
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(docAsnDetails.getReceiveQty().negate());    	
    	
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockOut(busInvSku);   	
    }
    
    /**
     * 出库单入库存
     * @param orderHeader
     * @param docOrderDetails
     */
    protected BusInvSku skuStockIn(DocOrderHeader orderHeader, DocOrderDetails docOrderDetails) {
    	//计算库存
    	BusInvSku busInvSku = this.getInitInvSku(orderHeader.getFromShopId(), docOrderDetails);
    	   	
    	BusInvSkuDetails busInvSkuDetails = this.getInitInvSkuDetails(orderHeader, docOrderDetails);    	   	
    	if(DocOrderTypeEnum.LOSE_SO.getCode().equals(orderHeader.getOrderType())){
    		busInvSku.setDamagedQty(docOrderDetails.getShippedQty().negate());
    		busInvSkuDetails.setDamagedQty(docOrderDetails.getShippedQty().negate());
    	}
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockIn(busInvSku); 
	}
    
    /**
     * 出库单出库存
     * @param orderHeader
     * @param docOrderDetails
     * @return
     */
    protected BusInvSku skuStockOut(DocOrderHeader orderHeader, DocOrderDetails docOrderDetails) {
    	//计算库存
    	BusInvSku busInvSku = this.getInitInvSku(orderHeader.getFromShopId(), docOrderDetails);
    	
    	BusInvSkuDetails busInvSkuDetails = this.getInitInvSkuDetails(orderHeader, docOrderDetails);    	   	
    	busInvSkuDetails.setDamagedQty(BigDecimal.ZERO); 	
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(docOrderDetails.getShippedQty().negate()); 
    	if(DocOrderTypeEnum.LOSE_SO.getCode().equals(orderHeader.getOrderType())){   		
    		busInvSku.setDamagedQty(docOrderDetails.getShippedQty().negate());
    		busInvSkuDetails.setDamagedQty(docOrderDetails.getShippedQty());
    	}
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockOut(busInvSku); 
	} 
    
    /**
     * 退货单退货入库
     * @param refundHeader
     * @param busRefundGoods
     */
    protected BusInvSku skuStockIn(BusRefund header, BusRefundGoods busRefundGoods) {
    	//计算库存
    	BusInvSku busInvSku = this.getInitInvSku(header.getShopId(), busRefundGoods);
    	   	
    	BusInvSkuDetails busInvSkuDetails = this.getInitInvSkuDetails(header, busRefundGoods);    	   	
    	
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockIn(busInvSku); 
	}
    

	/**
     * 退货单退货出库
     * @param refundHeader
     * @param busRefundGoods
     */
    protected BusInvSku skuStockOut(BusRefund header, BusRefundGoods busRefundGoods) {
    	//计算库存
    	BusInvSku busInvSku = this.getInitInvSku(header.getShopId(), busRefundGoods);
    	   	
    	BusInvSkuDetails busInvSkuDetails = this.getInitInvSkuDetails(header, busRefundGoods);    	   	
    	busInvSkuDetails.setDamagedQty(BigDecimal.ZERO); 	
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(busRefundGoods.getQty().negate());  
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockOut(busInvSku); 
	}
    
    /**
     * 寄提出库
     * @param header
     * @param busTakeGoods
     * @return
     */
    protected BusInvSku skuStockOut(BusTake header, BusTakeGoods busTakeGoods) {
    	//计算库存
    	BusInvSku busInvSku = this.getInitInvSku(header.getShopId(), busTakeGoods);
    	   	
    	BusInvSkuDetails busInvSkuDetails = this.getInitInvSkuDetails(header, busTakeGoods);    	   	
    	busInvSkuDetails.setDamagedQty(BigDecimal.ZERO); 	
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(busTakeGoods.getQty().negate());  
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockOut(busInvSku); 
	}
    
    /**
     * 寄提商品入库存
     * @param header
     * @param busTakeGoods
     */
    protected BusInvSku skuStockIn(BusTake header, BusTakeGoods busTakeGoods) {
    	//计算库存
    	BusInvSku busInvSku = this.getInitInvSku(header.getShopId(), busTakeGoods);
    	   	
    	BusInvSkuDetails busInvSkuDetails = this.getInitInvSkuDetails(header, busTakeGoods);    	   	
    	
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockIn(busInvSku);
	}
	

	/*****************************   私有方法       *********************************/

    /**
     * 单条寄提出库获取初始库存信息
     * @param shopId
     * @param busTakeGoods
     * @return
     */
    private BusInvSku getInitInvSku(String shopId, BusTakeGoods busTakeGoods) {
    	BusInvSku busInvSku = new BusInvSku();
    	busInvSku.setShopId(shopId);
    	busInvSku.setSku(busTakeGoods.getSku());
    	//入库时暂不考虑占用数量
    	busInvSku.setLockQty(BigDecimal.ZERO);
    	busInvSku.setQty(busTakeGoods.getQty());   	
    	busInvSku.setDamagedQty(BigDecimal.ZERO);
    	return busInvSku;
	}
    
    /**
     * 单条寄提出库获取初始库存交易明细信息
     * @param header
     * @param busTakeGoods
     * @return
     */
    private BusInvSkuDetails getInitInvSkuDetails(BusTake header, BusTakeGoods busTakeGoods) {
    	BusInvSkuDetails busInvSkuDetails = new BusInvSkuDetails();
    	//交易头信息
    	busInvSkuDetails.setShopId(header.getShopId());
    	busInvSkuDetails.setShopName(header.getShopName());
    	busInvSkuDetails.setTradeOrderNo(header.getTakeId());    	
    	busInvSkuDetails.setTradeTime(header.getUpdatedTime());
    	
    	String tradeStatus = header.getTakeStatus();
    	busInvSkuDetails.setTradeStatus(tradeStatus);   	    	
        busInvSkuDetails.setTradeType(DocTradeTypeEnum.TAKE_SO.getCode());    	
    	busInvSkuDetails.setCreatedTime(new Date());
    	busInvSkuDetails.setTradeRelationNo(header.getOrderId());   	    	
    	//交易商品明细
    	busInvSkuDetails.setDamagedQty(BigDecimal.ZERO);
    	busInvSkuDetails.setGoodsName(busTakeGoods.getGoodsName());
    	busInvSkuDetails.setId(PKMapping.GUUID(PKMapping.bus_inv_sku_details));
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(busTakeGoods.getQty()); 
    	busInvSkuDetails.setSku(busTakeGoods.getSku());
    	busInvSkuDetails.setTradeLineNo(busTakeGoods.getLineNo());
    	busInvSkuDetails.setTradeOrderDetailId(busTakeGoods.getGoodsId());    	
    	busInvSkuDetails.setUnit(busTakeGoods.getUnit());
    	return busInvSkuDetails;
	}

	/**
     * 单条出库获取初始库存信息
     * @param shopId
     * @param docOrderDetails
     * @return
     */
    private BusInvSku getInitInvSku(String shopId, DocOrderDetails docOrderDetails) {
    	BusInvSku busInvSku = new BusInvSku();
    	busInvSku.setShopId(shopId);
    	busInvSku.setSku(docOrderDetails.getSku());
    	//入库时暂不考虑占用数量
    	busInvSku.setLockQty(BigDecimal.ZERO);
    	busInvSku.setQty(docOrderDetails.getShippedQty());   	
    	busInvSku.setDamagedQty(BigDecimal.ZERO);
    	return busInvSku;
	}
    
    /**
     * 单条出库获取初始库存交易明细信息
     * @param orderHeader
     * @param docOrderDetails
     * @return
     */
    private BusInvSkuDetails getInitInvSkuDetails(DocOrderHeader orderHeader,
    		DocOrderDetails docOrderDetails) {
    	BusInvSkuDetails busInvSkuDetails = new BusInvSkuDetails();
    	//交易头信息
    	busInvSkuDetails.setShopId(orderHeader.getFromShopId());
    	busInvSkuDetails.setShopName(orderHeader.getFromShopName());
    	busInvSkuDetails.setTradeOrderNo(orderHeader.getOrderNo());
    	busInvSkuDetails.setTradeStatus(orderHeader.getOrderStatus());
    	busInvSkuDetails.setTradeTime(orderHeader.getDeliveryTime());
    	busInvSkuDetails.setTradeType(orderHeader.getOrderType());
    	
    	busInvSkuDetails.setCreatedTime(new Date());
    	//交易商品明细
    	busInvSkuDetails.setDamagedQty(BigDecimal.ZERO);
    	busInvSkuDetails.setGoodsName(docOrderDetails.getGoodsName());
    	busInvSkuDetails.setId(PKMapping.GUUID(PKMapping.bus_inv_sku_details));
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(docOrderDetails.getShippedQty()); 
    	busInvSkuDetails.setSku(docOrderDetails.getSku());
    	busInvSkuDetails.setTradeLineNo(docOrderDetails.getLineNo());
    	busInvSkuDetails.setTradeOrderDetailId(docOrderDetails.getSoDetailId());    	
    	busInvSkuDetails.setUnit(docOrderDetails.getUnit());
    	//调拨单出库单关联调拨明细对应的申请单号,采购退货对应采购申请单
    	String orderType = orderHeader.getOrderType();  	
    	if(DocOrderTypeEnum.ALLOT_SO.getCode().equals(orderType)){
    		busInvSkuDetails.setTradeRelationNo(docOrderDetails.getUserDefine1()); 
    	}else if(DocOrderTypeEnum.PURCHASE_SO.getCode().equals(orderType)){
    		busInvSkuDetails.setTradeRelationNo(docOrderDetails.getOrderNo()); 
    	}	
    	return busInvSkuDetails;
	}
    
    
    /**
     * 单条退货入库获取初始库存信息
     * @param shopId
     * @param docOrderDetails
     * @return
     */
    private BusInvSku getInitInvSku(String shopId, BusRefundGoods busRefundGoods) {
    	BusInvSku busInvSku = new BusInvSku();
    	busInvSku.setShopId(shopId);
    	busInvSku.setSku(busRefundGoods.getSku());
    	//入库时暂不考虑占用数量
    	busInvSku.setLockQty(BigDecimal.ZERO);
    	busInvSku.setQty(busRefundGoods.getQty());   	
    	busInvSku.setDamagedQty(BigDecimal.ZERO);
    	return busInvSku;
	}

    /**
     * 单条出库获取初始库存交易明细信息
     * @param header
     * @param busRefundGoods
     * @return
     */
    private BusInvSkuDetails getInitInvSkuDetails(BusRefund header, BusRefundGoods busRefundGoods) {
    	BusInvSkuDetails busInvSkuDetails = new BusInvSkuDetails();
    	//交易头信息
    	busInvSkuDetails.setShopId(header.getShopId());
    	busInvSkuDetails.setShopName(header.getShopName());
    	busInvSkuDetails.setTradeOrderNo(header.getRefundId());
    	Short refundStatus = header.getRefundStatus();
    	//默认交易成功
    	busInvSkuDetails.setTradeStatus(DocTradeStatusEnum.COMPLETED.getCode());
    	//单据为取消状态则交易取消
    	if(RefundStatusEnum.CANCEL.getValue().equals(refundStatus)){
    		busInvSkuDetails.setTradeStatus(DocTradeStatusEnum.CANCEL.getCode());
    	} 	
    	busInvSkuDetails.setTradeTime(header.getRefundTime());
    	busInvSkuDetails.setTradeType(DocTradeTypeEnum.BACK_SI.getCode());
    	busInvSkuDetails.setTradeRelationNo(header.getOrderId());   	
    	busInvSkuDetails.setCreatedTime(new Date());
    	//交易商品明细
    	busInvSkuDetails.setDamagedQty(BigDecimal.ZERO);
    	busInvSkuDetails.setGoodsName(busRefundGoods.getGoodsName());
    	busInvSkuDetails.setId(PKMapping.GUUID(PKMapping.bus_inv_sku_details));
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(busRefundGoods.getQty()); 
    	busInvSkuDetails.setSku(busRefundGoods.getSku());
    	busInvSkuDetails.setTradeLineNo(busRefundGoods.getLineNo());
    	busInvSkuDetails.setTradeOrderDetailId(busRefundGoods.getGoodsId());    	
    	busInvSkuDetails.setUnit(busRefundGoods.getUnit());
    	return busInvSkuDetails;
	}

	/**
     * 单条入库获取初始库存信息
     * @param shopId
     * @param docAsnDetails
     * @return
     */
    private BusInvSku getInitInvSku(String shopId, DocAsnDetails docAsnDetails){
    	BusInvSku busInvSku = new BusInvSku();
    	busInvSku.setShopId(shopId);
    	busInvSku.setSku(docAsnDetails.getSku());
    	//入库时暂不考虑占用数量
    	busInvSku.setLockQty(BigDecimal.ZERO);
    	busInvSku.setQty(docAsnDetails.getReceiveQty());   	
    	busInvSku.setDamagedQty(docAsnDetails.getDamagedQty());
    	return busInvSku;
    }
    
    /**
     * 单条入库获取初始库存交易明细信息
     * @param asnHeader
     * @param docAsnDetails
     * @return
     */
    private BusInvSkuDetails getInitInvSkuDetails(DocAsnHeader asnHeader, DocAsnDetails docAsnDetails){
    	
    	BusInvSkuDetails busInvSkuDetails = new BusInvSkuDetails();
    	//交易头信息
    	busInvSkuDetails.setShopId(asnHeader.getToShopId());
    	busInvSkuDetails.setShopName(asnHeader.getToShopName());
    	busInvSkuDetails.setTradeOrderNo(asnHeader.getAsnNo());
    	busInvSkuDetails.setTradeStatus(asnHeader.getAsnStatus());
    	busInvSkuDetails.setTradeTime(asnHeader.getReceivingTime());
    	busInvSkuDetails.setTradeType(asnHeader.getAsnType());
    	busInvSkuDetails.setCreatedTime(new Date());
    	//交易商品明细
    	busInvSkuDetails.setDamagedQty(docAsnDetails.getDamagedQty());
    	busInvSkuDetails.setGoodsName(docAsnDetails.getGoodsName());
    	busInvSkuDetails.setId(PKMapping.GUUID(PKMapping.bus_inv_sku_details));
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(docAsnDetails.getReceiveQty()); 
    	busInvSkuDetails.setSku(docAsnDetails.getSku());
    	busInvSkuDetails.setTradeLineNo(docAsnDetails.getLineNo());
    	busInvSkuDetails.setTradeOrderDetailId(docAsnDetails.getAsnDetailId());    	
    	busInvSkuDetails.setUnit(docAsnDetails.getUnit());
    	
    	//入库单类型是调拨入库、调退入库及销退入库则取出库单号, 否则取外部单号
    	busInvSkuDetails.setTradeRelationNo(asnHeader.getExtOrderNo());
    	String asnType = asnHeader.getAsnType();    	
    	if(DocAsnTypeEnum.ALLOT_REFUND_SI.getCode().equals(asnType) 
    		|| DocAsnTypeEnum.ALLOT_SI.getCode().equals(asnType)
    			|| DocAsnTypeEnum.BACK_SI.getCode().equals(asnType)){
    		busInvSkuDetails.setTradeRelationNo(asnHeader.getOrderNo());
    	}    	
    	return busInvSkuDetails;
    }

    /**
     * 单条销售明细获取初始库存交易明细信息
     * @param orderHeader
     * @param busGoods
     * @return
     */
    private BusInvSkuDetails getInitInvSkuDetails(BusOrder orderHeader, BusGoods busGoods) {
    	BusInvSkuDetails busInvSkuDetails = new BusInvSkuDetails();
    	//交易头信息
    	busInvSkuDetails.setShopId(orderHeader.getShopId());
    	busInvSkuDetails.setShopName(orderHeader.getShopName());
    	busInvSkuDetails.setTradeOrderNo(orderHeader.getOrderId());    	
    	busInvSkuDetails.setTradeTime(orderHeader.getUpdatedTime());
    	
    	String tradeStatus = orderHeader.getTradeStatus();
    	busInvSkuDetails.setTradeStatus(tradeStatus);   	
    	if(tradeStatus!=null && tradeStatus.equals(DocTradeStatusEnum.COMPLETED.getCode())){
        	busInvSkuDetails.setTradeType(DocTradeTypeEnum.SALE_SO.getCode());
    	}else{  
    		busInvSkuDetails.setTradeType(DocTradeTypeEnum.SALE_SO.getCode());  		
        	//busInvSkuDetails.setTradeType(DocTradeTypeEnum.BACK_SI.getCode());
    	}
    	busInvSkuDetails.setCreatedTime(new Date());
    	busInvSkuDetails.setTradeRelationNo(orderHeader.getExtOrderId());   	    	
    	//交易商品明细
    	busInvSkuDetails.setDamagedQty(BigDecimal.ZERO);
    	busInvSkuDetails.setGoodsName(busGoods.getGoodsName());
    	busInvSkuDetails.setId(PKMapping.GUUID(PKMapping.bus_inv_sku_details));
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(busGoods.getQty()); 
    	busInvSkuDetails.setSku(busGoods.getSku());
    	busInvSkuDetails.setTradeLineNo(busGoods.getLineNo());
    	busInvSkuDetails.setTradeOrderDetailId(busGoods.getGoodsId());    	
    	busInvSkuDetails.setUnit(busGoods.getUnit());
    	return busInvSkuDetails;
	}

    /**
     * 单条销售明细获取初始库存信息
     * @param shopId
     * @param busGoods
     * @return
     */
	private BusInvSku getInitInvSku(String shopId, BusGoods busGoods) {
		BusInvSku busInvSku = new BusInvSku();
    	busInvSku.setShopId(shopId);
    	busInvSku.setSku(busGoods.getSku());
    	//入库时暂不考虑占用数量
    	busInvSku.setLockQty(BigDecimal.ZERO);
    	busInvSku.setQty(busGoods.getQty());   	
    	busInvSku.setDamagedQty(BigDecimal.ZERO);
    	return busInvSku;
	}
	
	/**
	 * 整单退校验器
	 * @param refundDetailsList
	 * @param orderDetailsList
	 * @return
	 */
	private boolean allReturnValidater(List<BusRefundGoods> refundDetailsList, 
			List<BusGoods> orderDetailsList){
		//判别整单退
		boolean allReturn = true;
		for (BusGoods busGoods : orderDetailsList) {
			boolean hasExist = false;
			String sku = busGoods.getSku();
			BigDecimal qty = busGoods.getQty();
			for (BusRefundGoods busRefundGoods : refundDetailsList) {
				if(sku.equals(busRefundGoods.getSku())){
					hasExist = true;
					if(qty.compareTo(busRefundGoods.getQty())!=0){
						return false;
					}
				}
			}
			if(!hasExist){
				return false;
			}
		}
		return allReturn;
	}
	
	
	/********************************      单据验证器          *************************************/

	/**
	 * 基本验证器
	 * @param busOrder
	 * @param currUser
	 */
	protected void baseInfoValidator(BusOrder busOrder, BusUserDto currUser){
		
		if(busOrder==null){
			throw new OrderException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
		}
		if(currUser.getShopId()==null || !currUser.getShopId().equals(busOrder.getShopId())){
			throw new OrderException(SCMErrorEnum.USER_ILLEGAL);
		}
	}
	
	/**
	 * 订单状态是否有效
	 * @param busOrder
	 * @param buttonsEnum
	 */
	protected void orderStatusIsValid(BusOrder busOrder, OrderOperateButtonsEnum buttonsEnum){
		boolean isValid = super.orderStatusValidator(busOrder, buttonsEnum);
		if(!isValid){
		   throw new OrderException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
	    }
	}
	
	
	/**
	 * 基本验证器
	 * @param busRefund
	 * @param currUser
	 */
	protected void baseInfoValidator(BusRefund busRefund, BusOrder busOrder, BusUserDto currUser){
		
		if(busRefund==null){
			throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_NOT_EXIST);
		}
		if(busOrder==null){
			throw new AfterSaleException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
		}
		
		String shopId = currUser.getShopId(); 
		if(shopId==null || !shopId.equals(busRefund.getShopId()) 
			|| !shopId.equals(busOrder.getShopId())){
			throw new AfterSaleException(SCMErrorEnum.USER_ILLEGAL);
		}
		//要退单的订单状态: tradeStatus = 30  且  flowStatus in (30, 40) 且  refundStatus is null
		String tradeStatus = busOrder.getTradeStatus();
		String flowStatus = busOrder.getFlowStatus();
		Short refundStatus = busOrder.getRefundStatus();
		if(refundStatus!=null){
			throw new AfterSaleException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
		}
		if(!((FlowStatusEnum.COMPLETED.getCode().equals(flowStatus) 
				|| FlowStatusEnum.STOCKOUT.getCode().equals(flowStatus))
				&& TradeStatusEnum.COMPLETED.getCode().equals(tradeStatus))){
			throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_STATUS_INVALID);
		}		
		//校验经销商退货不退钱
		if(busRefund.getBuyerId().startsWith(CustomerTypeEnum.JXS.getCode())){
			if(busRefund.getRefundPrice().compareTo(BigDecimal.ZERO)>0){
				throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_NOT_REFUND_MONEY);
			}
		}
		
		//判别如果是寄存单已经寄提过则不可以创建默认的退货单， 但可以一键整单退
		/*Short orderType = busOrder.getOrderType() ;
		String takeStatus = busOrder.getTakeStatus();
		if(OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType)){
			if(takeStatus!=null && !OrderTakeStatusEnum.UNTAKE.getCode().equals(takeStatus)){
				throw new AfterSaleException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
			}
		}*/
	}
	
	/**
	 * 单据金额校验器
	 * @param busRefund
	 * @param refundDetailsList
	 * @param orderDetailsList
	 * @return
	 */
	protected boolean orderAmountValidater(BusRefund busRefund, List<BusRefundGoods> refundDetailsList,
			BusOrder busOrder, List<BusGoods> orderDetailsList){		
		//退款金额不能大于原订单实收金额
		BigDecimal receptPrice = busOrder.getReceptPrice();
		BigDecimal refundPrice = busRefund.getRefundPrice();
		BigDecimal totalPrice = BigDecimal.ZERO;
		if(refundPrice.compareTo(receptPrice)>0){
			throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_PAYACCOUNT_ILLEGAL.getErrorCode(),
				"退款金额不能大于原订单实收金额");
		}				
		//退货数量不能大于下单数量
		for (BusRefundGoods busRefundGoods : refundDetailsList) {
			BigDecimal originQty = busRefundGoods.getOriginQty();
			BigDecimal qty = busRefundGoods.getQty();
			if(qty.compareTo(originQty)>0){
				throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_SKU_QTY_ILLEGAL.getErrorCode(),
					"退货数量不能大于下单数量");
			}
			totalPrice = totalPrice.add(busRefundGoods.getTotalPrice());
		}
		//退款金额不能大于商品退货金额
		if(refundPrice.compareTo(totalPrice)>0){
			throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_PAYACCOUNT_ILLEGAL.getErrorCode(),
				"退款金额不能大于商品退货金额");
		}		
		//判别整单退
		return this.allReturnValidater(refundDetailsList, orderDetailsList);
	}
	
	/**
	 * 订单状态是否有效
	 * @param busRefund
	 * @param buttonsEnum
	 */
	protected void orderStatusIsValid(BusRefund busRefund, OrderOperateButtonsEnum buttonsEnum){
		boolean isValid = super.orderStatusValidator(busRefund, buttonsEnum);
		if(!isValid){
		   throw new AfterSaleException(SCMErrorEnum.BUS_REFUND_STATUS_INVALID);
	    }
	}
	
	
	/**
	 * 格式化备注
	 * @param newRemark
	 * @param oldRemark
	 * @param currUser
	 * @return
	 */
	protected String formatRemark(String newRemark, String originRemark, BusUserDto currUser){
		if(newRemark!=null){
			String prefix = DateUtil.getDateTimeFormat(new Date()) + " " + currUser.getRealname() + " ";								
			newRemark = (StringUtil.isNotEmpty(originRemark)?(originRemark + "\n"):"") + prefix + newRemark;								
		}	
		return newRemark;
	}
	

	/*******************************************      回传erp      *********************************************/
	
	/**
	 * 入库单签收后转成ERP调拨单(签收回传)
	 * @param header
	 * @return
	 */
	protected String transferErpAllotSo(DocAsnHeader header, List<DocAsnDetails> detailsSkus){
		
		ErpOrderDto erpOrderDto = new ErpOrderDto();
		ErpOrderHeader erpOrderHeader = new ErpOrderHeader();
		String asnNo = header.getAsnNo();
		erpOrderHeader.setTrnNum(asnNo);
		erpOrderHeader.setCreateDate(header.getReceivingTime());		
		if(DocAsnTypeEnum.PURCHASE_SI.getCode().equals(header.getAsnType())){
			erpOrderHeader.setTrnNum(header.getPoNo());
			erpOrderHeader.setCreateDate(header.getCreatedTime());
		}		
		erpOrderHeader.setFromWhse(header.getFromShopId());
		erpOrderHeader.setCreatedBy(header.getiName());	
		erpOrderHeader.setOrderDate(header.getReceivingTime());
		erpOrderHeader.setToWhse(header.getToShopId());
		//erpOrderHeader.setStat(stat);
		erpOrderDto.setHeader(erpOrderHeader);
		//初始化明细信息		
		List<ErpOrderDetails> details = new ArrayList<>();
		for (DocAsnDetails detailsSku : detailsSkus) {
			ErpOrderDetails erpOrderDetail = new ErpOrderDetails();
			erpOrderDetail.setTrnNum(asnNo);
			erpOrderDetail.setTrnLine(detailsSku.getLineNo());
			erpOrderDetail.setItem(detailsSku.getSku());			
			erpOrderDetail.setuM(detailsSku.getUnit());
			erpOrderDetail.setUnitCost(detailsSku.getCostPrice());
			erpOrderDetail.setMatlCost(detailsSku.getCostPrice());
			erpOrderDetail.setUnitMatCost(detailsSku.getCostPrice());
			erpOrderDetail.setUnitMatCostConv(detailsSku.getCostPrice());
			erpOrderDetail.setUnitPrice(detailsSku.getCostPrice());
			erpOrderDetail.setQtyReq(detailsSku.getReceiveQty());
			if(DocAsnTypeEnum.PURCHASE_SI.getCode().equals(header.getAsnType())){
				erpOrderDetail.setQtyReq(detailsSku.getOrderQty());
			}			
			//填写默认值
			erpOrderDetail.setQtyReceived(detailsSku.getReceiveQty());
			erpOrderDetail.setQtyShipped(detailsSku.getExpectedQty());
			erpOrderDetail.setQtyLoss(detailsSku.getRejectedQty());
			details.add(erpOrderDetail);			
		}	
		erpOrderDto.setDetails(details);
		String jsonParam = JSON.toJSONString(erpOrderDto);
		System.out.println("-----------------------------" + jsonParam);
		//门店调拨签收-新增erp调拨单,门店要货签收-erp签收回传操作
		String url = RouteUrlUtil.ERP_CREATE_ORDER_URL;
		if(DocAsnTypeEnum.PURCHASE_SI.getCode().equals(header.getAsnType())){
			url = RouteUrlUtil.ERP_RECEIVE_ORDER_URL;	
		}
		JSONObject result = HttpRequestUtils.httpPost(url, null, jsonParam, false);
		if(!result.getBoolean("status")){			
			throw new DocAsnException(result.getString("message"));
		}
		return asnNo;
	}
	
	/**
	 * 申请单转成ERP调拨单(待出库审核)
	 * @param header
	 * @return
	 */
	protected String transferErpAllotSo(DocPoHeader poHeader, List<DocPoDetails> poDetails){
		
		ErpOrderDto erpOrderDto = new ErpOrderDto();
		ErpOrderHeader erpOrderHeader = new ErpOrderHeader();
		String poNo = poHeader.getPoNo();
		erpOrderHeader.setTrnNum(poNo);
		erpOrderHeader.setCreateDate(poHeader.getCreatedTime());		
		//erpOrderHeader.setFromWhse(fromWhse);
		//erpOrderHeader.setStat(stat);
		erpOrderHeader.setCreatedBy(poHeader.getiName());		
		erpOrderHeader.setToWhse(poHeader.getToShopId());
		erpOrderHeader.setOrderDate(poHeader.getExpectedTime());
		erpOrderDto.setHeader(erpOrderHeader);
		//初始化明细信息		
		List<ErpOrderDetails> details = new ArrayList<>();
		for (DocPoDetails docPoDetails : poDetails) {
			ErpOrderDetails erpOrderDetail = new ErpOrderDetails();
			erpOrderDetail.setTrnNum(poNo);
			erpOrderDetail.setTrnLine(docPoDetails.getLineNo());
			erpOrderDetail.setItem(docPoDetails.getSku());			
			erpOrderDetail.setuM(docPoDetails.getUnit());
			erpOrderDetail.setUnitCost(docPoDetails.getCostPrice());
			erpOrderDetail.setMatlCost(docPoDetails.getCostPrice());
			erpOrderDetail.setUnitMatCost(docPoDetails.getCostPrice());
			erpOrderDetail.setUnitMatCostConv(docPoDetails.getCostPrice());
			erpOrderDetail.setUnitPrice(docPoDetails.getCostPrice());
			erpOrderDetail.setQtyReq(docPoDetails.getOrderedQty());
			//填写默认值
			erpOrderDetail.setQtyReceived(docPoDetails.getOrderedQty());
			erpOrderDetail.setQtyShipped(docPoDetails.getOrderedQty());
			erpOrderDetail.setQtyLoss(BigDecimal.ZERO);
			details.add(erpOrderDetail);			
		}	
		erpOrderDto.setDetails(details);
		String jsonParam = JSON.toJSONString(erpOrderDto);
		System.out.println("-----------------------------" + jsonParam);
		JSONObject result = HttpRequestUtils.httpPost(RouteUrlUtil.ERP_CREATE_ORDER_URL, null, jsonParam, false);
		if(!result.getBoolean("status")){			
			throw new DocPoException(result.getString("message"));
		}
		return poHeader.getPoNo();
	}
	
	/**
	 * 撤柜退货单回传erp
	 * @param header
	 * @return
	 */
	protected String transferErpAllotSo(DocOrderHeader header, List<DocOrderDetailsMateriel> detailsMateriels,
		List<DocOrderDetails> detailsSkus){
		
		ErpOrderDto erpOrderDto = new ErpOrderDto();
		ErpOrderHeader erpOrderHeader = new ErpOrderHeader();
		String orderNo = header.getOrderNo();
		erpOrderHeader.setTrnNum(orderNo);
		erpOrderHeader.setCreateDate(header.getCreatedTime());		
		erpOrderHeader.setFromWhse(header.getFromShopId());
		erpOrderHeader.setCreatedBy(header.getiName());	
		erpOrderHeader.setOrderDate(header.getDeliveryTime());
		//erpOrderHeader.setToWhse(poHeader.getToShopId());
		//erpOrderHeader.setStat(stat);
		erpOrderDto.setHeader(erpOrderHeader);
		//初始化明细信息		
		List<ErpOrderDetails> details = new ArrayList<>();
		for (DocOrderDetails detailsSku : detailsSkus) {
			ErpOrderDetails erpOrderDetail = new ErpOrderDetails();
			erpOrderDetail.setTrnNum(orderNo);
			erpOrderDetail.setTrnLine(detailsSku.getLineNo());
			erpOrderDetail.setItem(detailsSku.getSku());			
			erpOrderDetail.setuM(detailsSku.getUnit());
			erpOrderDetail.setUnitCost(detailsSku.getCostPrice());
			erpOrderDetail.setMatlCost(detailsSku.getCostPrice());
			erpOrderDetail.setUnitMatCost(detailsSku.getCostPrice());
			erpOrderDetail.setUnitMatCostConv(detailsSku.getCostPrice());
			erpOrderDetail.setUnitPrice(detailsSku.getCostPrice());
			erpOrderDetail.setQtyReq(detailsSku.getShippedQty());
			erpOrderDetail.setCategoryCode(detailsSku.getCategoryCode());
			//填写默认值
			erpOrderDetail.setQtyReceived(detailsSku.getShippedQty());
			erpOrderDetail.setQtyShipped(detailsSku.getShippedQty());
			erpOrderDetail.setQtyLoss(BigDecimal.ZERO);
			details.add(erpOrderDetail);			
		}	
		for (DocOrderDetailsMateriel detailsMateriel : detailsMateriels) {
			ErpOrderDetails erpOrderDetail = new ErpOrderDetails();
			erpOrderDetail.setTrnNum(orderNo);
			erpOrderDetail.setTrnLine(detailsMateriel.getLineNo());
			erpOrderDetail.setItem(detailsMateriel.getSku());			
			erpOrderDetail.setuM(detailsMateriel.getUnit());
			erpOrderDetail.setUnitCost(detailsMateriel.getCostPrice());
			erpOrderDetail.setMatlCost(detailsMateriel.getCostPrice());
			erpOrderDetail.setUnitMatCost(detailsMateriel.getCostPrice());
			erpOrderDetail.setUnitMatCostConv(detailsMateriel.getCostPrice());
			erpOrderDetail.setUnitPrice(detailsMateriel.getCostPrice());
			erpOrderDetail.setQtyShipped(detailsMateriel.getShippedQty());
			erpOrderDetail.setQtyReq(detailsMateriel.getShippedQty());
			erpOrderDetail.setCategoryCode(detailsMateriel.getCategoryCode());
			//填写默认值
			erpOrderDetail.setQtyReceived(detailsMateriel.getShippedQty());			
			erpOrderDetail.setQtyLoss(BigDecimal.ZERO);
			details.add(erpOrderDetail);			
		}	
		erpOrderDto.setDetails(details);
		String jsonParam = JSON.toJSONString(erpOrderDto);
		System.out.println("-----------------------------" + jsonParam);
		JSONObject result = HttpRequestUtils.httpPost(RouteUrlUtil.ERP_REFUND_ORDER_URL, null, jsonParam, false);
		if(!result.getBoolean("status")){			
			throw new DocOrderException(result.getString("message"));
		}
		return orderNo;
	}
	
}
