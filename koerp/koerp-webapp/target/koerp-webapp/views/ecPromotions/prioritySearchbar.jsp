<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<span style="float:right;margin-top:2px;">	
	<input id="promotionsnameSearcher" name="promotionsnameSearcher" class="easyui-searchbox" style="width:350px">
</span>
<div style="height:26px;padding:2px 4px 2px 4px;" >
	<label>
	            所属公司:
		<input name="companycode" id="companycode" class="easyui-combogrid" style="height:26px;width:162px;" />
	</label>
	<label>
	            所属店铺:
		<input name="shopid" id="shopid" class="easyui-combogrid" style="height:26px;width:200px;" />
	</label>
</div>

	
	
<script type="text/javascript">

$(function() {
	
	//初始化搜索框
	$('#promotionsnameSearcher').searchbox({
	     prompt: '输入活动名称筛选...',
	     searcher: function (value, name) {
	    	 currDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currPromotionsData);
	     }
	 });

});


</script>
		