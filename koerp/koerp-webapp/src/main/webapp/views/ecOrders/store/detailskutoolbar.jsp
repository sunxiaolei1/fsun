<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<span style="float:right;margin-top:2px;">	
	<input id="skuSearcher" name="searchername" class="easyui-searchbox" style="width:350px">
</span>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addSkuRow()">添加</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="delSkus()">删除</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-folder_up" plain="true" onclick="importSkus()">上传商品</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-download" plain="true" onclick="downloadTemplate()">下载模板</a>
		
<script type="text/javascript">

$(function() {
	
	//初始化搜索框
	$('#skuSearcher').searchbox({
	     prompt: '输入商品名称、货号、SKU筛选...',
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
	$.each(currDetailData,function(){
		notInSkusArr.push(this.sku);
	});

    $("<div></div>").dialog({
        id: "chooseSkuDialog",
        title: "添加商品",
        width: 1150,
        height: 500,
        iconCls: "icon-add",
        closed: false,
        cache: false,
        href: "${api}/sku/toChooseInvSku",
        view: {
            checkedSkus: currDetailData,
            notInSkusArr: notInSkusArr,
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

/**
 * 上传商品
 */
function importSkus(){
	
}

/**
 * 下载模板
 */
function downloadTemplate() {	
	
}

</script>
		