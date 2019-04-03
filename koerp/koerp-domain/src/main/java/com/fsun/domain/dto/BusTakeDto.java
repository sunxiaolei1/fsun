package com.fsun.domain.dto;

import java.util.ArrayList;
import java.util.List;

import com.fsun.domain.model.BusTake;
import com.fsun.domain.model.BusTakeGoods;

/**
 * 寄提对象
 * @author fsun
 * @date 2019年4月3日
 */
public class BusTakeDto {

	/**
	 * 寄提单号
	 */
	private String takeId;

	/**
	 * 寄提单头信息
	 */
	private BusTake header;
	
	/**
	 * 寄提单明细
	 */
	private List<BusTakeGoods> details = new ArrayList<>();

	/**
	 * 当前用户信息
	 */
	private BusUserDto currUser;

	public String getTakeId() {
		return takeId;
	}

	public void setTakeId(String takeId) {
		this.takeId = takeId;
	}

	public BusTake getHeader() {
		return header;
	}

	public void setHeader(BusTake header) {
		this.header = header;
	}

	public List<BusTakeGoods> getDetails() {
		return details;
	}

	public void setDetails(List<BusTakeGoods> details) {
		this.details = details;
	}

	public BusUserDto getCurrUser() {
		return currUser;
	}

	public void setCurrUser(BusUserDto currUser) {
		this.currUser = currUser;
	}
	
}
