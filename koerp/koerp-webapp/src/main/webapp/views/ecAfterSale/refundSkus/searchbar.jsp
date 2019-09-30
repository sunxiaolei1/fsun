<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<shiro:hasPermission name="orders:query">  
	<div id="queryDiv" style="height:14%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../../ecCommon/commonSearchHeader.jsp"%>
			<table style="width: 100%;padding:5px;">				
				<tr>		
					<td>所属公司:</td>
					<td>
						<input name="companycode" id="companycode" class="easyui-combogrid" />
					</td>
					<td>所属店铺:</td>
					<td>
						<input name="shopid" id="shopid" class="easyui-combogrid" />
					</td>
					<td>创建时间:</td>
					<td colspan="3">
						<input name="bcreatedatetime" id="bcreatedatetime" class="easyui-datetimebox" />
						-
						<input name="ecreatedatetime" id="ecreatedatetime" class="easyui-datetimebox" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>												
						<a id="export" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel'" onclick="export()">导出</a>					
					</td>																			
				</tr>
				<tr>
					<td>退单类型:</td>
					<td>
						<input id="ischangeorder" name="ischangeorder" class="easyui-combobox" />
					</td>														
					<td>SKU:</td>
					<td>
						<input name="sku" id="sku" class="easyui-textbox" />
					</td>
					<td>货号:</td>
					<td>
						<input name="materialcode" id="materialcode" class="easyui-textbox" />
					</td>
					<td>商品名称:</td>
					<td>
						<input name="materialname" id="materialname" class="easyui-textbox" style="width:240px;" />
					</td>																																		
				</tr>				
			</table>
		<%@include file="../../ecCommon/commonSearchFooter.jsp"%>
	</div>
</shiro:hasPermission>

<!-- 查询条件 -->
<%@include file="../../ecCommon/companyToShopSearch.jsp"%>

<script type="text/javascript">

$(function(){
	
	$('#ischangeorder').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecIschangeorderData
   	});	
	
	//初始化下拉框默认参数
	initComboxParams();
	
})

//查询
function query(){
	var url = "${api}/ecaftersale/refund/findSkusPage";
	commonQuery(url);
}


//重置
function reset(){
	var childfuncname = 'companyClear';
	commonReset(childfuncname);
}


</script>