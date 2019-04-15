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
	<input id="skuSearcher" class="easyui-searchbox" style="width:350px">
</span>
<div style="height:24px;">
	<span class="skutitle" >
		备用金交易历史[客户名称 : <span id="skutitle"></span>]
	</span>	
</div>	

<script type="text/javascript">

$(function() {
	
	//初始化搜索框
	$('#skuSearcher').searchbox({
	     prompt: '输入销售单号、交易店仓筛选...',
	     searcher: function (value, name) {
	    	 currOrderDetailDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currDetailData);
	     }
	 });

});

</script>
		