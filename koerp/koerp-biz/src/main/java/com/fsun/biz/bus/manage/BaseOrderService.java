package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.fsun.common.utils.PKMapping;
import com.fsun.domain.model.BusInvSku;
import com.fsun.domain.model.BusInvSkuDetails;
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


	
 
}