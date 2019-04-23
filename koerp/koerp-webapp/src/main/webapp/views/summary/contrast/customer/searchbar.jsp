<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:10%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../../../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>									
					<td  width="6%">客户名称:</td>
					<td>
						<input id="allCustomerCombo" name="customerCode"  class="easyui-combogrid" style="width:200px"/>
					</td>																																						
					<td width="6%">单据日期:</td>
					<td colspan="3">
						<input id="startDate" name="startDate" editable=false class="easyui-datebox" />
						-
						<input id="endDate" name="endDate" editable=false class="easyui-datebox" />&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>
				</tr>									
			</table>
		<%@include file="../../../busCommon/commonSearchFooter.jsp"%>		
	</div>

<%@include file="../../../busCommon/allCustomerSearch.jsp"%>
		

<script type="text/javascript">

$(function() {		
	var now = formatterDate(new Date());
	$("#startDate").datebox("setValue", now);
	$("#endDate").datebox("setValue", now);
});

//查询
function query(){
	var url = "${api}/summary/contrast/customer/findPage";
	commonQuery(url);
}

//重置
function reset(){
	commonReset();
}


</script>