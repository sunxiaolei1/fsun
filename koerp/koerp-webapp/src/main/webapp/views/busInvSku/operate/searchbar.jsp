<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:50px;overflow:hidden;" data-options="region:'north',split:true">
		<%@include file="../../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="8%">交易单号:</td>
					<td style="width:20%;" >
						<input id="tradeOrderNo" name="tradeOrderNo" class="easyui-textbox" />
					</td>	
					<td  width="8%">交易类型:</td>
					<td style="width:16%;" >
						<input id="tradeTypeCombo" name="tradeType" editable="false" class="easyui-combobox" style="width:80%;" />
					</td>				
					<td  width="8%">交易状态:</td>
					<td style="width:40%;" >
						<input id="tradeStatusCombo" name="tradeStatus" editable="false" class="easyui-combobox" style="width:30%;" />
						&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
						<a id="exportBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel'" onclick="exportExcel()">导出</a>
					</td>																			
				</tr>									
			</table>
		<%@include file="../../busCommon/commonSearchFooter.jsp"%>		
	</div>
<%-- </shiro:hasPermission> --%>

<script type="text/javascript">

$(function() {
	
	$('#tradeStatusCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docTradeStatusData	  
   	});
	
	$('#tradeTypeCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docTradeTypeData	  
   	});
		
	//初始化下拉框默认参数
	initComboxParams();
});


//查询
function query(){
	var url = "${api}/bus/invSku/findDetailsPage";
	commonQuery(url);
}

//重置
function reset(){
	commonReset();
}

//excel导出
function exportExcel(){	
	var queryParams = initQueryParams();
	var url = "${api}/bus/invSku/details/exportExcel?tradeOrderNo="+ queryParams.tradeOrderNo 
			+ "&sku="+ queryParams.sku 
			+ "&shopId="+ queryParams.shopId
			+ "&tradeType="+ queryParams.tradeType 
			+ "&tradeStatus="+ queryParams.tradeStatus;
	window.open(url); 
}

</script>