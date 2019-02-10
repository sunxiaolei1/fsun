package com.fsun.service.accessLog;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.BusAccessLogApi;
import com.fsun.biz.bus.manage.BusAccessLogManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BusAccessLogCondition;
import com.fsun.domain.model.BusAccessLog;
import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2019年2月10日
 */
@Service
public class BusAccessLogService implements BusAccessLogApi {
	
	@Autowired
	private BusAccessLogManage busAccessLogManage;

	@Override
	public BusAccessLog load(String id) {
		return busAccessLogManage.load(id);
	}

	@Override
	public List<BusAccessLog> list(BusAccessLogCondition condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageModel findPage(BusAccessLogCondition condition) {
		return busAccessLogManage.findMapPage(condition);
	}

	@Override
	public String save(BusAccessLog domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		return busAccessLogManage.delete(id);
	}

	@Override
	public void create(BusAccessLogCondition condition) {		
		Date now = new Date();
		BusAccessLog domain = new BusAccessLog();
		domain.setCreatedTime(condition.getCreatedTime());
		domain.setErrorMsg(condition.getErrorMsg());
		domain.setExt0(condition.getExt0());
		domain.setId(PKMapping.GUUID(PKMapping.bus_access_log));
		domain.setIp(condition.getIp());
		domain.setRequestId(condition.getRequestId());
		domain.setRequestJson(condition.getRequestJson());
		domain.setRequestStatus(condition.getRequestStatus());
		domain.setRequestType(condition.getRequestType());
		long period = now.getTime()-domain.getCreatedTime().getTime();
		domain.setSpendTime(Long.valueOf(period/1000).shortValue());
		busAccessLogManage.create(domain);
	}

}
