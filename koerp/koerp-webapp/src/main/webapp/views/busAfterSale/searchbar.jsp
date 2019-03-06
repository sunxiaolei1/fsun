<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:14%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../busCommon/commonSearchHeader.jsp"%>
			<table style="width: 100%;padding:5px;">
				<tr>
					<td width="6%">关键字:</td>
					<td>
						<input id="q" name="q" data-options="prompt:'输入退货单号、原订单号...'" class="easyui-textbox" />
					</td>								
					<td width="6%">换发单号:</td>
					<td>
						<input id="barterOrderId" name="barterOrderId"  class="easyui-textbox" />
					</td>
					<td width="6%">单据类型:</td>
					<td>	
						<input id="refundTypeCombo" name="refundType" class="easyui-combobox" editable="false" />
					</td>
					<td width="6%">退货状态:</td>
					<td>	
						<input id="refundStatusCombo" name="refundStatus" class="easyui-combobox" editable="false" />
					</td>											
				</tr>
				<tr>
					<td width="6%">客户名称:</td>
					<td>
						<input id="allCustomerCombo" name="buyerId"  class="easyui-combogrid" />
					</td>										
					<td width="6%">退换货原因:</td>
					<td>	
						<input id="refundReasonCombo" name="refundReason" class="easyui-combobox" editable="false" />
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
<%-- </shiro:hasPermission> --%>

<!-- 查询条件 -->
<%@include file="../busCommon/allCustomerSearch.jsp"%>

<script type="text/javascript">

var initOrderDateTime ="";

$(function() {
	
	$('#refundTypeCombo').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.refundTypeData
   	});	
	
	$('#refundStatusCombo').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.refundStatusData
   	});	
	
	$('#refundReasonCombo').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.refundReasonData
   	});	
	
	//初始化下拉框默认参数
	initComboxParams();
});


//查询
function query(){
	var url = "${api}/bus/aftersale/findPage";
	commonQuery(url);
}


//重置
function reset(){
	commonReset();
}

</script>