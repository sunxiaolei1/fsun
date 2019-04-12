package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusGoodsMapper;
import com.fsun.dao.mapper.BusTakeGoodsMapper;
import com.fsun.domain.entity.BusGoodsCondition;
import com.fsun.domain.enums.OrderTakeStatusEnum;
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
	
	/**
	 * 获取已被寄提的商品的库存数量
	 * @param orderId
	 * @return
	 */
	public List<BusTakeGoods> getInvSkuByOrderId(String orderId){
		List<BusTakeGoods> oriInvSkuList = mapper.getInvSkuByOrderId(orderId);
		return oriInvSkuList;
	}
	
	
	/**
	 * 获取订单下的商品库存信息
	 * @param orderId
	 * @return
	 */
	public List<BusTakeGoods> getInvSkuByOrder(BusOrder busOrder) {	
		
		List<BusTakeGoods> takeGoodsList = new ArrayList<>();
		String orderId = busOrder.getOrderId();
		Short refundStatus = busOrder.getRefundStatus();
		String takeStatus = busOrder.getTakeStatus();
		if(refundStatus!=null || (takeStatus!=null 
			&& OrderTakeStatusEnum.ALL_TAKE.getCode().equals(takeStatus))){
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
						busTakeGoods.setEnabled(true);
						takeGoodsList.add(busTakeGoods);
					}					
				}
			}
			return takeGoodsList;
		}		
	}

}
