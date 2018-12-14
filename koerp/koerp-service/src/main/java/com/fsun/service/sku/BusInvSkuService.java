package com.fsun.service.sku;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.BusInvSkuApi;
import com.fsun.biz.bus.manage.BusInvSkuManage;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.InvSkuDto;
import com.fsun.domain.entity.BusInvSkuCondition;
import com.fsun.domain.model.BusInvSku;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2018年12月13日
 */
@Service
public class BusInvSkuService implements BusInvSkuApi {
	
	@Autowired
	private BusInvSkuManage busInvSkuManage;
	
	@Override
	public boolean unique(String sku) {
		BusInvSku busInvSku = this.load(sku);
		if(busInvSku!=null){
			return true;
		}
		return false;
	}

	@Override
	public BusInvSku load(String id) {
		return busInvSkuManage.load(id);
	}

	@Override
	public List<BusInvSku> list(BusInvSkuCondition condition) {
		return busInvSkuManage.list(condition);
	}

	@Override
	public PageModel findPage(BusInvSkuCondition condition) {
		return busInvSkuManage.findMapPage(condition);
	}

	@Override
	public String save(BusInvSku domain, SysUser currentUser) {
		return null;
	}

	@Override
	public int delete(String id) {
		return 0;
	}

	@Override
	public InvSkuDto loadEntity(String id) {
		return busInvSkuManage.loadEntity(id);
	}

	@Override
	public PageModel findListForPage(BusInvSkuCondition condition) {
		return busInvSkuManage.findPage(condition);
	}

}
