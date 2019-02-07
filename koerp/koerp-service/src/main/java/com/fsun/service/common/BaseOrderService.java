package com.fsun.service.common;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.fsun.biz.bus.manage.BusInvSkuDetailsManage;
import com.fsun.biz.bus.manage.BusInvSkuManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.domain.enums.DocOrderTypeEnum;
import com.fsun.domain.enums.DocTradeStatusEnum;
import com.fsun.domain.enums.DocTradeTypeEnum;
import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusInvSku;
import com.fsun.domain.model.BusInvSkuDetails;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.DocAsnDetails;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.DocOrderDetails;
import com.fsun.domain.model.DocOrderHeader;

/**
 * 单据基础类
 * @author fsun
 * @date 2018年12月19日
 */
public abstract class BaseOrderService {

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
    
    
    
	/*****************************   私有方法       *********************************/

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
    	//busInvSkuDetails.setTradeRelationNo(tradeRelnullationNo);   	
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
    	//busInvSkuDetails.setTradeRelationNo(tradeRelnullationNo);   	
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
    	busInvSkuDetails.setTradeRelationNo(orderHeader.getExtOrderId());   	
    	busInvSkuDetails.setCreatedTime(orderHeader.getUpdatedTime());
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
	

	
 
}
