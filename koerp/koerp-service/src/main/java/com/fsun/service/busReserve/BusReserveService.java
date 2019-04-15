package com.fsun.service.busReserve;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.BusReserveApi;
import com.fsun.biz.bus.manage.BusReserveManage;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusReserveCondition;
import com.fsun.domain.enums.TradeTypeEnum;
import com.fsun.domain.enums.VipUnpaidPayModeEnum;
import com.fsun.domain.model.BusReserve;
import com.fsun.domain.model.SysUser;

/**
 * 备用金接口实现
 * @author fsun
 * @date 2019年4月15日
 */
@Service
public class BusReserveService implements BusReserveApi {
	
	@Autowired
	private BusReserveManage busReserveManage;

	@Override
	public HashMap<String, Object> findFooter(BusReserveCondition condition) {
		HashMap<String, Object> footer = busReserveManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public BusReserve load(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BusReserve> list(BusReserveCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageModel findPage(BusReserveCondition condition) {
		return busReserveManage.findMapPage(condition);
	}

	@Override
	public String save(BusReserve domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, Object> getInitData(String customerCode, BusUserDto currUser) {
		HashMap<String, Object> map = busReserveManage.getInitData(customerCode);		
		HashMap<String, Object> headerMap = (HashMap<String, Object>)map.get("header");
		String shopName = currUser.getShopName();
		String shopId = currUser.getShopId();
		headerMap.put("shopId", shopId);
		headerMap.put("shopName", shopName);
		headerMap.put("tradeType", TradeTypeEnum.RESERVE_RACHARGE.getValue());
		headerMap.put("payMode", VipUnpaidPayModeEnum.CASH_PAY.getValue());
		BigDecimal totalPrice = BigDecimal.ZERO;
		BigDecimal consumePrice = BigDecimal.ZERO;
		List<HashMap<String, Object>> details = (List<HashMap<String, Object>>)map.get("details");
		for (HashMap<String, Object> detail : details) {
			Boolean unusual = (Boolean)detail.get("unusual");			
			if(!unusual){
				Short tradeType = Short.valueOf(detail.get("tradeType").toString());
				BigDecimal tradePrice = (BigDecimal)detail.get("tradePrice");
				if(TradeTypeEnum.RESERVE_RACHARGE.getValue().equals(tradeType)){
					totalPrice = totalPrice.add(tradePrice);	
				}else if(TradeTypeEnum.RESERVE_CONSUME.getValue().equals(tradeType)){
					consumePrice = consumePrice.add(tradePrice);	
				}				
			}							
		}
		headerMap.put("totalPrice", totalPrice);
		headerMap.put("consumePrice", consumePrice);
		headerMap.put("enablePrice", totalPrice.add(consumePrice));
		headerMap.put("tradePrice", BigDecimal.ZERO);		
		return map;		
	}

}
