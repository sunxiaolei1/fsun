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
					<td width="6%">买家用户名:</td>
					<td>
						<input name="buyerusername" id="buyerusername" class="easyui-textbox" />
					</td>	
					<td width="6%">收货人姓名:</td>
					<td>
						<input name="realname" id="realname" class="easyui-textbox" />
					</td>
					<td width="6%">联系方式:</td>
					<td>
						<input name="contact" id="contact" class="easyui-textbox" />
					</td>					
				</tr>			
				<tr>
					<td width="6%">收货省份:</td>
					<td>
						<input id="provinceCombo" name="provinceid" class="easyui-combobox" editable="false" />
					</td>																																							
					<td width="6%">创建时间:</td>
					<td colspan="3">
						<input name="borderdatetime" id="borderdatetime" class="easyui-datetimebox" />
						-
						<input name="eorderdatetime" id="eorderdatetime" class="easyui-datetimebox" />
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
<%@include file="../ecCommon/companySearch.jsp"%>

<script type="text/javascript">

$(function() {
	
	$('#provinceCombo').combobox({		
   	 	valueField: 'regionId',
   	  	textField: 'regionName',
   	  	url: "${api}/region/findRegionList?parentId=1",
   	  	editable:false,  
   	 	loadFilter: function(result){      	 		 	 		
   	 		if(result==null || result.entry==null){
   	 			return [{regionId:"",regionName: "全部"}];	
   	 		}  	 		
   	 		var data = result.entry;
	   		data.unshift({regionId:"",regionName: "全部"});
	   	   	return data;
   	    }   	  
   	});
			
});


//查询
function query(){
	var url = "${api}/ecblackuser/findBlackUsersPageList";
	commonQuery(url);
}

//重置
function reset(){
	var childfuncname = 'companyClear';
	commonReset(childfuncname);
}


</script>