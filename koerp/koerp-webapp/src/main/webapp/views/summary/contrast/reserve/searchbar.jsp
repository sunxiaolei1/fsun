<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:80px;overflow:hidden;" data-options="region:'north',split:true">
		<%@include file="../../../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="8%">关键字:</td>
					<td>
						<input name="q" id="q" data-options="prompt:'输入销售单号...'" class="easyui-textbox" style="width:80%" />
					</td>
					<td width="8%">交易类型:</td>
					<td>
						<input id="tradeTypeCombo" name="tradeType" editable="false" class="easyui-combobox" style="width:80%" />
					</td>				
					<td  width="8%">交易状态:</td>
					<td>
						<input id="tradeStatusCombo" name="tradeStatus" editable="false" class="easyui-combobox" style="width:80%" />
					</td>
					<td  width="8%">支付方式:</td>
					<td>
						<input id="payModeCombo" name="payMode" editable="false" class="easyui-combobox" style="width:80%" />
					</td>																													
				</tr>
				<tr>
					<td  width="8%">所属客户:</td>
					<td>
						<input id="allCustomerCombo" name="customerCode"  class="easyui-combogrid" style="width:78%" />
					</td>
					<td  width="8%">所属店仓:</td>
					<td>
						<input id="shopText" name="shopId"  class="easyui-combogrid" style="width:80%" />
					</td>											
					<td width="8%">交易日期:</td>
					<td colspan="3" style="width:40%;" >
						<input id="startDate" name="startDate" class="easyui-datebox" style="width:26%" />
						-
						<input id="endDate" name="endDate" class="easyui-datebox" style="width:26%" />&nbsp;&nbsp;
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
	var url = "${api}/summary/contrast/reserve/findPage";
	commonQuery(url);
}

//重置
function reset(){
	var childfuncname = 'vipCustomerComboClear';
	commonReset(childfuncname);
}


</script>