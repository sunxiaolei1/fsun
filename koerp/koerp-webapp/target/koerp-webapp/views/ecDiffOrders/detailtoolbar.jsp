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
	<!-- diffos差异单详情 -->
	<a href="#" id="diff_syn" class="easyui-linkbutton" iconCls="icon-arrow_redo" plain="true" onclick="">订单手工同步</a>
	<a href="#" id="diff_express" class="easyui-linkbutton" iconCls="icon-award_star_silver_3" plain="true" onclick="">指定快递</a>
	<a href="#" id="diff_cancel" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="cancelOrder()">取消订单</a>
	<a href="#" id="diff_eidt_sku" class="easyui-linkbutton" iconCls="icon-asterisk_orange" plain="true" onclick="toEditDiffOrderView('${diffid}')">更改商品</a>
	<a href="#" id="diff_eidt_receive_info" class="easyui-linkbutton" iconCls="icon-asterisk_red" plain="true" onclick="">修改收货信息</a>
	<a href="#" id="diff_edit_invoice_info" class="easyui-linkbutton" iconCls="icon-asterisk_yellow" plain="true" onclick="">修改发票信息</a>
	<a href="#" id="diff_blacklist" class="easyui-linkbutton" iconCls="icon-report_user" plain="true" onclick="">列为黑名单</a>
	<a href="#" id="diff_audit_pass" class="easyui-linkbutton" iconCls="icon-cog_go" plain="true" onclick="diffAudit('${diffid}',30,'')">审核通过</a>
	<a href="#" id="diff_audit_reject" class="easyui-linkbutton" iconCls="icon-cog_stop" plain="true" onclick="">审核驳回</a>
	
</div>

<%@include file="../ecCommon/commonOrderFunc.jsp"%>

<script type="text/javascript">

$(function() {
    

});


</script>