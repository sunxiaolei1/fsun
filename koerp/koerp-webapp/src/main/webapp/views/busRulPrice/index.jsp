<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true">		
	<%@include file="../busCommon/commonRulTreeSearch.jsp"%>
	<div id="rulDetail" title="策略明细" class="easyui-panel" style="padding:5px;"
		data-options="region:'center',split:true,collapsible:false,border:false" ></div>
</div>
	
	
 <script type="text/javascript" >
 	
 
	$(function(){
		
		//初始化门店树
		initRulTree({}, 
			function(node){
				$("#rulDetail").panel("refresh", "${api}/bus/rule/price/toDetailView/" + node.id);
			}
		);
		
	});

	
</script>
</html>
