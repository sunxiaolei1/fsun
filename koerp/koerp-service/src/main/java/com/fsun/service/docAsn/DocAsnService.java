package com.fsun.service.docAsn;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.DocAsnApi;
import com.fsun.biz.bus.manage.DocAsnDetailsManage;
import com.fsun.biz.bus.manage.DocAsnHeaderManage;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.DocAsnDto;
import com.fsun.domain.entity.DocAsnHeaderCondition;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.SysUser;

/**
 * 入库单操作接口
 * @author fsun
 * @date 2018年12月15日
 */
@Service
public class DocAsnService implements DocAsnApi {

	@Autowired
	private DocAsnHeaderManage docAsnHeaderManage;
	
	@Autowired
	private DocAsnDetailsManage docAsnDetailsManage;
	
	@Override
	public DocAsnHeader load(String id) {
		return docAsnHeaderManage.load(id);
	}

	@Override
	public List<DocAsnHeader> list(DocAsnHeaderCondition condition) {
		return docAsnHeaderManage.list(condition);
	}

	@Override
	public PageModel findPage(DocAsnHeaderCondition condition) {
		return docAsnHeaderManage.findMapPage(condition);
	}

	@Override
	public String save(DocAsnHeader domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, Object> loadEntity(String asnNo) {
		return docAsnHeaderManage.loadEntity(asnNo);
	}

	@Override
	public PageModel findListForPage(DocAsnHeaderCondition condition) {
		return docAsnHeaderManage.findPage(condition);
	}

	@Override
	public String saveEntity(DocAsnDto docAsnDto, SysUser user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void changeStatus(String[] asnNos, String status, SysUser user) {
		// TODO Auto-generated method stub

	}

}
