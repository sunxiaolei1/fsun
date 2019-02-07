package com.fsun.service.shop;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.BusShopApi;
import com.fsun.biz.bus.manage.BusShopManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusShopCondition;
import com.fsun.domain.model.BusShop;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.ShopException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2018年12月9日
 */
@Service
public class BusShopService implements BusShopApi {

	@Autowired
	private BusShopManage busShopManage;
	
	@Override
	public boolean unique(BusShopCondition condition) {
		List<BusShop> list = busShopManage.list(condition);
		if(list==null || list.size()==0){
			return true;
		}else if(list.size()==1){			
			if(list.get(0).getShopId().equals(condition.getShopId())){
				return true;
			}
		}
		return false;
	}

	@Override
	public BusShop load(String id) {
		return busShopManage.load(id);
	}

	@Override
	public List<BusShop> list(BusShopCondition condition) {
		return busShopManage.list(condition);
	}

	@Override
	public PageModel findPage(BusShopCondition condition) {
		return busShopManage.findMapPage(condition);
	}

	@Transactional
	@Override
	public String save(BusShop domain, SysUser currentUser) {
		
		BusShopCondition condition = new BusShopCondition();
		condition.setShopId(domain.getShopId());
		condition.setShopCode(domain.getShopCode());
		boolean hasUnique= this.unique(condition);
		if(!hasUnique){
			throw new ShopException(SCMErrorEnum.BUS_SHOP_EXISTED);
		}
		
		//保存数据
		Date now = new Date();
		String shopId = domain.getShopId();
		if(shopId==null || shopId.equals("")){
			domain.setShopId(PKMapping.GUUID(PKMapping.bus_shop));
			domain.setEnabled(true);
			domain.setCreatedId(currentUser.getUsername());
			domain.setCreatedTime(now);
			busShopManage.create(domain);
		}else{
			BusShop busShop = this.load(shopId);
			if(busShop==null){
				throw new ShopException(SCMErrorEnum.BUS_SHOP_NOT_EXIST);
			}				
			busShop.setPosition(domain.getPosition());
			busShop.setShopName(domain.getShopName());
			busShop.setContacts(domain.getContacts());
			busShop.setAddress(domain.getAddress());
			busShop.setMemo(domain.getMemo());	
			busShop.setUpdatedId(currentUser.getUsername());
			busShop.setUpdatedTime(now);			
			busShopManage.update(busShop);
		}
		return domain.getShopId();
	}

	@Transactional
	@Override
	public int delete(String shopId) {
		return busShopManage.delete(shopId);
	}

	@Transactional
	@Override
	public void changeStatus(String[] shopIds, Boolean enabled, SysUser user) {
		
		Date now = new Date();
		for (String shopId: shopIds) {
			BusShop busShop = this.load(shopId);
			busShop.setEnabled(enabled);
			busShop.setUpdatedId(user.getId());
			busShop.setUpdatedTime(now);
			busShopManage.update(busShop);
		}
	}

}
