<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:10%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../ecCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="6%">关键字:</td>
					<td>
						<input name="q" id="q" data-options="prompt:'卡号,持卡人,手机号...'" class="easyui-textbox" style="width:250px" />
					</td>
					<td width="6%">卡级别:</td>
					<td>
						<input id="cardTypeCombo" name="cardType" class="easyui-combobox" editable="false" />
					</td>
					<td  width="10%">所属客户:</td>
					<td>
						<input id="vipCustomerCombo" name="customerCode"  class="easyui-combogrid" style="width:250px"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>																			
				</tr>									
			</table>
		<%@include file="../ecCommon/commonSearchFooter.jsp"%>		
	</div>
<%-- </shiro:hasPermission> --%>

<%@include file="../busCommon/vipCustomerSearch.jsp"%>	

<script type="text/javascript">

$(function() {
	
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
	var url = "${api}/bus/vip/findPage";
	commonQuery(url);
}

//重置
function reset(){
	var childfuncname = 'vipCustomerComboClear';
	commonReset(childfuncname);
}


</script>