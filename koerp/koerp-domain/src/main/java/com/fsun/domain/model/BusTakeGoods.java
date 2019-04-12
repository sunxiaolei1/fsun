package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class BusTakeGoods {
    /**
     * goods_id
     * 表字段 : bus_take_goods.goods_id
     */
    private String goodsId;

    /**
     * 寄提单号
     * 表字段 : bus_take_goods.take_id
     */
    private String takeId;

    /**
     * 订单id
     * 表字段 : bus_take_goods.order_id
     */
    private String orderId;

    /**
     * 原商品主键
     * 表字段 : bus_take_goods.ori_goods_id
     */
    private String oriGoodsId;

    /**
     * 门店信息
     * 表字段 : bus_take_goods.shop_id
     */
    private String shopId;

    /**
     * 行号
     * 表字段 : bus_take_goods.line_no
     */
    private Integer lineNo;

    /**
     * 商品名称
     * 表字段 : bus_take_goods.goods_name
     */
    private String goodsName;

    /**
     * 
     * 表字段 : bus_take_goods.category_name
     */
    private String categoryName;

    /**
     * 分类id
     * 表字段 : bus_take_goods.category_code
     */
    private String categoryCode;

    /**
     * 
     * 表字段 : bus_take_goods.brand_name
     */
    private String brandName;

    /**
     * 品牌编码
     * 表字段 : bus_take_goods.brand_code
     */
    private String brandCode;

    /**
     * 产品类型 1 单品，2 组合
     * 表字段 : bus_take_goods.product_type
     */
    private Short productType;

    /**
     * 商品条码
     * 表字段 : bus_take_goods.bar_code
     */
    private String barCode;

    /**
     * 单位
     * 表字段 : bus_take_goods.unit
     */
    private String unit;

    /**
     * 换算数量
     * 表字段 : bus_take_goods.convert_qty
     */
    private BigDecimal convertQty;

    /**
     * 换算单位
     * 表字段 : bus_take_goods.convert_unit
     */
    private String convertUnit;

    /**
     * 市场价
     * 表字段 : bus_take_goods.market_price
     */
    private BigDecimal marketPrice;

    /**
     * 原销售价
     * 表字段 : bus_take_goods.origin_sale_price
     */
    private BigDecimal originSalePrice;

    /**
     * sku
     * 表字段 : bus_take_goods.sku
     */
    private String sku;

    /**
     * 自提数量
     * 表字段 : bus_take_goods.qty
     */
    private BigDecimal qty;

    /**
     * 原订单数量
     * 表字段 : bus_take_goods.ori_qty
     */
    private BigDecimal oriQty;

    /**
     * 
     * 表字段 : bus_take_goods.max_qty
     */
    private BigDecimal maxQty;

    /**
     * 实际销售价(销售价、会员价)
     * 表字段 : bus_take_goods.sale_price
     */
    private BigDecimal salePrice;

    /**
     * 是否逻辑删除
     * 表字段 : bus_take_goods.enabled
     */
    private Boolean enabled;

    /**
     * 备注
     * 表字段 : bus_take_goods.memo
     */
    private String memo;

    /**
     * 自提时间
     * 表字段 : bus_take_goods.created_time
     */
    private Date createdTime;
    
    /**
     * 规格
     * 表字段 : bus_take_goods.property
     */
    private String property;
    
    /**
     * 原订单实际可寄提的商品总数
     */
    private BigDecimal oriInvQty;

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

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

    public String getOriGoodsId() {
        return oriGoodsId;
    }

    public void setOriGoodsId(String oriGoodsId) {
        this.oriGoodsId = oriGoodsId == null ? null : oriGoodsId.trim();
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId == null ? null : shopId.trim();
    }

    public Integer getLineNo() {
        return lineNo;
    }

    public void setLineNo(Integer lineNo) {
        this.lineNo = lineNo;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
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

    public String getBarCode() {
        return barCode;
    }

    public void setBarCode(String barCode) {
        this.barCode = barCode == null ? null : barCode.trim();
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

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku == null ? null : sku.trim();
    }

    public BigDecimal getQty() {
        return qty;
    }

    public void setQty(BigDecimal qty) {
        this.qty = qty;
    }

    public BigDecimal getOriQty() {
        return oriQty;
    }

    public void setOriQty(BigDecimal oriQty) {
        this.oriQty = oriQty;
    }

    public BigDecimal getMaxQty() {
        return maxQty;
    }

    public void setMaxQty(BigDecimal maxQty) {
        this.maxQty = maxQty;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
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

	/**
	 * @return the property
	 */
	public String getProperty() {
		return property;
	}

	/**
	 * @param property the property to set
	 */
	public void setProperty(String property) {
		this.property = property;
	}

	/**
	 * @return the oriInvQty
	 */
	public BigDecimal getOriInvQty() {
		return oriInvQty;
	}

	/**
	 * @param oriInvQty the oriInvQty to set
	 */
	public void setOriInvQty(BigDecimal oriInvQty) {
		this.oriInvQty = oriInvQty;
	}
}