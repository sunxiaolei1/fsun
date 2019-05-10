<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<span style="float:right;margin-top:2px;">	
	<input id="skuSearcher" class="easyui-searchbox" style="width:350px">
</span>
<a href="#" id="signedGoodsBtn" class="easyui-linkbutton" iconCls="icon-cart_full" plain="true" onclick="allTaked()">全部提货</a>
<a href="#" id="rejectedGoodsBtn" class="easyui-linkbutton" iconCls="icon-cart_delete" plain="true" onclick="allUnTaked()">取消所有提货</a>
		
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
 * 全部提货
 */
function allTaked(){	
	$.each(currDetailData, function(){
		this.qty = this.maxQty;
	});
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);	
}
  
/**
 * 取消所有提货
 */
function allUnTaked(){	
	$.each(currDetailData, function(){
		this.qty = 0;
	});
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);	
}   
    

</script>
		