<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.toolbar{
	height:30px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	background: #f3f3f3;
	padding-top:2px;
}
</style>

<div id="addtoolbar" class="toolbar" data-options="region:'center'">	
	<a href="#" class="easyui-linkbutton" iconCls="icon-cog_add" plain="true" onclick="previewOrder()">提交</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="cancel()">取消</a>			
</div> 

<script type="text/javascript">

/**
 * 预览单据
 */
function previewOrder(){
	
	var saveData = getSaveData();
	if(saveData!=null){
		var isTrue = updatePreviewOrder(saveData.params);
		if(isTrue){
			$("#editDiffOrderWin").window("open");
		}		
	}
	
}

/**
 * 初始化预览单据
 */
function updatePreviewOrder(paramsData){
	
	//差异单商品列表
	var diffSkus = [];
	//出现在被替换商品列表的商品
	var deleteSkus = [];
	//所有商品(包含新增的和被替换的商品)
	var diffOrderDetails = paramsData.diffOrderDetails;
	//被替换商品列表
	var deleteSkuDetails = paramsData.deleteSkuDetails;	
	var neworderprice = 0;
	var newpayprice = 0;
	
	var hasAddSku = false;
	$.each(diffOrderDetails, function(){
		if(typeof(this.orderlineid)=="undefined"){			
			//neworderprice += this.orderqty * this.saleprice;
			//newpayprice += this.totalprice;				
			var orderPrice = CalcAmount.multiply(this.orderqty, this.saleprice);
			neworderprice = CalcAmount.add(neworderprice, orderPrice);
			newpayprice = CalcAmount.add(newpayprice, this.totalprice);
			diffSkus.push(this);	
			hasAddSku = true;
		}else{
			//未被替换
			if(10 == this.aftersalestatus){												
				//neworderprice += this.orderqty * this.saleprice;
				//newpayprice += this.totalprice;
				var orderPrice = CalcAmount.multiply(this.orderqty, this.saleprice);
				neworderprice = CalcAmount.add(neworderprice, orderPrice);
				newpayprice = CalcAmount.add(newpayprice, this.totalprice);
				diffSkus.push(this);
			}else{
				deleteSkus.push(this);
			}
		}
	});	
	
	if(!hasAddSku){
		$.messager.alert("错误", "不存在新增的商品!", "error");  
		return false;
	}	
	if(deleteSkus.length==0){
		$.messager.alert("错误", "不存在被替换的商品!", "error");  		
		return false;
	}
	
	var diffqtyError = false;
	$.each(deleteSkuDetails, function(){	
		//var diffqty = this.oldorderqty-this.orderqty;
		var diffqty = CalcAmount.subtract(this.oldorderqty, this.orderqty);
		if(diffqty<0){
			diffqtyError = true;
			return false;
		}	
		if(diffqty>0){		
			//neworderprice += this.diffqty * this.saleprice;
			//newpayprice += this.diffqty * this.payprice;
			var diffAmount = CalcAmount.multiply(this.diffqty, this.saleprice);
			neworderprice = CalcAmount.add(neworderprice, diffAmount);
			var diffPayAmount = CalcAmount.multiply(this.diffqty, this.payprice);
			newpayprice = CalcAmount.add(newpayprice, diffPayAmount);
			
			var orderlineid = this.orderlineid;	
			$.each(deleteSkus, function(){			
				if(this.orderlineid==orderlineid){
					var that = cloneObj(this);
					that.orderqty = diffqty;
					//that.totalprice = diffqty * that.payprice; 
					//that.discountprice = diffqty * that.saleprice - that.totalprice;				
					that.totalprice = CalcAmount.multiply(that.orderqty, that.payprice, 2);
					var tempPrice = CalcAmount.multiply(that.orderqty, that.saleprice);
					that.discountprice = CalcAmount.subtract(tempPrice, that.totalprice, 2);
					diffSkus.push(that);	
					return false;
				}				
			});			
		}
		var row = cloneObj(this);
		var totalprice = row.totalprice;
		row.totalprice = (totalprice>0?-totalprice:totalprice);
		diffSkus.push(row);				
	});
	
	if(diffqtyError){
		$.messager.alert("错误", "被替换商品数不能大于下单数量!", "error");  
		return false;
	}
	
	//新订单商品总金额
	$("#neworderprice", $diffOrderfm).numberbox("setValue", neworderprice);	
	//新订单商品优惠
	//var discountprice = neworderprice - newpayprice;
	var discountprice = CalcAmount.subtract(neworderprice, newpayprice, 2);	
	$("#discountprice", $diffOrderfm).numberbox("setValue", discountprice);	
	
	//新订单优惠
	var sellercouponprice = $("#sellercouponprice", $diffOrderfm).numberbox("getValue");
	//var couponfee = discountprice + Number(sellercouponprice);
	var couponfee = CalcAmount.add(discountprice, sellercouponprice, 2);
	$("#couponfee", $diffOrderfm).val(couponfee);
	
	//新订单实收金额
	var shippingfee = $("#shippingfee", $diffOrderfm).numberbox("getValue");	
	//newpayprice = newpayprice + Number(shippingfee) - Number(sellercouponprice);
	var payShipPrice = CalcAmount.add(newpayprice, shippingfee);
	newpayprice = CalcAmount.subtract(payShipPrice, sellercouponprice, 2);	
	$("#newpayprice", $diffOrderfm).numberbox("setValue",newpayprice);
	
	//补退金额
	var originalpayprice = $("#originalpayprice", $diffOrderfm).numberbox("getValue");
	var integralamount = $("#integralamount", $diffOrderfm).numberbox("getValue");
	var bonusamount =  $("#bonusamount", $diffOrderfm).numberbox("getValue");
	//var changeprice = newpayprice - Number(originalpayprice) + Number(integralamount/100) + Number(bonusamount) ;
	var newpayprice0 = CalcAmount.subtract(newpayprice, originalpayprice);
	var integralBonusamount = CalcAmount.add(integralamount/100, bonusamount);
	var changeprice = CalcAmount.add(newpayprice0, integralBonusamount, 2);
	$("#changeprice", $diffOrderfm).numberbox("setValue",changeprice);
	$("#difforderprice", $diffOrderfm).val(changeprice);
	
	diffOrderSkuDataGrid.datagrid({
		view:footerStyleView,
		title:'差异商品明细',
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	    
	    remoteSort:false,
	    sortName:"sku",
        sortOrder:"desc",	  
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	   
	    fitColumns:true,	    
	    columns:[[
          	//{field:'ck',checkbox:true},	    		
        	{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
        	{field:"materialname",title:"商品名称",width:220,align:"center"},
        	{field:"materialcode",title:"商品货号",width:80,align:"center"},	
        	{field:"isbuy",title:"商品类型",width:60,align:"center", 
        		formatter:function(value, row){
        			return formatter(value, window.parent.ecIsbuy); 
        		}
        	},
        	{field:"materialproperty",title:"商品属性",width:140,align:"center"},
        	{field:"orderlineid",title:"交易类型",width:60,align:"center",
        		formatter:function(value, row){
        			var value = "";
        			if(row.sku!='合计'){
        				if(typeof(row.orderlineid)=="undefined"){
        					value = "变更";
        				}else{
        					if(row.oldorderqty!=null && row.oldorderqty>0){
        						value = "回退";
        					}else{
        						value = "销售";
        					}
        				}
        			} 
        			return value;       		 	
        		}
        	},
        	{field:"orderqty",title:"交易数量",width:60,align:"center",formatter:numBaseFormat},
        	{field:"saleprice",title:"销售单价",width:60,align:"center",formatter:numBaseFormat},
        	{field:"payprice",title:"实付单价",width:60,align:"center",formatter:numBaseFormat},	      	
        	{field:"totalprice",title:"交易总价",width:60,align:"center",formatter:numBaseFormat}
	    ]],
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    showFooter:true,
	    rowStyler:function(index,row){
	    	if (row.sku=="合计"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	    	
	    	var value = "";
	    	if(typeof(row.orderlineid)=="undefined"){
				value = "background-color:#42cc06;";
			}else{
				if(row.oldorderqty!=null && row.oldorderqty>0){
					value = "background-color:#FF9933;";
				}
			}
	    	return value;	    	 	
		},
	    loadFilter:function(data) {
	    	var fields = ["totalprice"];
	    	return commonListFormat(data, fields, "sku");
        }
	}).datagrid("loadData", diffSkus);
	
	return true;
}



/**
 * 保存单据
 */
function saveData(){
	//获取保存数据
	var saveData = getSaveData();
	if(saveData!=null){		
		if(typeof afterSaveFunc === 'function'){	
			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), null, afterSaveFunc);
		}else{
			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), cancel);
		}		
	}	
}


/**
 * 取消
 */
function cancel(){
	parent.closeCurrTab();
}

</script>