package com.fsun.service.sku;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.BusBasSkuApi;
import com.fsun.biz.bus.manage.BusBasSkuManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusBasSkuCondition;
import com.fsun.domain.enums.ProductTypeEnum;
import com.fsun.domain.model.BusBasSku;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.BasSkuException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2018年12月7日
 */
@Service
public class BusBasSkuService implements BusBasSkuApi {
	
	@Autowired
	private BusBasSkuManage busBasSkuManage;

	@Override
	public BusBasSku load(String id) {
		return busBasSkuManage.load(id);
	}
	
	@Override
	public BusBasSku loadBySku(String sku) {
		BusBasSkuCondition condition = new BusBasSkuCondition();
		condition.setSku(sku);
		List<BusBasSku> list = busBasSkuManage.list(condition);
		if(list==null || list.size()==0){
			throw new BasSkuException(SCMErrorEnum.BUS_SKU_NOT_EXIST);
		}else if(list.size()>1){
			throw new BasSkuException(SCMErrorEnum.BUS_SKU_ILLEGAL);
		}
		return list.get(0);	
	}

	@Override
	public boolean unique(BusBasSkuCondition condition) {
		List<BusBasSku> list = busBasSkuManage.list(condition);
		if(list==null || list.size()==0){
			return true;
		}else if(list.size()==1){			
			if(list.get(0).getSkuId().equals(condition.getSkuId())){
				return true;
			}
		}
		return false;
	}

	@Override
	public PageModel findPage(BusBasSkuCondition condition) {
		return busBasSkuManage.findMapPage(condition);
	}
	
	@Override
	public PageModel findListForPage(BusBasSkuCondition condition) {
		return busBasSkuManage.findPage(condition);
	}

	@Override
	public List<BusBasSku> list(BusBasSkuCondition condition) {
		return busBasSkuManage.list(condition);
	}

	@Transactional
	@Override
	public String save(BusBasSku domain, SysUser currentUser) {
		
		BusBasSkuCondition condition = new BusBasSkuCondition();
		condition.setSkuId(domain.getSkuId());
		condition.setSku(domain.getSku());
		boolean hasUnique= this.unique(condition);
		if(!hasUnique){
			throw new BasSkuException(SCMErrorEnum.BUS_SKU_EXISTED);
		}
		//保存数据
		Date now = new Date();
		String skuId = domain.getSkuId();
		if(StringUtils.isEmpty(skuId)){
			domain.setSkuId(PKMapping.GUUID(PKMapping.bus_bas_sku));
			domain.setCreatedId(currentUser.getId());
			domain.setCreatedTime(now);
			domain.setIsEnabled(true);
			domain.setQty(BigDecimal.ONE);
			domain.setProductType(ProductTypeEnum.SINGLE.getValue());
			domain.setIsRecommend(false);
			busBasSkuManage.create(domain);
		}else{
			BusBasSku busBasSku = this.load(skuId);
			if(busBasSku==null){
				throw new BasSkuException(SCMErrorEnum.BUS_SKU_NOT_EXIST);
			}	
			busBasSku.setGoodsName(domain.getGoodsName());
			busBasSku.setCategoryCode(domain.getCategoryCode());
			busBasSku.setBrandCode(domain.getBrandCode());
			busBasSku.setBarCode(domain.getBarCode());
			busBasSku.setUnit(domain.getUnit());
			busBasSku.setUnitName(domain.getUnitName());
			busBasSku.setCostPrice(domain.getCostPrice());
			busBasSku.setMarketPrice(domain.getMarketPrice());
			busBasSku.setOriginSalePrice(domain.getOriginSalePrice());
			busBasSku.setEnName(domain.getEnName());
			busBasSku.setProperty(domain.getProperty());
			busBasSku.setMemo(domain.getMemo());
			busBasSku.setDescr(domain.getDescr());
			busBasSku.setIsVipAppoint(domain.getIsVipAppoint());
			busBasSku.setIsChannelAppoint(domain.getIsChannelAppoint());
			busBasSku.setSortCode(domain.getSortCode());
			busBasSku.setUpdatedId(currentUser.getId());
			busBasSku.setUpdatedTime(now);
			busBasSkuManage.update(busBasSku);
		}
		return domain.getSkuId();

	}

	@Transactional
	@Override
	public void changeStatus(String[] skuIds, Boolean enabled, SysUser user) {
		
		Date now = new Date();
		for (String skuId : skuIds) {
			BusBasSku busBasSku = this.load(skuId);
			busBasSku.setUpdatedId(user.getId());
			busBasSku.setUpdatedTime(now);
			busBasSku.setIsEnabled(enabled);
			busBasSkuManage.update(busBasSku);
		}
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
