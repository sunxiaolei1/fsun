package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusGoodsMapper;
import com.fsun.dao.mapper.BusTakeGoodsMapper;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusGoodsCondition;
import com.fsun.domain.entity.BusTakeGoodsCondition;
import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusTakeGoods;

/**
 * @author fsun
 * @date 2019年4月3日
 */
@Component
public class BusTakeDetailManage extends CrudManage<BusTakeGoodsMapper, BusTakeGoods>{
	
	@Autowired
	private BusGoodsMapper busGoodsMapper;
	
	@Override
	public List<BusTakeGoods> listByHeaderId(String headerId) {
		BusTakeGoodsCondition condition = new BusTakeGoodsCondition();
		condition.setTakeId(headerId);
		return mapper.selectList(condition);	
	}
	
	/**
	 * 通过订单号获取订单下商品的提货流水
	 * @param orderId
	 * @return
	 */
	public List<HashMap<String, Object>> getTakeGoodsByOrderId(String orderId){
		return mapper.getTakeGoodsByOrderId(orderId);
	}
	
	
	
	
	/**
	 * 获取订单下的商品库存信息
	 * @param orderId
	 * @return
	 */
	/*public List<BusTakeGoods> getInvSkuByOrder1(BusOrder busOrder) {	
		
		List<BusTakeGoods> takeGoodsList = new ArrayList<>();
		String orderId = busOrder.getOrderId();
		Short refundStatus = busOrder.getRefundStatus();
		String takeStatus = busOrder.getTakeStatus();
		Short orderType = busOrder.getOrderType();
		if(!OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType) 
			|| (refundStatus!=null && !refundStatus.equals("")) 
				|| OrderTakeStatusEnum.ALL_TAKE.getCode().equals(takeStatus)){
			//存在退货过的或者是寄提单已提货完成的寄存单，则取空数组
			return takeGoodsList;
		}else{
			BusGoodsCondition condition = new BusGoodsCondition();
			condition.setOrderId(orderId);
			List<BusGoods> busGoodsList = busGoodsMapper.selectList(condition);
			if(refundStatus==null && takeStatus==null){
				//没有退货过的或者是未创建过寄提单的寄存单，则取订单商品明细		
				for (BusGoods busGoods : busGoodsList) {
					BusTakeGoods busTakeGoods = new BusTakeGoods();
					BeanUtils.copyProperties(busGoods, busTakeGoods);
					busTakeGoods.setMaxQty(busGoods.getQty());					
					busTakeGoods.setOriGoodsId(busGoods.getGoodsId());
					busTakeGoods.setOriQty(busGoods.getQty());	
					busTakeGoods.setOriInvQty(busGoods.getQty());
					busTakeGoods.setQty(BigDecimal.ZERO);
					busTakeGoods.setEnabled(true);
					takeGoodsList.add(busTakeGoods);
				}						
			}else{
				//部分提货的寄存单，则取订单商品明细及原已提货明细	
				List<BusTakeGoods> oriInvSkuList = mapper.getInvSkuByOrderId(orderId);
				for (BusGoods busGoods : busGoodsList) {
					boolean hasExist = false;
					for (BusTakeGoods busTakeGoods : oriInvSkuList) {
						String oriGoodsId = busTakeGoods.getOriGoodsId();
						BigDecimal maxQty = busTakeGoods.getMaxQty();
						if(busGoods.getGoodsId().equals(oriGoodsId)){
							hasExist = true;
							//过滤掉已经被提完货的商品
							if(maxQty.compareTo(BigDecimal.ZERO)!=0){
								takeGoodsList.add(busTakeGoods);
							}
							break;
						}
					}
					if(!hasExist){
						BusTakeGoods busTakeGoods = new BusTakeGoods();
						BeanUtils.copyProperties(busGoods, busTakeGoods);
						busTakeGoods.setMaxQty(busGoods.getQty());					
						busTakeGoods.setOriGoodsId(busGoods.getGoodsId());
						busTakeGoods.setOriQty(busGoods.getQty());
						busTakeGoods.setOriInvQty(busGoods.getQty());
						busTakeGoods.setQty(BigDecimal.ZERO);
						busTakeGoods.setEnabled(true);
						takeGoodsList.add(busTakeGoods);
					}					
				}
			}
			return takeGoodsList;
		}		
	}*/

	/**
	 * 初始化寄提商品明细
	 * @param busOrder
	 * @param currUser
	 * @return
	 */
	public List<BusTakeGoods> initTakeDetails(BusOrder busOrder, String takeId, BusUserDto currUser) {
		
		List<BusTakeGoods> takeGoodsList = new ArrayList<>();
		String orderId = busOrder.getOrderId();
		if(orderId!=null){
			BusGoodsCondition condition = new BusGoodsCondition();
			condition.setOrderId(orderId);
			List<BusGoods> busGoodsList= busGoodsMapper.selectList(condition);
			for (BusGoods busGoods : busGoodsList) {
				BigDecimal untakeQty = busGoods.getUntakeQty();
				if(untakeQty.compareTo(BigDecimal.ZERO)>0){
					BusTakeGoods busTakeGoods = new BusTakeGoods();
					BeanUtils.copyProperties(busGoods, busTakeGoods);
					busTakeGoods.setMaxQty(busGoods.getUntakeQty());					
					busTakeGoods.setOriGoodsId(busGoods.getGoodsId());
					busTakeGoods.setOriQty(busGoods.getQty());
					busTakeGoods.setOriInvQty(busGoods.getUntakeQty());
					busTakeGoods.setQty(BigDecimal.ZERO);
					busTakeGoods.setEnabled(true);
					busTakeGoods.setShopId(currUser.getShopId());
					busTakeGoods.setTakeId(takeId);
					takeGoodsList.add(busTakeGoods);
				}				
			}
		}
		return takeGoodsList;
	}

}
