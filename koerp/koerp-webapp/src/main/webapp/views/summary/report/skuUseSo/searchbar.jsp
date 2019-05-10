<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:50px;overflow:hidden;" data-options="region:'north',split:true">
		<%@include file="../../../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>									
					<td  width="8%">出库店仓:</td>
					<td>
						<input id="shopText" name="shopId"  class="easyui-combogrid" />
					</td>																																						
					<td width="8%">单据日期:</td>
					<td colspan="5">
						<input id="startDate" name="startDate" editable=false class="easyui-datebox" style="width:140px;" />
						-
						<input id="endDate" name="endDate" editable=false class="easyui-datebox" style="width:140px;" />&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>
				</tr>									
			</table>
		<%@include file="../../../busCommon/commonSearchFooter.jsp"%>		
	</div>

<%@include file="../../../busCommon/shopSearch.jsp"%>
		

<script type="text/javascript">

$(function() {		
	//加载初始条件	
	loadQueryParams();
});

/**
 * 查询
 */
function query(){
	
	$.ajax({
        type: "POST",
        dataType: "json",
        contentType:"application/json;charset=utf-8",
        async:true,
        url: "${api}/summary/report/skuUseSo/list",
        data: JSON.stringify(initQueryParams()),
        beforeSend: function (jqXHR) {  		        	
        	$.messager.progress({title: '请等待',msg: '数据加载中……',text: '',interval: 700});       	
        },
        success: function(result, textStatus) {       	
        	if(result.status){        		
        		if(result.entry!=null && result.entry.details!=null){
        			currDetailData = result.entry.details;
        			$('#skuSearcher').searchbox("clear");       			
        			clearDataGridSelections();
        			currDataGrid.datagrid({searchValue: ""}).datagrid('gotoPage', 1)
        				.datagrid("loadData", currDetailData);
        		}       		
        	}   			                				                															                	
        },
		complete: function (jqXHR, textStatus) {					
			$.messager.progress('close');
	    }
    });
}

/**
 * 重置
 */
function reset(){
	//清空查询条件
	reSetQueryParams();
	//加载初始条件	
	loadQueryParams();
	//加载数据
	query();
}

/**
 * 初始默认查询参数
 */
function loadQueryParams(){
	var now = formatterDate(new Date());
	$("#startDate", "#queryForm").datebox("setValue", now);
	$("#endDate", "#queryForm").datebox("setValue", now);
}

</script>