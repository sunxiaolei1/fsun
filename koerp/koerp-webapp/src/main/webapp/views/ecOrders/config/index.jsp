<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">		
	<%@include file="../../ecCommon/commonShopTreeSearch.jsp"%>
	<div id="configDetail" class="easyui-panel" title='设置列表' style="padding:5px;"
		data-options="region:'center',split:true,collapsible:false"  ></div>
</div>
	
	
 <script type="text/javascript" >
 	
 
	$(function(){
		
		//初始化门店树
		initShopTree({"isenable": true}, 
			function(node){
				$("#configDetail").panel("refresh", "${api}/ecorder/config/toDetail/" + node.id);
			}
		);
		
	});

	
</script>
</html>
