package com.fsun.service.docPo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.DocPoApi;
import com.fsun.biz.bus.manage.BusShopManage;
import com.fsun.biz.bus.manage.DocPoDetailsManage;
import com.fsun.biz.bus.manage.DocPoHeaderManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocPoDto;
import com.fsun.domain.entity.DocPoDetailsCondition;
import com.fsun.domain.entity.DocPoHeaderCondition;
import com.fsun.domain.enums.DocPoStatusEnum;
import com.fsun.domain.enums.DocPoTypeEnum;
import com.fsun.domain.enums.TradeFromEnum;
import com.fsun.domain.model.BusShop;
import com.fsun.domain.model.DocPoDetails;
import com.fsun.domain.model.DocPoHeader;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.DocPoException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.service.common.BaseOrderService;

/**
 * @author fsun
 * @date 2019年3月16日
 */
@Service
public class DocPoService extends BaseOrderService implements DocPoApi {
	
	@Autowired
	private DocPoHeaderManage docPoHeaderManage; 
	
	@Autowired
	private DocPoDetailsManage docPoDetailsManage;
	
	@Autowired
	private BusShopManage busShopManage;

	@Override
	public HashMap<String, Object> getInitData(String poNo, String poType, BusUserDto currUser) {
		HashMap<String, Object> map = new HashMap<>();
		if(StringUtils.isEmpty(poNo)){			
			DocPoHeader header = this.getInitHeader(poType, currUser);
			map.put("header", header);
		}else{
			map = docPoHeaderManage.loadEntity(poNo);
		}
		return map;
	}
	
	@Override
	public DocPoHeader load(String id) {
		return docPoHeaderManage.load(id);
	}

	@Override
	public List<DocPoHeader> list(DocPoHeaderCondition condition) {
		return docPoHeaderManage.list(condition);
	}
	
	@Override
	public List<DocPoDetails> details(String poNo) {
		DocPoDetailsCondition condition = new DocPoDetailsCondition();
		condition.setPoNo(poNo);
		return docPoDetailsManage.list(condition);
	}

	@Override
	public PageModel findPage(DocPoHeaderCondition condition) {
		return docPoHeaderManage.findMapPage(condition);
	}

	@Override
	public String save(DocPoHeader domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PageModel findListForPage(DocPoHeaderCondition condition) {
		return docPoHeaderManage.findPage(condition);
	}

	@Transactional
	@Override
	public void changeStatus(String[] poNos, String status, SysUser user, DocPoHeaderCondition condition) {
		Date now = new Date();
		for (String poNo : poNos) {
			DocPoHeader header = this.load(poNo);
			if(header==null){
				throw new DocPoException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
			}			
			//根据审核状态判别对应的审核门店
			String toShopId = header.getToShopId();
			String fromShopId = header.getFromShopId();
			if(status.equals(DocPoStatusEnum.AUDIT_PASS.getCode()) 
				|| status.equals(DocPoStatusEnum.AUDIT_REJECT.getCode()) ){
				if(!user.getShopId().equals(fromShopId)){
					throw new DocPoException(SCMErrorEnum.BUS_SHOP_ILLEGAL);
				}
			}else if(status.equals(DocPoStatusEnum.CANCEL.getCode())){
				if(!user.getShopId().equals(toShopId)){
					throw new DocPoException(SCMErrorEnum.BUS_SHOP_ILLEGAL);
				}
			}
			//判别状态是否可用
			if(!orderStatusValidator(status, header)){
				throw new DocPoException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
			}
			header.setPoStatus(status);
			header.setUpdatedName(user.getRealname());
			header.setUpdatedTime(now);
			String memo = condition.getMemo();
			if(memo!=null && !memo.equals("")){
				header.setMemo(memo);
			}			
			docPoHeaderManage.update(header);					
		}
	}

	@Override
	public HashMap<String, Object> loadEntity(String poNo) {
		return docPoHeaderManage.loadEntity(poNo);
	}

	@Transactional
	@Override
	public String saveEntity(DocPoDto docPoDto) {
		String poNo = docPoDto.getPoNo();
		BusUserDto currUser = docPoDto.getCurrentUser();
		DocPoHeader header = docPoDto.getHeader();		
		//入参基本的校验
		String iId = header.getiId();	
		if(!currUser.getId().equals(iId)){
			throw new DocPoException(SCMErrorEnum.USER_ILLEGAL);
		}		
		if(this.load(poNo)!=null){
			throw new DocPoException(SCMErrorEnum.BUS_ORDER_EXISTED);
		}			
		List<DocPoDetails> details = docPoDto.getDetails();
		if(details==null || details.size()==0){
			throw new DocPoException(SCMErrorEnum.BUS_ORDER_DETAIL_NOT_EXIST);
		}		
		//初始化头信息
		Date now = new Date();
		header.setPrintCount(0);
		header.setCreatedName(currUser.getRealname());
		header.setCreatedTime(now);
		header.setPoStatus(DocPoStatusEnum.CREATE.getCode());
		header.setPoSource(TradeFromEnum.PC.getCode());
		BigDecimal orderPrice = BigDecimal.ZERO;
		//初始化明细
		int lineNo = 1;
		for (DocPoDetails docPoDetails : details) {
			docPoDetails.setPoDetailId(PKMapping.GUUID(PKMapping.doc_po_details));
			docPoDetails.setPoNo(poNo);
			docPoDetails.setLineNo(lineNo++);
			docPoDetails.setExpectedQty(BigDecimal.ZERO);
			docPoDetails.setReceiveQty(BigDecimal.ZERO);
			BigDecimal totalPrice = docPoDetails.getOrderedQty().multiply(docPoDetails.getPrice()).setScale(2, BigDecimal.ROUND_HALF_UP);
			docPoDetails.setTotalPrice(totalPrice);
			docPoDetails.setCreatedTime(now);
			orderPrice = orderPrice.add(totalPrice);
			docPoDetailsManage.create(docPoDetails);
		}
		header.setOrderPrice(orderPrice);
		docPoHeaderManage.create(header);		
		return poNo;
	}

	@Transactional
	@Override
	public String updateEntity(DocPoDto docPoDto) {
		String poNo = docPoDto.getPoNo();
		BusUserDto currUser = docPoDto.getCurrentUser();
		DocPoHeader header = docPoDto.getHeader();		
		//入参基本的校验
		String iId = header.getiId();	
		if(!currUser.getId().equals(iId)){
			throw new DocPoException(SCMErrorEnum.USER_ILLEGAL);
		}	
		DocPoHeader oldHeader = this.load(poNo);
		if(oldHeader==null){
			throw new DocPoException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
		}	
		String currPoStatus = DocPoStatusEnum.CREATE.getCode();
		if(!this.orderStatusValidator(currPoStatus, oldHeader)){
			throw new DocPoException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
		}
		
		List<DocPoDetails> details = docPoDto.getDetails();
		if(details==null || details.size()==0){
			throw new DocPoException(SCMErrorEnum.BUS_ORDER_DETAIL_NOT_EXIST);
		}		
		//初始化头信息
		Date now = new Date();		
		header.setUpdatedName(currUser.getRealname());
		header.setUpdatedTime(now);
		header.setPoStatus(currPoStatus);		
		BigDecimal orderPrice = BigDecimal.ZERO;
		
		//初始化明细
		//删除原明细
		docPoDetailsManage.deleteByPoNo(poNo);
		//新增明细		
		int lineNo = 1;
		for (DocPoDetails docPoDetails : details) {
			docPoDetails.setPoDetailId(PKMapping.GUUID(PKMapping.doc_po_details));
			docPoDetails.setPoNo(poNo);
			docPoDetails.setLineNo(lineNo++);
			docPoDetails.setExpectedQty(BigDecimal.ZERO);
			docPoDetails.setReceiveQty(BigDecimal.ZERO);
			BigDecimal totalPrice = docPoDetails.getOrderedQty().multiply(docPoDetails.getPrice()).setScale(2, BigDecimal.ROUND_HALF_UP);
			docPoDetails.setTotalPrice(totalPrice);
			docPoDetails.setCreatedTime(now);
			orderPrice = orderPrice.add(totalPrice);
			docPoDetailsManage.create(docPoDetails);
		}
		header.setOrderPrice(orderPrice);
		docPoHeaderManage.update(header);		
		return poNo;
	}
	
	/****************************    私有方法          ******************************/
	
	/**
	 * 验证申请单状态是否可用
	 * @param currAsnStatus
	 * @param oldHeader
	 * @return
	 */
	private boolean orderStatusValidator(String currOrderStatus, DocPoHeader oldHeader){
		boolean isTrue = true;
		String oldStatus = oldHeader.getPoStatus();
		switch (DocPoStatusEnum.getByName(currOrderStatus)) {
			case CREATE:	
				if(DocPoStatusEnum.AUDIT_PASS.getCode().equals(oldStatus)
					|| DocPoStatusEnum.CANCEL.getCode().equals(oldStatus)){
					isTrue = false;
				}
				break;		
			case AUDIT_PASS:			
				break;	
			case AUDIT_REJECT:			
				break;				
			case CANCEL:						
				if(DocPoStatusEnum.AUDIT_PASS.getCode().equals(oldStatus)
					|| DocPoStatusEnum.CANCEL.getCode().equals(oldStatus)){
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
	private DocPoHeader getInitHeader(String poType, BusUserDto currUser){
		DocPoHeader header = new DocPoHeader();
		String poNo = docPoHeaderManage.initPoNo(poType, currUser.getShopCode());
		header.setPoNo(poNo);
		switch (DocPoTypeEnum.getByName(poType)) {
			case PURCHASE_APPLY:			
				break;		
			case ALLOT_APPLY:	
				header.setPoType(poType);
				header.setToShopId(currUser.getShopId());
				header.setToShopName(currUser.getShopName());
				//初始化下单人门店信息
				BusShop busShop = busShopManage.load(currUser.getShopId());
				header.setiShopId(busShop.getShopId());
				header.setiId(currUser.getId());
				header.setiName(currUser.getRealname());
				header.setiContact(busShop.getContacts());
				header.setiTel(busShop.getTel());
				header.setiAddress(busShop.getAddress());						
				break;
			default:
				break;
		}
		return header;
	}

}
