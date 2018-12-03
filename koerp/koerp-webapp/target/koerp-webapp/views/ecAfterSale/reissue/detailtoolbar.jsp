<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<style>
.toolbar{
	height:30px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	border-bottom:0px;
	background: #f3f3f3;
	padding-top:2px;
}
</style>

<div id="detailtoolbar" class="toolbar" data-options="region:'center'">
	<a href="#" id="order_close_reissue_order" class="easyui-linkbutton" iconCls="icon-bullet_cross" plain="true" onclick="">关闭补发单</a>	
	<a href="#" id="order_reaudit" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="">重新审核</a>	
	<a href="#" id="order_refresh" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="">刷新</a>	
</div>

<script type="text/javascript">

$(function() {
    
	var hiddenButtons = '${hiddenbuttons}';
	$.each(hiddenButtons.split(","), function(){
		$("#"+this).hide();
	});
});


</script>