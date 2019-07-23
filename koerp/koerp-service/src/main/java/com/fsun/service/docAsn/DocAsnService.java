package com.fsun.service.docAsn;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.DocAsnApi;
import com.fsun.biz.bus.manage.BusShopManage;
import com.fsun.biz.bus.manage.DocAsnDetailsManage;
import com.fsun.biz.bus.manage.DocAsnHeaderManage;
import com.fsun.biz.bus.manage.DocOrderDetailsManage;
import com.fsun.biz.bus.manage.DocOrderHeaderManage;
import com.fsun.biz.bus.manage.DocPoDetailsManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocAsnDto;
import com.fsun.domain.entity.DocAsnDetailsCondition;
import com.fsun.domain.entity.DocAsnHeaderCondition;
import com.fsun.domain.entity.DocPoDetailsCondition;
import com.fsun.domain.enums.DocAsnCheckStatusEnum;
import com.fsun.domain.enums.DocAsnSignTypeEnum;
import com.fsun.domain.enums.DocAsnStatusEnum;
import com.fsun.domain.enums.DocAsnTypeEnum;
import com.fsun.domain.enums.DocOrderStatusEnum;
import com.fsun.domain.enums.TradeFromEnum;
import com.fsun.domain.model.BusShop;
import com.fsun.domain.model.DocAsnDetails;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.DocOrderDetails;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.domain.model.DocPoDetails;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.DocAsnException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.service.common.BaseOrderService;

/**
 * 入库单操作接口
 * @author fsun
 * @date 2018年12月15日
 */
@Service
public class DocAsnService extends BaseOrderService implements DocAsnApi {
	
	@Autowired
	private DocPoDetailsManage docPoDetailsManage;

	@Autowired
	private DocAsnHeaderManage docAsnHeaderManage;
	
	@Autowired
	private DocAsnDetailsManage docAsnDetailsManage;
	
	@Autowired
	private DocOrderHeaderManage docOrderHeaderManage;
	
	@Autowired
	private DocOrderDetailsManage docOrderDetailsManage;
	
	@Autowired
	private BusShopManage busShopManage;
	
	@Override
	public HashMap<String, Object> getInitData(String asnNo, String asnType, BusUserDto currUser) {
		
		HashMap<String, Object> map = new HashMap<>();
		if(StringUtils.isEmpty(asnNo)){			
			DocAsnHeader header = this.getInitHeader(asnType, currUser);
			map.put("header", header);
		}else{
			map = docAsnHeaderManage.loadEntity(asnNo);
			//调拨入库初始化
			if(DocAsnTypeEnum.ALLOT_SI.getCode().equals(asnType)){
				HashMap<String, Object> headerMap = (HashMap<String, Object>)map.get("header");
				String asnStatus = (String)headerMap.get("asnStatus");
				//如果是待签收状态
				if(DocAsnStatusEnum.SI_DQS.getCode().equals(asnStatus)){
					headerMap.put("iId", currUser.getId());
					headerMap.put("checkUserId", currUser.getId());
					headerMap.put("checkName", currUser.getRealname());
					headerMap.put("checkStatus", DocAsnCheckStatusEnum.UNSIGN.getCode());
				}
			}
		}
		return map;
	}
	
	@Override
	public DocAsnHeader load(String id) {
		return docAsnHeaderManage.load(id);
	}

	@Override
	public List<DocAsnHeader> list(DocAsnHeaderCondition condition) {
		return docAsnHeaderManage.list(condition);
	}

	@Override
	public PageModel findPage(DocAsnHeaderCondition condition) {
		return docAsnHeaderManage.findMapPage(condition);
	}

	@Override
	public String save(DocAsnHeader domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, Object> loadEntity(String asnNo) {
		return docAsnHeaderManage.loadEntity(asnNo);
	}

	@Override
	public PageModel findListForPage(DocAsnHeaderCondition condition) {
		return docAsnHeaderManage.findPage(condition);
	}

	@Transactional
	@Override
	public String saveEntity(DocAsnDto docAsnDto) {
		String asnNo = docAsnDto.getAsnNo();
		BusUserDto currUser = docAsnDto.getCurrentUser();
		DocAsnHeader header = docAsnDto.getHeader();
		//调拨入库
		if(DocAsnTypeEnum.ALLOT_SI.getCode().equals(header.getAsnType())){
			return this.allotSign(docAsnDto);
		}
		//入参基本的校验
		String iId = header.getiId();
		if(!currUser.getId().equals(iId)){
			throw new DocAsnException(SCMErrorEnum.USER_ILLEGAL);
		}
		if(this.load(asnNo)!=null){
			throw new DocAsnException(SCMErrorEnum.BUS_ORDER_EXISTED);
		}			
		List<DocAsnDetails> details = docAsnDto.getDetails();
		if(details==null || details.size()==0){
			throw new DocAsnException(SCMErrorEnum.BUS_ORDER_DETAIL_NOT_EXIST);
		}
		
		//初始化头信息
		Date now = new Date();
		header.setPrintCount(0);
		header.setiAddress(currUser.getShopName());
		header.setiContact(currUser.getRealname());
		header.setiName(currUser.getRealname());
		header.setiTel(currUser.getTelphone());
		header.setReceivingTime(header.getReceivingTime()!=null?header.getReceivingTime():now);
		header.setCreatedName(currUser.getRealname());
		header.setCreatedTime(now);
		header.setAsnStatus(DocAsnStatusEnum.SI_WQSH.getCode());
		header.setAsnSource(TradeFromEnum.PC.getCode());
		BigDecimal orderPrice = BigDecimal.ZERO;
		//初始化明细
		int lineNo = 1;
		for (DocAsnDetails docAsnDetails : details) {
			docAsnDetails.setAsnDetailId(PKMapping.GUUID(PKMapping.doc_asn_details));
			docAsnDetails.setAsnNo(asnNo);
			docAsnDetails.setLineNo(lineNo++);
			BigDecimal orderQty = docAsnDetails.getReceiveQty().add(
					docAsnDetails.getDamagedQty().add(docAsnDetails.getRejectedQty())
			);				
			docAsnDetails.setOrderQty(orderQty);
			docAsnDetails.setExpectedQty(orderQty);
			BigDecimal totalPrice = docAsnDetails.getOrderQty().multiply(docAsnDetails.getPrice()).setScale(2, BigDecimal.ROUND_HALF_UP);
			docAsnDetails.setTotalPrice(totalPrice);
			docAsnDetails.setCreatedTime(now);
			docAsnDetails.setSignType(this.initSignType(docAsnDetails));		
			orderPrice = orderPrice.add(totalPrice);
			docAsnDetailsManage.create(docAsnDetails);
			super.skuStockIn(header, docAsnDetails);
		}
		header.setOrderPrice(orderPrice);
		docAsnHeaderManage.create(header);		
		return asnNo;
	}

	@Transactional
	@Override
	public synchronized void changeStatus(String[] asnNos, String status, 
			BusUserDto user, DocAsnHeaderCondition condition) {		
		Date now = new Date();
		for (String asnNo : asnNos) {
			DocAsnHeader header = this.load(asnNo);
			if(header==null){
				throw new DocAsnException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
			}
			String shopId = header.getToShopId();
			if(!user.getShopId().equals(shopId)){
				throw new DocAsnException(SCMErrorEnum.BUS_SHOP_ILLEGAL);
			}
			if(!this.asnStatusValidator(status, header)){
				throw new DocAsnException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
			}
			header.setAsnStatus(status);
			header.setUpdatedName(user.getRealname());
			header.setUpdatedTime(now);
			header.setMemo(condition.getMemo());
			docAsnHeaderManage.update(header);
			
			if(DocAsnStatusEnum.getByName(status)==DocAsnStatusEnum.SI_SHQX){
				DocAsnDetailsCondition condition0 = new DocAsnDetailsCondition();
				condition0.setAsnNo(asnNo);
				List<DocAsnDetails> docAsnDetails = docAsnDetailsManage.list(condition0);
				for (DocAsnDetails docAsnDetails2 : docAsnDetails) {
					super.skuStockOut(header, docAsnDetails2);
				}
			}
			
		}
	}
	
	@Override
	public String getRemark(String id) {
		DocAsnHeader header = docAsnHeaderManage.load(id);
		if(header!=null && header.getMemo()!=null){
			return header.getMemo();
		}
		return "";
	}

	@Override
	public String appendRemark(DocAsnHeaderCondition condition, BusUserDto currUser) {
		String asnNo = condition.getAsnNo();
		DocAsnHeader header = docAsnHeaderManage.load(asnNo);
		//基础验证
		if(header==null){
			throw new DocAsnException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
		}
		String shopId = currUser.getShopId(); 
		if(shopId==null || !shopId.equals(header.getToShopId())){
			throw new DocAsnException(SCMErrorEnum.USER_ILLEGAL);
		}		
		//追击备注
		header.setUpdatedTime(new Date());
		header.setUpdatedName(currUser.getRealname());	
		if(condition.getMemo()==null || condition.getMemo().equals("")){
			throw new DocAsnException(SCMErrorEnum.INVALID_PARAMS);
		}
		header.setMemo(super.formatRemark(condition.getMemo(), header.getMemo(), currUser));
		docAsnHeaderManage.update(header);
		return asnNo;
	}
	
	@Override
	public void signPrint(String id) {
		// TODO Auto-generated method stub		
	}

	
	/************************************        私有方法              ************************************/
	
	/**
	 * 验证入库单单状态是否可用
	 * @param currAsnStatus
	 * @param oldHeader
	 * @return
	 */
	private boolean asnStatusValidator(String currAsnStatus, DocAsnHeader oldHeader){
		boolean isTrue = true;
		String oldStatus = oldHeader.getAsnStatus();
		switch (DocAsnStatusEnum.getByName(currAsnStatus)) {
			case SI_DQS:			
				break;		
			case SI_BFQS:			
				break;	
			case SI_WQSH:			
				break;
			case SI_SHWC:			
				break;					
			case SI_SHQX:						
				if(DocAsnStatusEnum.SI_SHQX.getCode().equals(oldStatus)
					|| DocAsnStatusEnum.SI_SHQX.getCode().equals(oldStatus)
					   || DocAsnStatusEnum.SI_SHWC.getCode().equals(oldStatus)){
					isTrue = false;
				}
				break;
			case SI_JJSH:					
				break;
			default:
				break;
		}
		return isTrue;
	}
	
	
	/**
	 * 初始化入库单头信息
	 * @param asnType
	 * @param currentUser
	 * @return
	 */
	private DocAsnHeader getInitHeader(String asnType, BusUserDto currUser){
		DocAsnHeader header = new DocAsnHeader();
		String asnNo = docAsnHeaderManage.initAsnNo(asnType, currUser.getShopCode());
		header.setAsnNo(asnNo);
		switch (DocAsnTypeEnum.getByName(asnType)) {
			case ALLOT_SI:			
				break;		
			case OVER_SI:	
				header.setAsnType(asnType);
				header.setiId(currUser.getId());
				header.setToShopId(currUser.getShopId());
				header.setToShopName(currUser.getShopName());
				break;
			case PURCHASE_SI:
				header.setAsnType(asnType);
				header.setiId(currUser.getId());
				header.setToShopId(currUser.getShopId());
				header.setToShopName(currUser.getShopName());
				break;
			case BACK_SI:					
				break;
			case SUNDRY_SI:					
				header.setAsnType(asnType);
				header.setiId(currUser.getId());
				header.setToShopId(currUser.getShopId());
				header.setToShopName(currUser.getShopName());
				break;
			default:
				break;
		}
		return header;
	}
	
	/**
	 * 初始化签收类型
	 * @param docAsnDetails
	 * @return
	 */
	private String initSignType(DocAsnDetails docAsnDetails) {
		
		BigDecimal expectedQty = docAsnDetails.getExpectedQty();
		BigDecimal receiveQty = docAsnDetails.getReceiveQty();
		BigDecimal rejectedQty = docAsnDetails.getRejectedQty();
		String signType = DocAsnSignTypeEnum.PART_SIGN.getCode();
		if(expectedQty.compareTo(receiveQty)==0){
			signType = DocAsnSignTypeEnum.ALL_SIGN.getCode();
		}else if(expectedQty.compareTo(rejectedQty)==0){
			signType = DocAsnSignTypeEnum.ALL_RETURN.getCode();
		}
		return signType;
	}

	/**
	 * 签收入库操作
	 * @param docAsnDto
	 * @return
	 */
	private String allotSign(DocAsnDto docAsnDto){
		
		String asnNo = docAsnDto.getAsnNo();
		BusUserDto currUser = docAsnDto.getCurrentUser();
		DocAsnHeader header = docAsnDto.getHeader();
		//入参基本的校验
		String iId = header.getiId();
		if(!currUser.getId().equals(iId)){
			throw new DocAsnException(SCMErrorEnum.USER_ILLEGAL);
		}
		DocAsnHeader oriDocAsnHeader = this.load(asnNo);
		if(oriDocAsnHeader==null){
			throw new DocAsnException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
		}			
		List<DocAsnDetails> details = docAsnDto.getDetails();
		if(details==null || details.size()==0){
			throw new DocAsnException(SCMErrorEnum.BUS_ORDER_DETAIL_NOT_EXIST);
		}	
		//获取收货门店信息
		BusShop currShop = busShopManage.load(currUser.getShopId());
		if(currShop==null){
			throw new DocAsnException(SCMErrorEnum.BUS_SHOP_NOT_EXIST);
		}
		//初始化头信息
		Date now = new Date();
		header.setPrintCount(0);
		header.setiAddress(currShop.getAddress());
		header.setiContact(currShop.getContacts());
		header.setiName(currUser.getRealname());
		header.setiTel(currUser.getTelphone());
		header.setReceivingTime(now);
		header.setUpdatedName(currUser.getRealname());
		header.setUpdatedTime(now);
		header.setCheckStatus(DocAsnCheckStatusEnum.SIGNED.getCode());		
		//默认完全收货
		header.setAsnStatus(DocAsnStatusEnum.SI_BFQS.getCode());
		BigDecimal orderPrice = BigDecimal.ZERO;
		//退货、签收及发货合计值
		BigDecimal rejectedQty = BigDecimal.ZERO;		
		BigDecimal receiveQty = BigDecimal.ZERO;
		BigDecimal expectedQty = BigDecimal.ZERO;
		//初始化明细	
		for (DocAsnDetails docAsnDetails : details) {
			BigDecimal totalPrice = BigDecimal.ZERO;
			docAsnDetails.setUpdatedTime(now);
			//计算退货数量
			rejectedQty = rejectedQty.add(docAsnDetails.getRejectedQty());
			receiveQty = receiveQty.add(docAsnDetails.getReceiveQty());
			expectedQty = expectedQty.add(docAsnDetails.getExpectedQty());	
			//存在入库商品则入库操作
			String signType = docAsnDetails.getSignType();
			if(signType!=null && !DocAsnSignTypeEnum.ALL_RETURN.getCode().equals(signType)){
				totalPrice = (docAsnDetails.getReceiveQty().add(docAsnDetails.getDamagedQty()))
					.multiply(docAsnDetails.getPrice()).setScale(2, BigDecimal.ROUND_HALF_UP);
				docAsnDetails.setTotalPrice(totalPrice);
				//金额合计
				orderPrice = orderPrice.add(totalPrice);	
				//入库存
				super.skuStockIn(header, docAsnDetails);
			}				
			docAsnDetailsManage.update(docAsnDetails);					
		}
		//根据数量判别签收状态
		if(expectedQty.compareTo(receiveQty)==0){
			header.setAsnStatus(DocAsnStatusEnum.SI_WQSH.getCode());
			//更新申请、出库明细对应的收货数量
			this.synRelationOrders(header, details);
		}else {			
			//出现退货的情况下创建退货单
			if(expectedQty.compareTo(rejectedQty)==0){
				header.setAsnStatus(DocAsnStatusEnum.SI_JJSH.getCode());
			}else{
				//更新申请、出库明细对应的收货数量
				this.synRelationOrders(header, details);
			}						
			//判别是否有退货数量，若存在则制作退货单
			if(rejectedQty.compareTo(BigDecimal.ZERO)>0){
				String refundOrderNo = this.transferAllotRefund(oriDocAsnHeader, header, details);
				header.setUserDefine1(refundOrderNo);
			}			
		}		
		header.setOrderPrice(orderPrice);		
		docAsnHeaderManage.update(header);
		return asnNo;
	}
	
	/**
	 * 更新关联单据信息(申请单和出库单)
	 * @param header
	 * @param details
	 */
	private void synRelationOrders(DocAsnHeader header, List<DocAsnDetails> details) {		
		//组装被签收商品的集合
		Date now = new Date();
		HashMap<String, BigDecimal> receiveSkuQtyMap = new HashMap<>();
		for (DocAsnDetails docAsnDetails : details) {
			String signType = docAsnDetails.getSignType();
			if(signType!=null && !DocAsnSignTypeEnum.ALL_RETURN.getCode().equals(signType)){
				BigDecimal receiveSkuQty = docAsnDetails.getReceiveQty().
					add(docAsnDetails.getDamagedQty());
				receiveSkuQtyMap.put(docAsnDetails.getUserDefine1(), receiveSkuQty);
			}			
		}		
		//更新申请单明细
		String poNos = header.getPoNo();
		if(poNos!=null && !poNos.equals("")){
		    for (String poNo : poNos.split(",")) {
		    	DocPoDetailsCondition poDetailsCondition  = new DocPoDetailsCondition();
				poDetailsCondition.setPoNo(poNo);
				List<DocPoDetails> poDetailsList = docPoDetailsManage.list(poDetailsCondition);
				if(poDetailsList==null || poDetailsList.size()==0){
					throw new DocAsnException(SCMErrorEnum.BUS_ORDER_ILLEGAL);
				}
				for (DocPoDetails docPoDetails : poDetailsList) {
					BigDecimal receiveQty = receiveSkuQtyMap.get(docPoDetails.getPoDetailId());
					if(receiveQty!=null && receiveQty.compareTo(BigDecimal.ZERO)>0){
						docPoDetails.setReceiveQty(receiveQty);
						docPoDetails.setUpdatedTime(now);
						docPoDetailsManage.update(docPoDetails);
					}					
				}
			}		
		}else{
			throw new DocAsnException(SCMErrorEnum.BUS_ORDER_ILLEGAL);
		}		
		//更新出库单明细及状态
		String orderNo = header.getOrderNo();
		HashMap<String, Object> orderEntry = docOrderHeaderManage.loadEntity(orderNo);
		if(orderEntry==null){
			throw new DocAsnException(SCMErrorEnum.BUS_ORDER_ILLEGAL);
		}		
		DocOrderHeader orderHeader = new DocOrderHeader();
		orderHeader.setOrderNo(orderNo);
		orderHeader.setOrderStatus(DocOrderStatusEnum.SO_CKWC.getCode());
		orderHeader.setUpdatedTime(now);
		orderHeader.setUpdatedName(header.getUpdatedName());
		docOrderHeaderManage.update(orderHeader);
		List<HashMap<String, Object>> detailsListMap = (List<HashMap<String, Object>>) orderEntry.get("details");
		for (HashMap<String, Object> detailsMap : detailsListMap) {
			String poDetailId = (String) detailsMap.get("userDefine1");
			String soDetailId = (String) detailsMap.get("soDetailId");
			BigDecimal receiveQty = receiveSkuQtyMap.get(poDetailId);
			if(receiveQty!=null && receiveQty.compareTo(BigDecimal.ZERO)>0){
				DocOrderDetails docOrderDetails = new DocOrderDetails();			
				docOrderDetails.setSoDetailId(soDetailId);
				docOrderDetails.setReceiveQty(receiveQty);
				docOrderDetails.setUpdatedTime(now);
				docOrderDetailsManage.update(docOrderDetails);
			}
		}		
	}

	/**
	 * 转换成调退入库单
	 * @param header
	 * @param details
	 * @return
	 */
	private String transferAllotRefund(DocAsnHeader oriDocAsnHeader, DocAsnHeader currHeader, List<DocAsnDetails> details) {
		DocOrderHeader oriOrderHeader = docOrderHeaderManage.load(oriDocAsnHeader.getOrderNo());
		Date now = new Date();
		if(oriOrderHeader!=null){	
			BusShop busShop = busShopManage.load(oriOrderHeader.getFromShopId());	
			if(busShop==null){
				throw new DocAsnException(SCMErrorEnum.BUS_SHOP_NOT_EXIST);
			}
			DocAsnHeader newAsnHeader = new DocAsnHeader();
			BeanUtils.copyProperties(oriDocAsnHeader, newAsnHeader);
			String refundAsnNo = docAsnHeaderManage.initAsnNo(
				DocAsnTypeEnum.ALLOT_REFUND_SI.getCode(), busShop.getShopCode());
			newAsnHeader.setAsnNo(refundAsnNo);
			//当前头信息取值
			newAsnHeader.setUpdatedName(currHeader.getUpdatedName());
			newAsnHeader.setiAddress(currHeader.getiAddress());
			newAsnHeader.setiContact(currHeader.getiContact());
			newAsnHeader.setiName(currHeader.getiName());
			newAsnHeader.setiTel(currHeader.getiTel());
			newAsnHeader.setiId(currHeader.getiId());
			//原头信息取值
			newAsnHeader.setCreatedTime(now);
			newAsnHeader.setCreatedName(currHeader.getUpdatedName());
			newAsnHeader.setUpdatedTime(now);
			newAsnHeader.setAsnStatus(DocAsnStatusEnum.SI_WQSH.getCode());
			newAsnHeader.setAsnType(DocAsnTypeEnum.ALLOT_REFUND_SI.getCode());
			newAsnHeader.setCarrierId("");
			newAsnHeader.setCarrierName("");
			newAsnHeader.setReceivingTime(now);
			newAsnHeader.setAddress(oriOrderHeader.getiAddress()!=null?oriOrderHeader.getiAddress():"");		
			newAsnHeader.setMobile(oriOrderHeader.getiTel()!=null?oriOrderHeader.getiTel():"");
			newAsnHeader.setMemo("");
			newAsnHeader.setPrintCount(0);		
			newAsnHeader.setToShopId(newAsnHeader.getFromShopId());
			newAsnHeader.setToShopName(newAsnHeader.getFromShopName());
			//创建明细
			BigDecimal orderPrice = BigDecimal.ZERO;
			int lineNo = 0;
			for (DocAsnDetails docAsnDetails : details) {
				BigDecimal rejectedQty = docAsnDetails.getRejectedQty();
				if(rejectedQty!=null && rejectedQty.compareTo(BigDecimal.ZERO)>0){
					DocAsnDetails newDocAsnDetails = new DocAsnDetails();
					BeanUtils.copyProperties(docAsnDetails, newDocAsnDetails);
					newDocAsnDetails.setAsnDetailId(PKMapping.GUUID(PKMapping.doc_asn_header));
					newDocAsnDetails.setAsnNo(refundAsnNo);
					newDocAsnDetails.setLineNo(lineNo++);
					newDocAsnDetails.setDamagedQty(BigDecimal.ZERO);
					newDocAsnDetails.setReceiveQty(rejectedQty);
					newDocAsnDetails.setRejectedQty(BigDecimal.ZERO);
					newDocAsnDetails.setCreatedTime(now);
					BigDecimal totalPrice = rejectedQty.multiply(newDocAsnDetails.getPrice())
						.setScale(2, BigDecimal.ROUND_HALF_UP);
					newDocAsnDetails.setTotalPrice(totalPrice);
					orderPrice = orderPrice.add(totalPrice);
					docAsnDetailsManage.create(newDocAsnDetails);
					//入库存
					super.skuStockIn(newAsnHeader, newDocAsnDetails);
				}			
			}		
			newAsnHeader.setOrderPrice(orderPrice);
			docAsnHeaderManage.create(newAsnHeader);
			//出库单记录调退入库单号
			oriOrderHeader.setUserDefine2(newAsnHeader.getAsnNo());
			docOrderHeaderManage.update(oriOrderHeader);
			return refundAsnNo;
		}		
		throw new DocAsnException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
	}

}
