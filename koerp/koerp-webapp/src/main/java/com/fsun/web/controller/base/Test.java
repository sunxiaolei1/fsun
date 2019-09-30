package com.fsun.web.controller.base;

import com.fsun.common.utils.MD5Utils;

/**
 * @author fsun
 * @date 2019年9月24日
 */
public class Test {

	public static void main(String[] args) {
		String newPassword = MD5Utils.md5SaltEncode("123456", "sj");
		System.out.println(newPassword);
	}

}
