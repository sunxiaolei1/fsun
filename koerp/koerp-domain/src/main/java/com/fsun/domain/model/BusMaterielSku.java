package com.fsun.domain.model;

import java.math.BigDecimal;

public class BusMaterielSku {
    /**
     * 
     * 表字段 : bus_materiel_sku.id
     */
    private Integer id;

    /**
     * 物料sku
     * 表字段 : bus_materiel_sku.materiel_skuId
     */
    private String materielSkuId;

    /**
     * 商品sku
     * 表字段 : bus_materiel_sku.bas_skuId
     */
    private String basSkuId;

    /**
     * 物料单位数量
     * 表字段 : bus_materiel_sku.materiel_qty
     */
    private BigDecimal materielQty;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMaterielSkuId() {
        return materielSkuId;
    }

    public void setMaterielSkuId(String materielSkuId) {
        this.materielSkuId = materielSkuId == null ? null : materielSkuId.trim();
    }

    public String getBasSkuId() {
        return basSkuId;
    }

    public void setBasSkuId(String basSkuId) {
        this.basSkuId = basSkuId == null ? null : basSkuId.trim();
    }

    public BigDecimal getMaterielQty() {
        return materielQty;
    }

    public void setMaterielQty(BigDecimal materielQty) {
        this.materielQty = materielQty;
    }
}