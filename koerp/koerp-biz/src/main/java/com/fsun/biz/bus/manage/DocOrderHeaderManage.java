package com.fsun.biz.bus.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.dao.mapper.DocOrderHeaderMapper;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.entity.DocOrderHeaderCondition;
import com.fsun.domain.model.DocOrderHeader;

/**
 * @author fsun
 * @date 2018年12月15日
 */
@Component
public class DocOrderHeaderManage extends CrudManage<DocOrderHeaderMapper, DocOrderHeader>{

	/**
	 * 根据出库类型生成出库单号
	 * @param orderType
	 * @param shopCode
	 * @return
	 */
	public String initOrderNo(String orderType, String shopCode) {
		String prefix = DateUtil.getNowDateStr().replace("-", "") + orderType + shopCode;
		List<String> list = mapper.getMaxOrderNo(prefix);
		if(list!=null && list.size()>0){
			String maxOrderNo = list.get(0);
			return (Long.parseLong(maxOrderNo) + 1) + "";
		}else{	
			return prefix + "00001";
		}
	}

	
	/**
	 * 
	 * @param condition
	 * @return
	 */
	public PageModel findPage(DocOrderHeaderCondition condition) {
		List<DocOrderHeader> list = mapper.selectList(condition);
		return new PageModel(list);
	}

	/**
	 * 
	 * @param orderNo
	 * @return
	 */
	public HashMap<String, Object> loadEntity(String orderNo) {
		return mapper.loadEntity(orderNo);
	}

	
}
