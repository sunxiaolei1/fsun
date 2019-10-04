<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:80px;overflow:hidden;" data-options="region:'north',split:true">
		<%@include file="../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<input type="hidden" name="poType" value="20" />
				<tr>													
					<td width="8%">出库店仓:</td>
					<td colspan="3">
						<input id="fromShopCombo" name="fromShopId"  class="easyui-combogrid" style="width:90%;"/>
					</td>					
					<td width="8%">入库店仓:</td>
					<td colspan="3">
						<input id="toShopCombo" name="toShopId"  class="easyui-combogrid" style="width:80%;"/>
					</td>																			
				</tr>
				<tr>
					<td  width="8%">单据状态:</td>
					<td>
						<input id="poStatusCombo" name="poStatus" editable="false" class="easyui-combobox" style="width:80%;"/>
					</td>	
					<td width="8%">关键字:</td>
					<td>
						<input name="q" id="q" data-options="prompt:'输入申请单号...'" class="easyui-textbox" style="width:85%;"/>
					</td>
									
					<td width="8%">单据日期:</td>
					<td colspan="3" style="width:46%;" >
						<input id="startDate" name="startDate" class="easyui-datebox" editable="false" style="width:28%;"/>
						-
						<input id="endDate" name="endDate" class="easyui-datebox" editable="false" style="width:28%;"/>&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>
				</tr>									
			</table>
		<%@include file="../busCommon/commonSearchFooter.jsp"%>		
	</div>

<%@include file="../busCommon/fromToShopSearch.jsp"%>
		

<script type="text/javascript">

$(function() {
	
	$('#poStatusCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: docPoStatusData1  
   	});
	
	/* $('#poTypeCombo').combobox({		
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docPoTypeData	  
   	}); */
		
	//初始化下拉框默认参数
	initComboxParams();
});

//查询
function query(){
	var url = "${api}/doc/po/findPage";
	commonQuery(url);
}

//重置
function reset(){
	commonReset();
}


</script>