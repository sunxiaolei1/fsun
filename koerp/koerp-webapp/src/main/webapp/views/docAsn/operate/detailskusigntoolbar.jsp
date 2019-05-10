<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<span style="float:right;margin-top:2px;">	
	<input id="skuSearcher" class="easyui-searchbox" style="width:350px">
</span>
<a href="#" id="signedGoodsBtn" class="easyui-linkbutton" iconCls="icon-cart_full" plain="true" onclick="allSigned()">整单签收</a>
<a href="#" id="rejectedGoodsBtn" class="easyui-linkbutton" iconCls="icon-cart_delete" plain="true" onclick="allRejected()">整单退</a>
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-cart_error" plain="true" onclick="allDamaged()">整单报损</a> -->
		
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
 * 整单签收
 */
function allSigned(){	
	$.each(currDetailData, function(){
		this.receiveQty = this.expectedQty;
		this.rejectedQty = 0;
		this.damagedQty = 0;
		this.signType = '10';
	});
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);	
}
  
/**
 * 整单退
 */
function allRejected(){	
	$.each(currDetailData, function(){
		this.receiveQty = 0;
		this.rejectedQty = this.expectedQty;
		this.damagedQty = 0;
		this.signType = '30';
	});
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);	
}
    
    
/**
 * 整单报损
 */
function allDamaged(){	
	$.each(currDetailData, function(){
		this.receiveQty = 0;
		this.rejectedQty = 0;
		this.damagedQty = this.expectedQty;
		this.signType = '20';
	});
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);	
}   
    

</script>
		