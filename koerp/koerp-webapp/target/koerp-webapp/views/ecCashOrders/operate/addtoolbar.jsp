<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
	
<span style="float:right;margin-top:2px;">	
	<input id="skuSearcher" class="easyui-searchbox" style="width:350px">
</span>
<a href="#" class="easyui-linkbutton" iconCls="icon-cog_add" plain="true" onclick="saveData()">保存</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="cancel()">取消</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="relationCashOrders()">相关补退款单</a>

<script type="text/javascript">

$(function() {
	
	//初始化搜索框
	$('#skuSearcher').searchbox({
	     prompt: '输入商品名称、货号、SKU筛选...',
	     searcher: function (value, name) {
	    	 orderSkuDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currDetailData);
	     }
	 });

});


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

/**
 * 相关补退款单据
 */
function relationCashOrders(){
	var relationid = getCurrRelationid();
	var url = "${api}/eccash/operate/toRelationCashView/"+ relationid;	
	commonDialog("ordersDialog", "相关补退款单("+ relationid +")", "98%", "80%", url, "icon-application_view_detail");
}

</script>