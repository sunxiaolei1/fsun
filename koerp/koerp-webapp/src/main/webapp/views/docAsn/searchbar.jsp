<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:14%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../ecCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="6%">单据类型:</td>
					<td>
						<input id="asnTypeCombo" name="asnType"  class="easyui-combobox" />
					</td>				
					<td  width="6%">单据状态:</td>
					<td>
						<input id="asnStatusCombo" name="asnStatus"  class="easyui-combobox" />
					</td>
					<td  width="6%">发货店仓:</td>
					<td>
						<input id="fromShopCombo" name="fromShopId"  class="easyui-combogrid" style="width:200px"/>
					</td>					
					<td  width="6%">收货店仓:</td>
					<td>
						<input id="toShopCombo" name="toShopId"  class="easyui-combogrid" style="width:200px"/>
					</td>																			
				</tr>
				<tr>
					<td width="6%">关键字:</td>
					<td colspan="3">
						<input name="q" id="q" data-options="prompt:'输入入库单号,出库单号,申请单号...'" class="easyui-textbox" style="width:400px" />
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
		<%@include file="../ecCommon/commonSearchFooter.jsp"%>		
	</div>

<%@include file="../busCommon/fromToShopSearch.jsp"%>
		

<script type="text/javascript">

$(function() {
	
	$('#asnStatusCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docAsnStatusData	  
   	});
	
	$('#asnTypeCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docAsnTypeData	  
   	});
		
	//初始化下拉框默认参数
	initComboxParams();
});

//查询
function query(){
	var url = "${api}/doc/asn/findPage";
	commonQuery(url);
}

//重置
function reset(){
	commonReset();
}


</script>