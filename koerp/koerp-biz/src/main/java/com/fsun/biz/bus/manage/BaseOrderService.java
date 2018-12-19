package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.fsun.common.utils.PKMapping;
import com.fsun.domain.model.BusInvSku;
import com.fsun.domain.model.BusInvSkuDetails;
import com.fsun.domain.model.DocAsnDetails;
import com.fsun.domain.model.DocAsnHeader;

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
    protected BusInvSku skuStockIn(DocAsnHeader asnHeader, 
    	DocAsnDetails docAsnDetails){
    	
    	//计算库存
    	BusInvSku busInvSku = new BusInvSku();
    	busInvSku.setShopId(asnHeader.getToShopId());
    	busInvSku.setSku(docAsnDetails.getSku());
    	//入库时暂不考虑占用数量
    	busInvSku.setLockQty(BigDecimal.ZERO);
    	busInvSku.setQty(docAsnDetails.getReceiveQty());   	
    	busInvSku.setDamagedQty(docAsnDetails.getDamagedQty());
    	   	
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
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockIn(busInvSku);   	
    }  
    
    
    /**
     * 入库单出库存
     * @param asnHeader
     * @param docAsnDetails
     * @return
     */
    protected BusInvSku skuStockOut(DocAsnHeader asnHeader, 
    	DocAsnDetails docAsnDetails){
    	
    	//计算库存
    	BusInvSku busInvSku = new BusInvSku();
    	busInvSku.setShopId(asnHeader.getToShopId());
    	busInvSku.setSku(docAsnDetails.getSku());
    	//入库时暂不考虑占用数量
    	busInvSku.setLockQty(BigDecimal.ZERO);
    	busInvSku.setQty(docAsnDetails.getReceiveQty());   	
    	busInvSku.setDamagedQty(docAsnDetails.getDamagedQty());
    	   	
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
    	busInvSkuDetails.setDamagedQty(docAsnDetails.getDamagedQty().negate());
    	busInvSkuDetails.setGoodsName(docAsnDetails.getGoodsName());
    	busInvSkuDetails.setId(PKMapping.GUUID(PKMapping.bus_inv_sku_details));
    	busInvSkuDetails.setLockQty(BigDecimal.ZERO);
    	busInvSkuDetails.setQty(docAsnDetails.getReceiveQty().negate());    	
    	busInvSkuDetails.setSku(docAsnDetails.getSku());
    	busInvSkuDetails.setTradeLineNo(docAsnDetails.getLineNo());
    	busInvSkuDetails.setTradeOrderDetailId(docAsnDetails.getAsnDetailId());    	
    	busInvSkuDetails.setUnit(docAsnDetails.getUnit());
    	busInvSkuDetailsManage.create(busInvSkuDetails);    	
    	return busInvSkuManage.stockOut(busInvSku);   	
    }  
}
