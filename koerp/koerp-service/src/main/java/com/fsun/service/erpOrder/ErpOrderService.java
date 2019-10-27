package com.fsun.service.erpOrder;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.ErpOrderApi;
import com.fsun.biz.bus.manage.BusShopManage;
import com.fsun.biz.bus.manage.DocAsnDetailsManage;
import com.fsun.biz.bus.manage.DocAsnHeaderManage;
import com.fsun.biz.bus.manage.DocPoDetailsManage;
import com.fsun.biz.bus.manage.DocPoHeaderManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.domain.dto.ErpOrderDto;
import com.fsun.domain.entity.DocPoDetailsCondition;
import com.fsun.domain.enums.DocAsnSignTypeEnum;
import com.fsun.domain.enums.DocAsnStatusEnum;
import com.fsun.domain.enums.DocAsnTypeEnum;
import com.fsun.domain.enums.DocGoodsTypeEnum;
import com.fsun.domain.enums.DocPoStatusEnum;
import com.fsun.domain.enums.TradeFromEnum;
import com.fsun.domain.model.BusShop;
import com.fsun.domain.model.DocAsnDetails;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.DocPoDetails;
import com.fsun.domain.model.DocPoHeader;
import com.fsun.domain.model.ErpOrderDetails;
import com.fsun.domain.model.ErpOrderHeader;
import com.fsun.exception.bus.DocOrderException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2019年10月9日
 */
@Service
public class ErpOrderService implements ErpOrderApi {
	
	@Autowired
	private DocPoHeaderManage docPoHeaderManage; 
	
	@Autowired
	private DocPoDetailsManage docPoDetailsManage;
	
	@Autowired
	private BusShopManage busShopManage;
	
	@Autowired
	private DocAsnHeaderManage docAsnHeaderManage;
	
	@Autowired
	private DocAsnDetailsManage docAsnDetailsManage;

	@Transactional
	@Override
	public String transferAsnDto(ErpOrderDto erpOrderDto) {
		
		ErpOrderHeader erpOrderHeader = erpOrderDto.getHeader();		
		String poNo = erpOrderHeader.getTrnNum();
		DocPoHeader poHeader = docPoHeaderManage.load(poNo);
		
		DocAsnHeader header = new DocAsnHeader();
		BigDecimal zero = BigDecimal.ZERO; 
		String toShopId = poHeader.getToShopId();		
		BusShop toShop = busShopManage.load(toShopId);		
		if(toShop==null){
			throw new DocOrderException(SCMErrorEnum.BUS_SHOP_NOT_EXIST);
		}
		//初始化头信息
		String asnType = DocAsnTypeEnum.PURCHASE_SI.getCode();
		String asnNo = docAsnHeaderManage.initAsnNo(asnType, toShop.getShopCode());		
		header.setAsnNo(asnNo);
		header.setAsnSource(TradeFromEnum.PC.getCode());
		header.setAsnStatus(DocAsnStatusEnum.SI_DQS.getCode());
		header.setAsnType(asnType);				
		header.setToShopId(toShopId);
		header.setToShopName(toShop.getShopName());	
		header.setFromShopId(poHeader.getFromShopId());
		header.setFromShopName(poHeader.getFromShopName());		
		header.setExtOrderNo(poNo);
		header.setOrderPrice(zero);
		header.setPoNo(poNo);
		header.setPrintCount(0);
		//默认从erp接口取
		header.setDeliveryTime(new Date());
		header.setExpectedTime(erpOrderHeader.getOrderDate());
		header.setMobile(toShop.getTel());
		header.setAddress(toShop.getAddress());
		header.setCarrierId("");
		header.setCarrierName(toShop.getContacts());
		header.setCreatedName(erpOrderHeader.getCreatedBy());
		header.setCreatedTime(new Date());
		header.setiName(erpOrderHeader.getCreatedBy());
		docAsnHeaderManage.create(header);
		
		List<DocPoDetails> poDetails = this.getPoDetails(poNo);
		List<DocPoDetails> newPoDetails = new ArrayList<>();
		//初始化明细信息		
		for (ErpOrderDetails erpOrderDetail : erpOrderDto.getDetails()) {
			String sku = erpOrderDetail.getItem();
			BigDecimal orderQty = erpOrderDetail.getQtyShipped();
			DocPoDetails docPoDetails = this.getPoDetail(sku, poDetails);
			if(docPoDetails==null){	
				throw new DocOrderException(SCMErrorEnum.BUS_ORDER_DETAIL_NOT_EXIST);
			}			
			DocAsnDetails asnDetail = new DocAsnDetails();
			asnDetail.setAsnDetailId(PKMapping.GUUID(PKMapping.doc_asn_details));
			asnDetail.setAsnNo(asnNo);	
			asnDetail.setSku(sku);											
			asnDetail.setReceiveQty(orderQty);
			asnDetail.setExpectedQty(orderQty);	
			BigDecimal totalPrice = orderQty.multiply(docPoDetails.getPrice())
				.setScale(2, BigDecimal.ROUND_HALF_UP);
			asnDetail.setTotalPrice(totalPrice);
			asnDetail.setGoodsType(DocGoodsTypeEnum.NORMAL.getValue());
			asnDetail.setSignType(DocAsnSignTypeEnum.ALL_SIGN.getCode());
			asnDetail.setRejectedQty(zero);
			asnDetail.setDamagedQty(zero);	
			
			asnDetail.setLineNo(docPoDetails.getLineNo());
			asnDetail.setOrderQty(docPoDetails.getOrderedQty());	
			asnDetail.setBarCode(docPoDetails.getBarCode());
			asnDetail.setBrandCode(docPoDetails.getBrandCode());
			asnDetail.setBrandName(docPoDetails.getBrandName());
			asnDetail.setCategoryCode(docPoDetails.getCategoryCode());
			asnDetail.setCategoryName(docPoDetails.getCategoryName());
			asnDetail.setConvertQty(docPoDetails.getConvertQty());
			asnDetail.setConvertUnit(docPoDetails.getConvertUnit());
			asnDetail.setCostPrice(docPoDetails.getCostPrice());
			asnDetail.setGoodsName(docPoDetails.getGoodsName());
			asnDetail.setParentSku(docPoDetails.getParentSku());
			asnDetail.setPoLineNo(docPoDetails.getLineNo());
			asnDetail.setPrice(docPoDetails.getPrice());
			asnDetail.setProperty(docPoDetails.getProperty());
			asnDetail.setRatePrecent(docPoDetails.getRatePrecent());
			asnDetail.setUnit(docPoDetails.getUnit());
			//用于签收回显
			asnDetail.setUserDefine1(docPoDetails.getPoDetailId());
			docAsnDetailsManage.create(asnDetail);	
		
			docPoDetails.setExpectedQty(orderQty);
			newPoDetails.add(docPoDetails);
		}
		//审核采购申请及更新明细
		this.auditPurchaseApply(header, poHeader, newPoDetails);
		return asnNo;
	}
	
	/**
	 * 获取申请单明细
	 * @param poNo
	 * @return
	 */
	private List<DocPoDetails> getPoDetails(String poNo) {
		DocPoDetailsCondition condition = new DocPoDetailsCondition();
		condition.setPoNo(poNo);
		return docPoDetailsManage.list(condition);
	}
	
	/**
	 * 根据Sku获取申请单下的单个明细
	 * @param sku
	 * @param details
	 * @return
	 */
	private DocPoDetails getPoDetail(String sku, List<DocPoDetails> details){		
		for (DocPoDetails docPoDetails : details) {
			if(sku!=null && sku.equals(docPoDetails.getSku())){
				return docPoDetails;			
			}
		}
		return null;
	}

	/**
	 * 审核采购申请及更新明细
	 * @param header
	 * @param details
	 */
	private void auditPurchaseApply(DocAsnHeader header, DocPoHeader poHeader, List<DocPoDetails> details) {			
		Date now = new Date();			
		//更新申请单明细				
		for (DocPoDetails docPoDetails : details) {											
			//docPoDetails.setExpectedQty(docPoDetails.getOrderedQty());
			docPoDetails.setUpdatedTime(now);
			docPoDetailsManage.update(docPoDetails);
		}
		//更新申请单状态								
		poHeader.setUpdatedName(header.getUpdatedName());
		poHeader.setUpdatedTime(header.getUpdatedTime());				
		//审核信息
		poHeader.setPoStatus(DocPoStatusEnum.AUDIT_PASS.getCode());
		poHeader.setAuditTime(now);
		poHeader.setAuditorId(header.getiId());
		poHeader.setAuditor(header.getiName());
		poHeader.setRelationNo(header.getExtOrderNo());
		poHeader.setDeliveryTime(header.getDeliveryTime());
		poHeader.setExpectedTime(header.getExpectedTime());
		docPoHeaderManage.update(poHeader);				
	}

}
