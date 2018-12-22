<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<span style="float:right;margin-top:2px;">	
	<input id="rulSkuSearcher" name="searchername" class="easyui-searchbox" style="width:350px">
</span>
<a href="#" id="addRulSkusBtn" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addSkuRow()">选择商品</a>
<a href="#" id="delRulSkusBtn" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="delSkus()">删除</a>
		
<script type="text/javascript">

$(function() {
	
	//初始化搜索框
	$('#rulSkuSearcher').searchbox({
	     prompt: '输入商品名称、SKU筛选...',
	     searcher: function (value, name) {
	    	 currOrderDetailDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currSkusData);
	     }
	 });

});

//商品列表刷新
function skuListReLoad() {
	currOrderDetailDataGrid.datagrid("loadData", currSkusData);
}

//初始化一个商品
function defindInitNewSku(checkedSku){
	
	if(checkedSku==null){
		return null;
	}	
	var sku = new Object();		
		
	sku.skuId = checkedSku.skuId;		
	sku.categoryCode = checkedSku.categoryCode;      
	sku.productType = checkedSku.productType;
	sku.sku = checkedSku.sku; 
    sku.brandCode = checkedSku.brandCode;
    sku.goodsName = checkedSku.goodsName;
    sku.enName = checkedSku.enName;
    sku.property = checkedSku.property;     
    sku.marketPrice = checkedSku.marketPrice;
    sku.salePrice = checkedSku.originSalePrice;
    sku.lastSalePrice = null;
    sku.vipPrice = checkedSku.originSalePrice;
    sku.costPrice = checkedSku.costPrice;
    sku.unit = checkedSku.unit;
    sku.unitName = checkedSku.unitName;
    sku.keywords = checkedSku.keywords;    
    return sku;
}

/**
 * 打开商品选择控件
 */
function addSkuRow() {
	
	var isValid0 = currOrderDetailDataGrid.datagrid("isValid");	
	if(!isValid0){
		$.messager.alert({title: '消息', msg: '数据验证未通过!'});
		return;
	}
	
	var notInSkusArr = new Array();
	$.each(currSkusData,function(){
		notInSkusArr.push(this.sku);
	});

    $("<div></div>").dialog({
        id: "chooseSkuDialog",
        title: "选择商品",
        width: 1150,
        height: 500,
        iconCls: "icon-add",
        closed: false,
        cache: false,
        href: "${api}/bus/basSku/toChooseSku",
        view: {
            checkedSkus: currSkusData,
            notInSkusArr: notInSkusArr,
            loadFuncName: "skuListReLoad",
            initNewSku: "defindInitNewSku"
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
        		$.each(currSkusData, function(){
        			if(!skus.contains(this.sku)){
        				newDetailData.push(this);
        			}
        		});
        		currSkusData = newDetailData;
        		currOrderDetailDataGrid.datagrid("loadData", currSkusData);
        	}
        }
    });	
}

</script>
		