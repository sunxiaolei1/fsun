package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.dao.mapper.BusInvSkuMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.InvSkuDto;
import com.fsun.domain.entity.BusInvSkuCondition;
import com.fsun.domain.entity.BusVipCondition;
import com.fsun.domain.enums.CustomerTypeEnum;
import com.fsun.domain.enums.VipCardTypeEnum;
import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.BusInvSku;
import com.fsun.exception.bus.InvSkuException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2018年12月13日
 */
@Component
public class BusInvSkuManage extends CrudManage<BusInvSkuMapper, BusInvSku>{
	
	@Autowired
	private BusCustomerManage busCustomerManage;
	
	@Autowired
	private BusVipManage busVipManage;

	/**
	 * java对象分页查询
	 * @param condition
	 * @return
	 */
	public PageModel selectInvSkuList(BusInvSkuCondition condition) {
		//List<BusInvSku> list = mapper.selectList(condition);
		List<InvSkuDto> list = mapper.selectInvSkuList(condition);
		if(list!=null){
			List<HashMap<String, Object>> mapList = new ArrayList<>();				
			BusCustomer busCustomer = busCustomerManage.loadByCode(condition.getCustomerCode());
			BusVipCondition busVipCondition  = busVipManage.getVipCardParams(busCustomer);	
			for (InvSkuDto invSkuDto : list) {
				HashMap<String, Object> map = new HashMap<>();
				map.put("skuId", invSkuDto.getSkuId());
				map.put("barCode", invSkuDto.getBarCode());
				map.put("sku", invSkuDto.getSku());
				map.put("parentSkuId", invSkuDto.getParentSkuId());
				map.put("categoryCode", invSkuDto.getCategoryCode());
				map.put("productType", invSkuDto.getProductType());
				map.put("brandCode", invSkuDto.getBrandCode());
				map.put("goodsName", invSkuDto.getGoodsName());
				map.put("enName", invSkuDto.getEnName());
				map.put("property", invSkuDto.getProperty());				
				map.put("unit", invSkuDto.getUnit());
				map.put("assistId", invSkuDto.getAssistId());
				map.put("warningQty", invSkuDto.getWarningQty());
				map.put("qty", 1);
				map.put("convertQty", invSkuDto.getConvertQty());
				map.put("convertUnit", invSkuDto.getConvertUnit());
				map.put("isVipAppoint", invSkuDto.getIsVipAppoint());
				map.put("costPrice", invSkuDto.getCostPrice());
				map.put("marketPrice", invSkuDto.getMarketPrice());
				map.put("originSalePrice", invSkuDto.getSalePrice());
				
				//根据不同的客户类型获取对应的销售单价
				map.put("salePrice", this.getSalePriceByCustomer(busCustomer, invSkuDto, busVipCondition));		
				mapList.add(map);
			}
			return new PageModel(mapList);
		}
		return new PageModel(list);
	}
	
	/**
	 * 通过门店获取商品库存
	 * @param sku
	 * @param shopId
	 * @return
	 */
	public BusInvSku loadBySkuAndShopId(String sku, String shopId) {
		
		BusInvSkuCondition condition = new BusInvSkuCondition();
		condition.setSku(sku);
		condition.setShopId(shopId);
		List<BusInvSku> busInvSkus = mapper.selectList(condition);
		if(busInvSkus==null || busInvSkus.size()==0){
			return null;
		}		
		if(busInvSkus!=null && busInvSkus.size()>1){
			throw new InvSkuException(SCMErrorEnum.BUS_SKU_ILLEGAL);
		}
		return busInvSkus.get(0);
	}
	
	/**
	 * 商品入库
	 * @param domain
	 */
	public BusInvSku stockIn(BusInvSku domain){		
		 String sku = domain.getSku();	
		 String shopId = domain.getShopId();
		 if(StringUtils.isEmpty(sku)){
			throw new InvSkuException(SCMErrorEnum.BUS_SKU_ISNULL);
		 }
		 if(StringUtils.isEmpty(shopId)){
			throw new InvSkuException(SCMErrorEnum.BUS_SHOP_ISNULL);
		 }	 
		 Date now = new Date();
		 BusInvSku old = this.loadBySkuAndShopId(sku, shopId);
		 if(old!=null){
			 old.setDamagedQty(old.getDamagedQty().add(domain.getDamagedQty()));
			 old.setLockQty(old.getLockQty().add(domain.getLockQty()));
			 old.setQty(old.getQty().add(domain.getQty()));
			 old.setUpdatedTime(now);
			 mapper.updateByPrimaryKey(old);
			 return old;
		 }else{
			 domain.setId(PKMapping.GUUID(PKMapping.bus_inv_sku));
			 domain.setCreatedTime(now);	
			 mapper.insert(domain);
			 return domain;
		 }		
	}
	
	

	/**
	 * 商品出库
	 * @param domain
	 */
	public BusInvSku stockOut(BusInvSku domain){
		String sku = domain.getSku();	
		 String shopId = domain.getShopId();
		 if(StringUtils.isEmpty(sku)){
			throw new InvSkuException(SCMErrorEnum.BUS_SKU_ISNULL);
		 }
		 if(StringUtils.isEmpty(shopId)){
			throw new InvSkuException(SCMErrorEnum.BUS_SHOP_ISNULL);
		 }	 
		 Date now = new Date();
		 BusInvSku old = this.loadBySkuAndShopId(sku, shopId);
		 if(old!=null){
			 old.setDamagedQty(old.getDamagedQty().subtract(domain.getDamagedQty()));
			 old.setLockQty(old.getLockQty().subtract(domain.getLockQty()));
			 old.setQty(old.getQty().subtract(domain.getQty()));
			 old.setUpdatedTime(now);
			 mapper.updateByPrimaryKey(old);
			 return old;
		 }else{
			 domain.setCreatedTime(now);
			 domain.setDamagedQty(domain.getDamagedQty().negate());
			 domain.setLockQty(domain.getLockQty().negate());
			 domain.setQty(domain.getQty().negate());
			 mapper.insert(domain);
			 return domain;
		 }	
	}
	
	
	
	
	/*************************************          私有方法                   ****************************************/

	/**
	 * 根据不同的客户类型获取对应的销售单价
	 * @param busCustomer
	 * @param invSkuDto
	 * @param busVipCondition
	 * @return
	 */
	private BigDecimal getSalePriceByCustomer(BusCustomer busCustomer, InvSkuDto invSkuDto, BusVipCondition busVipCondition){
		BigDecimal realSalePrice = null;
		//批发价
		BigDecimal marketPrice = invSkuDto.getMarketPrice();
		//普通价
		BigDecimal salePrice = invSkuDto.getSalePrice();
		//会员价
		BigDecimal vipPrice = invSkuDto.getVipPrice();	
		//是否是外部会员指定vip价商品
		boolean isVipAppoint = invSkuDto.getIsVipAppoint();
		
		if(busCustomer!=null){
			switch (CustomerTypeEnum.getByCode(busCustomer.getCustomerType())) {
				case VIP:	
					//会员卡类型
					Integer vipCardType = busVipCondition.getCardType();
					//会员卡有无余额
					boolean hasBalance = busVipCondition.isHasBalance();
					switch (VipCardTypeEnum.getByValue(vipCardType)) {
						case DEFAULT_VIP:
							//余额大于0
							if(hasBalance){
								if(isVipAppoint){
									realSalePrice = vipPrice;
								}else{
									realSalePrice = salePrice.multiply(new BigDecimal(0.9)).setScale(2, BigDecimal.ROUND_HALF_UP);
								}
							}else{
								realSalePrice = salePrice.multiply(new BigDecimal(0.95)).setScale(2, BigDecimal.ROUND_HALF_UP);
							}							
							break;
						case SILVER_VIP:
							realSalePrice = vipPrice;
							break;
						case GOLD_VIP:
							realSalePrice = vipPrice;
							break;
						default:
							break;
					}
					break;						
				case JXS:	
					realSalePrice = marketPrice;
					break;	
				case GYS:	
					realSalePrice = salePrice;
					break;	
				case YWY:	
					realSalePrice = marketPrice;
					break;	
				case SK:	
					realSalePrice = salePrice;
					break;	
				case GZ:	
					realSalePrice = salePrice;
					break;	
				default:
					realSalePrice = salePrice;
					break;
			}
		}
		return realSalePrice;
	}
}
