package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusRulSku {
    /**
     * rul_sku_id
     * 表字段 : bus_rul_sku.sku_id
     */
    private String skuId;

    /**
     * 策略Id
     * 表字段 : bus_rul_sku.rul_id
     */
    private String rulId;

    /**
     * 产品分类编码
     * 表字段 : bus_rul_sku.category_code
     */
    private String categoryCode;

    /**
     * 产品类型 0 单品，1 组合
     * 表字段 : bus_rul_sku.product_type
     */
    private Short productType;

    /**
     * sku
     * 表字段 : bus_rul_sku.sku
     */
    private String sku;

    /**
     * 品牌编码
     * 表字段 : bus_rul_sku.brand_code
     */
    private String brandCode;

    /**
     * 商品名称
     * 表字段 : bus_rul_sku.goods_name
     */
    private String goodsName;

    /**
     * 英文名称
     * 表字段 : bus_rul_sku.en_name
     */
    private String enName;

    /**
     * 商品属性
     * 表字段 : bus_rul_sku.property
     */
    private String property;

    /**
     * 市场价(作为批发价使用)
     * 表字段 : bus_rul_sku.market_price
     */
    private BigDecimal marketPrice;

    /**
     * 销售价
     * 表字段 : bus_rul_sku.sale_price
     */
    private BigDecimal salePrice;

    /**
     * 原销售价
     * 表字段 : bus_rul_sku.last_sale_price
     */
    private BigDecimal lastSalePrice;

    /**
     * 成本价
     * 表字段 : bus_rul_sku.cost_price
     */
    private BigDecimal costPrice;

    /**
     * 会员价
     * 表字段 : bus_rul_sku.vip_price
     */
    private BigDecimal vipPrice;

    /**
     * 单位
     * 表字段 : bus_rul_sku.unit
     */
    private String unit;

    /**
     * 单位名称
     * 表字段 : bus_rul_sku.unit_name
     */
    private String unitName;

    /**
     * 商品关键字
     * 表字段 : bus_rul_sku.keywords
     */
    private String keywords;

    /**
     * 创建时间
     * 表字段 : bus_rul_sku.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_rul_sku.updated_time
     */
    private Date updatedTime;

    public String getSkuId() {
        return skuId;
    }

    public void setSkuId(String skuId) {
        this.skuId = skuId == null ? null : skuId.trim();
    }

    public String getRulId() {
        return rulId;
    }

    public void setRulId(String rulId) {
        this.rulId = rulId == null ? null : rulId.trim();
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode == null ? null : categoryCode.trim();
    }

    public Short getProductType() {
        return productType;
    }

    public void setProductType(Short productType) {
        this.productType = productType;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku == null ? null : sku.trim();
    }

    public String getBrandCode() {
        return brandCode;
    }

    public void setBrandCode(String brandCode) {
        this.brandCode = brandCode == null ? null : brandCode.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getEnName() {
        return enName;
    }

    public void setEnName(String enName) {
        this.enName = enName == null ? null : enName.trim();
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property == null ? null : property.trim();
    }

    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public BigDecimal getLastSalePrice() {
        return lastSalePrice;
    }

    public void setLastSalePrice(BigDecimal lastSalePrice) {
        this.lastSalePrice = lastSalePrice;
    }

    public BigDecimal getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(BigDecimal costPrice) {
        this.costPrice = costPrice;
    }

    public BigDecimal getVipPrice() {
        return vipPrice;
    }

    public void setVipPrice(BigDecimal vipPrice) {
        this.vipPrice = vipPrice;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName == null ? null : unitName.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
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