package com.fsun.domain.model;

import java.util.Date;

public class BusRulShop {
    /**
     * id
     * 表字段 : bus_rul_shop.id
     */
    private String id;

    /**
     * 产品分类Id
     * 表字段 : bus_rul_shop.rul_id
     */
    private String rulId;

    /**
     * 店铺编号
     * 表字段 : bus_rul_shop.shop_id
     */
    private String shopId;

    /**
     * 店铺名称
     * 表字段 : bus_rul_shop.shop_name
     */
    private String shopName;

    /**
     * 创建时间
     * 表字段 : bus_rul_shop.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_rul_shop.updated_time
     */
    private Date updatedTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getRulId() {
        return rulId;
    }

    public void setRulId(String rulId) {
        this.rulId = rulId == null ? null : rulId.trim();
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

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }
}