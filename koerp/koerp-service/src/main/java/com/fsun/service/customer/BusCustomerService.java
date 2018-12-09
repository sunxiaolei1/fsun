package com.fsun.service.customer;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.bus.BusCustomerApi;
import com.fsun.biz.bus.manage.BusCustomerManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusCustomerCondition;
import com.fsun.domain.model.BusCustomer;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.bus.BasSkuException;
import com.fsun.exception.bus.CustomerException;
import com.fsun.exception.enums.SCMErrorEnum;

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
	public boolean unique(BusCustomerCondition condition) {
		List<BusCustomer> list = busCustomerManage.list(condition);
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

	@Transactional
	@Override
	public String save(BusCustomer domain, SysUser currentUser) {
		
		BusCustomerCondition condition = new BusCustomerCondition();
		condition.setId(domain.getId());
		condition.setCustomerName(domain.getCustomerName());
		boolean hasUnique= this.unique(condition);
		if(!hasUnique){
			throw new BasSkuException(SCMErrorEnum.BUS_CUSTOMER_EXISTED);
		}
		
		//保存数据
		Date now = new Date();
		String id = domain.getId();
		if(id==null || id.equals("")){
			domain.setId(PKMapping.GUUID(PKMapping.bus_customer));
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
				throw new CustomerException(SCMErrorEnum.BUS_CUSTOMER_NOT_EXIST);
			}				
			busCustomer.setCustomerName(domain.getCustomerName());
			busCustomer.setContacts(domain.getContacts());
			busCustomer.setAddress(domain.getAddress());
			busCustomer.setTel(domain.getTel());
			busCustomer.setMemo(domain.getMemo());
			busCustomer.setSalesman(domain.getSalesman());			
			busCustomer.setUpdatedId(currentUser.getUsername());
			busCustomer.setUpdatedTime(now);			
			busCustomerManage.update(busCustomer);
		}
		return domain.getId();
	}

	@Transactional
	@Override
	public int delete(String id) {
		return busCustomerManage.delete(id);
	}

	@Transactional
	@Override
	public void changeStatus(String[] ids, Boolean enabled, SysUser user) {
		
		Date now = new Date();
		for (String id : ids) {
			BusCustomer busCustomer = this.load(id);
			busCustomer.setEnabled(enabled);
			busCustomer.setUpdatedId(user.getId());
			busCustomer.setUpdatedTime(now);
			busCustomerManage.update(busCustomer);
		}
	}

}
