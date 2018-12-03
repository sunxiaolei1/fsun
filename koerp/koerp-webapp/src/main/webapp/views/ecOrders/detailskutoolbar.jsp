<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<style type="text/css">

.skutitle{
	margin: 0px 18px 0px 4px;
    padding-top: 0px;
    padding-bottom: 0px;
    height: 22px;
    line-height: 22px;
    width: 182px;
    font-size: 12px;
    font-weight: bold;
    color: #575765;
}

</style>


<span style="float:right;margin-top:2px;">	
	<input id="skuSearcher" name="searchername" class="easyui-searchbox" style="width:350px">
</span>
<div style="height:26px;"><span class="skutitle" >商品列表</span></div>	
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
	
	if(!endRowEditing(currOrderDetailDataGrid)){
		$.messager.alert({title: '消息', msg: '数据验证未通过!'});
		return;
	}

    $("<div></div>").dialog({
        id: "chooseSkuDialog",
        title: "添加商品",
        width: 1100,
        height: 450,
        iconCls: "icon-add",
        closed: false,
        cache: false,
        href: "${api}/sku/toChooseEditSku",
        view: {
            checkedSkus: currDetailData         
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
		