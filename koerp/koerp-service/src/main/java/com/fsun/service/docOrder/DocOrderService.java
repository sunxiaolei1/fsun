package com.fsun.service.docOrder;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.DocOrderApi;
import com.fsun.biz.bus.manage.DocOrderDetailsManage;
import com.fsun.biz.bus.manage.DocOrderHeaderManage;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.DocOrderDto;
import com.fsun.domain.entity.DocOrderHeaderCondition;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.domain.model.SysUser;

/**
 * 出库单操作接口
 * @author fsun
 * @date 2018年12月15日
 */
@Service
public class DocOrderService implements DocOrderApi {
	
	@Autowired
	private DocOrderHeaderManage docOrderHeaderManage;
	
	@Autowired
	private DocOrderDetailsManage docOrderDetailsManage;

	@Override
	public DocOrderHeader load(String id) {
		return docOrderHeaderManage.load(id);
	}

	@Override
	public List<DocOrderHeader> list(DocOrderHeaderCondition condition) {
		return docOrderHeaderManage.list(condition);
	}

	@Override
	public PageModel findPage(DocOrderHeaderCondition condition) {
		return docOrderHeaderManage.findMapPage(condition);
	}

	@Override
	public String save(DocOrderHeader domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PageModel findListForPage(DocOrderHeaderCondition condition) {
		return docOrderHeaderManage.findPage(condition);
	}

	@Override
	public void changeStatus(String[] orderNos, String status, SysUser user) {
		// TODO Auto-generated method stub

	}

	@Override
	public HashMap<String, Object> loadEntity(String orderNo) {		
		return docOrderHeaderManage.loadEntity(orderNo);
	}

	@Override
	public String saveEntity(DocOrderDto docOrderDto, SysUser user) {
		// TODO Auto-generated method stub
		return null;
	}

}
