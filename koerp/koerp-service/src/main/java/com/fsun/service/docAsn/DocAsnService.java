package com.fsun.service.docAsn;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.DocAsnApi;
import com.fsun.biz.bus.manage.DocAsnDetailsManage;
import com.fsun.biz.bus.manage.DocAsnHeaderManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocAsnDto;
import com.fsun.domain.entity.DocAsnDetailsCondition;
import com.fsun.domain.entity.DocAsnHeaderCondition;
import com.fsun.domain.enums.DocAsnStatusEnum;
import com.fsun.domain.enums.DocAsnTypeEnum;
import com.fsun.domain.enums.TradeFromEnum;
import com.fsun.domain.model.DocAsnDetails;
import com.fsun.domain.model.DocAsnHeader;
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
	private DocAsnHeaderManage docAsnHeaderManage;
	
	@Autowired
	private DocAsnDetailsManage docAsnDetailsManage;	 
	
	@Override
	public HashMap<String, Object> getInitData(String asnNo, String asnType, BusUserDto currUser) {
		
		HashMap<String, Object> map = new HashMap<>();
		if(StringUtils.isEmpty(asnNo)){			
			DocAsnHeader header = this.getInitHeader(asnType, currUser);
			map.put("header", header);
		}else{
			map = docAsnHeaderManage.loadEntity(asnNo);
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
			BigDecimal totalPrice = docAsnDetails.getOrderQty().multiply(docAsnDetails.getPrice()).setScale(2, BigDecimal.ROUND_HALF_UP);
			docAsnDetails.setTotalPrice(totalPrice);
			docAsnDetails.setCreatedTime(now);
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
	public void changeStatus(String[] asnNos, String status, 
		SysUser user, DocAsnHeaderCondition condition) {		
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
			if(!asnStatusValidator(status, header)){
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
				break;
			default:
				break;
		}
		return header;
	}

}
