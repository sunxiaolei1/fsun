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
	<a href="#" class="easyui-linkbutton" iconCls="icon-lorry_go" plain="true" onclick="">入库</a>	
	<a href="#" class="easyui-linkbutton" iconCls="icon-hourglass_delete" plain="true" onclick="">超时认领</a>	
	<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="">刷新</a>	
</div>

<script type="text/javascript">

$(function() {
    

});


</script>