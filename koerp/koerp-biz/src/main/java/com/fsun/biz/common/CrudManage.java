package com.fsun.biz.common;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.fsun.dao.mapper.BaseMySqlMapper;
import com.fsun.domain.common.PageModel;

/***
 * 查询基类
 * @author sunxiaolei
 * @param <T> 指对应插入或返回的对象类型 model
 * @param <M> 指对应的mapper
 * @param <C> 指对应的查询条件
 */
public abstract class CrudManage <M extends BaseMySqlMapper<T>, T extends Object> extends BaseManage{

	/**
	 * 持久层对象
	 */
	@Autowired
	protected M mapper;

	/**
	 * 根据主键获取单条数据
	 *
	 * @param id
	 * @return
	 */
	public T load(String id) {
		return mapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 获取对象
	 * @param id
	 * @return
	 */
	public HashMap<String, Object> loadEntity(Object id) {
		return mapper.loadEntity(id);
	}

	/**
	 * 查询列表数据
	 *
	 * @param condition
	 * @return
	 */
	public <C>List<T> list(C condition) {
		return mapper.selectList(condition);
	}
	
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
	public <C>HashMap<String, Object> findFooter(C condition) {
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
	
	/**
	 * 插入对象
	 *
	 * @param entity
	 */
	public int create(T domain) {		
		return mapper.insert(domain);		
	}

	/**
	 * 属性非空更新对象
	 * @param entity
	 */
	public int update(T domain) {		
		return mapper.updateByPrimaryKeySelective(domain);		
	}
	
	/**
	 * 更新对象所有属性
	 * @param entity
	 */
	public int updateEach(T domain) {		
		return mapper.updateByPrimaryKey(domain);		
	}

	/**
	 * 删除数据
	 *
	 * @param entity
	 */
	public int delete(String id) {
		return mapper.deleteByPrimaryKey(id);
	}

	
	/**
	 * 批量删除数据
	 * @param entitys
	 */
	@Transactional
	public void deleteAll(Collection<T> entitys) {
		for (T entity : entitys) {
			mapper.delete(entity);
		}
	}
	
}
