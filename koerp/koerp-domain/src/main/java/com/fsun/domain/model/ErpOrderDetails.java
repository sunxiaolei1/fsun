package com.fsun.domain.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author fsun
 * @date 2019年10月9日
 */
public class ErpOrderDetails {

	/**
	 * 单据编号--poNo
	 */
	private String trnNum;
	
	/**
	 * 商品行号--poNo
	 */
	private Integer trnLine;
	
	/**
	 * ERP字段固定值--
	 */
	private String stat = "O";
	
	/**
	 * 商品编号--sku
	 */
	private String item;
	
	/**
	 * 订购数量--orderedQty
	 */
	private BigDecimal qtyReq;
	
	/**
	 * 单位--unit
	 */
	private String uM;
	
	/**
	 * 采购单价--cost_price
	 */
	private BigDecimal unitCost;	
	
	/**
	 * 采购单价--cost_price
	 */
	private BigDecimal matlCost;
	
	/**
	 * 采购单价--cost_price
	 */
	private BigDecimal unitPrice;
	
	/**
	 * 采购单价--cost_price
	 */
	private BigDecimal unitMatCost;
	
	/**
	 * 采购单价--cost_price
	 */
	private BigDecimal unitMatCostConv;
	
	/**
	 * ERP字段固定值--
	 */
	private String trnLoc = "TRANSIT";
	
	/**
	 * 发货时间--expected_qty
	 */
	private Date schShipDate;
	
	/**
	 * 收货时间--receive_time
	 */
	private Date schRcvDate;
	
	/**
	 * 收货数量--receive_qty
	 */
	private BigDecimal qtyReceived;
	
	/**
	 * 预期收货数量--expected_qty
	 */
	private BigDecimal qtyShipped;
	
	/**
	 * 退货数量--(expected_qty-qtyReceived)
	 */
	private BigDecimal qtyLoss;

	public String getTrnNum() {
		return trnNum;
	}

	public void setTrnNum(String trnNum) {
		this.trnNum = trnNum;
	}

	public Integer getTrnLine() {
		return trnLine;
	}

	public void setTrnLine(Integer trnLine) {
		this.trnLine = trnLine;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public BigDecimal getQtyReq() {
		return qtyReq;
	}

	public void setQtyReq(BigDecimal qtyReq) {
		this.qtyReq = qtyReq;
	}

	public String getuM() {
		return uM;
	}

	public void setuM(String uM) {
		this.uM = uM;
	}

	public BigDecimal getUnitCost() {
		return unitCost;
	}

	public void setUnitCost(BigDecimal unitCost) {
		this.unitCost = unitCost;
	}

	public BigDecimal getMatlCost() {
		return matlCost;
	}

	public void setMatlCost(BigDecimal matlCost) {
		this.matlCost = matlCost;
	}

	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public BigDecimal getUnitMatCost() {
		return unitMatCost;
	}

	public void setUnitMatCost(BigDecimal unitMatCost) {
		this.unitMatCost = unitMatCost;
	}

	public BigDecimal getUnitMatCostConv() {
		return unitMatCostConv;
	}

	public void setUnitMatCostConv(BigDecimal unitMatCostConv) {
		this.unitMatCostConv = unitMatCostConv;
	}

	public String getTrnLoc() {
		return trnLoc;
	}

	public void setTrnLoc(String trnLoc) {
		this.trnLoc = trnLoc;
	}

	public Date getSchShipDate() {
		return schShipDate;
	}

	public void setSchShipDate(Date schShipDate) {
		this.schShipDate = schShipDate;
	}

	public Date getSchRcvDate() {
		return schRcvDate;
	}

	public void setSchRcvDate(Date schRcvDate) {
		this.schRcvDate = schRcvDate;
	}

	public BigDecimal getQtyReceived() {
		return qtyReceived;
	}

	public void setQtyReceived(BigDecimal qtyReceived) {
		this.qtyReceived = qtyReceived;
	}

	public BigDecimal getQtyShipped() {
		return qtyShipped;
	}

	public void setQtyShipped(BigDecimal qtyShipped) {
		this.qtyShipped = qtyShipped;
	}

	public BigDecimal getQtyLoss() {
		return qtyLoss;
	}

	public void setQtyLoss(BigDecimal qtyLoss) {
		this.qtyLoss = qtyLoss;
	}
	
}
