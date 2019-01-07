package com.fsun.common.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

public class StringUtils {
	/**
	 * 获取唯一Id
	 *
	 * @return
	 */
	public static String getUUID() {
		String uuid = UUID.randomUUID().toString();
		return uuid.toUpperCase().replace("-", "");
	}

	/**
	 * 检查指定的字符串是否为空。
	 * <ul>
	 * <li>SysUtils.isEmpty(null) = true</li>
	 * <li>SysUtils.isEmpty("") = true</li>
	 * <li>SysUtils.isEmpty("   ") = true</li>
	 * <li>SysUtils.isEmpty("abc") = false</li>
	 * </ul>
	 *
	 * @param value
	 *            待检查的字符串
	 * @return true/false
	 */
	public static boolean isEmpty(String value) {
		int strLen = 0;
		if (value == null || (strLen = value.length()) == 0) {
			return true;
		}
		for (int i = 0; i < strLen; i++) {
			if ((Character.isWhitespace(value.charAt(i)) == false)) {
				return false;
			}
		}
		return true;
	}

	public static String generateVarcharPrimaryKey() {
		SimpleDateFormat time = new SimpleDateFormat("yyyyMMddHHmmss");
		String key = time.format(new Date()) + UUID.randomUUID().toString().split("-")[4];
		return key;
	}

	public static List<String> split(String str) {
		List<String> result = new ArrayList<String>();
		if (!isEmpty(str)) {
			String[] temp = str.split(",");
			for (String string : temp) {
				if (!isEmpty(string)) {
					result.add(string);
				}
			}
		}
		return result;
	}

	public static String md5Encode(String inStr) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		byte[] byteArray = null;
		try {
			byteArray = inStr.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = md5Bytes[i] & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}

	/**
	 * 会员卡号生成规则
	 *
	 * @param merchantNum
	 *            商户号 (现在传8)
	 * @param activeNum
	 *            活动编号 (001)
	 * @return 会员卡号
	 */
	public static String getPosVipCardNum(String merchantNum, String activeNum) {
		StringBuilder card = new StringBuilder();
		card.append(merchantNum);
		card.append(activeNum);
		Random random = new Random();
		int nextInt = random.nextInt(10000000);
		String randomNum = org.apache.commons.lang3.StringUtils.leftPad(nextInt + "", 7, "0");
		card.append(randomNum);
		return card.toString();
	}

	/**
	 * 手机号验证
	 */
	public static boolean validatePhone(String phone) throws PatternSyntaxException {
		return isChinaPhoneLegal(phone) || isHKPhoneLegal(phone);
	}

	/**
	 * 大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数 此方法中前三位格式有： 13+任意数 15+除4的任意数 18+除1和4的任意数
	 * 17+除9的任意数 147
	 */
	public static boolean isChinaPhoneLegal(String str) throws PatternSyntaxException {
		String regExp = "^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$";
		Pattern p = Pattern.compile(regExp);
		Matcher m = p.matcher(str);
		return m.matches();
	}

	/**
	 * 香港手机号码8位数，5|6|8|9开头+7位任意数
	 */
	public static boolean isHKPhoneLegal(String str) throws PatternSyntaxException {
		String regExp = "^(5|6|8|9)\\d{7}$";
		Pattern p = Pattern.compile(regExp);
		Matcher m = p.matcher(str);
		return m.matches();
	}

	/**
	 * 校验银行账号 
      	校验过程： 
      1、从卡号最后一位数字开始，逆向将奇数位(1、3、5等等)相加。 
      2、从卡号最后一位数字开始，逆向将偶数位数字，先乘以2（如果乘积为两位数，将个位十位数字相加，即将其减去9），再求和。 
      3、将奇数位总和加上偶数位总和，结果应该可以被10整除。        
	 * @param bankaccount
	 * @return
	 */
	public static boolean isBankAccount(String bankaccount) {
		if (bankaccount.length() < 15 || bankaccount.length() > 19) {
			return false;
		}
		char bit = getBankCardCheckCode(bankaccount.substring(0, bankaccount.length() - 1));
		if (bit == 'N') {
			return false;
		}
		return bankaccount.charAt(bankaccount.length() - 1) == bit;  		
	}

	/** 
	* 从不含校验位的银行卡卡号采用 Luhm 校验算法获得校验位 
	* @param nonCheckCodeBankCard 
	* @return 
	*/  
	private static char getBankCardCheckCode(String nonCheckCodeBankCard){  
		if (nonCheckCodeBankCard == null || nonCheckCodeBankCard.trim().length() == 0
				|| !nonCheckCodeBankCard.matches("\\d+")) {
			// 如果传的不是数据返回N
			return 'N';
		}
		char[] chs = nonCheckCodeBankCard.trim().toCharArray();
		int luhmSum = 0;
		for (int i = chs.length - 1, j = 0; i >= 0; i--, j++) {
			int k = chs[i] - '0';
			if (j % 2 == 0) {
				k *= 2;
				k = k / 10 + k % 10;
			}
			luhmSum += k;
		}
		return (luhmSum % 10 == 0) ? '0' : (char) ((10 - luhmSum % 10) + '0');
	}
}
