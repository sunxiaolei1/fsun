package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusRefundGoods {
    /**
     * goods_id
     * 表字段 : bus_refund_goods.goods_id
     */
    private String goodsId;

    /**
     * 原订单id
     * 表字段 : bus_refund_goods.order_id
     */
    private String orderId;

    /**
     * 退单id
     * 表字段 : bus_refund_goods.refund_id
     */
    private String refundId;

    /**
     * 行号
     * 表字段 : bus_refund_goods.line_no
     */
    private Integer lineNo;

    /**
     * 商品类型
     * 表字段 : bus_refund_goods.goods_type
     */
    private Short goodsType;

    /**
     * 
     * 表字段 : bus_refund_goods.category_name
     */
    private String categoryName;

    /**
     * 分类id
     * 表字段 : bus_refund_goods.category_code
     */
    private String categoryCode;

    /**
     * 
     * 表字段 : bus_refund_goods.brand_name
     */
    private String brandName;

    /**
     * 品牌编码
     * 表字段 : bus_refund_goods.brand_code
     */
    private String brandCode;

    /**
     * 产品类型 1 单品，2 组合
     * 表字段 : bus_refund_goods.product_type
     */
    private Short productType;

    /**
     * 商品名称
     * 表字段 : bus_refund_goods.goods_name
     */
    private String goodsName;

    /**
     * 商品条码
     * 表字段 : bus_refund_goods.bar_code
     */
    private String barCode;

    /**
     * sku
     * 表字段 : bus_refund_goods.sku
     */
    private String sku;

    /**
     * parent_sku
     * 表字段 : bus_refund_goods.parent_sku
     */
    private String parentSku;

    /**
     * 原SKU ID
     * 表字段 : bus_refund_goods.sku_id
     */
    private String skuId;

    /**
     * 原父SKU ID
     * 表字段 : bus_refund_goods.parent_sku_id
     */
    private String parentSkuId;

    /**
     * 英文单位简称
     * 表字段 : bus_refund_goods.en_unit
     */
    private String enUnit;

    /**
     * 总分摊价
     * 表字段 : bus_refund_goods.total_part_price
     */
    private BigDecimal totalPartPrice;

    /**
     * 税种
     * 表字段 : bus_refund_goods.rate_type
     */
    private String rateType;
    
    /**
     * 原订单销售数量
     * 表字段 : bus_refund_goods.origin_qty
     */
    private BigDecimal originQty;

    /**
     * 购买数量
     * 表字段 : bus_refund_goods.qty
     */
    private BigDecimal qty;

    /**
     * 单位
     * 表字段 : bus_refund_goods.unit
     */
    private String unit;

    /**
     * 换算数量
     * 表字段 : bus_refund_goods.convert_qty
     */
    private BigDecimal convertQty;

    /**
     * 换算单位
     * 表字段 : bus_refund_goods.convert_unit
     */
    private String convertUnit;

    /**
     * 市场价
     * 表字段 : bus_refund_goods.market_price
     */
    private BigDecimal marketPrice;

    /**
     * 原销售价
     * 表字段 : bus_refund_goods.origin_sale_price
     */
    private BigDecimal originSalePrice;

    /**
     * 实际销售价(销售价、会员价)
     * 表字段 : bus_refund_goods.sale_price
     */
    private BigDecimal salePrice;

    /**
     * 商品分摊价
     * 表字段 : bus_refund_goods.part_price
     */
    private BigDecimal partPrice;

    /**
     * 
     * 表字段 : bus_refund_goods.coupon_price
     */
    private BigDecimal couponPrice;

    /**
     * 商品折价 销售价-分摊价=折扣价
     * 表字段 : bus_refund_goods.discount_price
     */
    private BigDecimal discountPrice;

    /**
     * 商品销售总金额
     * 表字段 : bus_refund_goods.total_price
     */
    private BigDecimal totalPrice;

    /**
     * 成本价
     * 表字段 : bus_refund_goods.cost_price
     */
    private BigDecimal costPrice;

    /**
     * 税率
     * 表字段 : bus_refund_goods.rate_precent
     */
    private BigDecimal ratePrecent;

    /**
     * 是否为赠品 1 赠品，0 非赠品
     * 表字段 : bus_refund_goods.is_gift
     */
    private Boolean isGift;

    /**
     * 赠送数量
     * 表字段 : bus_refund_goods.gift_count
     */
    private BigDecimal giftCount;

    /**
     * 赠送金额
     * 表字段 : bus_refund_goods.gift_price
     */
    private BigDecimal giftPrice;

    /**
     * 点单界面是否显示，不显示用于组合商品
     * 表字段 : bus_refund_goods.is_show
     */
    private Boolean isShow;

    /**
     * 商品属性
     * 表字段 : bus_refund_goods.property
     */
    private String property;

    /**
     * 备注
     * 表字段 : bus_refund_goods.memo
     */
    private String memo;

    /**
     * 创建时间
     * 表字段 : bus_refund_goods.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_refund_goods.updated_time
     */
    private Date updatedTime;
    
    /**
     * 原订单商品应收总金额
     */
    private BigDecimal originTotalPrice;

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getRefundId() {
        return refundId;
    }

    public void setRefundId(String refundId) {
        this.refundId = refundId == null ? null : refundId.trim();
    }

    public Integer getLineNo() {
        return lineNo;
    }

    public void setLineNo(Integer lineNo) {
        this.lineNo = lineNo;
    }

    public Short getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(Short goodsType) {
        this.goodsType = goodsType;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode == null ? null : categoryCode.trim();
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName == null ? null : brandName.trim();
    }

    public String getBrandCode() {
        return brandCode;
    }

    public void setBrandCode(String brandCode) {
        this.brandCode = brandCode == null ? null : brandCode.trim();
    }

    public Short getProductType() {
        return productType;
    }

    public void setProductType(Short productType) {
        this.productType = productType;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
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

    public String getSkuId() {
        return skuId;
    }

    public void setSkuId(String skuId) {
        this.skuId = skuId == null ? null : skuId.trim();
    }

    public String getParentSkuId() {
        return parentSkuId;
    }

    public void setParentSkuId(String parentSkuId) {
        this.parentSkuId = parentSkuId == null ? null : parentSkuId.trim();
    }

    public String getEnUnit() {
        return enUnit;
    }

    public void setEnUnit(String enUnit) {
        this.enUnit = enUnit == null ? null : enUnit.trim();
    }

    public BigDecimal getTotalPartPrice() {
        return totalPartPrice;
    }

    public void setTotalPartPrice(BigDecimal totalPartPrice) {
        this.totalPartPrice = totalPartPrice;
    }

    public String getRateType() {
        return rateType;
    }

    public void setRateType(String rateType) {
        this.rateType = rateType == null ? null : rateType.trim();
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

    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    public BigDecimal getOriginSalePrice() {
        return originSalePrice;
    }

    public void setOriginSalePrice(BigDecimal originSalePrice) {
        this.originSalePrice = originSalePrice;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public BigDecimal getPartPrice() {
        return partPrice;
    }

    public void setPartPrice(BigDecimal partPrice) {
        this.partPrice = partPrice;
    }

    public BigDecimal getCouponPrice() {
        return couponPrice;
    }

    public void setCouponPrice(BigDecimal couponPrice) {
        this.couponPrice = couponPrice;
    }

    public BigDecimal getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(BigDecimal discountPrice) {
        this.discountPrice = discountPrice;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(BigDecimal costPrice) {
        this.costPrice = costPrice;
    }

    public BigDecimal getRatePrecent() {
        return ratePrecent;
    }

    public void setRatePrecent(BigDecimal ratePrecent) {
        this.ratePrecent = ratePrecent;
    }

    public Boolean getIsGift() {
        return isGift;
    }

    public void setIsGift(Boolean isGift) {
        this.isGift = isGift;
    }

    public BigDecimal getGiftCount() {
        return giftCount;
    }

    public void setGiftCount(BigDecimal giftCount) {
        this.giftCount = giftCount;
    }

    public BigDecimal getGiftPrice() {
        return giftPrice;
    }

    public void setGiftPrice(BigDecimal giftPrice) {
        this.giftPrice = giftPrice;
    }

    public Boolean getIsShow() {
        return isShow;
    }

    public void setIsShow(Boolean isShow) {
        this.isShow = isShow;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property == null ? null : property.trim();
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

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

	/**
	 * @return the originQty
	 */
	public BigDecimal getOriginQty() {
		return originQty;
	}

	/**
	 * @param originQty the originQty to set
	 */
	public void setOriginQty(BigDecimal originQty) {
		this.originQty = originQty;
	}

	/**
	 * @return the originTotalPrice
	 */
	public BigDecimal getOriginTotalPrice() {
		return originTotalPrice;
	}

	/**
	 * @param originTotalPrice the originTotalPrice to set
	 */
	public void setOriginTotalPrice(BigDecimal originTotalPrice) {
		this.originTotalPrice = originTotalPrice;
	}

}