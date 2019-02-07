package com.fsun.domain.dto;

import com.fsun.domain.model.SysUser;

/**
 * @author fsun
 * @date 2018年12月17日
 */
public class BusUserDto extends SysUser{

	 /**
     * 店仓编码
     */
    private String shopCode;
    
    /**
     * 店仓名称
     */
    private String shopName;

	public String getShopCode() {
		return shopCode;
	}

	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
    
}
