package com.fsun.service.docOrder;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.DocOrderApi;
import com.fsun.biz.bus.manage.DocOrderDetailsManage;
import com.fsun.biz.bus.manage.DocOrderHeaderManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocOrderDto;
import com.fsun.domain.entity.DocOrderDetailsCondition;
import com.fsun.domain.entity.DocOrderHeaderCondition;
import com.fsun.domain.enums.DocOrderModeEnum;
import com.fsun.domain.enums.DocOrderStatusEnum;
import com.fsun.domain.enums.DocOrderTypeEnum;
import com.fsun.domain.enums.TradeFromEnum;
import com.fsun.domain.model.DocOrderDetails;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.DocOrderException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.service.common.BaseOrderService;

/**
 * 出库单操作接口
 * @author fsun
 * @date 2018年12月15日
 */
@Service
public class DocOrderService extends BaseOrderService implements DocOrderApi {
	
	@Autowired
	private DocOrderHeaderManage docOrderHeaderManage;
	
	@Autowired
	private DocOrderDetailsManage docOrderDetailsManage;

	
	@Override
	public HashMap<String, Object> getInitData(String orderNo, String orderType, BusUserDto currUser) {
		HashMap<String, Object> map = new HashMap<>();
		if(StringUtils.isEmpty(orderNo)){			
			DocOrderHeader header = this.getInitHeader(orderType, currUser);
			map.put("header", header);
		}else{
			map = docOrderHeaderManage.loadEntity(orderNo);
		}
		return map;
	}
	
	@Override
	public DocOrderHeader load(String id) {
		return docOrderHeaderManage.load(id);
	}
		
	@Override
	public List<DocOrderHeader> list(DocOrderHeaderCondition condition) {
		return docOrderHeaderManage.list(condition);
	}

	@Override
	public PageModel findPage(DocOrderHeaderCondition condition) {
		return docOrderHeaderManage.findMapPage(condition);
	}

	@Override
	public String save(DocOrderHeader domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PageModel findListForPage(DocOrderHeaderCondition condition) {
		return docOrderHeaderManage.findPage(condition);
	}

	@Transactional
	@Override
	public void changeStatus(String[] orderNos, String status, SysUser user, 
		DocOrderHeaderCondition condition) {
		Date now = new Date();
		for (String orderNo : orderNos) {
			DocOrderHeader header = this.load(orderNo);
			if(header==null){
				throw new DocOrderException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
			}		
			if(!orderStatusValidator(status, header)){
				throw new DocOrderException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
			}
			header.setOrderStatus(status);
			header.setUpdatedName(user.getRealname());
			header.setUpdatedTime(now);
			header.setMemo(condition.getMemo());
			docOrderHeaderManage.update(header);
			
			if(DocOrderStatusEnum.getByName(status)==DocOrderStatusEnum.SO_CKQX){
				DocOrderDetailsCondition condition0 = new DocOrderDetailsCondition();
				condition0.setOrderNo(orderNo);
				List<DocOrderDetails> docOrderDetails = docOrderDetailsManage.list(condition0);
				for (DocOrderDetails docOrderDetails2 : docOrderDetails) {
					super.skuStockIn(header, docOrderDetails2);
				}
			}
			
		}
		
	}

	@Transactional
	@Override
	public String saveEntity(DocOrderDto docOrderDto) {
		String orderNo = docOrderDto.getOrderNo();
		BusUserDto currUser = docOrderDto.getCurrentUser();
		DocOrderHeader header = docOrderDto.getHeader();		
		//入参基本的校验
		String iId = header.getiId();
		if(!DocOrderTypeEnum.USE_SO.getCode().equals(header.getOrderType())){
			if(!currUser.getId().equals(iId)){
				throw new DocOrderException(SCMErrorEnum.USER_ILLEGAL);
			}
		}		
		if(this.load(orderNo)!=null){
			throw new DocOrderException(SCMErrorEnum.BUS_ORDER_EXISTED);
		}			
		List<DocOrderDetails> details = docOrderDto.getDetails();
		if(details==null || details.size()==0){
			throw new DocOrderException(SCMErrorEnum.BUS_ORDER_DETAIL_NOT_EXIST);
		}		
		//初始化头信息
		Date now = new Date();
		header.setiAddress(currUser.getShopName());
		header.setiContact(currUser.getRealname());
		header.setiTel(currUser.getTelphone());
		header.setDeliveryTime(header.getDeliveryTime()!=null?header.getDeliveryTime():now);
		header.setCreatedName(currUser.getRealname());
		header.setCreatedTime(now);
		header.setOrderStatus(DocOrderStatusEnum.SO_DDCK.getCode());
		header.setOrderSource(TradeFromEnum.PC.getCode());
		BigDecimal orderPrice = BigDecimal.ZERO;
		//初始化明细
		int lineNo = 1;
		for (DocOrderDetails docOrderDetails : details) {
			docOrderDetails.setSoDetailId(PKMapping.GUUID(PKMapping.doc_order_details));
			docOrderDetails.setOrderNo(orderNo);
			docOrderDetails.setLineNo(lineNo++);			
			docOrderDetails.setOrderedQty(
				docOrderDetails.getOrderedQty()!=null?docOrderDetails.getOrderedQty():docOrderDetails.getShippedQty()
			);
			BigDecimal totalPrice = docOrderDetails.getShippedQty().multiply(docOrderDetails.getPrice()).setScale(2, BigDecimal.ROUND_HALF_UP);
			docOrderDetails.setTotalPrice(totalPrice);
			docOrderDetails.setCreatedTime(now);
			orderPrice = orderPrice.add(totalPrice);
			docOrderDetailsManage.create(docOrderDetails);
			super.skuStockOut(header, docOrderDetails);
		}
		header.setOrderPrice(orderPrice);
		docOrderHeaderManage.create(header);		
		return orderNo;
	}
	
	@Override
	public HashMap<String, Object> loadEntity(String orderNo) {		
		return docOrderHeaderManage.loadEntity(orderNo);
	}
	

	/****************************    私有方法          ******************************/
	
	/**
	 * 验证入库单单状态是否可用
	 * @param currAsnStatus
	 * @param oldHeader
	 * @return
	 */
	private boolean orderStatusValidator(String currOrderStatus, DocOrderHeader oldHeader){
		boolean isTrue = true;
		String oldStatus = oldHeader.getOrderStatus();
		switch (DocOrderStatusEnum.getByName(currOrderStatus)) {
			case SO_DSH:			
				break;		
			case SO_SHWC:			
				break;	
			case SO_DDCK:			
				break;
			case SO_CKWC:			
				break;					
			case SO_CKQX:						
				if(DocOrderStatusEnum.SO_CKQX.getCode().equals(oldStatus)
					|| DocOrderStatusEnum.SO_CKWC.getCode().equals(oldStatus)){
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
	private DocOrderHeader getInitHeader(String orderType, BusUserDto currUser){
		DocOrderHeader header = new DocOrderHeader();
		String orderNo = docOrderHeaderManage.initOrderNo(orderType, currUser.getShopCode());
		header.setOrderNo(orderNo);
		switch (DocOrderTypeEnum.getByName(orderType)) {
			case ALLOT_SO:			
				break;		
			case SHORTAGE_SO:	
				header.setOrderType(orderType);
				header.setiId(currUser.getId());
				header.setFromShopId(currUser.getShopId());
				header.setFromShopName(currUser.getShopName());
				break;
			case PURCHASE_SO:					
				break;
			case LOSE_SO:	
				header.setOrderType(orderType);
				header.setiId(currUser.getId());
				header.setFromShopId(currUser.getShopId());
				header.setFromShopName(currUser.getShopName());
				break;
			case USE_SO:
				header.setOrderType(orderType);				
				header.setFromShopId(currUser.getShopId());
				header.setFromShopName(currUser.getShopName());
				header.setOrderMode(DocOrderModeEnum.YP.getCode());
				break;
			default:
				break;
		}
		return header;
	}

}
