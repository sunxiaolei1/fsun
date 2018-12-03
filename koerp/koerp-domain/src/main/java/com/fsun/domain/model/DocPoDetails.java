package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class DocPoDetails {
    /**
     * po_detail_id
     * 表字段 : doc_po_details.po_detail_id
     */
    private String poDetailId;

    /**
     * 单据号
     * 表字段 : doc_po_details.po_no
     */
    private String poNo;

    /**
     * 行号
     * 表字段 : doc_po_details.line_no
     */
    private Integer lineNo;

    /**
     * 分类编码
     * 表字段 : doc_po_details.category_code
     */
    private String categoryCode;

    /**
     * 分类名称
     * 表字段 : doc_po_details.category_name
     */
    private String categoryName;

    /**
     * 商品条码
     * 表字段 : doc_po_details.bar_code
     */
    private String barCode;

    /**
     * 品牌编码
     * 表字段 : doc_po_details.brand_code
     */
    private String brandCode;

    /**
     * 品牌名称
     * 表字段 : doc_po_details.brand_name
     */
    private String brandName;

    /**
     * 商品名称
     * 表字段 : doc_po_details.goods_name
     */
    private String goodsName;

    /**
     * sku
     * 表字段 : doc_po_details.sku
     */
    private String sku;

    /**
     * parent_sku
     * 表字段 : doc_po_details.parent_sku
     */
    private String parentSku;

    /**
     * 商品属性
     * 表字段 : doc_po_details.property
     */
    private String property;

    /**
     * 行状态
     * 表字段 : doc_po_details.line_status
     */
    private String lineStatus;

    /**
     * 批次号
     * 表字段 : doc_po_details.lot_num
     */
    private String lotNum;

    /**
     * 商品序号
     * 表字段 : doc_po_details.seq
     */
    private String seq;

    /**
     * 商品增减数量
     * 表字段 : doc_po_details.sub_qty
     */
    private BigDecimal subQty;

    /**
     * 用户自定义1
     * 表字段 : doc_po_details.user_define1
     */
    private String userDefine1;

    /**
     * 用户自定义2
     * 表字段 : doc_po_details.user_define2
     */
    private String userDefine2;

    /**
     * 用户自定义3
     * 表字段 : doc_po_details.user_define3
     */
    private String userDefine3;

    /**
     * 收货时间
     * 表字段 : doc_po_details.receive_time
     */
    private Date receiveTime;

    /**
     * 收货数量
     * 表字段 : doc_po_details.receive_qty
     */
    private BigDecimal receiveQty;

    /**
     * 预期收货数量
     * 表字段 : doc_po_details.expected_qty
     */
    private BigDecimal expectedQty;

    /**
     * 订购数量
     * 表字段 : doc_po_details.ordered_qty
     */
    private BigDecimal orderedQty;

    /**
     * 单位
     * 表字段 : doc_po_details.unit
     */
    private String unit;

    /**
     * 换算数量
     * 表字段 : doc_po_details.convert_qty
     */
    private BigDecimal convertQty;

    /**
     * 换算单位
     * 表字段 : doc_po_details.convert_unit
     */
    private String convertUnit;

    /**
     * 是否赠品
     * 表字段 : doc_po_details.is_gift
     */
    private Boolean isGift;

    /**
     * 商品总金额
     * 表字段 : doc_po_details.total_price
     */
    private BigDecimal totalPrice;

    /**
     * 成本价
     * 表字段 : doc_po_details.cost_price
     */
    private BigDecimal costPrice;

    /**
     * 单价
     * 表字段 : doc_po_details.price
     */
    private BigDecimal price;

    /**
     * 体积
     * 表字段 : doc_po_details.volume
     */
    private BigDecimal volume;

    /**
     * 税率
     * 表字段 : doc_po_details.rate_precent
     */
    private BigDecimal ratePrecent;

    /**
     * 备注
     * 表字段 : doc_po_details.memo
     */
    private String memo;

    /**
     * 创建时间
     * 表字段 : doc_po_details.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : doc_po_details.updated_time
     */
    private Date updatedTime;

    public String getPoDetailId() {
        return poDetailId;
    }

    public void setPoDetailId(String poDetailId) {
        this.poDetailId = poDetailId == null ? null : poDetailId.trim();
    }

    public String getPoNo() {
        return poNo;
    }

    public void setPoNo(String poNo) {
        this.poNo = poNo == null ? null : poNo.trim();
    }

    public Integer getLineNo() {
        return lineNo;
    }

    public void setLineNo(Integer lineNo) {
        this.lineNo = lineNo;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode == null ? null : categoryCode.trim();
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public String getBarCode() {
        return barCode;
    }

    public void setBarCode(String barCode) {
        this.barCode = barCode == null ? null : barCode.trim();
    }

    public String getBrandCode() {
        return brandCode;
    }

    public void setBrandCode(String brandCode) {
        this.brandCode = brandCode == null ? null : brandCode.trim();
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName == null ? null : brandName.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
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

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property == null ? null : property.trim();
    }

    public String getLineStatus() {
        return lineStatus;
    }

    public void setLineStatus(String lineStatus) {
        this.lineStatus = lineStatus == null ? null : lineStatus.trim();
    }

    public String getLotNum() {
        return lotNum;
    }

    public void setLotNum(String lotNum) {
        this.lotNum = lotNum == null ? null : lotNum.trim();
    }

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq == null ? null : seq.trim();
    }

    public BigDecimal getSubQty() {
        return subQty;
    }

    public void setSubQty(BigDecimal subQty) {
        this.subQty = subQty;
    }

    public String getUserDefine1() {
        return userDefine1;
    }

    public void setUserDefine1(String userDefine1) {
        this.userDefine1 = userDefine1 == null ? null : userDefine1.trim();
    }

    public String getUserDefine2() {
        return userDefine2;
    }

    public void setUserDefine2(String userDefine2) {
        this.userDefine2 = userDefine2 == null ? null : userDefine2.trim();
    }

    public String getUserDefine3() {
        return userDefine3;
    }

    public void setUserDefine3(String userDefine3) {
        this.userDefine3 = userDefine3 == null ? null : userDefine3.trim();
    }

    public Date getReceiveTime() {
        return receiveTime;
    }

    public void setReceiveTime(Date receiveTime) {
        this.receiveTime = receiveTime;
    }

    public BigDecimal getReceiveQty() {
        return receiveQty;
    }

    public void setReceiveQty(BigDecimal receiveQty) {
        this.receiveQty = receiveQty;
    }

    public BigDecimal getExpectedQty() {
        return expectedQty;
    }

    public void setExpectedQty(BigDecimal expectedQty) {
        this.expectedQty = expectedQty;
    }

    public BigDecimal getOrderedQty() {
        return orderedQty;
    }

    public void setOrderedQty(BigDecimal orderedQty) {
        this.orderedQty = orderedQty;
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

    public Boolean getIsGift() {
        return isGift;
    }

    public void setIsGift(Boolean isGift) {
        this.isGift = isGift;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getVolume() {
        return volume;
    }

    public void setVolume(BigDecimal volume) {
        this.volume = volume;
    }

    public BigDecimal getRatePrecent() {
        return ratePrecent;
    }

    public void setRatePrecent(BigDecimal ratePrecent) {
        this.ratePrecent = ratePrecent;
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
}