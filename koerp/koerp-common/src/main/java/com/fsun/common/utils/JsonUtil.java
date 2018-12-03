package com.fsun.common.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

/**
 * 
 * @ClassName: JsonUtil
 * @Description:对象与json的处理工具
 * @author: wuchulin
 * @date: 2017年12月13日 下午2:04:04
 */
public class JsonUtil {

	// 默认日期格式
	public static final String DEFFAULT_DATE_FORMAT = "yyyy-MM-dd";

	/**
	 * 
	 * @Title: objectToJSONString
	 * @Description: 对象转成jsonString
	 * @param: @param object
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	public static String objectToJSONString(Object object) {
		return JSON.toJSONString(object);
	}

	/**
	 * 
	 * @Title: objectToSONString
	 * @Description: 对象转成jsonString, 处理时间格式
	 * @param: @param object
	 * @param: @param format
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	public static String toJSONStringFormatDate(Object object) {
		// 修改全局的全局日期格式
		JSON.DEFFAULT_DATE_FORMAT = DEFFAULT_DATE_FORMAT;
		return JSON.toJSONString(object,
				SerializerFeature.WriteDateUseDateFormat);
	}

	/**
	 * 
	 * @Title: objectToSONString
	 * @Description: 对象转成jsonString, 处理时间格式
	 * @param: @param object
	 * @param: @param format
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	public static String toJSONStringFormatDate(Object object, String format) {
		// 修改全局的全局日期格式
		JSON.DEFFAULT_DATE_FORMAT = format;
		return JSON.toJSONString(object,
				SerializerFeature.WriteDateUseDateFormat);
	}
}
