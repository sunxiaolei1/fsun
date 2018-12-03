<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<shiro:hasPermission name="orders:query">  
	<div id="queryDiv" style="height:26%;overflow:hidden;border: 1px solid #D3D3D3;" data-options="region:'center'">
		<%@include file="../../ecCommon/commonSearchHeader.jsp"%>
			<table style="width: 100%;padding:5px;">
				<tr>					
					<td width="6%">补款单号:</td>
					<td>
						<input name="cashid" id="cashid" class="easyui-textbox" />
					</td>
					<td width="6%">关联订单号:</td>
					<td>
						<input name="sysorderid" id="sysorderid" class="easyui-textbox" />
					</td>
					<td width="6%">外部单号:</td>
					<td>
						<input name="extorderid" id="extorderid" class="easyui-textbox" />
					</td>
					<td>补款状态:</td>
					<td>
						<input id="refundcashstatus" name="refundcashstatus" class="easyui-combobox" editable="false" />
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
					<td>订单类型:</td>
					<td>
						<input type="text" id="ordertype" name="ordertype" class="easyui-combobox" editable="false" />
					</td>
					<td>销售状态:</td>
					<td>
						<input type="text" id="salestatus" name="salestatus" class="easyui-combobox" editable="false" />
					</td>																			
				</tr>
				<tr>																		
					<td>买家用户名:</td>
					<td>
						<input name="username" id="username" class="easyui-textbox" />
					</td>	
					<td>创建人:</td>
					<td>
						<input name="addcname" id="addcname" class="easyui-textbox" />
					</td>
					<td>修改人:</td>
					<td>
						<input name="modyfycname" id="modyfycname" class="easyui-textbox" />
					</td>				
				</tr>							
				<tr>																										
					<td>创建时间:</td>
					<td colspan="3">
						<input name="badddatetime" id="badddatetime" class="easyui-datetimebox" />
						-
						<input name="eadddatetime" id="eadddatetime" class="easyui-datetimebox" />
					</td>
					<td>修改时间:</td>
					<td colspan="3">
						<input name="bmodifydatetime" id="bmodifydatetime" class="easyui-datetimebox" />
						-
						<input name="emodifydatetime" id="emodifydatetime" class="easyui-datetimebox" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
						<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>
					</td>					
				</tr>									
			</table>
		<%@include file="../../ecCommon/commonSearchFooter.jsp"%>
	</div>
</shiro:hasPermission>

<!-- 查询条件 -->
<%@include file="../../ecCommon/companyToShopSearch.jsp"%>

<script type="text/javascript">

$(function() {
		
	$('#ordertype').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecOrdertypeData
   	});	
	
	$('#salestatus').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecSalestatusData
   	});	 
	
	$('#refundcashstatus').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecRefundcashstatusData
   	});	
	
	$('#refundreason').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecRefundreasonData
   	});	
	
	//初始化下拉框默认参数
	initComboxParams();
	
});


//查询
function query(){
	var url = "${api}/eccash/findCashOrdersPageList"; 
	commonQuery(url);
}


//重置
function reset(){
	var childfuncname = 'companyClear';
	commonReset(childfuncname);
}


</script>