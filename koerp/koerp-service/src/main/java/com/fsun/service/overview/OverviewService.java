package com.fsun.service.overview;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.OverviewApi;
import com.fsun.biz.bus.manage.BusInvSkuManage;
import com.fsun.biz.bus.manage.BusOrderManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusInvSkuCondition;
import com.fsun.domain.entity.OverviewCondition;

/**
 * @author fsun
 * @date 2019年5月14日
 */
@Service
public class OverviewService implements OverviewApi {

	@Autowired
	private BusInvSkuManage busInvSkuManage; 
	
	@Autowired
	private BusOrderManage busOrderManage;
	
	@Override
	public HashMap<String, Object> getInitData(OverviewCondition condition, BusUserDto currUser) {
		HashMap<String, Object> data = new HashMap<String, Object>();	
		BusInvSkuCondition busInvSkuCondition = new BusInvSkuCondition();		
		//busInvSkuCondition.setShopId(currUser.getShopId());
		List<HashMap<String, Object>> invSkus = busInvSkuManage.getWarningList(busInvSkuCondition);
		data.put("invSkus", invSkus);		
		return data;
	}

}
