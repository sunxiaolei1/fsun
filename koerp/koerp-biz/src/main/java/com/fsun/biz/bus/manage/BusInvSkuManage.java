package com.fsun.biz.bus.manage;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.dao.mapper.BusInvSkuMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusInvSkuCondition;
import com.fsun.domain.model.BusInvSku;
import com.fsun.exception.bus.InvSkuException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2018年12月13日
 */
@Component
public class BusInvSkuManage extends CrudManage<BusInvSkuMapper, BusInvSku>{

	/**
	 * java对象分页查询
	 * @param condition
	 * @return
	 */
	public PageModel findPage(BusInvSkuCondition condition) {
		List<BusInvSku> list = mapper.selectList(condition);
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

}
