<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<span style="float:right;margin-top:2px;">	
	<input id="skuSearcher" name="searchername" class="easyui-searchbox" style="width:350px">
</span>
<a href="#" id="addPromotionsGiftsBtn" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addSkuRow()">添加</a>
<a href="#" id="delPromotionsGiftsBtn" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="delSkus()">删除</a>
		
<script type="text/javascript">

$(function() {
	
	//初始化搜索框
	$('#skuSearcher').searchbox({
	     prompt: '输入赠品名称、货号、SKU筛选...',
	     searcher: function (value, name) {
	    	 currOrderDetailDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currGiftDetailData);
	     }
	 });

});

//商品列表刷新
function skuListReLoad() {
	currOrderDetailDataGrid.datagrid("loadData", currGiftDetailData);
}

//初始化一个商品
function defindInitNewSku(checkedSku){
	
	if(checkedSku==null){
		return null;
	}	
	var sku = new Object();		
		
    sku.materialcode = checkedSku.materialcode;
    sku.materialname = checkedSku.materialshortname;
    sku.materialproperty = checkedSku.suitattribute;
    sku.sku = checkedSku.sku;      
    sku.orderprice = 0; 
    sku.giftsqty = 1; 
    sku.qty = 1; 
    sku.giftslockqty = 1;
    sku.giftshasqty = 0;
    sku.enableqty = 1;
    sku.saleprice = checkedSku.price;
    sku.payprice = checkedSku.price;      
    return sku;
}

/**
 * 打开商品选择控件
 */
function addSkuRow() {
	
	if(hasShopid()==null){
		$.messager.alert({title: '消息', msg: '需要选择门店!'});
		return;
	}
	
	if(!endRowEditing(currOrderDetailDataGrid)){
		$.messager.alert({title: '消息', msg: '数据验证未通过!'});
		return;
	}
	
	var companycode = $("#companycode").combogrid("getValue");
	var shopid = $("#shopid").combogrid("getValue");
	var notInSkusArr = new Array();
	$.each(currGiftDetailData,function(){
		notInSkusArr.push(this.sku);
	});

    $("<div></div>").dialog({
        id: "chooseSkuDialog",
        title: "添加赠送商品",
        width: 1150,
        height: 500,
        iconCls: "icon-add",
        closed: false,
        cache: false,
        href: "${api}/sku/toChooseInvSku",
        view: {
            checkedSkus: currGiftDetailData,
            notInSkusArr: notInSkusArr,
            loadFuncName: "skuListReLoad",
            initNewSku: "defindInitNewSku",
            currCompanycode: companycode,
            currShopid: shopid
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
        		$.each(currGiftDetailData, function(){
        			if(!skus.contains(this.sku)){
        				newDetailData.push(this);
        			}
        		});
        		currGiftDetailData = newDetailData;
        		currOrderDetailDataGrid.datagrid("loadData", currGiftDetailData);
        	}
        }
    });	
}

//隐藏按钮
function hiddenPromotionsGiftsBtn(){
	$("#addPromotionsGiftsBtn").linkbutton("disable");
	$("#delPromotionsGiftsBtn").linkbutton("disable");	
}

</script>
		