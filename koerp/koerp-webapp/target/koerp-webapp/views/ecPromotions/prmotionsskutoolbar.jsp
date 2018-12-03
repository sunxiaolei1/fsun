<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<span style="float:right;margin-top:2px;">	
	<input id="promotionsSkuSearcher" name="searchername" class="easyui-searchbox" style="width:350px">
</span>
<a href="#" id="addPromotionsSkuBtn" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addPromotionsSkuRow()">添加</a>
<a href="#" id="delPromotionsSkusBtn" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="delPromotionsSkus()">删除</a>
		
<script type="text/javascript">

$(function() {
	
	//初始化搜索框
	$('#promotionsSkuSearcher').searchbox({
	     prompt: '输入商品名称、货号、SKU筛选...',
	     searcher: function (value, name) {
	    	 currSkuDetailDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currSkuDetailData);
	     }
	 });

});


//商品列表刷新
function promotionsSkuListReLoad() {
	currSkuDetailDataGrid.datagrid("loadData", currSkuDetailData);
}

/**
 * 打开商品选择控件
 */
function addPromotionsSkuRow() {
	
	if(hasShopid()==null){
		$.messager.alert({title: '消息', msg: '需要选择门店!'});
		return;
	}
	
	if(!endRowEditing(currSkuDetailDataGrid)){
		$.messager.alert({title: '消息', msg: '数据验证未通过!'});
		return;
	}
	
	var notInSkusArr = new Array();
	$.each(currSkuDetailData,function(){
		notInSkusArr.push(this.sku);
	});
	
    $("<div></div>").dialog({
        id: "chooseSkuDialog",
        title: "添加活动商品",
        width: 1150,
        height: 500,
        iconCls: "icon-add",
        closed: false,
        cache: false,
        href: "${api}/sku/toChooseSku",
        view: {
            checkedSkus: currSkuDetailData,
            notInSkusArr: notInSkusArr,
            loadFuncName: "promotionsSkuListReLoad"
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
function delPromotionsSkus() {	
	
	$.messager.confirm("确认", "是否确认删除？", function (sure) {
        if (sure) {
        	var rows = currSkuDetailDataGrid.datagrid("getSelections");
        	if(rows.length>0){	
        		var skus = new Array(); 
        		$.each(rows, function(){
        			skus.push(this.sku);	
        		});
        		
        		var newDetailData = [];
        		$.each(currSkuDetailData, function(){
        			if(!skus.contains(this.sku)){
        				newDetailData.push(this);
        			}
        		});
        		currSkuDetailData = newDetailData;
        		currSkuDetailDataGrid.datagrid("loadData", currSkuDetailData);
        	}
        }
    });	
}

//隐藏按钮
function hiddenPromotionsGoodsBtn(){
	$("#addPromotionsSkuBtn").linkbutton("disable");
	$("#delPromotionsSkusBtn").linkbutton("disable");	
}

//显示按钮
function showPromotionsGoodsBtn(){
	$("#addPromotionsSkuBtn").linkbutton("enable");
	$("#delPromotionsSkusBtn").linkbutton("enable");
}


</script>
		