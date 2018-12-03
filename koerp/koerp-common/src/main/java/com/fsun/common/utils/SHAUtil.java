package com.fsun.common.utils;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.alibaba.fastjson.JSONObject;

public class SHAUtil {
	/**
	 * @Title: SHA256
	 * @Description: 传入文本内容，返回 SHA-256 串
	 * @param: @param strText
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	public static String SHA256(final String strText) {
		return shaEncode(strText, "SHA-256");
	}

	/**
	 * @Title: SHA512
	 * @Description: 传入文本内容，返回 SHA-512 串
	 * @param: @param strText
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	public static String SHA512(final String strText) {
		return shaEncode(strText, "SHA-512");
	}

	/**
	 * 
	 * @Title: shaEncode
	 * @Description: 哈希加密
	 * @param: @param strText
	 * @param: @param strType
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	public static String shaEncode(final String strText, final String strType) {
		// 返回值
		String strResult = null;

		// 是否是有效字符串
		if (strText != null && strText.length() > 0) {
			try {
				// SHA 加密开始
				// 创建加密对象 并傳入加密類型
				MessageDigest messageDigest = MessageDigest
						.getInstance(strType);
				// 传入要加密的字符串
				messageDigest.update(strText.getBytes(Charset.forName("utf8")));
				// 得到 byte 類型结果
				byte byteBuffer[] = messageDigest.digest();

				// 將 byte 轉換爲 string
				StringBuffer strHexString = new StringBuffer();
				// 遍歷 byte buffer
				for (int i = 0; i < byteBuffer.length; i++) {
					String hex = Integer.toHexString(0xff & byteBuffer[i]);
					if (hex.length() == 1) {
						strHexString.append('0');
					}
					strHexString.append(hex);
				}
				// 得到返回結果
				strResult = strHexString.toString();
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}

		return strResult;
	}

	/**
	 * @Title: countSign
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param: @param forSignList 将url中参数（除了sign）的value值放入该list
	 * @param: @param jsonStr POST请求整个body
	 * @param: @param signKey
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	public static String shaSign(JSONObject json, String signKey) {
		List<String> forSignList = new ArrayList<String>();
		forSignList.add(json.get("appid").toString());
		forSignList.add(json.get("servicename").toString());
		forSignList.add(json.get("version").toString());
		forSignList.add(json.get("jsonBody").toString());
		forSignList.removeAll(Collections.singleton(null));

		// 排序
		java.util.Collections.sort(forSignList);
		StringBuilder sb = new StringBuilder();
		for (String s : forSignList) {
			sb.append(s);
		}
		// 排序后添加签名秘钥
		sb.append(signKey);

		// SHA256计算签名
		return SHA256(sb.toString());
	}

	public static void main(String[] args) {
		JSONObject json = new JSONObject();
		String jsonStr = "{\"body\":{\"requestData\":[{\"CompanyCode\":\"\",\"BillNo\":\"WA1712143010004-1111\",\"ReMark\":\"取消订单\"}]}}";
		json.put("appid", "xsyf5458f5c0f9022db743a7c0710145903");
		json.put("servicename", "ERP.CancelOrderService");
		json.put("version", "1.0");
		json.put("jsobBody", jsonStr);
		System.out.println(shaSign(json, "1"));
	}
}
