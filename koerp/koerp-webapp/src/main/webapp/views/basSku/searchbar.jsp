<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<%-- <shiro:hasPermission name="orders:query">   --%>
	<div id="queryDiv" style="height:10%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../busCommon/commonSearchHeader.jsp"%>		
			<table style="width:100%;padding:5px;">
				<tr>
					<td width="6%">关键字:</td>
					<td>
						<input name="q" id="q" data-options="prompt:'sku,商品名称,规格...'" class="easyui-textbox" style="width:250px" />
					</td>
					<td width="6%">条形码:</td>
					<td>
						<input id="barCodeText" name="barCode" class="easyui-textbox" editable="false" />
					</td>
					<td width="6%">商品分类:</td>
					<td>
						<input id="categoryCodeCombo" name="categoryCode" class="easyui-combobox" editable="false" />
					</td>
					<td  width="6%">品牌名称:</td>
					<td>
						<input id="brandCodeCombo" name="brandCode"  class="easyui-combobox" editable="false"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>																			
				</tr>									
			</table>
		<%@include file="../busCommon/commonSearchFooter.jsp"%>		
	</div>
<%-- </shiro:hasPermission> --%>

<script type="text/javascript">

$(function() {
	
	$('#categoryCodeCombo').combobox({	
		width: 140,
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.categoryCodeData	  
   	});
	
	$('#brandCodeCombo').combobox({	
		width: 140,
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.brandCodeData	  
   	});	
		
	//初始化下拉框默认参数
	initComboxParams();
});


//查询
function query(){
	var url = "${api}/bus/basSku/findPage";
	commonQuery(url);
}

//重置
function reset(){
	commonReset();
}


</script>