package com.fsun.biz.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.fsun.dao.mapper.BaseMySqlMapper;
import com.fsun.domain.common.PageModel;

/**
 * @author fsun
 * @date 2019年4月24日
 */
public abstract class BaseContrastManage<M extends BaseMySqlMapper<T>, T extends Object> 
		extends BaseReportManage {

	/**
	 * 持久层对象
	 */
	@Autowired
	protected M mapper;
	
	/**
	 * 通过headerId获取明细
	 * @param headerId
	 * @return
	 */
	public List<T> listByHeaderId(String headerId){
		return null;		
	}

	/**
	 * 查询分页数据
	 * @param condition
	 * @return
	 */
	public <C>PageModel findPage(C condition) {
		List<T> list = mapper.selectList(condition);
		return new PageModel(list);
	}
	
	
	/**
	 * 查询分页数据(Map)
	 * @param condition
	 * @return
	 */
	public <C>PageModel findMapPage(C condition) {
		List<HashMap<String, Object>> list = mapper.selectListMap(condition);
		return new PageModel(list);
	}
	
	/**
	 * 获取表单合计行
	 * @param condition
	 * @return
	 */
	public <C>Map<String, Object> findFooter(C condition) {
		return mapper.findFooter(condition);
	}
	
	/**
	 * 导出excel
	 * @param condition
	 * @return
	 */
	public <C>List<HashMap<String, Object>> export(C condition) {
		return mapper.export(condition);
	}
	
}
