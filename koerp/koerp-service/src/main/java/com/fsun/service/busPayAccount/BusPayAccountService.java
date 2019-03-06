package com.fsun.service.busPayAccount;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.BusPayAccountApi;
import com.fsun.biz.bus.manage.BusPayAccountManage;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusPayAccountCondition;
import com.fsun.domain.model.BusPayAccount;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2019年3月6日
 */
@Service
public class BusPayAccountService implements BusPayAccountApi{
	
	@Autowired
	private BusPayAccountManage payAccountManage;

	@Override
	public HashMap<String, Object> findFooter(BusPayAccountCondition condition) {
		return payAccountManage.findFooter(condition);
	}

	@Override
	public BusPayAccount load(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String save(BusPayAccount domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BusPayAccount> list(BusPayAccountCondition condition) {
		return payAccountManage.list(condition);
	}

	@Override
	public PageModel findPage(BusPayAccountCondition condition) {
		return payAccountManage.findMapPage(condition);
	}

}
