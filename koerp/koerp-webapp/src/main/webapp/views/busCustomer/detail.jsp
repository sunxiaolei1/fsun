<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<style type="text/css">

.easyui-textbox, .easyui-combogrid, .easyui-datebox, .easyui-combobox, .easyui-numberbox, .easyui-datetimebox {
	width: 162px;
}

.toolbar{
	height:28px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	border-bottom:0px;
	background: #f3f3f3;
	padding-top:2px;
}

</style>

<div class="toolbar">
	<a href="#" id="orderSaveBtn" class="easyui-linkbutton" iconCls="icon-disk" plain="true">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="closeDialog('ordersDialog')">取消</a>
</div>
	
<form id="orderfm">
	<input id="id" name="id" hidden="true"/>									      
   	<table class="nb-formTable" style="width:100%;">			   		
        <tr>
        	<th width="12%">客户类型<span style="color:red;">*</span></th>
			<td>	
				<input id="customerType" name="customerType" class="easyui-combobox" 
					editable="false" required />
			</td>			          
			<th width="12%">客户编号<span style="color:red;">*</span></th>
			<td>
				<input name="customerCode" id="customerCode" class="easyui-textbox" 
					data-options="prompt:'系统自动生成'"  disabled />
			</td>
		</tr>
        <tr>					
			<th width="12%">客户名称<span style="color:red;">*</span></th>
			<td>
				<input name="customerName" id="customerName" class="easyui-textbox" required />
			</td>
			<th width="12%">信用额度</th>
			<td>
				<input name="creditPrice" id="creditPrice" class="easyui-numberbox" 
					data-options="min:0,precision:2,value:0, formatter: priceFormat"/>
			</td>					
        </tr>
        <tr>			          															
			<th width="12%">联系人</th>
			<td>
				<input name="contacts" id="contacts" class="easyui-textbox" />
			</td>
			<th width="12%">手机号</th>
			<td>
				<input name="tel" id="tel" class="easyui-textbox" />
			</td>
		</tr>
        <tr>
			<th width="12%">所属销售代表</th>
			<td>
				<input name="salesman" id="salesman" class="easyui-combogrid" />
			</td>
        </tr>
        <tr>
        	<th width="12%">详细地址</th>
			<td colspan="3">
				<input id="address" name="address" data-options="multiline:true"
					class="easyui-textbox" style="width:440px;height:50px;"/>
			</td>
		</tr>
        <tr>
        	<th width="12%">备注</th>
			<td colspan="3">
				<input id="memo" name="memo"  data-options="multiline:true" 
					class="easyui-textbox" style="width:440px;height:50px;"/>
			</td>		        	
        </tr>		        			       
	</table>			
</form>			
					

<!-- 查询条件 -->
<%@include file="../busCommon/salesmanSelect.jsp"%> 

<script type="text/javascript">

var $orderfm;

$(function () { 
	
	$orderfm = $("#orderfm");	
	var id = '${id}';
	
	$('#customerType', $orderfm).combobox({ 
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.busCustomerTypeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");

	initInfo($orderfm, id);		

	$("#orderSaveBtn").click(function(){
			
		var isValid = $orderfm.form('validate');
		if (!isValid){
			$.messager.alert("错误", "提交的数据不正确!", "error");  
			return;
		}		
		var baseInfo = formJson($orderfm);					
		commonPost("${api}/bus/customer/save", JSON.stringify(baseInfo), afterSaveFunc);	
	});
     
});


/**
 * 保存成功后触发
 */
function afterSaveFunc(){
	closeDialog('ordersDialog');
	reflushDataGrid();
}

/**
 * 初始信息
 */
function initInfo($orderfm, id){	
	if(id!=''){		
		$.ajax({
			type : "GET",
			url : "${api}/bus/customer/"+ id +"?timestamp=" + new Date().getTime(),
			contentType:"application/json;charset=utf-8",	   
			dataType : "json",
			success : function(result) {		
				var data = result.entry;
				$orderfm.form("load", data);
				initSalesmanGrid(data.salesman);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert("错误", errorThrown, "error");
			}
		}); 
	}else{		
		window.setTimeout(function () {
			initSalesmanGrid("");
	    }, 100);
		
	}		
}


</script>