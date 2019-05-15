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
		//获取各门店销售业绩
		BigDecimal maxSeries = BigDecimal.ZERO;
		int year = DateUtil.getNowYear();
		List<HashMap<String, Object>> saleQuota = busOrderManage.getSaleQuota(year);
		for (HashMap<String, Object> hashMap : saleQuota) {			
			String saleAmount = (String) hashMap.get("saleAmount");
			if(saleAmount!=null && !saleAmount.equals("")){
				String[] saleStrArr = saleAmount.split(",");
				List<BigDecimal> saleArr = new ArrayList<>();
				for (String saleStr : saleStrArr) {
					BigDecimal sale = new BigDecimal(saleStr);
					if(sale.compareTo(maxSeries)>0){
						maxSeries = sale;
					}
					saleArr.add(sale);					
				}
				hashMap.put("data", saleArr);
			}
			hashMap.remove("saleAmount");
		}
		data.put("maxSeries", maxSeries);
		data.put("saleSeriesData", saleQuota);
		data.put("seriesYear", year);		
		//获取商品销量占比
		List<HashMap<String, Object>> skusQuota = busOrderManage.getSkusQuota(year);
		BigDecimal totalAmount = busOrderManage.getSkusTotalAmount(year);
		BigDecimal saleTotalPercent = BigDecimal.ZERO;
		BigDecimal saleTotal = BigDecimal.ZERO;
		for (HashMap<String, Object> hashMap : skusQuota) {			
			BigDecimal saleAmount = (BigDecimal) hashMap.get("z");
			BigDecimal salePercent = saleAmount.multiply(new BigDecimal(100)).divide(totalAmount, 2, BigDecimal.ROUND_HALF_UP);
			saleTotalPercent = saleTotalPercent.add(salePercent);
			saleTotal = saleTotal.add(saleAmount);
			hashMap.put("y", salePercent);
		}
		//其他商品的百分比
		HashMap<String, Object> othersMap = new HashMap<>();
		othersMap.put("name", "其他");
		othersMap.put("z", totalAmount.subtract(saleTotal));
		othersMap.put("y", new BigDecimal(100).subtract(saleTotalPercent));
		skusQuota.add(othersMap);
		
		data.put("skusSeriesData", skusQuota);
		return data;
	}

}
