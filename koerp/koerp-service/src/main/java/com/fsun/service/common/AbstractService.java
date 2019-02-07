package com.fsun.service.common;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fsun.domain.dto.RulPriceTreeDto;
import com.fsun.domain.model.BusRulPrice;

/**
 * 超类
 * @author fsun
 *
 */
public abstract class AbstractService {
	
	/**
	 * 获取子节点
	 * @param tree
	 * @param list
	 */
	protected void addChildren(RulPriceTreeDto parentNode, List<BusRulPrice> list) {
		List<RulPriceTreeDto> childrenNode = new ArrayList<>();
		for (BusRulPrice rulPrice : list) {		
			RulPriceTreeDto childNode = new RulPriceTreeDto();
			childNode.setId(rulPrice.getRulId());
			childNode.setText(rulPrice.getRulName());
			childNode.setState("open");				
			childNode.setIconCls("icon-house");				
			childrenNode.add(childNode);			
		}
		parentNode.setChildren(childrenNode);
	}
	
	/**
	 * 获得后几天的时间
	 * @param d
	 * @param day
	 * @return
	 */
	protected Date getDateAfter(Date currDate, int day) {  
        Calendar now = Calendar.getInstance();  
        now.setTime(currDate);  
        now.set(Calendar.DATE, now.get(Calendar.DATE) + day);  
        return now.getTime();  
    }
	
	/**
     * 实体对象转成Map
     * @param obj 实体对象
     * @return
     */
    public static Map<String, Object> object2Map(Object obj) {
        Map<String, Object> map = new HashMap<>();
        if (obj == null) {
            return map;
        }
        Class<?> clazz = obj.getClass();
        Field[] fields = clazz.getDeclaredFields();
        try {
            for (Field field : fields) {
                field.setAccessible(true);
                map.put(field.getName(), field.get(obj));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
    
    /**
     * Map转成实体对象
     * 注意: 如果要转换的map是从页面直接传过来的,
     * js是弱语言所以数字类型到后台只能是Integer或Float类型,当对象中出现short类型无法转换
     * @param map map实体对象包含属性
     * @param clazz 实体对象类型
     * @return
     */
    public static Object map2Object(Map<String, Object> map, Class<?> clazz) {
        if (map == null) {
            return null;
        }
        Object obj = null;
        try {
            obj = clazz.newInstance();

            Field[] fields = obj.getClass().getDeclaredFields();
            for (Field field : fields) {
            	if(field.getName().equals("isenabled")){
            		System.out.println(field.getName());
            	}
                int mod = field.getModifiers();
                if (Modifier.isStatic(mod) || Modifier.isFinal(mod)) {
                    continue;
                }
                field.setAccessible(true);                
                field.set(obj, map.get(field.getName()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return obj;
    }
    
    
    
    /** 
     * 将Map对象通过反射机制转换成Bean对象 (页面传值也适用) 
     * @param map 存放数据的map对象 
     * @param clazz 待转换的class 
     * @return 转换后的Bean对象 
     * @throws Exception 异常 
     */  
	public static Object mapToBean(Map<String, Object> map, Class<?> clazz) throws Exception {  
        Object obj = clazz.newInstance();  
        if(map != null && map.size() > 0) {  
            for(Map.Entry<String, Object> entry : map.entrySet()) {  
                String propertyName = entry.getKey();       //属性名
                Object value = entry.getValue();  
                String setMethodName = "set"  
                        + propertyName.substring(0, 1).toUpperCase()
                        + propertyName.substring(1);  
                Field field = getClassField(clazz, propertyName);  
                if(field==null)
                	continue;
                Class<?> fieldTypeClass = field.getType();  
                value = convertValType(value, fieldTypeClass); 
                try{               	
                	clazz.getMethod(setMethodName, field.getType()).invoke(obj, value); 
                }catch(NoSuchMethodException e){
                	e.printStackTrace();
                }
            }  
        }  
        return obj;  
    }
	
	/** 
     * 获取指定字段名称查找在class中的对应的Field对象(包括查找父类) 
     *  
     * @param clazz 指定的class 
     * @param fieldName 字段名称 
     * @return Field对象 
     */  
    private static Field getClassField(Class<?> clazz, String fieldName) {  
        if( Object.class.getName().equals(clazz.getName())) {  
            return null;  
        }  
        Field []declaredFields = clazz.getDeclaredFields();  
        for (Field field : declaredFields) {  
            if (field.getName().equals(fieldName)) {  
                return field;  
            }  
        }  
  
        Class<?> superClass = clazz.getSuperclass();  
        if(superClass != null) {// 简单的递归一下  
            return getClassField(superClass, fieldName);  
        }  
        return null;  
    }   
	
	 /** 
     * 将Object类型的值，转换成bean对象属性里对应的类型值 
     *  
     * @param value Object对象值 
     * @param fieldTypeClass 属性的类型 
     * @return 转换后的值 
     */  
    private static Object convertValType(Object value, Class<?> fieldTypeClass) {  
        
    	Object retVal = null;  
        if(value==null){
    		return retVal;
    	}
        
        if(Long.class.getName().equals(fieldTypeClass.getName())  
                || long.class.getName().equals(fieldTypeClass.getName())) {  
            retVal = Long.parseLong(value.toString());  
        } else if(Short.class.getName().equals(fieldTypeClass.getName())  
                || short.class.getName().equals(fieldTypeClass.getName())) {  
            retVal = Short.parseShort(value.toString());  
        } else if(Integer.class.getName().equals(fieldTypeClass.getName())  
                || int.class.getName().equals(fieldTypeClass.getName())) {  
            retVal = Integer.parseInt(value.toString());  
        } else if(Float.class.getName().equals(fieldTypeClass.getName())  
                || float.class.getName().equals(fieldTypeClass.getName())) {  
            retVal = Float.parseFloat(value.toString());  
        } else if(Double.class.getName().equals(fieldTypeClass.getName())  
                || double.class.getName().equals(fieldTypeClass.getName())) {  
            retVal = Double.parseDouble(value.toString());  
        } else if(BigDecimal.class.getName().equals(fieldTypeClass.getName())) {  
        	retVal = BigDecimal.valueOf(Double.parseDouble(value.toString())); 
        } else {  
            retVal = value;  
        }  
        
        return retVal;  
    }  
	
}
