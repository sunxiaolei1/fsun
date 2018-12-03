<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<shiro:hasPermission name="orders:query">  
	<div id="queryDiv" style="height:26%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../../ecCommon/commonSearchHeader.jsp"%>
			<table style="width: 100%;padding:5px;">
				<tr>
					<td width="6%">系统单号:</td>
					<td>
						<input name="sysorderid" id="sysorderid" class="easyui-textbox" />
					</td>
					<td width="6%">外部单号:</td>
					<td>
						<input name="extorderid" id="extorderid" class="easyui-textbox" />
					</td>					
					<td>系统状态:</td>
					<td>
						<input name="systemstatus" id="systemstatus" class="easyui-combobox" editable="false" />
					</td>					
					<td>订单类型:</td>
					<td>
						<input type="text" id="ordertype" name="ordertype" class="easyui-combobox" editable="false" />
					</td>
				</tr>
				<tr>													
					<td>所属公司:</td>
					<td>
						<input name="companycode" id="companycode" class="easyui-combogrid" />
					</td>
					<td>所属店铺:</td>
					<td>
						<input name="shopid" id="shopid" class="easyui-combogrid" />
					</td>
					<td>所属仓库:</td>
					<td>
						<input name="stockcode" id="stockcode" class="easyui-combogrid" />
					</td>									
				</tr>				
				<tr>
					<td>买家用户名:</td>
					<td>
						<input name="username" id="username" class="easyui-textbox" />
					</td>
					<td>销售状态:</td>
					<td>
						<input type="text" id="salestatus" name="salestatus" class="easyui-combobox" editable="false" />
					</td>					
				</tr>
				<tr>	
					<td>下单时间:</td>
					<td colspan="3">
						<input name="borderdatetime" id="borderdatetime" class="easyui-datetimebox" />
						-
						<input name="eorderdatetime" id="eorderdatetime" class="easyui-datetimebox"/>
					</td>			
					<td>付款时间:</td>
					<td colspan="3">
						<input name="bpaymentdatetime" id="bpaymentdatetime" class="easyui-datetimebox" />
						-
						<input name="epaymentdatetime" id="epaymentdatetime" class="easyui-datetimebox" />
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>						
					</td>
					
				</tr>
			</table>
		<%@include file="../../ecCommon/commonSearchFooter.jsp"%>		
	</div>
</shiro:hasPermission>


<!-- 查询条件 -->
<%@include file="../../ecCommon/companyToShopStockSearch.jsp"%>

<script type="text/javascript">

var initOrderDateTime ="";

$(function() {
	
	/* var date = new Date();//获取当前时间  
	date.setDate(date.getDate()-7);//设置天数 -7 天
	initOrderDateTime = formatterDateTime(date);
	$('#borderdatetime').datetimebox('setValue', initOrderDateTime); */	
	
	$('#ordertype').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecOrdertypeData
   	});	
	
	$('#salestatus').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecTradestatusData
   	});	 	 
	
	$('#systemstatus').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecSystemstatusData
   	});	 
	
	//初始化下拉框默认参数
	initComboxParams();
	
});

//查询
function query(){
	var url = '${api}/ecorder/findOrdersPageList';
	commonQuery(url);
}


//重置
function reset(){
	var childfuncname = 'companyClear';
	commonReset(childfuncname);
}

</script>