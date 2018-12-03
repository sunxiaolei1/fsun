package com.fsun.service.codes;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.base.BasCodesApi;
import com.fsun.biz.common.BasCodesManage;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.BasCodesCondition;
import com.fsun.domain.model.BusBasCodes;
import com.fsun.domain.model.SysUser;
import com.fsun.exception.common.BasCodesException;

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

	@Override
	public String save(BusBasCodes domain, SysUser currentUser) throws BasCodesException {		
		//验证是否重复
		BasCodesCondition qCodesCondition = new BasCodesCondition();
		qCodesCondition.setCodeType(domain.getCodeType());
		qCodesCondition.setCodeCode(domain.getCodeCode());
		qCodesCondition.setUpdateCodeId(domain.getCodeId());
		List<BusBasCodes> codesList = this.list(qCodesCondition);
		if (codesList != null && codesList.size() > 0) {
			throw new BasCodesException("对不起，该数据类别和编码已存在");
		}		
		//保存数据
		Date now = new Date();
		String codeId = domain.getCodeId();
		if(codeId==null || codeId.equals("")){
			domain.setCodeId(StringUtils.getUUID());
			domain.setCreatedName(currentUser.getUsername());
			domain.setCreatedTime(now);
			basCodesManage.create(domain);
		}else{
			BusBasCodes busBasCodes = this.load(codeId);
			if(busBasCodes==null){
				throw new BasCodesException("要更新的数据不存在");
			}			
			busBasCodes.setCodeCode(busBasCodes.getCodeCode());
			busBasCodes.setCodeName(busBasCodes.getCodeName());
			busBasCodes.setCodeType(busBasCodes.getCodeType());
			busBasCodes.setSortCode(busBasCodes.getSortCode());
			busBasCodes.setUserDefine1(busBasCodes.getUserDefine1());
			busBasCodes.setUserDefine2(busBasCodes.getUserDefine2());
			busBasCodes.setUserDefine3(busBasCodes.getUserDefine3());
			busBasCodes.setUpdatedName(currentUser.getUsername());
			busBasCodes.setUpdatedTime(now);
			basCodesManage.update(domain);
		}
		return domain.getCodeId();
	}

	@Override
	public int delete(String id) {
		return basCodesManage.delete(id);
	}

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
