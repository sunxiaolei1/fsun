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
					<td width="6%">退货单号:</td>
					<td>
						<input name="refundorderid" id="refundorderid" class="easyui-textbox" />
					</td>
					<td width="6%">退货状态:</td>
					<td>	
						<input type="text" id="refundstatus" name="refundstatus" class="easyui-combobox" editable="false" />
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
					<td>退单类型:</td>
					<td>	
						<input type="text" id="ischangeorder" name="ischangeorder" class="easyui-combobox" editable="false" />
					</td>													
				</tr>			
				<tr>
					<td>运单号:</td>
					<td>
						<input name="expressno" id="expressno" class="easyui-textbox" />
					</td>
					<td>仓储状态:</td>
					<td>
						<input type="text" id="stockstatus" name="stockstatus" class="easyui-combobox" editable="false" />
					</td>				
					<td>是否整单退:</td>
					<td>
						<input type="text" id="isallreturn" name="isallreturn" class="easyui-combobox" editable="false" />
					</td>
					<td>创建人:</td>
					<td colspan="3">
						<input name="addcname" id="addcname" class="easyui-textbox" />
					</td>				
				</tr>	
				<tr>	
					<td>标记处理:</td>
					<td>
						<input type="text" id="refundorderstatus" name="refundorderstatus" class="easyui-combobox" editable="false" />
					</td>																														
					<td>创建时间:</td>
					<td colspan="5">
						<input name="bcreatedatetime" id="bcreatedatetime" class="easyui-datetimebox" />
						-
						<input name="ecreatedatetime" id="ecreatedatetime" class="easyui-datetimebox" />
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
<%@include file="../../ecCommon/companyToShopStockSearch.jsp"%>

<script type="text/javascript">

var initOrderDateTime ="";

$(function() {
	
	$('#refundstatus').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecRefundstatusData
   	});	
	
	$('#ischangeorder').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecIschangeorderData
   	});	 
	
	$('#stockstatus').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecStockstatusData
   	});	
	
	$('#refundorderstatus').combobox({   	
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecRefundorderstatusData
   	});	

	$('#isallreturn').combobox({   	
		valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.isAllReturnData
   	});	
	
	//初始化下拉框默认参数
	initComboxParams();
});


//查询
function query(){
	var url = "${api}/ecaftersale/refund/findOrdersPage";
	commonQuery(url);
}


//重置
function reset(){
	var childfuncname = 'companyClear';
	commonReset(childfuncname);
}

</script>