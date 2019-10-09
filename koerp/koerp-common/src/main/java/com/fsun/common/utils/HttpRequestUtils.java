package com.fsun.common.utils;

import java.io.IOException;
import java.net.URLDecoder;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

@SuppressWarnings("deprecation")
public class HttpRequestUtils {

	public static void main(String[] args) {

		String token = MD5Utils.md5Encode("xsyf5458f5c0f9022db743a7c0710145903"
				+ "1" + "MD5" + "1.0" + "ERP.PushProductsService");

		StringBuffer sb = new StringBuffer();
		sb.append("{\"appKey\": \"xsyf5458f5c0f9022db743a7c0710145903\",");
		sb.append("\"serviceName\": \"ERP.PushProductsService\",");
		sb.append("\"token\": \"" + token + "\",");
		sb.append("\"v\": \"1.0\",");
		sb.append("\"sign\": \"MD5\",");
		sb.append("\"std_data\": {");
		sb.append("\"parameter\": {");
		sb.append("\"requestData\": [{");
		sb.append("\"MaterialCode\": \"010101000100\",");
		sb.append("\"SizeCode\": \"35\",");
		sb.append("\"MaterialShortName\": \"耐克\",");
		sb.append("\"SizeName\": \"35码\",");
		sb.append("\"SKU\": \"0101010001\",");
		sb.append("\"SKUType\": \"\",");
		sb.append("\"Price\": \"399\",");
		sb.append("\"CostPrice\": \"199\",");
		sb.append("\"CardCode\": \"NIKE\",");
		sb.append("\"CardName\": \"耐克\",");
		sb.append("\"ColorCode\": \"blue\",");
		sb.append("\"Color\": \"蓝色\",");
		sb.append("\"SaleDate\": \"2018-01-01\",");
		sb.append("\"Year\": \"2018\",");
		sb.append("\"SeasonCode\": \"summer\",");
		sb.append("\"Season\": \"夏季\",");
		sb.append("\"Decription\": \"测试测试测试测试测试测试测试\",");
		sb.append("\"SexCode\": \"F\",");
		sb.append("\"SexName\": \"女性\",");
		sb.append("\"Location\": \"10\",");
		sb.append("\"ReceiveTime\": \"2017-12-04\",");
		sb.append("\"KindCode\": \"\",");
		sb.append("\"KindName\": \"\",");
		sb.append("\"ItemCode\": \"\",");
		sb.append("\"ItemName\": \"\",");
		sb.append("\"ModelCode\": \"\",");
		sb.append("\"ModelName\": \"\",");
		sb.append("\"IsSuit\": \"false\",");
		sb.append("\"SupplierCode\": \"\",");
		sb.append("\"SupplierName\": \"\",");
		sb.append("\"ERPModifyTime\": \"2017-12-01\",");
		sb.append("\"AddWho\": \"service\",");
		sb.append("\"AddDate\": \"2017-12-04\",");
		sb.append("\"EditWho\": \"service\",");
		sb.append("\"EditDate\": \"2017-12-04\",");
		sb.append("\"IsEnable\": \"true\"");
		sb.append("}]}}}");

		System.out.println("-----------------------------" + sb.toString());
		JSONObject jsonParam = JSON.parseObject(sb.toString());
		System.out.println("-----------------------------" + jsonParam);
		HttpRequestUtils.httpPost(
				"http://edi.ningruisoft.com:58997/restDispatch", null,
				jsonParam);
	}

	private static Logger logger = Logger.getLogger(HttpRequestUtils.class);

	/**
	 * httpPost
	 * 
	 * @param url
	 *            路径
	 * @param jsonParam
	 *            参数
	 * @return
	 */
	public static JSONObject httpPost(String url, JSONObject headerParam,
			JSONObject bodyParam) {
		return httpPost(url, headerParam, JSON.toJSONString(bodyParam), false);
	}
	
	/**
	 * httpPost
	 * 
	 * @param url
	 *            路径
	 * @param jsonParam
	 *            参数
	 * @return
	 */
	public static JSONObject httpPost(String url, String headerString,
			String jsonString) {
		JSONObject headerParam = (JSONObject) JSON.parseObject(headerString);
		// JSONObject bodyParam = (JSONObject) JSON.parseObject(jsonString);
		// //delete by melvin
		return httpPost(url, headerParam, jsonString, false);
	}

	/**
	 * post请求
	 * 
	 * @param url
	 *            url地址
	 * @param jsonParam
	 *            参数
	 * @param noNeedResponse
	 *            不需要返回结果
	 * @return
	 */
	public static JSONObject httpPost(String url, JSONObject headerParam,
			String bodyParam, boolean noNeedResponse) {
		logger.info("-------------------url:" + url);
		logger.info("-------------------bodyParam:" + bodyParam);
		// post请求返回结果
		DefaultHttpClient httpClient = new DefaultHttpClient();
		JSONObject jsonResult = null;
		HttpPost httppost = new HttpPost(url);
		try {
			if (null != headerParam) {
				// 添加头部信息
				httppost.addHeader("Content-Type",
						"application/json;charset=UTF-8");
				httppost.addHeader("verifycode",
						headerParam.getString("verifycode"));
			}

			if (null != bodyParam) {
				// 解决中文乱码问题
				StringEntity entity = new StringEntity(bodyParam.toString(),
						"utf-8");
				entity.setContentEncoding("UTF-8");
				entity.setContentType("application/json");
				httppost.setEntity(entity);
			}

			HttpResponse result = httpClient.execute(httppost);
			url = URLDecoder.decode(url, "UTF-8");
			// 请求发送成功，并得到响应
			if (result.getStatusLine().getStatusCode() == 200) {
				String str = "";
				try {
					// 读取服务器返回过来的json字符串数据
					str = EntityUtils.toString(result.getEntity());
					if (noNeedResponse) {
						return null;
					}

					// 把json字符串转换成json对象
					jsonResult = (JSONObject) JSON.parseObject(str);
					logger.info("-------------------请求返回:" + jsonResult);
				} catch (Exception e) {
					e.printStackTrace();
					logger.error("post请求提交失败:" + url, e);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("post请求提交失败:" + url, e);
		}
		return jsonResult;
	}

	/**
	 * 发送get请求
	 * 
	 * @param url
	 *            路径
	 * @return
	 */
	public static JSONObject httpGet(String url) {
		// get请求返回结果
		JSONObject jsonResult = null;
		try {
			DefaultHttpClient client = new DefaultHttpClient();
			// 发送get请求
			HttpGet request = new HttpGet(url);
			HttpResponse response = client.execute(request);

			/** 请求发送成功，并得到响应 **/
			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				/** 读取服务器返回过来的json字符串数据 **/
				String strResult = EntityUtils.toString(response.getEntity());
				/** 把json字符串转换成json对象 **/
				jsonResult = (JSONObject) JSON.parseObject(strResult);
				url = URLDecoder.decode(url, "UTF-8");
			} else {
				logger.error("get请求提交失败:" + url);
			}
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("get请求提交失败:" + url, e);
		}
		return jsonResult;
	}
}
