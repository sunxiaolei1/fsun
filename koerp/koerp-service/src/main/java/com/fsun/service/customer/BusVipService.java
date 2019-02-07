package com.fsun.service.customer;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.BusVipApi;
import com.fsun.biz.bus.manage.BusVipManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusVipCondition;
import com.fsun.domain.enums.PayModeEnum;
import com.fsun.domain.enums.TradeTypeEnum;
import com.fsun.domain.enums.VipUnpaidPayModeEnum;
import com.fsun.domain.model.BusVip;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.VipException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * 会员卡操作接口
 * @author sunxiaolei
 *
 */
@Service
public class BusVipService implements BusVipApi {
	
	@Autowired
	private BusVipManage busVipManage;
	
	@Override
	public boolean unique(BusVipCondition condition) {
		
		List<BusVip> list = busVipManage.list(condition);
		if(list==null || list.size()==0){
			return true;
		}else if(list.size()==1){			
			if(list.get(0).getId().equals(condition.getId())){
				return true;
			}
		}
		return false;
	}
	
	@Override
	public HashMap<String, Object> initRachargeData(String cardNo, BusUserDto currUser) {
		HashMap<String, Object> map = busVipManage.initRachargeData(cardNo);		
		HashMap<String, Object> headerMap = (HashMap<String, Object>)map.get("header");
		String shopName = currUser.getShopName();
		String shopId = currUser.getShopId();
		headerMap.put("shopId", shopId);
		headerMap.put("shopName", shopName);	
		headerMap.put("tradeType", TradeTypeEnum.VIP_RACHARGE.getValue());
		headerMap.put("payMode", VipUnpaidPayModeEnum.CASH_PAY.getValue());
		return map;
	}
 
	@Override
	public BusVip load(String id) {
		return busVipManage.load(id);
	}

	@Override
	public List<BusVip> list(BusVipCondition condition) {
		return busVipManage.list(condition);
	}

	@Override
	public PageModel findPage(BusVipCondition condition) {
		return busVipManage.findMapPage(condition);
	}

	@Transactional
	@Override
	public String save(BusVip domain, SysUser currentUser) {
		
		BusVipCondition condition = new BusVipCondition();
		condition.setId(domain.getId());
		condition.setCardNo(domain.getCardNo());
		boolean hasUnique= this.unique(condition);
		if(!hasUnique){
			throw new VipException(SCMErrorEnum.BUS_VIP_EXISTED);
		}
		
		//保存数据
		Date now = new Date();
		String id = domain.getId();
		if(id==null || id.equals("")){
			domain.setId(PKMapping.GUUID(PKMapping.bus_vip));
			domain.setEnablePrice(BigDecimal.ZERO);
			domain.setGiftPrice(BigDecimal.ZERO);
			domain.setVipTime(now);			
			domain.setCreatedName(currentUser.getUsername());
			domain.setEnabled(true);
			busVipManage.create(domain);
		}else{
			BusVip busVip = this.load(id);
			if(busVip==null){
				throw new VipException(SCMErrorEnum.BUS_VIP_NOT_EXIST);
			}	
			busVip.setCardType(domain.getCardType());
			busVip.setCardNo(domain.getCardNo());
			busVip.setMobile(domain.getMobile());
			busVip.setCustomerCode(domain.getCustomerCode());
			busVip.setEmail(domain.getEmail());			
			busVip.setMemo(domain.getMemo());
			busVip.setOriginPrecent(domain.getOriginPrecent());
			busVip.setSex(domain.getSex());
			busVip.setWechat(domain.getWechat());
			busVip.setCnName(domain.getCnName());
			busVip.setBrithday(domain.getBrithday());
			busVip.setUpdatedName(currentUser.getUsername());
			busVip.setUpdatedTime(now);
			
			//busVip.setEnablePrice(domain.getEnablePrice());
			busVipManage.update(busVip);
		}
		return domain.getId();
	}

	@Transactional
	@Override
	public int delete(String id) {
		return busVipManage.delete(id);
	}

	@Transactional
	@Override
	public void changeStatus(String[] ids, Boolean enabled, SysUser user) {
		Date now = new Date();
		for (String id : ids) {
			BusVip busVip = this.load(id);
			busVip.setUpdatedName(user.getId());
			busVip.setUpdatedTime(now);
			busVip.setEnabled(enabled);
			busVipManage.update(busVip);
		}
	}

}
