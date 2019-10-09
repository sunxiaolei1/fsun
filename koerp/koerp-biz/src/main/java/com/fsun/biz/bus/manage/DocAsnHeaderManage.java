package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.common.utils.PKMapping;
import com.fsun.dao.mapper.BusShopMapper;
import com.fsun.dao.mapper.DocAsnDetailsMapper;
import com.fsun.dao.mapper.DocAsnHeaderMapper;
import com.fsun.domain.enums.DocAsnSignTypeEnum;
import com.fsun.domain.enums.DocAsnStatusEnum;
import com.fsun.domain.enums.DocAsnTypeEnum;
import com.fsun.domain.enums.DocGoodsTypeEnum;
import com.fsun.domain.enums.TradeFromEnum;
import com.fsun.domain.model.BusShop;
import com.fsun.domain.model.DocAsnDetails;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.DocOrderDetails;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.exception.bus.DocOrderException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2018年12月15日
 */
@Component
public class DocAsnHeaderManage extends CrudManage<DocAsnHeaderMapper, DocAsnHeader>{
	
	@Autowired
	private BusShopMapper busShopMapper;
	
	@Autowired
	private DocAsnDetailsMapper docAsnDetailsMapper;

	/**
	 * 根据入库类型生成入库单号
	 * @param asnType
	 * @return
	 */
	public String initAsnNo(String asnType, String shopCode) {
		
		//String prefix = DateUtil.getNowDateStr().replace("-", "") + asnType + shopCode;
		String prefix = DateUtil.getNowShortDateStr() + asnType;
		List<String> list = mapper.getMaxNumber(prefix);
		if(list!=null && list.size()>0){
			String maxAsnNo = list.get(0);
			return (Long.parseLong(maxAsnNo) + 1) + "";
		}else{	
			//return prefix + "00001";
			return prefix + "01";
		}
	}

	/**
	 * 转换成调拨入库单
	 * @param orderHeader
	 * @param orderDetails
	 */
	public String transferAllotStorage(DocOrderHeader orderHeader, List<DocOrderDetails> orderDetails) {
		DocAsnHeader header = new DocAsnHeader();
		BigDecimal zero = BigDecimal.ZERO; 
		String toShopId = orderHeader.getToShopId();
		String fromShopId = orderHeader.getFromShopId();
		BusShop toShop = busShopMapper.selectByPrimaryKey(toShopId);
		BusShop fromShop = busShopMapper.selectByPrimaryKey(fromShopId);
		if(toShop==null || fromShop==null){
			throw new DocOrderException(SCMErrorEnum.BUS_SHOP_NOT_EXIST);
		}
		//初始化头信息
		String asnNo = this.initAsnNo(DocAsnTypeEnum.ALLOT_SI.getCode(), toShop.getShopCode());
		header.setAsnNo(asnNo);
		header.setAsnSource(TradeFromEnum.PC.getCode());
		header.setAsnStatus(DocAsnStatusEnum.SI_DQS.getCode());
		header.setAsnType(DocAsnTypeEnum.ALLOT_SI.getCode());
		header.setDeliveryTime(orderHeader.getDeliveryTime());
		header.setExpectedTime(orderHeader.getExpectedTime());		
		header.setFromShopId(orderHeader.getFromShopId());
		header.setFromShopName(orderHeader.getFromShopName());
		header.setToShopId(orderHeader.getToShopId());
		header.setToShopName(orderHeader.getToShopName());		
		header.setOrderNo(orderHeader.getOrderNo());
		header.setOrderPrice(zero);
		header.setPoNo(orderHeader.getPoNo());
		header.setPrintCount(0);
		header.setMobile(fromShop.getTel());
		header.setAddress(fromShop.getAddress());
		header.setCarrierId(orderHeader.getCarrierId());
		header.setCarrierName(orderHeader.getCarrierName());
		header.setCreatedName(orderHeader.getUpdatedName());
		header.setCreatedTime(orderHeader.getUpdatedTime());
		this.create(header);
		//初始化明细信息		
		int lineNo = 0;
		for (DocOrderDetails docOrderDetails : orderDetails) {
			DocAsnDetails asnDetail = new DocAsnDetails();
			BeanUtils.copyProperties(docOrderDetails, asnDetail);
			asnDetail.setAsnDetailId(PKMapping.GUUID(PKMapping.doc_asn_details));
			asnDetail.setAsnNo(asnNo);	
			asnDetail.setLineNo(lineNo++);
			asnDetail.setOrderQty(docOrderDetails.getOrderedQty());
			asnDetail.setExpectedQty(docOrderDetails.getShippedQty());		
			asnDetail.setGoodsType(DocGoodsTypeEnum.NORMAL.getValue());					
			asnDetail.setReceiveQty(docOrderDetails.getShippedQty());
			BigDecimal totalPrice = docOrderDetails.getShippedQty().multiply(docOrderDetails.getPrice())
				.setScale(2, BigDecimal.ROUND_HALF_UP);
			asnDetail.setTotalPrice(totalPrice);
			asnDetail.setSignType(DocAsnSignTypeEnum.ALL_SIGN.getCode());
			asnDetail.setRejectedQty(zero);
			asnDetail.setDamagedQty(zero);			
			docAsnDetailsMapper.insertSelective(asnDetail);			
		}		
		return asnNo;
	}

}
