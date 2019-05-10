<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:50px;overflow:hidden;" data-options="region:'north',split:true">
		<%@include file="../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="7%">关键字:</td>
					<td width="15%">
						<input name="q" id="q" data-options="prompt:'客户编号,名称,手机号...'" class="easyui-textbox" style="width:95%" />
					</td>
					<td  width="10%">销售代表:</td>
					<td width="12%">
						<input id="salesmanText" name="salesman"  class="easyui-combogrid" style="width:90%" />			
					</td>
					<td width="8%">客户类型:</td>
					<td width="29%">
						<input id="customerTypeCombo" name="customerType" class="easyui-combobox" editable="false" style="width:35%" /> 
						&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>																			
				</tr>									
			</table>
		<%@include file="../busCommon/commonSearchFooter.jsp"%>		
	</div>
<%-- </shiro:hasPermission> --%>

<%@include file="../busCommon/salesmanSearch.jsp"%>	

<script type="text/javascript">

$(function() {
	
	$('#customerTypeCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.busCustomerTypeData	  
   	});
		
	//初始化下拉框默认参数
	initComboxParams();
});


//查询
function query(){
	var url = "${api}/bus/customer/findPage";
	commonQuery(url);
}

//重置
function reset(){
	var childfuncname = 'salesmanTextClear';
	commonReset(childfuncname);
}


</script>