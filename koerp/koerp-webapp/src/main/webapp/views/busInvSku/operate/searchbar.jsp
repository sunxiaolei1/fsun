<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:10%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../../ecCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="6%">交易单号:</td>
					<td>
						<input id="tradeOrderNo" name="tradeOrderNo" class="easyui-textbox" style="width:180px" />
					</td>	
					<td  width="6%">交易类型:</td>
					<td>
						<input id="tradeTypeCombo" name="tradeType" class="easyui-combobox" style="width:160px"/>
					</td>				
					<td  width="6%">交易状态:</td>
					<td>
						<input id="tradeStatusCombo" name="tradeStatus" class="easyui-combobox" style="width:160px"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>																			
				</tr>									
			</table>
		<%@include file="../../ecCommon/commonSearchFooter.jsp"%>		
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


</script>