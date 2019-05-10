<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:80px;overflow:hidden;" data-options="region:'north',split:true">
		<%@include file="../../../busCommon/commonSearchHeader.jsp"%>		
			<table style="width: 100%;padding:5px;">
				<tr>
					<td width="8%">关键字:</td>
					<td>
						<input id="q" name="q" data-options="prompt:'退货单号、原订单号、换发单号...'" 
							class="easyui-textbox" style="width:85%" />
					</td>								
					<td  width="8%">交易门店:</td>
					<td>
						<input id="shopText" name="shopId"  class="easyui-combogrid" style="width:80%" />
					</td>
					<td width="8%">单据类型:</td>
					<td>	
						<input id="refundTypeCombo" name="refundType" class="easyui-combobox" editable="false" style="width:80%" />
					</td>
					<td width="8%">退货状态:</td>
					<td>	
						<input id="refundStatusCombo" name="refundStatus" class="easyui-combobox" editable="false" style="width:80%" />
					</td>											
				</tr>
				<tr>
					<td width="8%">客户名称:</td>
					<td>
						<input id="allCustomerCombo" name="buyerId"  class="easyui-combogrid" style="width:80%" />
					</td>										
					<td width="8%">退换货原因:</td>
					<td>	
						<input id="refundReasonCombo" name="refundReason" class="easyui-combobox" editable="false" style="width:80%" />
					</td>
					<td width="8%">单据日期:</td>
					<td colspan="3" style="width:38%;" >
						<input id="startDate" name="startDate" class="easyui-datebox" style="width:26%;" />
						-
						<input id="endDate" name="endDate" class="easyui-datebox" style="width:26%;" />&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>																													
				</tr>																					
			</table>
		<%@include file="../../../busCommon/commonSearchFooter.jsp"%>		
	</div>

<%@include file="../../../busCommon/shopSearch.jsp"%>
<%@include file="../../../busCommon/allCustomerSearch.jsp"%>			

<script type="text/javascript">

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
	var url = "${api}/summary/contrast/refund/findPage";
	commonQuery(url);
}

//重置
function reset(){
	commonReset();
}


</script>