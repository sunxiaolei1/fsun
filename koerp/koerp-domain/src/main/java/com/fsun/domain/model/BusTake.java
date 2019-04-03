package com.fsun.domain.model;

import java.util.Date;

/**
 * 寄提单
 * @author fsun
 * @date 2019年4月3日
 */
public class BusTake {
	
    /**
     * 寄提单号
     * 表字段 : bus_take.take_id
     */
    private String takeId;

    /**
     * 原订单号
     * 表字段 : bus_take.order_id
     */
    private String orderId;

    /**
     * 买家id
     * 表字段 : bus_take.buyer_id
     */
    private String buyerId;

    /**
     * 买家名称
     * 表字段 : bus_take.buyer_name
     */
    private String buyerName;

    /**
     * 提货人
     * 表字段 : bus_take.take_name
     */
    private String takeName;

    /**
     * 卖家id
     * 表字段 : bus_take.seller_id
     */
    private String sellerId;

    /**
     * 卖家名称
     * 表字段 : bus_take.seller_name
     */
    private String sellerName;

    /**
     * 店铺id
     * 表字段 : bus_take.shop_id
     */
    private String shopId;

    /**
     * 店铺名称
     * 表字段 : bus_take.shop_name
     */
    private String shopName;

    /**
     * 备注
     * 表字段 : bus_take.memo
     */
    private String memo;

    /**
     * 提货状态，30 已提货   40 提货取消   60 交易完成
     * 表字段 : bus_take.take_status
     */
    private String takeStatus;

    /**
     * 创建时间
     * 表字段 : bus_take.created_time
     */
    private Date createdTime;

    /**
     * 创建人
     * 表字段 : bus_take.created_name
     */
    private String createdName;

    /**
     * 更新时间
     * 表字段 : bus_take.updated_time
     */
    private Date updatedTime;

    /**
     * 更新人
     * 表字段 : bus_take.updated_name
     */
    private String updatedName;
    
    /**
     * 打印次数
     * 表字段 : bus_order.print_count
     */
    private Integer printCount;

    public String getTakeId() {
        return takeId;
    }

    public void setTakeId(String takeId) {
        this.takeId = takeId == null ? null : takeId.trim();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId == null ? null : buyerId.trim();
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName == null ? null : buyerName.trim();
    }

    public String getTakeName() {
        return takeName;
    }

    public void setTakeName(String takeName) {
        this.takeName = takeName == null ? null : takeName.trim();
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId == null ? null : sellerId.trim();
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName == null ? null : sellerName.trim();
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId == null ? null : shopId.trim();
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName == null ? null : shopName.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getCreatedName() {
        return createdName;
    }

    public void setCreatedName(String createdName) {
        this.createdName = createdName == null ? null : createdName.trim();
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public String getUpdatedName() {
        return updatedName;
    }

    public void setUpdatedName(String updatedName) {
        this.updatedName = updatedName == null ? null : updatedName.trim();
    }

	/**
	 * @return the printCount
	 */
	public Integer getPrintCount() {
		return printCount;
	}

	/**
	 * @param printCount the printCount to set
	 */
	public void setPrintCount(Integer printCount) {
		this.printCount = printCount;
	}

	/**
	 * @return the takeStatus
	 */
	public String getTakeStatus() {
		return takeStatus;
	}

	/**
	 * @param takeStatus the takeStatus to set
	 */
	public void setTakeStatus(String takeStatus) {
		this.takeStatus = takeStatus;
	}
}