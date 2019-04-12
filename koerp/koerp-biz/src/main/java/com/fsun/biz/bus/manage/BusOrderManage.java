package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.dao.mapper.BusOrderMapper;
import com.fsun.domain.dto.BusOrderDto;
import com.fsun.domain.enums.PayModeEnum;
import com.fsun.domain.enums.ProductTypeEnum;
import com.fsun.domain.model.BusGoods;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusPayAccount;
import com.fsun.exception.bus.OrderException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2018年12月24日
 */
@Component
public class BusOrderManage extends CrudManage<BusOrderMapper, BusOrder>{
	
	/**
	 * 根据出库类型生成销售单号
	 * @param orderType
	 * @param shopCode
	 * @return
	 */
	public String initOrderId(Short orderType, String shopCode) {
		String prefix = DateUtil.getNowDateStr().replace("-", "") + "0"+ orderType + shopCode;
		List<String> list = mapper.getMaxNumber(prefix);
		if(list!=null && list.size()>0){
			String maxOrderNo = list.get(0);
			return (Long.parseLong(maxOrderNo) + 1) + "";
		}else{	
			return prefix + "00001";
		}
	}


	/**
	 * 初始化商品分摊明细
	 * @param busOrderDto
	 * @return
	 */
	public void initApportionDetails(BusOrderDto busOrderDto, Set<BusGoods> apportionDetails) {
		
		BusOrder header = busOrderDto.getHeader();
		List<BusPayAccount> payAccounts = busOrderDto.getPayAccounts();
		
		//要求账单和订单头金额字段保持一致
		BigDecimal totalReceptPrice = this.getTotalReceptPrice(payAccounts, header);
		
		//根据账单实收进行商品实收分摊
		List<BusGoods> goodsList = busOrderDto.getDetails();		
		//第一级商品(可销售的商品包括套餐及单品)
        List<BusGoods> firstGoods = new ArrayList<>();
        //套餐下的单品
        HashMap<String, List<BusGoods>> secondGoodsMap = new HashMap<>();
		//skuid对应的订单下套餐商品明细条数
        HashMap<String, BigDecimal> priceMap = new HashMap<String, BigDecimal>();
        //获取订单商品应收总金额
        BigDecimal totalPrice = this.getTotalPrice(goodsList, firstGoods, secondGoodsMap, priceMap);
        //分摊结算套餐及套餐下的商品
        this.settleChildren(totalReceptPrice, totalPrice, firstGoods, secondGoodsMap, priceMap, apportionDetails);
	}

	
	
	
	/************************************    私有方法       **************************************/
	
	/**
	 * 分摊结算套餐及套餐下的商品
	 * @param totalReceptPrice 订单对应的账单实收总金额
	 * @param totalPrice 订单商品应收总金额
	 * @param goodsDtos 商品集合
	 * @param secondGoodsMap 第二级商品集合
	 * @param priceMap skuid对应的订单下套餐商品明细条数
	 * @param apportionDetails 要返回的集合
	 */
	private void settleChildren(BigDecimal totalReceptPrice, BigDecimal totalPrice, List<BusGoods> goodsDtos,
		HashMap<String, List<BusGoods>> secondGoodsMap, HashMap<String, BigDecimal> priceMap, Set<BusGoods> apportionDetails) {	       	   	   	
    	//订单商品应收总金额为零
    	if (totalPrice.compareTo(BigDecimal.ZERO) == 0) {	         
    		for (BusGoods busGoods : goodsDtos) {
	        	busGoods.setTotalPartPrice(BigDecimal.ZERO);
	        	busGoods.setPartPrice(BigDecimal.ZERO);
	        	busGoods.setDiscountPrice(busGoods.getTotalPrice());
	    		if (ProductTypeEnum.PACKAGE.getValue().equals(busGoods.getProductType())) {
	    			this.settleSecondGoods(busGoods, secondGoodsMap, priceMap, apportionDetails);
	    		}
    		}
	    }else if(totalPrice.compareTo(BigDecimal.ZERO) > 0){	    	
	    	//公式：实收金额 =  单个售价 × 数量 × 账单实收价 / 销售总价
	    	BigDecimal totalPartPrice = null; 
	    	//记录前n-1的商品明细的分摊总额
	    	BigDecimal newPartPrice = BigDecimal.ZERO;
	    	int length = goodsDtos.size();
	    	for (int i = 0; i < length; i++) {   		
	    		BusGoods goodsDto = goodsDtos.get(i);   		
				if (i < length - 1) {
					//公式: 单价*数量  = 金额
					//公式： 金额*账单实收价/销售总价
					//注：当订单出现满赠情况且赠的是同一个产品,则对应的赠送的东西直接分摊到该满赠产品中去（即:并不分摊到别的产品中去)
					if (goodsDto.getIsGift()) {
						totalPartPrice = goodsDto.getTotalPrice().subtract(goodsDto.getGiftPrice())
							.multiply(totalReceptPrice).divide(totalPrice, 2, BigDecimal.ROUND_HALF_UP);
					} else {
						totalPartPrice = goodsDto.getTotalPrice().multiply(totalReceptPrice).
							divide(totalPrice, 2, BigDecimal.ROUND_HALF_UP);
					}
					//可售商品的n-1商品分摊价
					newPartPrice = newPartPrice.add(totalPartPrice);
					if (totalReceptPrice.compareTo(newPartPrice) < 0) {
						//差额
						BigDecimal balance = totalReceptPrice.subtract(newPartPrice);
						totalPartPrice = totalPartPrice.add(balance);
						newPartPrice = newPartPrice.add(balance);
					}
				} else {
					//最后一个是相减(账单实收总价-(n-1)个分摊总价)
					totalPartPrice = totalReceptPrice.subtract(newPartPrice);
				}
				//存在同一个订单中的相同sku的情况(即:套餐(23123111)中可以商品A+B,也可以才商品A+C),
				//明细分摊价需要累加(一个单品的实收金额分多次计算，需要合并)
				BigDecimal skuNumber = priceMap.get(goodsDto.getParentSkuId());
				if (skuNumber != null && skuNumber.intValue() > 1) {           
					totalPartPrice = totalPartPrice.add(goodsDto.getTotalPartPrice());           
				}   	
	    		//重新记录数据
	    		goodsDto.setTotalPartPrice(totalPartPrice);
	    		goodsDto.setPartPrice(totalPartPrice.divide(goodsDto.getQty(), 2, BigDecimal.ROUND_HALF_UP));
	    		goodsDto.setDiscountPrice(goodsDto.getTotalPrice().subtract(totalPartPrice));
	    		if (ProductTypeEnum.PACKAGE.getValue().equals(goodsDto.getProductType())) {
	    			this.settleSecondGoods(goodsDto, secondGoodsMap, priceMap, apportionDetails);
	    		}
	    	}
	    }
    	apportionDetails.addAll(goodsDtos);	   
	}
	
	/**
	 * 清算套餐下的菜品明细分摊
	 * @param firstGoodsDto
	 * @param secondGoodsMap
	 * @param apportionDetails
	 * @param priceMap
	 */
	private void settleSecondGoods(BusGoods firstGoodsDto, HashMap<String, List<BusGoods>> secondGoodsMap,
			HashMap<String, BigDecimal> priceMap, Set<BusGoods> apportionDetails) {
	    //考虑:存在同一个订单中的相同sku的情况(即:套餐(23123111)中可以菜品A+B,也可以才菜品A+C)
	    //套餐分摊总价 注意:套餐个数是指同一个订单下的套餐种类数量,即在第一级商品明细中出现同一个sku的菜品个数
	    BigDecimal totalReceptPrice = firstGoodsDto.getTotalPartPrice();
	    BigDecimal totalPrice = BigDecimal.ZERO;
	    List<BusGoods> secondGoodsDtos = secondGoodsMap.get(firstGoodsDto.getSkuId());
	    if (secondGoodsDtos != null && secondGoodsDtos.size() > 0) {
	    	//核算套餐下的单品的总销售金额
	    	//TotalPrice-GiftPrice,考虑同个菜品满赠情况
	    	for (BusGoods goodsDto : secondGoodsDtos) {
	    		if (goodsDto.getIsGift()) {
	    			totalPrice = totalPrice.add(goodsDto.getTotalPrice().subtract(goodsDto.getGiftPrice()));
	    		} else {
	    			totalPrice = totalPrice.add(goodsDto.getTotalPrice());
	    		}
	    	}
	     	this.settleChildren(totalReceptPrice, totalPrice, secondGoodsDtos, secondGoodsMap, priceMap, apportionDetails);
	    }
	}

	
	/**
	 * 根据账单获取实收总额
	 * @param payAccounts
	 * @return
	 */
	private BigDecimal getTotalReceptPrice(List<BusPayAccount> payAccounts, BusOrder header) {		
		//实收总金额
		BigDecimal totalReceptPrice = BigDecimal.ZERO;
	    //优惠总金额
	    BigDecimal discountAmount = BigDecimal.ZERO;	    
	    //找零总金额
	    BigDecimal dibPrice = BigDecimal.ZERO;	    
	    //抹零金额
	    BigDecimal toZeroAmount = BigDecimal.ZERO;		    
	    for (BusPayAccount payAccount : payAccounts) {    	        	
	    	if(PayModeEnum.TO_ZERO.getValue().equals(payAccount.getPayMode())){
	    		toZeroAmount = toZeroAmount.add(payAccount.getDiscountAmount());
	    	}else{
	    		totalReceptPrice = totalReceptPrice.add(payAccount.getReceptPrice()); 
	    		discountAmount = discountAmount.add(payAccount.getDiscountAmount());
	    	}
	    	dibPrice = dibPrice.add(payAccount.getDibPrice());
	    }
	    //计算实收总金额
	    totalReceptPrice = totalReceptPrice.subtract(discountAmount);
	    
	    //验证公式: ReceptPrice = DibPrice + PayPrice
	    if(totalReceptPrice.compareTo(header.getReceptPrice())!=0 
	    	|| dibPrice.compareTo(header.getDibPrice())!=0){
	    	throw new OrderException(SCMErrorEnum.BUS_ORDER_PAYACCOUNT_ILLEGAL);
	    }
	    
	    //验证公式: OrderPrice = ReceptPrice + DiscountPrice + ToZeroPrice
	    if(discountAmount.compareTo(header.getDiscountPrice())!=0
	    	|| toZeroAmount.compareTo(header.getToZeroPrice())!=0){
	    	throw new OrderException(SCMErrorEnum.BUS_ORDER_PAYACCOUNT_ILLEGAL);
	    }		
		return totalReceptPrice;
	}

	/**
	 * 获取订单商品应收总金额
	 * @param goodsList
	 * @param firstGoods
	 * @param secondGoodsMap
	 * @param priceMap
	 * @return
	 */
	private BigDecimal getTotalPrice(List<? extends BusGoods> goodsList, List<BusGoods> firstGoods,
			HashMap<String, List<BusGoods>> secondGoodsMap, HashMap<String, BigDecimal> priceMap) {

	    BigDecimal totalPrice = BigDecimal.ZERO;
	    BigDecimal oldTotalPartPrice = BigDecimal.ZERO;
	    //明细中同一个sku对应分摊总价集合
	    HashMap<String, BigDecimal> skuToTotalPartPriceMap = new HashMap<String, BigDecimal>();
	    //是否有skuid相同的套餐
	    boolean hasSameSku = false;
	    for (BusGoods busGoods : goodsList) {
	        //第一级商品
	        if (busGoods.getParentSkuId() == null) {
	        	//获取第一级商品
	        	firstGoods.add(busGoods);
	        	//原分摊金额累加
	        	oldTotalPartPrice = oldTotalPartPrice.add(busGoods.getTotalPartPrice());		        	        
		        //如果缘分摊总价出现负数则直接认为分摊出错
		        if (busGoods.getTotalPartPrice().compareTo(BigDecimal.ZERO) < 0) {
		        	priceMap.put("oldTotalPartPrice", new BigDecimal(-2));
		        }
		        //TotalPrice-GiftPrice 考虑同一商品满赠情况
		        if (busGoods.getIsGift()) {
		        	totalPrice = totalPrice.add(busGoods.getTotalPrice().subtract(busGoods.getGiftPrice()));
		        } else {
		        	totalPrice = totalPrice.add(busGoods.getTotalPrice());
		        }	        
		        if (ProductTypeEnum.PACKAGE.getValue().equals(busGoods.getProductType())) {
		        	String skuId = busGoods.getSkuId();
		        	BigDecimal skuNumber = priceMap.get(skuId);
		        	//如果该sku的商品有多条,则记录sku的相同商品的数量
		        	if (skuNumber != null) {
		        		skuNumber = skuNumber.add(BigDecimal.ONE);
		        		priceMap.put(skuId, skuNumber);
		        		hasSameSku = true;
		        	} else {
		        		//获取第二级商品
		        		List<BusGoods> secondGoods = new ArrayList<>();
		        		BigDecimal oldTotalChildPartPrice = BigDecimal.ZERO;
		        		for (BusGoods goodsDto : goodsList) {
		        			if (skuId.equals(goodsDto.getParentSkuId())) {
		        				oldTotalChildPartPrice = oldTotalChildPartPrice.add(goodsDto.getTotalPartPrice());
		        				goodsDto.setTotalPartPrice(BigDecimal.ZERO);
		        				secondGoods.add(goodsDto);
		        			}
		        		}
		        		//获取该套餐商品对应的单品明细
		        		secondGoodsMap.put(skuId, secondGoods);
		        		//获取该套餐商品对应的单品原分摊实收总金额
		        		skuToTotalPartPriceMap.put(skuId, oldTotalChildPartPrice);
		        		priceMap.put(skuId, BigDecimal.ONE);
		        	}
		        }
	        }
	    }

	    //判别是否有原分摊负数错误
	    BigDecimal oldTotalPartPrice0 = priceMap.get("oldTotalPartPrice");
	    if (oldTotalPartPrice0 != null && oldTotalPartPrice0.compareTo(BigDecimal.ZERO) < 0) {
	    	return totalPrice;
	    }

	    //是否有skuid相同的套餐
	    if (hasSameSku) {
	    	//找出套餐下分摊出错的订单
	    	for (BusGoods busGoods : firstGoods) {
	    		if (ProductTypeEnum.PACKAGE.getValue().equals(busGoods.getProductType())) {
	    			BigDecimal skuTotalPartPrice = busGoods.getTotalPartPrice();
	    			String skuId = busGoods.getSkuId();
	    			BigDecimal skuNumber = priceMap.get(skuId);
	    			if (skuNumber != null && skuNumber.intValue() > 1) {
	    				skuTotalPartPrice = BigDecimal.ZERO;
	    				for (BusGoods busGoods2 : firstGoods) {
	    					if (skuId.equals(busGoods2.getSkuId())) {
	    						skuTotalPartPrice = skuTotalPartPrice.add(busGoods2.getTotalPartPrice());
	    					}
	    				}
	    			}
	    			//skuid相同的套餐商品的实收总金额 == skuid相同的套餐商品下的单品实收总金额
	    			if (skuTotalPartPrice.compareTo(skuToTotalPartPriceMap.get(skuId)) != 0) {
	    				priceMap.put("oldTotalPartPrice", new BigDecimal(-1));
	    				return totalPrice;
	    			}
	    		}
	    	}
	    } else {
	    	//找出套餐下分摊出错的订单
	    	for (BusGoods busGoods : firstGoods) {
	    		if (ProductTypeEnum.PACKAGE.getValue().equals(busGoods.getProductType())) {
	    			BigDecimal skuTotalPartPrice = busGoods.getTotalPartPrice();
	    			if (skuTotalPartPrice.compareTo(skuToTotalPartPriceMap.get(busGoods.getSkuId())) != 0) {
	    				priceMap.put("oldTotalPartPrice", new BigDecimal(-1));
	    				return totalPrice;
	    			}
	    		}
	    	}
	    }
	    priceMap.put("oldTotalPartPrice", oldTotalPartPrice);
	    return totalPrice;
	  }

	
}
