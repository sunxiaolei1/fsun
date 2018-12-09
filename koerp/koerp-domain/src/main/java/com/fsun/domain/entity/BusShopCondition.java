package com.fsun.domain.entity;

import com.fsun.domain.model.BusShop;

/**
 * @author fsun
 * @date 2018年12月9日
 */
public class BusShopCondition extends BusShop{

	/**
	 * 模糊查询参数
	 */
	private String q;
	
	/**
	 * 过滤掉的门店String
	 */
	private String notInShopIdsStr;
		
	/**
	 * 过滤掉的门店
	 */
	private String[] notInShopIds;
	
	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	public String getNotInShopIdsStr() {
		return notInShopIdsStr;
	}

	public void setNotInShopIdsStr(String notInShopIdsStr) {
		this.notInShopIdsStr = notInShopIdsStr;
		if(notInShopIdsStr!=null && !notInShopIdsStr.equals("")){
			this.notInShopIds = notInShopIdsStr.split(",");
		}
	}

	public String[] getNotInShopIds() {
		return notInShopIds;
	}

	public void setNotInShopIds(String[] notInShopIds) {
		this.notInShopIds = notInShopIds;
	}
	
}
