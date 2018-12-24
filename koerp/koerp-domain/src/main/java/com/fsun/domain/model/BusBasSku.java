package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusBasSku {
    /**
     * sku_id
     * 表字段 : bus_bas_sku.sku_id
     */
    private String skuId;

    /**
     * 商品条码
     * 表字段 : bus_bas_sku.bar_code
     */
    private String barCode;

    /**
     * sku
     * 表字段 : bus_bas_sku.sku
     */
    private String sku;

    /**
     * 上级sku
     * 表字段 : bus_bas_sku.parent_sku
     */
    private String parentSku;

    /**
     * 产品分类编码
     * 表字段 : bus_bas_sku.category_code
     */
    private String categoryCode;

    /**
     * 产品类型 0 单品，1 组合
     * 表字段 : bus_bas_sku.product_type
     */
    private Short productType;

    /**
     * 品牌编码
     * 表字段 : bus_bas_sku.brand_code
     */
    private String brandCode;

    /**
     * 辅助编码
     * 表字段 : bus_bas_sku.assist_id
     */
    private String assistId;

    /**
     * 商品名称
     * 表字段 : bus_bas_sku.goods_name
     */
    private String goodsName;

    /**
     * 英文名称
     * 表字段 : bus_bas_sku.en_name
     */
    private String enName;

    /**
     * 商品属性
     * 表字段 : bus_bas_sku.property
     */
    private String property;

    /**
     * 市场价(作为批发价使用)
     * 表字段 : bus_bas_sku.market_price
     */
    private BigDecimal marketPrice;

    /**
     * 成本价
     * 表字段 : bus_bas_sku.cost_price
     */
    private BigDecimal costPrice;

    /**
     * 原销售价
     * 表字段 : bus_bas_sku.origin_sale_price
     */
    private BigDecimal originSalePrice;

    /**
     * 库存预警值
     * 表字段 : bus_bas_sku.warning_qty
     */
    private Integer warningQty;

    /**
     * 数量
     * 表字段 : bus_bas_sku.qty
     */
    private BigDecimal qty;

    /**
     * 单位
     * 表字段 : bus_bas_sku.unit
     */
    private String unit;

    /**
     * 单位名称
     * 表字段 : bus_bas_sku.unit_name
     */
    private String unitName;

    /**
     * 换算数量
     * 表字段 : bus_bas_sku.convert_qty
     */
    private BigDecimal convertQty;

    /**
     * 换算单位
     * 表字段 : bus_bas_sku.convert_unit
     */
    private String convertUnit;

    /**
     * 商品关键字
     * 表字段 : bus_bas_sku.keywords
     */
    private String keywords;

    /**
     * 备注
     * 表字段 : bus_bas_sku.memo
     */
    private String memo;

    /**
     * 详情
     * 表字段 : bus_bas_sku.descr
     */
    private String descr;

    /**
     * 状态 1 待审核，2 仓库中，3 已上架，4 已下架
     * 表字段 : bus_bas_sku.status
     */
    private Short status;

    /**
     * 是否推荐商品
     * 表字段 : bus_bas_sku.is_recommend
     */
    private Boolean isRecommend;

    /**
     * 上架时间
     * 表字段 : bus_bas_sku.on_shelf_time
     */
    private Date onShelfTime;

    /**
     * 下架时间
     * 表字段 : bus_bas_sku.off_shelf_time
     */
    private Date offShelfTime;

    /**
     * 排序号
     * 表字段 : bus_bas_sku.sort_code
     */
    private Integer sortCode;

    /**
     * 状态,1启用,-0 禁用
     * 表字段 : bus_bas_sku.is_enabled
     */
    private Boolean isEnabled;

    /**
     * Extended field
     * 表字段 : bus_bas_sku.ext_0
     */
    private String ext0;

    /**
     * Extended field
     * 表字段 : bus_bas_sku.ext_1
     */
    private String ext1;

    /**
     * 税率
     * 表字段 : bus_bas_sku.rate_precent
     */
    private BigDecimal ratePrecent;

    /**
     * 0，非直接结算；1直接结算
     * 表字段 : bus_bas_sku.settle_type
     */
    private Integer settleType;

    /**
     * 创建时间
     * 表字段 : bus_bas_sku.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_bas_sku.updated_time
     */
    private Date updatedTime;

    /**
     * 创建人id
     * 表字段 : bus_bas_sku.created_id
     */
    private String createdId;

    /**
     * 更新人id
     * 表字段 : bus_bas_sku.updated_id
     */
    private String updatedId;

    /**
     * 是否是普通会员指定vip价商品,1是,-0 否
     * 表字段 : bus_bas_sku.is_vip_appoint
     */
    private Boolean isVipAppoint;

    public String getSkuId() {
        return skuId;
    }

    public void setSkuId(String skuId) {
        this.skuId = skuId == null ? null : skuId.trim();
    }

    public String getBarCode() {
        return barCode;
    }

    public void setBarCode(String barCode) {
        this.barCode = barCode == null ? null : barCode.trim();
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku == null ? null : sku.trim();
    }

    public String getParentSku() {
        return parentSku;
    }

    public void setParentSku(String parentSku) {
        this.parentSku = parentSku == null ? null : parentSku.trim();
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

    public String getBrandCode() {
        return brandCode;
    }

    public void setBrandCode(String brandCode) {
        this.brandCode = brandCode == null ? null : brandCode.trim();
    }

    public String getAssistId() {
        return assistId;
    }

    public void setAssistId(String assistId) {
        this.assistId = assistId == null ? null : assistId.trim();
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

    public BigDecimal getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(BigDecimal costPrice) {
        this.costPrice = costPrice;
    }

    public BigDecimal getOriginSalePrice() {
        return originSalePrice;
    }

    public void setOriginSalePrice(BigDecimal originSalePrice) {
        this.originSalePrice = originSalePrice;
    }

    public Integer getWarningQty() {
        return warningQty;
    }

    public void setWarningQty(Integer warningQty) {
        this.warningQty = warningQty;
    }

    public BigDecimal getQty() {
        return qty;
    }

    public void setQty(BigDecimal qty) {
        this.qty = qty;
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

    public BigDecimal getConvertQty() {
        return convertQty;
    }

    public void setConvertQty(BigDecimal convertQty) {
        this.convertQty = convertQty;
    }

    public String getConvertUnit() {
        return convertUnit;
    }

    public void setConvertUnit(String convertUnit) {
        this.convertUnit = convertUnit == null ? null : convertUnit.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr == null ? null : descr.trim();
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Boolean getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Boolean isRecommend) {
        this.isRecommend = isRecommend;
    }

    public Date getOnShelfTime() {
        return onShelfTime;
    }

    public void setOnShelfTime(Date onShelfTime) {
        this.onShelfTime = onShelfTime;
    }

    public Date getOffShelfTime() {
        return offShelfTime;
    }

    public void setOffShelfTime(Date offShelfTime) {
        this.offShelfTime = offShelfTime;
    }

    public Integer getSortCode() {
        return sortCode;
    }

    public void setSortCode(Integer sortCode) {
        this.sortCode = sortCode;
    }

    public Boolean getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(Boolean isEnabled) {
        this.isEnabled = isEnabled;
    }

    public String getExt0() {
        return ext0;
    }

    public void setExt0(String ext0) {
        this.ext0 = ext0 == null ? null : ext0.trim();
    }

    public String getExt1() {
        return ext1;
    }

    public void setExt1(String ext1) {
        this.ext1 = ext1 == null ? null : ext1.trim();
    }

    public BigDecimal getRatePrecent() {
        return ratePrecent;
    }

    public void setRatePrecent(BigDecimal ratePrecent) {
        this.ratePrecent = ratePrecent;
    }

    public Integer getSettleType() {
        return settleType;
    }

    public void setSettleType(Integer settleType) {
        this.settleType = settleType;
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

    public String getCreatedId() {
        return createdId;
    }

    public void setCreatedId(String createdId) {
        this.createdId = createdId == null ? null : createdId.trim();
    }

    public String getUpdatedId() {
        return updatedId;
    }

    public void setUpdatedId(String updatedId) {
        this.updatedId = updatedId == null ? null : updatedId.trim();
    }

    public Boolean getIsVipAppoint() {
        return isVipAppoint;
    }

    public void setIsVipAppoint(Boolean isVipAppoint) {
        this.isVipAppoint = isVipAppoint;
    }
}