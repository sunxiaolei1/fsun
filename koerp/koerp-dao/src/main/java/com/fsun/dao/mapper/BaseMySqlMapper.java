package com.fsun.dao.mapper;

import java.util.HashMap;
import java.util.List;

/**
 * dao层基类
 * @author sunxiaolei
 *
 * @param <T>
 */
public interface BaseMySqlMapper<T> {
	
	public int deleteByPrimaryKey(Object primaryKey);
	
	public int delete(T record);
	
	public int insert(T record);

    public int insertSelective(T record);

    public T selectByPrimaryKey(Object primaryKey);
    
    public <C>List<T> selectList(C condition);
    
    public <C>List<HashMap<String, Object>> selectListMap(C condition);
    
    /**
	 * 获取表单合计行
	 * @param condition
	 * @return
	 */
	public <C>HashMap<String, Object> findFooter(C condition);
	
	/**
	 * 导出excel
	 * @param condition
	 * @return
	 */
	public <C>List<HashMap<String, Object>> export(C condition);

	public int updateByPrimaryKeySelective(T record);

	public int updateByPrimaryKey(T record);

}
