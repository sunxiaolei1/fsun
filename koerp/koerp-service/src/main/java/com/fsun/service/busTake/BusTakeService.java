package com.fsun.service.busTake;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.BusTakeApi;
import com.fsun.biz.bus.manage.BusGoodsManage;
import com.fsun.biz.bus.manage.BusOrderManage;
import com.fsun.biz.bus.manage.BusTakeDetailManage;
import com.fsun.biz.bus.manage.BusTakeManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusTakeDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusTakeCondition;
import com.fsun.domain.enums.BusTakeStatusEnum;
import com.fsun.domain.enums.OrderOperateButtonsEnum;
import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusTake;
import com.fsun.domain.model.BusTakeGoods;
import com.fsun.exception.bus.BusTakeException;
import com.fsun.exception.enums.SCMErrorEnum;
import com.fsun.service.common.BaseOrderService;

/**
 * @author fsun
 * @date 2019年4月3日
 */
@Service
public class BusTakeService extends BaseOrderService implements BusTakeApi {
	
	@Autowired
	private BusOrderManage busOrderManage;
	
	@Autowired
	private BusGoodsManage busGoodsManage;
	
	@Autowired
	private BusTakeManage busTakeManage;
	
	@Autowired
	private BusTakeDetailManage busTakeDetailManage;

	@Override
	public PageModel findPage(BusTakeCondition condition) {
		return busTakeManage.findMapPage(condition);
		
	}

	@Override
	public PageModel findListForPage(BusTakeCondition condition) {
		return  busTakeManage.findPage(condition);
	}

	@Override
	public List<BusTake> list(BusTakeCondition condition) {
		return busTakeManage.list(condition);
	}

	@Override
	public List<HashMap<String, Object>> getTakeGoodsByOrderId(String orderId) {
		return busTakeDetailManage.getTakeGoodsByOrderId(orderId);
	}
	
	@Override
	public HashMap<String, Object> loadEntity(String takeId) {
		return busTakeManage.loadEntity(takeId);
	}

	@Override
	public HashMap<String, Object> getInitData(String takeId, String orderId, BusUserDto currUser) {
		HashMap<String, Object> map = new HashMap<>();
		if(StringUtils.isEmpty(takeId)){					
			//订单不存在
			BusOrder busOrder = busOrderManage.load(orderId);
			if(busOrder==null){
				throw new BusTakeException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
			}
			if(!busOrder.getShopId().equals(currUser.getShopId())){
				//throw new BusTakeException(SCMErrorEnum.USER_ILLEGAL);
			}
			//头信息
			BusTake header = new BusTake();
			takeId = busTakeManage.initNumber(orderId, "JT", currUser.getShopCode());
			header.setTakeId(takeId);
			header.setOrderId(orderId);
			header.setSellerId(currUser.getId());
			header.setSellerName(currUser.getRealname());
			header.setShopId(currUser.getShopId());
			header.setShopName(currUser.getShopName());
			header.setBuyerId(busOrder.getBuyerId());
			header.setBuyerName(busOrder.getBuyerName());
			header.setTakeName(busOrder.getBuyerName());
			header.setTakeTime(new Date());
			map.put("header", header);
			//获取订单下的商品库存信息					
			map.put("details", busTakeDetailManage.initTakeDetails(busOrder, takeId, currUser));						
		}else{
			map = busTakeManage.loadEntity(takeId);
		}
		return map;
	}

	@Transactional
	@Override
	public String saveEntity(BusTakeDto busTakeDto) {
		String takeId = busTakeDto.getTakeId();
		BusUserDto currUser = busTakeDto.getCurrUser();
		BusTake header = busTakeDto.getHeader();
		//入参基本的校验
		String sellerId = header.getSellerId();
		if(!currUser.getId().equals(sellerId)){
			throw new BusTakeException(SCMErrorEnum.USER_ILLEGAL);
		}
		if(busTakeManage.load(takeId)!=null){
			throw new BusTakeException(SCMErrorEnum.BUS_ORDER_EXISTED);
		}
		//订单不存在
		BusOrder busOrder = busOrderManage.load(header.getOrderId());
		if(busOrder==null){
			throw new BusTakeException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
		}	
		//状态校验
		if(!orderStatusValidator(null, busOrder, OrderOperateButtonsEnum.TAKE_OUT)){
	    	throw new BusTakeException(SCMErrorEnum.BUS_ORDER_ILLEGAL);
	    }
		//明细不能为空
		List<BusTakeGoods> details = busTakeDto.getDetails();
		if(details==null || details.size()==0){
			throw new BusTakeException(SCMErrorEnum.BUS_ORDER_DETAIL_NOT_EXIST);
		}		
		//初始化头信息
		Date now = new Date();
		header.setPrintCount(0);
		header.setTakeStatus(BusTakeStatusEnum.TAKED.getCode());
		header.setCreatedName(currUser.getRealname());
		header.setUpdatedName(currUser.getRealname());
		header.setCreatedTime(now);
		header.setUpdatedTime(now);
		busTakeManage.create(header);
		
		//获取订单下的商品库存信息校验寄提单商品的有效性		
		List<BusGoods> busGoodsList = busGoodsManage.listByHeaderId(header.getOrderId());
		//初始化明细
		int lineNo = 1;
		boolean hasExist;
		BigDecimal takeOutQty = BigDecimal.ZERO;
		for (BusTakeGoods busTakeGoods : details) {		
			BigDecimal qty = busTakeGoods.getQty();
			hasExist = false;
			for (BusGoods busGoods : busGoodsList) {
				if(busGoods.getGoodsId().equals(busTakeGoods.getOriGoodsId())){
					BigDecimal diffQty = busGoods.getUntakeQty().subtract(qty);
					if(diffQty.compareTo(BigDecimal.ZERO)<0){
						throw new BusTakeException(SCMErrorEnum.BUS_SKU_INV_ILLEGAL);
					}
					busGoods.setUntakeQty(diffQty);
					busGoods.setUpdatedTime(now);
					busGoodsManage.update(busGoods);
					hasExist = true;
				}
			}
			if(!hasExist){
				throw new BusTakeException(SCMErrorEnum.BUS_SKU_INV_ILLEGAL);
			}
			//存在提货数量
			if(qty.compareTo(BigDecimal.ZERO)>0){
				busTakeGoods.setGoodsId(PKMapping.GUUID(PKMapping.bus_take_goods));
				busTakeGoods.setLineNo(lineNo++);
				busTakeGoods.setCreatedTime(now);				
				busTakeDetailManage.create(busTakeGoods);
				this.skuStockOut(header, busTakeGoods);
			}
			takeOutQty = takeOutQty.add(qty);			
		}		
		//寄提出库总数量==0
		if(takeOutQty.compareTo(BigDecimal.ZERO)==0){
			throw new BusTakeException(SCMErrorEnum.BUS_SKU_INV_ILLEGAL);
		}		
		//同步当前寄存单对应的寄提状态
		busOrderManage.synOrderTakeStatus(busGoodsList, busOrder, currUser.getRealname());
		
		return takeId;
	}

	@Transactional
	@Override
	public void changeStatus(String[] takeIds, String status, BusUserDto user, BusTakeCondition condition){		
		Date now = new Date();
		for (String takeId : takeIds) {
			BusTake header = busTakeManage.load(takeId);
			if(header==null){
				throw new BusTakeException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
			}
			String shopId = header.getShopId();
			if(!user.getShopId().equals(shopId)){
				throw new BusTakeException(SCMErrorEnum.BUS_SHOP_ILLEGAL);
			}
			if(!this.takeStatusValidator(status, header)){
				throw new BusTakeException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
			}
			
			//更新明细
			if(BusTakeStatusEnum.getByCode(status)==BusTakeStatusEnum.CANCEL){
				//单据状态校验
				BusOrder busOrder = busOrderManage.load(header.getOrderId());
				if(!orderStatusValidator(header, busOrder, OrderOperateButtonsEnum.CANCEL_TAKE)){
			    	throw new BusTakeException(SCMErrorEnum.BUS_ORDER_ILLEGAL);
			    }
				//更新头信息
				header.setTakeStatus(status);
				header.setUpdatedName(user.getRealname());
				header.setUpdatedTime(now);
				header.setMemo(condition.getMemo());
				
				List<BusTakeGoods> busTakeGoodsList = busTakeDetailManage.listByHeaderId(takeId);
				List<BusGoods> busGoodsList = busGoodsManage.listByHeaderId(header.getOrderId());
				for (BusTakeGoods busTakeGoods : busTakeGoodsList) {
					//回退库存
					this.skuStockIn(header, busTakeGoods);
					//回退寄存单商品可用寄提库存
					for (BusGoods busGoods : busGoodsList) {
						if(busGoods.getGoodsId().equals(busTakeGoods.getOriGoodsId())){
							busGoods.setUntakeQty(busGoods.getUntakeQty().add(busTakeGoods.getQty()));
							busGoods.setUpdatedTime(now);
							busGoodsManage.update(busGoods);
						}
					}
					//更新商品状态
					busTakeGoods.setEnabled(false);
					busTakeDetailManage.update(busTakeGoods);
				}
				//同步当前寄存单对应的寄提状态
				busOrderManage.synOrderTakeStatus(busGoodsList, busOrder, user.getRealname());
			}else{
				//更新头信息
				header.setTakeStatus(status);
				header.setUpdatedName(user.getRealname());
				header.setUpdatedTime(now);
				header.setMemo(condition.getMemo());
			}
			
			busTakeManage.update(header);
		}
	}
	
	@Override
	public void signPrint(String takeId) {
		BusTake header = busTakeManage.load(takeId);	
		if(header==null){
			throw new BusTakeException(SCMErrorEnum.BUS_ORDER_NOT_EXIST);
		}	
		String takeStatus = header.getTakeStatus();
		if(BusTakeStatusEnum.CANCEL.getCode().equals(takeStatus) 
			|| BusTakeStatusEnum.COMPLETE.getCode().equals(takeStatus)){
			throw new BusTakeException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
		}
		//累加打印次数
		int printCount = (header.getPrintCount()!=null?header.getPrintCount():0);
		header.setPrintCount(++printCount);
		busTakeManage.update(header);
	}
	
	@Override
	public String getRemark(String takeId) {
		BusTake busTake = busTakeManage.load(takeId);
		if(busTake!=null && busTake.getMemo()!=null){
			return busTake.getMemo();
		}
		return "";
	}
	
	@Override
	public String appendRemark(BusTakeCondition condition, BusUserDto currUser) {
		String takeId = condition.getTakeId();
		BusTake busTake = busTakeManage.load(takeId);
		//基础验证
		if(busTake==null){
			throw new BusTakeException(SCMErrorEnum.BUS_REFUND_NOT_EXIST);
		}
		String shopId = currUser.getShopId(); 
		if(shopId==null || !shopId.equals(busTake.getShopId())){
			throw new BusTakeException(SCMErrorEnum.USER_ILLEGAL);
		}		
		BusOrder busOrder = busOrderManage.load(busTake.getOrderId());
		//订单状态验证
		this.orderStatusValidator(busTake, busOrder, OrderOperateButtonsEnum.ADD_TAKE_REMARK);
		//追击备注
		busTake.setUpdatedTime(new Date());
		busTake.setUpdatedName(currUser.getRealname());	
		if(condition.getMemo()==null || condition.getMemo().equals("")){
			throw new BusTakeException(SCMErrorEnum.INVALID_PARAMS);
		}
		busTake.setMemo(super.formatRemark(condition.getMemo(), busTake.getMemo(), currUser));
		busTakeManage.update(busTake);
		return takeId;
	}
	
	
	/************************************        私有方法              ************************************/

	/**
	 * 验证寄提单状态是否可用
	 * @param currTakeStatus
	 * @param oldHeader
	 * @return
	 */
	private boolean takeStatusValidator(String currTakeStatus, BusTake oldHeader){
		boolean isTrue = true;
		String oldStatus = oldHeader.getTakeStatus();
		switch (BusTakeStatusEnum.getByCode(currTakeStatus)) {
			case TAKED:	
				break;		
			case CANCEL:
				if(BusTakeStatusEnum.CANCEL.getCode().equals(oldStatus)
					|| BusTakeStatusEnum.COMPLETE.getCode().equals(oldStatus)){
					isTrue = false;
				}				
				break;	
			case COMPLETE:
				if(BusTakeStatusEnum.CANCEL.getCode().equals(oldStatus)
					|| BusTakeStatusEnum.COMPLETE.getCode().equals(oldStatus)){
					isTrue = false;
				}			
				break;
			default:
				break;
		}
		return isTrue;
	}

}
