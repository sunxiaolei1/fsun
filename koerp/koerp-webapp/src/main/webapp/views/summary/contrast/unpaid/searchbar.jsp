<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:15%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../../../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="6%">关键字:</td>
					<td>
						<input name="q" id="q" data-options="prompt:'输入销售单号...'" class="easyui-textbox" />
					</td>
					<td width="6%">交易类型:</td>
					<td>
						<input id="tradeTypeCombo" name="tradeType"  class="easyui-combobox" />
					</td>				
					<td  width="6%">交易状态:</td>
					<td>
						<input id="tradeStatusCombo" name="tradeStatus"  class="easyui-combobox" />
					</td>
					<td  width="6%">支付方式:</td>
					<td>
						<input id="payModeCombo" name="payMode"  class="easyui-combobox" />
					</td>																													
				</tr>
				<tr>
					<td  width="6%">所属客户:</td>
					<td>
						<input id="allCustomerCombo" name="customerCode"  class="easyui-combogrid" />
					</td>
					<td  width="6%">所属店仓:</td>
					<td>
						<input id="shopText" name="shopId"  class="easyui-combogrid" />
					</td>											
					<td width="6%">交易日期:</td>
					<td colspan="3">
						<input id="startDate" name="startDate" class="easyui-datebox" />
						-
						<input id="endDate" name="endDate" class="easyui-datebox" />&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>
				</tr>									
			</table>
		<%@include file="../../../busCommon/commonSearchFooter.jsp"%>		
	</div>
<%-- </shiro:hasPermission> --%>

<%@include file="../../../busCommon/allCustomerSearch.jsp"%>

<%@include file="../../../busCommon/shopSearch.jsp"%>	

<script type="text/javascript">

$(function() {
	
	$('#tradeTypeCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.tradeTypeData	  
   	});
	
	$('#tradeStatusCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.tradeStatusData	  
   	});
	
	$('#payModeCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.vipUnpaidPayModeData	  
   	});
	
	$('#cardTypeCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.vipCardTypeData	  
   	});
		
	//初始化下拉框默认参数
	initComboxParams();
});


//查询
function query(){
	var url = "${api}/summary/contrast/unpaid/findPage";
	commonQuery(url);
}

//重置
function reset(){
	var childfuncname = 'vipCustomerComboClear';
	commonReset(childfuncname);
}


</script>