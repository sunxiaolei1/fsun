<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">		
	<%@include file="../busCommon/commonRulTreeSearch.jsp"%>
	<div id="rulDetail" class="easyui-panel" title='价格策略明细' style="padding:5px;"
		data-options="region:'center',split:true,collapsible:false" ></div>
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
