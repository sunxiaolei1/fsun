<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:14%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="6%">关键字:</td>
					<td colspan="3">
						<input name="q" id="q" data-options="prompt:'输入寄提单号、寄存单号、提货人检索...'" class="easyui-textbox" style="width:300px" />
					</td>								
					<td  width="6%">单据状态:</td>
					<td>
						<input id="takeStatusCombo" name="takeStatus"  class="easyui-combobox" />
					</td>
					<td  width="6%">客户名称:</td>
					<td>
						<input id="allCustomerCombo" name="buyerId"  class="easyui-combogrid" />
					</td>																										
				</tr>
				<tr>
					<td  width="6%">所属店仓:</td>
					<td colspan="3">
						<input id="shopText" name="shopId"  class="easyui-combogrid" style="width:300px"/>
					</td>					
					<td width="6%">单据日期:</td>
					<td colspan="3">
						<input id="startDate" name="startDate" class="easyui-datebox" />
						-
						<input id="endDate" name="endDate" class="easyui-datebox" />&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>
				</tr>									
			</table>
		<%@include file="../busCommon/commonSearchFooter.jsp"%>		
	</div>

<%@include file="../busCommon/shopSearch.jsp"%>
<%@include file="../busCommon/allCustomerSearch.jsp"%>			

<script type="text/javascript">

$(function() {
	
	$('#takeStatusCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.busTakeStatusData	  
   	});
		
	//初始化下拉框默认参数
	initComboxParams();
});

//查询
function query(){
	var url = "${api}/bus/take/findPage";
	commonQuery(url);
}

//重置
function reset(){
	commonReset();
}


</script>