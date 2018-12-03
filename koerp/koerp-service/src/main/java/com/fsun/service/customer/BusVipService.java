package com.fsun.service.customer;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.BusVipApi;
import com.fsun.biz.bus.manage.BusVipManage;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusVipCondition;
import com.fsun.domain.model.BusVip;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.VipException;

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

	@Override
	public String save(BusVip domain, SysUser currentUser) {
		//保存数据
		Date now = new Date();
		String id = domain.getId();
		if(id==null || id.equals("")){
			domain.setId(StringUtils.getUUID());
			domain.setEnablePrice(BigDecimal.ZERO);
			domain.setVipTime(now);
			domain.setCreatedName(currentUser.getUsername());
			domain.setEnabled(true);
			busVipManage.create(domain);
		}else{
			BusVip busVip = this.load(id);
			if(busVip==null){
				throw new VipException("会员卡不存在");
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
			busVipManage.update(domain);
		}
		return domain.getId();
	}

	@Override
	public int delete(String id) {
		return busVipManage.delete(id);
	}

	@Override
	public void changeStatus(String[] ids, Boolean enabled) {
		for (String id : ids) {
			BusVip busVip = this.load(id);
			busVip.setEnabled(enabled);
			busVipManage.update(busVip);
		}
	}

}
