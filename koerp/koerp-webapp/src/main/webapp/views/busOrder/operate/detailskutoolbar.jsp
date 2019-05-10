<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<span style="float:right;margin-top:2px;">	
	<input id="skuSearcher" class="easyui-searchbox" style="width:350px">
</span>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addSkuRow()">添加商品 </a>
<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="addGiftSkuRow()">设为赠品 </a>
<a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="delGiftSkuRow()">取消赠品 </a>
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="delSkus()">删除</a> -->
		
<script type="text/javascript">

$(function() {
	
	//初始化搜索框
	$('#skuSearcher').searchbox({
	     prompt: '输入商品名称、SKU筛选...',
	     searcher: function (value, name) {
	    	 currOrderDetailDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currDetailData);
	     }
	 });

});

//商品列表刷新
function skuListReLoad() {
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);
}

/**
 * 打开商品选择控件
 */
function addSkuRow() {	
	
	var shopId = $("#shopId", $orderfm).val();
	var customerCode = $("#allCustomer",$orderfm).combogrid("getValue");
	if(customerCode==null || customerCode==''){
		$.messager.alert({title: '消息', msg: '请先选择客户信息'});
		return;
	}

	var isValid0 = currOrderDetailDataGrid.datagrid("isValid");	
	if(!isValid0){
		$.messager.alert({title: '消息', msg: '数据验证未通过!'});
		return;
	}
	
    $("<div></div>").dialog({
        id: "chooseSkuDialog",
        title: "添加商品",
        width: "95%",
        height: "420px",
        iconCls: "icon-add",
        closed: false,
        cache: false,
        href: "${api}/bus/invSku/toChooseEditSku",
        view: {
            checkedSkus: currDetailData,
            customerCode: customerCode,
            currShopId: shopId
        },
        modal: true,
        minimizable: false,
        maximizable: false,
        closable: true,
        collapsible: false,
        resizable: true,
        onClose: function () {
            $(this).dialog("destroy");
        }
    });
}

/**
 * 打开设为赠品控件
 */
function addGiftSkuRow() {	

	var rows = currOrderDetailDataGrid.datagrid("getSelections");	
	if(rows!=null && rows.length==1){
		 var row = rows[0];
		 $("<div></div>").dialog({
	        id: "giftSkuDialog",
	        title: "商品设为赠品",
	        width: 600,
	        height: 200,
	        iconCls: "icon-edit",
	        closed: false,
	        cache: false,
	        href: "${api}/bus/order/toSetGiftsView",	       
	        modal: true,
	        minimizable: false,
	        maximizable: false,
	        closable: true,
	        collapsible: false,
	        resizable: true,
	        buttons:[
             	{
             		text:"确定",iconCls:"icon-disk",
                     handler: function (data) {                     	
	                  	if ($setGiftsfm.form('validate')) {
	                  		var data = formJson($setGiftsfm);
	        	    		$.each(currDetailData, function(){
	        	    			if(row.sku == this.sku){
	        	    				this.isGift = data.isGift;
	        	    				this.goodsType = data.goodsType;
	        	    				this.giftCount = data.giftCount;
	        	    				this.giftPrice = CalcAmount.multiply(this.giftCount, this.originSalePrice);
	        	    				//实付金额
	        	    				var receptQty = CalcAmount.subtract(this.qty, this.giftCount);
	        	    				var couponPrice = CalcAmount.subtract(this.originSalePrice, this.salePrice);
	        	    				this.totalPrice = CalcAmount.multiply(this.salePrice, receptQty, 2);
	        	    				//商品优惠
	        	    				var tempPrice = CalcAmount.multiply(receptQty, couponPrice);
	        	    				this.couponPrice = CalcAmount.add(this.giftPrice, tempPrice, 2);    	        	    		
	    	        	    		return;
	        	    			}
	        	    		});
	        	    		currOrderDetailDataGrid.datagrid("loadData", currDetailData);	
	                  		$('#giftSkuDialog').dialog("destroy");
	                  	}
                     }
                 },
                 {
                     text:"取消",
                     iconCls:"icon-cancel",
                     handler:function(){
                     	$('#giftSkuDialog').dialog("destroy");
                     }
                 }
             ],
             onLoad:function(){
             	$('#giftSkuDialog').window('center');        	
             	$("#goodsName", $setGiftsfm).text(row.goodsName);
             	$('#goodsType', $setGiftsfm).combobox("setValue",2);
             	$("#sku", $setGiftsfm).textbox("setValue",row.sku);
             	$('#qty', $setGiftsfm).numberbox("setValue",row.qty);                	   
             	$('#giftCount', $setGiftsfm).numberspinner({
            	    min: 1,
            	    max: row.qty
            	}).numberspinner("setValue",1);
 			},
	        onClose: function () {
	            $(this).dialog("destroy");
	        }
	    });
		
	}else{
		$.messager.alert({title: '消息', msg: '请选中一行明细'});
	}
	
   
}

//取消赠品
function delGiftSkuRow(){
	
	var rows = currOrderDetailDataGrid.datagrid("getSelections");	
	if(rows!=null && rows.length>0){
		var skus = new Array(); 
		$.each(rows, function(){
			skus.push(this.sku);	
		});		
		$.each(currDetailData, function(){
			if(skus.contains(this.sku)){
				this.isGift = false;
				this.goodsType = "";
		  		this.giftCount = 0;
		  		this.giftPrice = 0; 
		  		//this.totalPrice = this.salePrice * (this.qty - this.giftCount);
		  		//this.couponPrice = this.giftPrice + (this.qty - this.giftCount)*(this.originSalePrice - this.salePrice);
		  	    //实付金额
				var receptQty = CalcAmount.subtract(this.qty, this.giftCount);
				var couponPrice = CalcAmount.subtract(this.originSalePrice, this.salePrice);
				this.totalPrice = CalcAmount.multiply(this.salePrice, receptQty, 2);
				//商品优惠
				var tempPrice = CalcAmount.multiply(receptQty, couponPrice);
				this.couponPrice = CalcAmount.add(this.giftPrice, tempPrice, 2);    
			}
		});
  		currOrderDetailDataGrid.datagrid("loadData", currDetailData);	
	}else{
		$.messager.alert({title: '消息', msg: '请至少选中一行明细'});
	}
	
}


/**
 * 删除商品
 */
function delSkus() {	
	
	$.messager.confirm("确认", "是否确认删除？", function (sure) {
        if (sure) {
        	var rows = currOrderDetailDataGrid.datagrid("getSelections");
        	if(rows.length>0){	
        		var skus = new Array(); 
        		$.each(rows, function(){
        			skus.push(this.sku);	
        		});
        		
        		var newDetailData = [];
        		$.each(currDetailData, function(){
        			if(!skus.contains(this.sku)){
        				newDetailData.push(this);
        			}
        		});
        		currDetailData = newDetailData;
        		currOrderDetailDataGrid.datagrid("loadData", currDetailData);
        	}
        }
    });	
}

</script>
		