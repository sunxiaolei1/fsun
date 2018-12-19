package com.fsun.biz.bus.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.dao.mapper.DocAsnHeaderMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.DocAsnHeaderCondition;
import com.fsun.domain.model.DocAsnHeader;

/**
 * @author fsun
 * @date 2018年12月15日
 */
@Component
public class DocAsnHeaderManage extends CrudManage<DocAsnHeaderMapper, DocAsnHeader>{

	/**
	 * 获取单个对象
	 * @param asnNo
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String asnNo) {
		return mapper.loadEntity(asnNo);
	}

	/**
	 * 获取列表
	 * @param condition
	 * @return
	 */
	public PageModel findPage(DocAsnHeaderCondition condition) {
		List<DocAsnHeader> list = mapper.selectList(condition);
		return new PageModel(list);
	}

	/**
	 * 根据入库类型生成入库单号
	 * @param asnType
	 * @return
	 */
	public String initAsnNo(String asnType, String shopCode) {
		
		String prefix = DateUtil.getNowDateStr().replace("-", "") + asnType + shopCode;
		List<String> list = mapper.getMaxAsnNo(prefix);
		if(list!=null && list.size()>0){
			String maxAsnNo = list.get(0);
			return (Long.parseLong(maxAsnNo) + 1) + "";
		}else{	
			return prefix + "00001";
		}
	}

}
