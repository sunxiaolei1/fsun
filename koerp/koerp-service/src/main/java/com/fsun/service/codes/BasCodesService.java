package com.fsun.service.codes;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.api.base.BasCodesApi;
import com.fsun.biz.common.BasCodesManage;
import com.fsun.common.utils.PKMapping;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BasCodesCondition;
import com.fsun.domain.model.BusBasCodes;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.common.BasCodesException;
import com.fsun.exception.enums.SCMErrorEnum;

@Service
public class BasCodesService implements BasCodesApi {

	@Autowired
	private BasCodesManage basCodesManage;
	
	@Override
	public BusBasCodes load(String id) {
		return basCodesManage.load(id);
	}

	@Override
	public List<BusBasCodes> list(BasCodesCondition condition) {
		return basCodesManage.list(condition);
	}

	@Override
	public PageModel findPage(BasCodesCondition condition) {
		return basCodesManage.findMapPage(condition);
	}

	@Transactional
	@Override
	public String save(BusBasCodes domain, SysUser currentUser) throws BasCodesException {		
		//验证是否重复
		BasCodesCondition qCodesCondition = new BasCodesCondition();
		qCodesCondition.setCodeType(domain.getCodeType());
		qCodesCondition.setCodeCode(domain.getCodeCode());
		qCodesCondition.setUpdateCodeId(domain.getCodeId());
		List<BusBasCodes> codesList = this.list(qCodesCondition);
		if (codesList != null && codesList.size() > 0) {
			throw new BasCodesException(SCMErrorEnum.BUS_CODES_EXISTED);
		}		
		//保存数据
		Date now = new Date();
		String codeId = domain.getCodeId();
		if(codeId==null || codeId.equals("")){
			domain.setCodeId(PKMapping.GUUID(PKMapping.bus_bas_codes));
			domain.setCreatedName(currentUser.getUsername());
			domain.setCreatedTime(now);
			basCodesManage.create(domain);
		}else{
			BusBasCodes busBasCodes = this.load(codeId);
			if(busBasCodes==null){
				throw new BasCodesException(SCMErrorEnum.BUS_CODES_NOT_EXIST);
			}			
			busBasCodes.setCodeCode(domain.getCodeCode());
			busBasCodes.setCodeName(domain.getCodeName());
			busBasCodes.setCodeType(domain.getCodeType());
			busBasCodes.setSortCode(domain.getSortCode());
			busBasCodes.setUserDefine1(domain.getUserDefine1());
			busBasCodes.setUserDefine2(domain.getUserDefine2());
			busBasCodes.setUserDefine3(domain.getUserDefine3());
			busBasCodes.setUpdatedName(currentUser.getUsername());
			busBasCodes.setUpdatedTime(now);
			basCodesManage.update(busBasCodes);
		}
		return domain.getCodeId();
	}

	@Transactional
	@Override
	public int delete(String id) {
		return basCodesManage.delete(id);
	}

	@Transactional
	@Override
	public void deletes(String[] ids) {		
		for (String id : ids) {
			this.delete(id);
		}
	}

	@Override
	public List<String> findCodeType() {
		return basCodesManage.findCodeType();
	}

}
