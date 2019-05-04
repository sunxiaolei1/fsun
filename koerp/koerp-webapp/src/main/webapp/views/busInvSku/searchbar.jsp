<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:50px;overflow:hidden;" data-options="region:'north',split:true">
		<%@include file="../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="8%">关键字:</td>
					<td>
						<input name="q" id="q" data-options="prompt:'输入sku,商品名称...'" class="easyui-textbox" style="width:200px" />
					</td>					
					<td  width="8%">所属店仓:</td>
					<td>
						<input id="shopText" name="shopId"  class="easyui-combogrid" style="width:200px"/>
						&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>	
						<a id="exportBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel'" onclick="exportExcel()">导出</a>					
					</td>																			
				</tr>									
			</table>
		<%@include file="../busCommon/commonSearchFooter.jsp"%>		
	</div>
<%-- </shiro:hasPermission> --%>

<%@include file="../busCommon/shopSearch.jsp"%>	

<script type="text/javascript">


//查询
function query(){
	var url = "${api}/bus/invSku/findPage";
	commonQuery(url);
}

//重置
function reset(){
	commonReset();
}

//excel导出
function exportExcel(){	
	var queryParams = initQueryParams();
	var url = "${api}/bus/invSku/exportExcel?q="+ encodeURI(encodeURI(queryParams.q)) 			
			+ "&shopId="+ queryParams.shopId;
	window.open(url); 
}

</script>