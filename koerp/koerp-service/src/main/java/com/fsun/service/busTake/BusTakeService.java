package com.fsun.service.busTake;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.BusTakeApi;
import com.fsun.biz.bus.manage.BusOrderManage;
import com.fsun.biz.bus.manage.BusTakeDetailManage;
import com.fsun.biz.bus.manage.BusTakeManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusTakeDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusTakeCondition;
import com.fsun.domain.entity.BusTakeGoodsCondition;
import com.fsun.domain.enums.BusTakeStatusEnum;
import com.fsun.domain.enums.OrderOperateButtonsEnum;
import com.fsun.domain.enums.OrderTakeStatusEnum;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusTake;
import com.fsun.domain.model.BusTakeGoods;
import com.fsun.domain.model.SysUser;
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
				throw new BusTakeException(SCMErrorEnum.USER_ILLEGAL);
			}
			//头信息
			BusTake header = new BusTake();
			takeId = busTakeManage.initNumber(orderId, "JT");
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
			map.put("details", busTakeDetailManage.getInvSkuByOrder(busOrder));						
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
		//获取订单下的商品库存信息
		List<BusTakeGoods> invSkuList = busTakeDetailManage.getInvSkuByOrder(busOrder);
		//初始化明细
		int lineNo = 1;
		boolean hasExist;
		boolean hasAllTake = true;
		BigDecimal takeOutQty = BigDecimal.ZERO;
		for (BusTakeGoods busTakeGoods : details) {		
			BigDecimal qty = busTakeGoods.getQty();
			hasExist = false;
			for (BusTakeGoods oldBusTakeGoods : invSkuList) {
				if(oldBusTakeGoods.getOriGoodsId().equals(busTakeGoods.getOriGoodsId())){
					if(oldBusTakeGoods.getMaxQty().compareTo(qty)<0){
						throw new BusTakeException(SCMErrorEnum.BUS_SKU_INV_ILLEGAL);
					}else if(oldBusTakeGoods.getMaxQty().compareTo(qty)>0){
						hasAllTake = false;
					}
					hasExist = true;
				}
			}
			if(!hasExist){
				throw new BusTakeException(SCMErrorEnum.BUS_SKU_INV_ILLEGAL);
			}
			//存在提货数量
			if(qty.compareTo(BigDecimal.ZERO)>0){
				busTakeGoods.setGoodsId(PKMapping.GUUID(PKMapping.bus_take_goods));
				busTakeGoods.setTakeId(takeId);
				busTakeGoods.setLineNo(lineNo++);
				busTakeGoods.setCreatedTime(now);	
				busTakeGoods.setEnabled(true);
				busTakeGoods.setShopId(header.getShopId());
				busTakeDetailManage.create(busTakeGoods);
				this.skuStockOut(header, busTakeGoods);
			}
			takeOutQty = takeOutQty.add(qty);			
		}		
		//寄提出库总数量==0
		if(takeOutQty.compareTo(BigDecimal.ZERO)==0){
			throw new BusTakeException(SCMErrorEnum.BUS_SKU_INV_ILLEGAL);
		}		
		//记录提货状态
		if(hasAllTake){
			busOrder.setTakeStatus(OrderTakeStatusEnum.ALL_TAKE.getCode());
		}else{
			busOrder.setTakeStatus(OrderTakeStatusEnum.PART_TAKE.getCode());
		}	
		busOrder.setUpdatedName(currUser.getRealname());
		busOrder.setUpdatedTime(now);
		busOrderManage.update(busOrder);
		return takeId;
	}

	@Transactional
	@Override
	public void changeStatus(String[] takeIds, String status, SysUser user, BusTakeCondition condition){		
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
				BusTakeGoodsCondition condition0 = new BusTakeGoodsCondition();
				condition0.setTakeId(takeId);
				List<BusTakeGoods> busTakeGoods = busTakeDetailManage.list(condition0);
				for (BusTakeGoods busTakeGoods2 : busTakeGoods) {
					busTakeGoods2.setEnabled(false);
					busTakeDetailManage.update(busTakeGoods2);
					this.skuStockIn(header, busTakeGoods2);
				}
			}
			//更新头信息
			header.setTakeStatus(status);
			header.setUpdatedName(user.getRealname());
			header.setUpdatedTime(now);
			header.setMemo(condition.getMemo());
			busTakeManage.update(header);
		}
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
