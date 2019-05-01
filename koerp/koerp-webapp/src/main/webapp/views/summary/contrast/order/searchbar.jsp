<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:15%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../../../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="6%">关键字:</td>
					<td>
						<input name="keywords" id="keywords" data-options="prompt:'输入销售单号、客户名称、手机号...'" class="easyui-textbox" style="width:240px" />
					</td>														
					<td width="6%">单据类型:</td>
					<td>
						<input id="orderTypeCombo" name="orderType"  class="easyui-combobox" />
					</td>				
					<td  width="6%">交易状态:</td>
					<td>
						<input id="tradeStatusCombo" name="tradeStatus"  class="easyui-combobox" />
					</td>					
					<td  width="6%">交易门店:</td>
					<td>
						<input id="shopText" name="shopId"  class="easyui-combogrid" />
					</td>
					
				</tr>	
				<tr>	
					<td width="6%">客户名称:</td>
					<td>
						<input id="allCustomerCombo" name="customerCode"  class="easyui-combogrid" style="width:240px"/>
					</td>	
					<td  width="6%">经办人:</td>
					<td>
						<input id="salesmanText" name="carrierId"  class="easyui-combogrid" />
					</td>																																										
					<td width="6%">单据日期:</td>
					<td colspan="3">
						<input id="startDate" name="startDate" editable=false class="easyui-datebox" />
						-
						<input id="endDate" name="endDate" editable=false class="easyui-datebox" />&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>
				</tr>									
			</table>
		<%@include file="../../../busCommon/commonSearchFooter.jsp"%>		
	</div>

<%@include file="../../../busCommon/shopSearch.jsp"%>
<%@include file="../../../busCommon/allCustomerSearch.jsp"%>	
<%@include file="../../../busCommon/salesmanSearch.jsp"%>			

<script type="text/javascript">

$(function() {		
	//var now = formatterDate(new Date());
	//$("#startDate").datebox("setValue", now);
	//$("#endDate").datebox("setValue", now);
	$('#tradeStatusCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.tradeStatusData	  
   	});
	
	$('#orderTypeCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.orderTypeData	  
   	});
		
	//初始化下拉框默认参数
	initComboxParams();
});

//查询
function query(){
	var url = "${api}/summary/contrast/order/findPage";
	commonQuery(url);
}

//重置
function reset(){
	commonReset();
}


</script>