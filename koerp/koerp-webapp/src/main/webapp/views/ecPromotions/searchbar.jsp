<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 


<shiro:hasPermission name="orders:query">  
	<div id="queryDiv" style="height:14%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../ecCommon/commonSearchHeader.jsp"%>
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
					<td>活动状态:</td>
					<td>	
						<input id="status" name="status" class="easyui-combobox" editable="false" />
					</td>
					<td>活动类型:</td>
					<td>	
						<input id="promotionstype" name="promotionstype" class="easyui-combobox" editable="false" />
					</td>																				
				</tr>	
				<tr>
					<td>活动名称:</td>
					<td colspan="3">
						<input name="promotionsname" id="promotionsname" class="easyui-textbox" style="width: 440px;" />
					</td>																																															
					<td>活动时间段:</td>
					<td colspan="3">
						<input name="startdatetime" id="startdatetime" class="easyui-datetimebox" />
						-
						<input name="originaldatetime" id="originaldatetime" class="easyui-datetimebox" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>
					</td>					
				</tr>									
			</table>
		<%@include file="../ecCommon/commonSearchFooter.jsp"%>
	</div>
</shiro:hasPermission>

<!-- 查询条件 -->
<%@include file="../ecCommon/companyToShopSearch.jsp"%>

<script type="text/javascript">

var initOrderDateTime ="";

$(function() {
	
	$('#status').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecPromotionsStatusData
   	});	
	
	$('#promotionstype').combobox({   	
  	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecPromotionsTypeData
   	});	

	//初始化下拉框默认参数
	initComboxParams();
});


//查询
function query(){
	var url = "${api}/ecpromotions/findPromotionsPage";
	commonQuery(url);
}


//重置
function reset(){
	var childfuncname = 'companyClear';
	commonReset(childfuncname);
}

</script>