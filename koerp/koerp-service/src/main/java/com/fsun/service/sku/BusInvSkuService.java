package com.fsun.service.sku;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.BusInvSkuApi;
import com.fsun.biz.bus.manage.BusInvSkuDetailsManage;
import com.fsun.biz.bus.manage.BusInvSkuManage;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusInvSkuCondition;
import com.fsun.domain.entity.BusInvSkuDetailsCondition;
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
	
	@Autowired
	private BusInvSkuDetailsManage busInvSkuDetailsManage; 
	
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
	public PageModel findListForPage(BusInvSkuCondition condition) {
		return busInvSkuManage.selectInvSkuList(condition);
	}

	@Override
	public PageModel findDetailsPage(BusInvSkuDetailsCondition condition) {
		return busInvSkuDetailsManage.findMapPage(condition);
	}

	@Override
	public HashMap<String, Object> findFooter(BusInvSkuCondition condition) {
		HashMap<String, Object> footer = busInvSkuManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public HashMap<String, Object> findDetailsFooter(BusInvSkuDetailsCondition condition) {
		HashMap<String, Object> footer = busInvSkuDetailsManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public List<HashMap<String, Object>> exportInvSku(BusInvSkuCondition condition) {
		return busInvSkuManage.export(condition);
	}

	@Override
	public List<HashMap<String, Object>> exportInvSkuDetails(BusInvSkuDetailsCondition condition) {
		return busInvSkuDetailsManage.export(condition);
	}

	@Transactional
	@Override
	public void configWarning(String[] ids, BigDecimal warningQty, BusUserDto user) {
		for (String id : ids) {
			BusInvSku busInvSku = busInvSkuManage.load(id);
			busInvSku.setWarningQty(warningQty);
			busInvSkuManage.update(busInvSku);
		}
	}
}
