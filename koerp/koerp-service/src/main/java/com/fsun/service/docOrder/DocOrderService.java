package com.fsun.service.docOrder;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.DocOrderApi;
import com.fsun.biz.bus.manage.BusShopManage;
import com.fsun.biz.bus.manage.DocAsnDetailsManage;
import com.fsun.biz.bus.manage.DocAsnHeaderManage;
import com.fsun.biz.bus.manage.DocOrderDetailsManage;
import com.fsun.biz.bus.manage.DocOrderHeaderManage;
import com.fsun.biz.bus.manage.DocPoDetailsManage;
import com.fsun.biz.bus.manage.DocPoHeaderManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.dto.DocOrderDto;
import com.fsun.domain.entity.DocAsnDetailsCondition;
import com.fsun.domain.entity.DocOrderDetailsCondition;
import com.fsun.domain.entity.DocOrderHeaderCondition;
import com.fsun.domain.entity.DocOrderInitCondition;
import com.fsun.domain.entity.DocPoDetailsCondition;
import com.fsun.domain.enums.DocAsnStatusEnum;
import com.fsun.domain.enums.DocOrderModeEnum;
import com.fsun.domain.enums.DocOrderStatusEnum;
import com.fsun.domain.enums.DocOrderTypeEnum;
import com.fsun.domain.enums.TradeFromEnum;
import com.fsun.domain.model.BusShop;
import com.fsun.domain.model.DocAsnDetails;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.DocOrderDetails;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.domain.model.DocPoDetails;
import com.fsun.domain.model.DocPoHeader;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.DocOrderException;
import com.fsun.exception.bus.OrderException;
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

	@Autowired
	private DocPoDetailsManage docPoDetailsManage;

	@Autowired
	private DocPoHeaderManage docPoHeaderManage;

	@Autowired
	private DocAsnHeaderManage docAsnHeaderManage;

	@Autowired
	private DocAsnDetailsManage docAsnDetailsManage;

	@Autowired
	private BusShopManage busShopManage;


	@Override
	public HashMap<String, Object> getInitData(DocOrderInitCondition condition, BusUserDto currUser) {
		HashMap<String, Object> map = new HashMap<>();
		String orderNo = condition.getOrderNo();
		if(StringUtils.isEmpty(orderNo)){
			String orderType = condition.getOrderType();
			DocOrderHeader header = this.getInitHeader(condition, currUser);
			if(DocOrderTypeEnum.ALLOT_SO.getCode().equals(orderType)){
				List<DocOrderDetails> details = this.getInitDetails(condition, header);
				map.put("details", details);
			}
			//如果选择的是一个申请单据则需要同步收货信息
			String poNo = header.getPoNo();
			if(poNo!=null && !poNo.contains(",")){
				DocPoHeader docPoHeader = docPoHeaderManage.load(poNo);
				if(docPoHeader!=null){
					header.setReceiveAddress(docPoHeader.getiAddress());
					header.setContacts(docPoHeader.getiContact());
					header.setMobile(docPoHeader.getiTel());
				}
			}
			map.put("header", header);
		}else{
			map = docOrderHeaderManage.loadEntity(orderNo);
		}
		return map;
	}

	@Override
	public DocOrderDto getPurchaseSoInitData(DocOrderInitCondition condition,
		BusUserDto currUser) {

		DocOrderDto docOrderDto = new DocOrderDto();
		//初始化头信息
		DocOrderHeader header = new DocOrderHeader();
		String asnNo = condition.getAsnNo();
		DocAsnHeader docAsnHeader = docAsnHeaderManage.load(asnNo);
		if(!docAsnHeader.getToShopId().equals(currUser.getShopId())){
			throw new DocOrderException(SCMErrorEnum.USER_ILLEGAL);
		}
		String orderNo = docOrderHeaderManage.initOrderNo(DocOrderTypeEnum.PURCHASE_SO.getCode(),
				currUser.getShopCode());
		header.setOrderNo(orderNo);
		header.setOrderType(DocOrderTypeEnum.PURCHASE_SO.getCode());
		header.setDeliveryTime(new Date());
		header.setiId(currUser.getId());
		header.setSupplierId(docAsnHeader.getSupplierId());
		header.setSupplierName(docAsnHeader.getSupplierName());
		header.setSupplierAddress(docAsnHeader.getSupplierAddress());
		header.setSupplierContact(docAsnHeader.getSupplierContact());
		header.setSupplierTel(docAsnHeader.getSupplierTel());
		header.setAddress(docAsnHeader.getSupplierAddress());
		header.setContacts(docAsnHeader.getSupplierContact());
		header.setMobile(docAsnHeader.getSupplierTel());
		header.setFromShopId(docAsnHeader.getToShopId());
		header.setFromShopName(docAsnHeader.getToShopName());
		header.setUserDefine1(docAsnHeader.getAsnNo());
		header.setPoNo(docAsnHeader.getPoNo());
		docOrderDto.setHeader(header);
		//初始化明细信息
		List<DocOrderDetails> details = new ArrayList<>();
		DocAsnDetailsCondition condition0 = new DocAsnDetailsCondition();
		condition0.setAsnNo(asnNo);
		List<DocAsnDetails> list = docAsnDetailsManage.list(condition0);
		String asnDetailIds = condition.getAsnDetailIds();
		for (DocAsnDetails docAsnDetails : list) {
			if(asnDetailIds.contains(docAsnDetails.getAsnDetailId())){
				DocOrderDetails docOrderDetails = new DocOrderDetails();
				BeanUtils.copyProperties(docAsnDetails, docOrderDetails);
				docOrderDetails.setUserDefine2(docAsnDetails.getAsnDetailId());
				docOrderDetails.setUpdatedTime(null);
				docOrderDetails.setOrderNo(orderNo);
				docOrderDetails.setOrderedQty(docAsnDetails.getReceiveQty());
				docOrderDetails.setShippedQty(docAsnDetails.getReceiveQty());
				docOrderDetails.setReceiveQty(BigDecimal.ZERO);
				docOrderDetails.setPickedQty(BigDecimal.ZERO);
				docOrderDetails.setSubQty(BigDecimal.ZERO);
				details.add(docOrderDetails);
			}
		}
		docOrderDto.setDetails(details);
		return docOrderDto;
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
	public synchronized void changeStatus(String[] orderNos, String status, BusUserDto user,
		DocOrderHeaderCondition condition) {
		Date now = new Date();
		for (String orderNo : orderNos) {
			DocOrderHeader header = this.load(orderNo);
			if(header==null){
				throw new DocOrderException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
			}
			String shopId = header.getFromShopId();
			if(!user.getShopId().equals(shopId)){
				throw new DocOrderException(SCMErrorEnum.BUS_SHOP_ILLEGAL);
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

				//如果是采购退货单则需要更新采购入库单关联的对应退货单号
				if(DocOrderTypeEnum.PURCHASE_SO.getCode().equals(header.getOrderType())){
					DocAsnHeader docAsnHeader = docAsnHeaderManage.load(header.getUserDefine1());
					if(docAsnHeader==null){
						throw new DocOrderException(SCMErrorEnum.BUS_RELATION_ORDER_NOT_EXIST);
					}
					docAsnHeader.setOrderNo("");
					docAsnHeader.setUpdatedTime(now);
					docAsnHeader.setUpdatedName(user.getRealname());
					docAsnHeaderManage.update(docAsnHeader);
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
		//如果是创建调拨出库单
		if(DocOrderTypeEnum.ALLOT_SO.getCode().equals(header.getOrderType())){
			return this.allotCargo(docOrderDto);
		}
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
		header.setPrintCount(0);
		header.setOrderTime(now);
		header.setiAddress(currUser.getShopName());
		header.setiContact(currUser.getRealname());
		header.setiTel(currUser.getTelphone());
		header.setiShopId(currUser.getShopId());
		header.setiName(currUser.getRealname());
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
			docOrderDetails.setOrderedQty(docOrderDetails.getShippedQty());
			BigDecimal totalPrice = docOrderDetails.getShippedQty().multiply(docOrderDetails.getPrice()).setScale(2, BigDecimal.ROUND_HALF_UP);
			docOrderDetails.setTotalPrice(totalPrice);
			docOrderDetails.setCreatedTime(now);
			orderPrice = orderPrice.add(totalPrice);
			docOrderDetailsManage.create(docOrderDetails);
			super.skuStockOut(header, docOrderDetails);
		}
		header.setOrderPrice(orderPrice);

		//如果是采购退货单则需要更新采购入库单关联的对应退货单号
		if(DocOrderTypeEnum.PURCHASE_SO.getCode().equals(header.getOrderType())){
			DocAsnHeader docAsnHeader = docAsnHeaderManage.load(header.getUserDefine1());
			if(docAsnHeader==null){
				throw new DocOrderException(SCMErrorEnum.BUS_RELATION_ORDER_NOT_EXIST);
			}
			docAsnHeader.setOrderNo(orderNo);
			docAsnHeader.setUpdatedTime(now);
			docAsnHeader.setUpdatedName(currUser.getRealname());
			docAsnHeaderManage.update(docAsnHeader);
		}

		docOrderHeaderManage.create(header);
		return orderNo;
	}

	@Override
	public HashMap<String, Object> loadEntity(String orderNo) {
		return docOrderHeaderManage.loadEntity(orderNo);
	}

	@Override
	public void signPrint(String orderNo) {
		DocOrderHeader header = docOrderHeaderManage.load(orderNo);
		if(header==null){
			throw new OrderException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
		}
		String orderStatus = header.getOrderStatus();
		if(DocOrderStatusEnum.SO_CKWC.getCode().equals(orderStatus)
			|| DocOrderStatusEnum.SO_CKQX.getCode().equals(orderStatus)){
			throw new DocOrderException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
		}
		//累加打印次数
		int printCount = (header.getPrintCount()!=null?header.getPrintCount():0);
		header.setPrintCount(++printCount);
		docOrderHeaderManage.update(header);
	}

	@Override
	public String getRemark(String id) {
		DocOrderHeader header = docOrderHeaderManage.load(id);
		if(header!=null && header.getMemo()!=null){
			return header.getMemo();
		}
		return "";
	}

	@Override
	public String appendRemark(DocOrderHeaderCondition condition, BusUserDto currUser) {
		String orderNo = condition.getOrderNo();
		DocOrderHeader header = docOrderHeaderManage.load(orderNo);
		//基础验证
		if(header==null){
			throw new DocOrderException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
		}
		String shopId = currUser.getShopId();
		if(shopId==null || !shopId.equals(header.getFromShopId())){
			throw new DocOrderException(SCMErrorEnum.USER_ILLEGAL);
		}
		//追击备注
		header.setUpdatedTime(new Date());
		header.setUpdatedName(currUser.getRealname());
		if(condition.getMemo()==null || condition.getMemo().equals("")){
			throw new DocOrderException(SCMErrorEnum.INVALID_PARAMS);
		}
		header.setMemo(super.formatRemark(condition.getMemo(), header.getMemo(), currUser));
		docOrderHeaderManage.update(header);
		return orderNo;
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
		String orderType = oldHeader.getOrderType();
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
				}else if(DocOrderStatusEnum.SO_DDCK.getCode().equals(oldStatus)){
					String asnNo = oldHeader.getUserDefine1();
					DocAsnHeader docAsnHeader = docAsnHeaderManage.load(asnNo);
					//没有关联入库单的或者调拨入库单为待签收状态才能取消
					if(docAsnHeader==null || !DocAsnStatusEnum.SI_DQS.getCode().equals(docAsnHeader.getAsnStatus())){
						if(DocOrderTypeEnum.ALLOT_SO.getCode().equals(orderType)){
							isTrue = false;
						}else if(DocOrderTypeEnum.PURCHASE_SO.getCode().equals(orderType)){
							//采购入库单为完全收货或者部分收货状态才能取消
							if(!DocAsnStatusEnum.SI_BFQS.getCode().equals(docAsnHeader.getAsnStatus())
								&& !DocAsnStatusEnum.SI_WQSH.getCode().equals(docAsnHeader.getAsnStatus())){
								isTrue = false;
							}
						}
					}
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
	private DocOrderHeader getInitHeader(DocOrderInitCondition condition, BusUserDto currUser){
		DocOrderHeader header = new DocOrderHeader();
		String orderType = condition.getOrderType();
		String orderNo = docOrderHeaderManage.initOrderNo(orderType, currUser.getShopCode());
		header.setOrderNo(orderNo);
		switch (DocOrderTypeEnum.getByName(orderType)) {
			case ALLOT_SO:
				header.setOrderType(orderType);
				header.setiId(currUser.getId());
				header.setiName(currUser.getRealname());
				header.setFromShopId(currUser.getShopId());
				header.setFromShopName(currUser.getShopName());
				Date now = new Date();
				header.setDeliveryTime(now);
				header.setExpectedTime(DateUtil.getDayAfter(now, 3));
				//初始话入库店仓信息
				BusShop busShop = busShopManage.load(condition.getToShopId());
				if(busShop!=null){
					header.setToShopId(busShop.getShopId());
					header.setToShopName(busShop.getShopName());
					header.setReceiveAddress(busShop.getAddress());
					header.setContacts(busShop.getContacts());
					header.setMobile(busShop.getTel());
				}
				break;
			case SHORTAGE_SO:
				header.setOrderType(orderType);
				header.setiId(currUser.getId());
				header.setFromShopId(currUser.getShopId());
				header.setFromShopName(currUser.getShopName());
				header.setDeliveryTime(new Date());
				break;
			case PURCHASE_SO:
				break;
			case LOSE_SO:
				header.setOrderType(orderType);
				header.setiId(currUser.getId());
				header.setFromShopId(currUser.getShopId());
				header.setFromShopName(currUser.getShopName());
				header.setDeliveryTime(new Date());
				break;
			case USE_SO:
				header.setOrderType(orderType);
				header.setFromShopId(currUser.getShopId());
				header.setFromShopName(currUser.getShopName());
				header.setOrderMode(DocOrderModeEnum.YP.getCode());
				header.setDeliveryTime(new Date());
				break;
			default:
				break;
		}
		return header;
	}

	/**
	 * 初始化出库单明细信息
	 * @param condition
	 * @return
	 */
	private List<DocOrderDetails> getInitDetails(DocOrderInitCondition condition, DocOrderHeader header) {

		List<DocOrderDetails> details = new ArrayList<>();
		String orderNo = header.getOrderNo();
		String orderType = condition.getOrderType();
		HashSet<String> poNoSet = new HashSet<>();
		//初始化调拨明细
		if(DocOrderTypeEnum.ALLOT_SO.getCode().equals(orderType)){
			DocPoDetailsCondition condition0 = new DocPoDetailsCondition();
			condition0.setInPoDetailIds(condition.getInPoDetailIds());
			List<DocPoDetails> list = docPoDetailsManage.list(condition0);
			for (DocPoDetails docPoDetails : list) {
				DocOrderDetails detail = new DocOrderDetails();
				BeanUtils.copyProperties(docPoDetails, detail);
				//(用于记录原申请单对应的商品明细主键)
				detail.setUserDefine1(docPoDetails.getPoDetailId());
				detail.setOrderNo(orderNo);
				detail.setPickedQty(BigDecimal.ZERO);
				detail.setShippedQty(docPoDetails.getOrderedQty());
				poNoSet.add(docPoDetails.getPoNo());
				details.add(detail);
			}
			header.setPoNo(StringUtils.collectionToCommaDelimitedString(poNoSet));
		}
		return details;
	}


	/**
	 * 调拨审核出库
	 * @param docOrderDto
	 * @return
	 */
	private String allotCargo(DocOrderDto docOrderDto) {
		String orderNo = docOrderDto.getOrderNo();
		BusUserDto currUser = docOrderDto.getCurrentUser();
		DocOrderHeader header = docOrderDto.getHeader();
		//入参基本的校验
		String iId = header.getiId();
		if(!currUser.getId().equals(iId)){
			throw new DocOrderException(SCMErrorEnum.USER_ILLEGAL);
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
		header.setPrintCount(0);
		header.setDeliveryTime(now);
		header.setOrderTime(now);
		header.setiShopId(currUser.getShopId());
		header.setiName(currUser.getRealname());
		header.setiAddress(currUser.getShopName());
		header.setiContact(currUser.getRealname());
		header.setiTel(currUser.getTelphone());
		header.setCreatedName(currUser.getRealname());
		header.setCreatedTime(now);
		header.setUpdatedName(currUser.getRealname());
		header.setUpdatedTime(now);
		header.setOrderStatus(DocOrderStatusEnum.SO_DDCK.getCode());
		header.setOrderSource(TradeFromEnum.PC.getCode());
		BigDecimal orderPrice = BigDecimal.ZERO;
		//初始化明细
		int lineNo = 1;
		for (DocOrderDetails docOrderDetails : details) {
			docOrderDetails.setSoDetailId(PKMapping.GUUID(PKMapping.doc_order_details));
			docOrderDetails.setLineNo(lineNo++);
			BigDecimal totalPrice = docOrderDetails.getShippedQty().
				multiply(docOrderDetails.getPrice()).setScale(2, BigDecimal.ROUND_HALF_UP);
			docOrderDetails.setTotalPrice(totalPrice);
			docOrderDetails.setCreatedTime(now);
			orderPrice = orderPrice.add(totalPrice);
			docOrderDetailsManage.create(docOrderDetails);
			super.skuStockOut(header, docOrderDetails);
		}
		header.setOrderPrice(orderPrice);
		//生成调拨入库白单
		String asnNo = docAsnHeaderManage.transferAllotStorage(header, details);
		//更新调拨申请状态及明细
		docPoHeaderManage.auditAllotApply(header, details);
		//创建出库单
		header.setUserDefine1(asnNo);
		docOrderHeaderManage.create(header);
		return orderNo;
	}

}
