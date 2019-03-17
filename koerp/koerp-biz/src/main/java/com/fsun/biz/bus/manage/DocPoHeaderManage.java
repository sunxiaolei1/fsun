package com.fsun.biz.bus.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.dao.mapper.DocPoHeaderMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.DocPoHeaderCondition;
import com.fsun.domain.model.DocPoHeader;

/**
 * @author fsun
 * @date 2019年3月16日
 */
@Component
public class DocPoHeaderManage extends CrudManage<DocPoHeaderMapper, DocPoHeader>{

	/**
	 * 初始化申请单号
	 * @param poType
	 * @param shopCode
	 * @return
	 */
	public String initPoNo(String poType, String shopCode) {
		String prefix = DateUtil.getNowDateStr().replace("-", "") + poType + shopCode;
		List<String> list = mapper.getMaxPoNo(prefix);
		if(list!=null && list.size()>0){
			String maxPoNo = list.get(0);
			return (Long.parseLong(maxPoNo) + 1) + "";
		}else{	
			return prefix + "00001";
		}
	}

	/**
	 * 
	 * @param condition
	 * @return
	 */
	public PageModel findPage(DocPoHeaderCondition condition) {
		List<DocPoHeader> list = mapper.selectList(condition);
		return new PageModel(list);
	}

	/**
	 * 
	 * @param orderNo
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String poNo) {
		return mapper.loadEntity(poNo);
	}
}
