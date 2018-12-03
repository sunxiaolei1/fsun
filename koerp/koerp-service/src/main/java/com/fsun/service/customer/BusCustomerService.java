package com.fsun.service.customer;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.BusCustomerApi;
import com.fsun.biz.bus.manage.BusCustomerManage;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusCustomerCondition;
import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.CustomerException;

/**
 * 
 * @author sunxiaolei
 *
 */
@Service
public class BusCustomerService implements BusCustomerApi {
	
	@Autowired
	private BusCustomerManage busCustomerManage;

	@Override
	public BusCustomer load(String id) {
		return busCustomerManage.load(id);
	}

	@Override
	public List<BusCustomer> list(BusCustomerCondition condition) {
		return busCustomerManage.list(condition);
	}

	@Override
	public PageModel findPage(BusCustomerCondition condition) {
		return busCustomerManage.findMapPage(condition);
	}

	@Override
	public String save(BusCustomer domain, SysUser currentUser) {
		//保存数据
		Date now = new Date();
		String id = domain.getId();
		if(id==null || id.equals("")){
			domain.setId(StringUtils.getUUID());
			String customerCode = busCustomerManage.initCustomerCode(domain.getCustomerType());
			domain.setCustomerCode(customerCode);
			domain.setCreditPrice(BigDecimal.ZERO);
			domain.setEnabled(true);
			domain.setCreatedId(currentUser.getUsername());
			domain.setCreatedTime(now);
			busCustomerManage.create(domain);
		}else{
			BusCustomer busCustomer = this.load(id);
			if(busCustomer==null){
				throw new CustomerException("客户不存在");
			}				
			busCustomer.setCustomerName(domain.getCustomerName());
			busCustomer.setContacts(domain.getContacts());
			busCustomer.setAddress(domain.getAddress());
			busCustomer.setTel(domain.getTel());
			busCustomer.setMemo(domain.getMemo());
			busCustomer.setSalesman(domain.getSalesman());			
			busCustomer.setUpdatedId(currentUser.getUsername());
			busCustomer.setUpdatedTime(now);			
			busCustomerManage.update(domain);
		}
		return domain.getId();
	}

	@Override
	public int delete(String id) {
		return busCustomerManage.delete(id);
	}

	@Override
	public void changeStatus(String[] ids, Boolean enabled) {
		for (String id : ids) {
			BusCustomer busCustomer = this.load(id);
			busCustomer.setEnabled(enabled);
			busCustomerManage.update(busCustomer);
		}
	}

}
