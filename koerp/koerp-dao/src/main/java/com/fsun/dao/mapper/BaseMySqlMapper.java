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
	
	int deleteByPrimaryKey(Object primaryKey);
	
	int delete(T record);
	
    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Object primaryKey);
    
    <C>List<T> selectList(C condition);
    
    <C>List<HashMap<String, Object>> selectListMap(C condition);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);

}
