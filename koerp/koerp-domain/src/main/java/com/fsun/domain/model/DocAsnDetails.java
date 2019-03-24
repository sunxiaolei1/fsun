package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

public class DocAsnDetails {
    /**
     * asn_detail_id
     * 表字段 : doc_asn_details.asn_detail_id
     */
    private String asnDetailId;

    /**
     * 单据号
     * 表字段 : doc_asn_details.asn_no
     */
    private String asnNo;

    /**
     * 行号
     * 表字段 : doc_asn_details.line_no
     */
    private Integer lineNo;

    /**
     * 分类编码
     * 表字段 : doc_asn_details.category_code
     */
    private String categoryCode;

    /**
     * 分类名称
     * 表字段 : doc_asn_details.category_name
     */
    private String categoryName;

    /**
     * 商品条码
     * 表字段 : doc_asn_details.bar_code
     */
    private String barCode;

    /**
     * 品牌编码
     * 表字段 : doc_asn_details.brand_code
     */
    private String brandCode;

    /**
     * 品牌名称
     * 表字段 : doc_asn_details.brand_name
     */
    private String brandName;

    /**
     * 商品名称
     * 表字段 : doc_asn_details.goods_name
     */
    private String goodsName;

    /**
     * sku
     * 表字段 : doc_asn_details.sku
     */
    private String sku;

    /**
     * parent_sku
     * 表字段 : doc_asn_details.parent_sku
     */
    private String parentSku;

    /**
     * 商品属性
     * 表字段 : doc_asn_details.property
     */
    private String property;

    /**
     * 关联po单号
     * 表字段 : doc_asn_details.po_no
     */
    private String poNo;

    /**
     * 关联po单号行号
     * 表字段 : doc_asn_details.po_line_no
     */
    private Integer poLineNo;

    /**
     * 行状态
     * 表字段 : doc_asn_details.line_status
     */
    private String lineStatus;

    /**
     * 收货时间
     * 表字段 : doc_asn_details.receive_time
     */
    private Date receiveTime;

    /**
     * 收货数量
     * 表字段 : doc_asn_details.receive_qty
     */
    private BigDecimal receiveQty;

    /**
     * 采购数量
     * 表字段 : doc_asn_details.order_qty
     */
    private BigDecimal orderQty;

    /**
     * 预期收货数量
     * 表字段 : doc_asn_details.expected_qty
     */
    private BigDecimal expectedQty;

    /**
     * 破损数量
     * 表字段 : doc_asn_details.damaged_qty
     */
    private BigDecimal damagedQty;

    /**
     * 预期收货时间
     * 表字段 : doc_asn_details.expected_time
     */
    private Date expectedTime;

    /**
     * 拒收数量
     * 表字段 : doc_asn_details.rejected_qty
     */
    private BigDecimal rejectedQty;

    /**
     * 拒收时间
     * 表字段 : doc_asn_details.rejected_time
     */
    private Date rejectedTime;

    /**
     * 单位
     * 表字段 : doc_asn_details.unit
     */
    private String unit;

    /**
     * 换算数量
     * 表字段 : doc_asn_details.convert_qty
     */
    private BigDecimal convertQty;

    /**
     * 换算单位
     * 表字段 : doc_asn_details.convert_unit
     */
    private String convertUnit;

    /**
     * 商品总金额
     * 表字段 : doc_asn_details.total_price
     */
    private BigDecimal totalPrice;

    /**
     * 成本价
     * 表字段 : doc_asn_details.cost_price
     */
    private BigDecimal costPrice;

    /**
     * 批次号
     * 表字段 : doc_asn_details.lot_num
     */
    private String lotNum;

    /**
     * 单价
     * 表字段 : doc_asn_details.price
     */
    private BigDecimal price;

    /**
     * 用户自定义1(用于记录原申请单对应的商品明细主键)
     * 表字段 : doc_asn_details.user_define1
     */
    private String userDefine1;

    /**
     * 用户自定义2
     * 表字段 : doc_asn_details.user_define2
     */
    private String userDefine2;

    /**
     * 用户自定义3
     * 表字段 : doc_asn_details.user_define3
     */
    private String userDefine3;

    /**
     * 货品类别 1 正常，2 强压
     * 表字段 : doc_asn_details.goods_type
     */
    private String goodsType;

    /**
     * 体积
     * 表字段 : doc_asn_details.volume
     */
    private BigDecimal volume;

    /**
     * 税率
     * 表字段 : doc_asn_details.rate_precent
     */
    private BigDecimal ratePrecent;

    /**
     * 备注
     * 表字段 : doc_asn_details.memo
     */
    private String memo;

    /**
     * 创建时间
     * 表字段 : doc_asn_details.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : doc_asn_details.updated_time
     */
    private Date updatedTime;
    
    /**
     * 签收类型
     * 表字段 : doc_asn_details.sign_type
     */
    private String signType;

    public String getAsnDetailId() {
        return asnDetailId;
    }

    public void setAsnDetailId(String asnDetailId) {
        this.asnDetailId = asnDetailId == null ? null : asnDetailId.trim();
    }

    public String getAsnNo() {
        return asnNo;
    }

    public void setAsnNo(String asnNo) {
        this.asnNo = asnNo == null ? null : asnNo.trim();
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

    public String getPoNo() {
        return poNo;
    }

    public void setPoNo(String poNo) {
        this.poNo = poNo == null ? null : poNo.trim();
    }

    public Integer getPoLineNo() {
        return poLineNo;
    }

    public void setPoLineNo(Integer poLineNo) {
        this.poLineNo = poLineNo;
    }

    public String getLineStatus() {
        return lineStatus;
    }

    public void setLineStatus(String lineStatus) {
        this.lineStatus = lineStatus == null ? null : lineStatus.trim();
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

    public BigDecimal getOrderQty() {
        return orderQty;
    }

    public void setOrderQty(BigDecimal orderQty) {
        this.orderQty = orderQty;
    }

    public BigDecimal getExpectedQty() {
        return expectedQty;
    }

    public void setExpectedQty(BigDecimal expectedQty) {
        this.expectedQty = expectedQty;
    }

    public BigDecimal getDamagedQty() {
        return damagedQty;
    }

    public void setDamagedQty(BigDecimal damagedQty) {
        this.damagedQty = damagedQty;
    }

    public Date getExpectedTime() {
        return expectedTime;
    }

    public void setExpectedTime(Date expectedTime) {
        this.expectedTime = expectedTime;
    }

    public BigDecimal getRejectedQty() {
        return rejectedQty;
    }

    public void setRejectedQty(BigDecimal rejectedQty) {
        this.rejectedQty = rejectedQty;
    }

    public Date getRejectedTime() {
        return rejectedTime;
    }

    public void setRejectedTime(Date rejectedTime) {
        this.rejectedTime = rejectedTime;
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

    public String getLotNum() {
        return lotNum;
    }

    public void setLotNum(String lotNum) {
        this.lotNum = lotNum == null ? null : lotNum.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
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

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType == null ? null : goodsType.trim();
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

	/**
	 * @return the signType
	 */
	public String getSignType() {
		return signType;
	}

	/**
	 * @param signType the signType to set
	 */
	public void setSignType(String signType) {
		this.signType = signType;
	}
}