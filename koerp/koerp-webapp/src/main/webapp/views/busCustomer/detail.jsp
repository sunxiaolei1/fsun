<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<div class="toolbar">
	<a href="#" id="orderSaveBtn" class="easyui-linkbutton" iconCls="icon-disk" plain="true">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="closeDialog('ordersDialog')">取消</a>
</div>
	
<div class="fsun-wrap">
	<form id="orderfm">
		<span class="title" style="top: 63px;">基本信息</span>	
		<input id="id" name="id" hidden="true"/>									      
	   	<table class="nb-formTable">		   		
	        <tr>
	        	<th>客户类型<span style="color:red;">*</span></th>
				<td>	
					<input id="customerType" name="customerType" class="easyui-combobox" 
						editable="false" required />
				</td>			          
				<th>客户编号<span style="color:red;">*</span></th>
				<td>
					<input name="customerCode" id="customerCode" class="easyui-textbox" 
						data-options="prompt:'系统自动生成'"  disabled />
				</td>
			</tr>
	        <tr>					
				<th>客户名称<span style="color:red;">*</span></th>
				<td>
					<input name="customerName" id="customerName" class="easyui-textbox" 
						data-options="required:true,validType:'uniqueValue'" />
				</td>
				<th>信用额度</th>
				<td>
					<input name="creditPrice" id="creditPrice" class="easyui-numberbox" 
						data-options="min:0,precision:2,value:0, formatter: priceFormat"/>
				</td>					
	        </tr>
	        <tr>			          															
				<th>联系人</th>
				<td>
					<input name="contacts" id="contacts" class="easyui-textbox" />
				</td>
				<th>手机号</th>
				<td>
					<input name="tel" id="tel" class="easyui-textbox" />
				</td>
			</tr>
	        <tr>
				<th>销售代表</th>
				<td colspan="3">
					<input name="salesman" id="salesman" class="easyui-combogrid" />
				</td>
	        </tr>
	        <tr>
	        	<th>详细地址</th>
				<td colspan="3">
					<input id="address" name="address" 
						class="easyui-textbox" style="width:75%;"/>
				</td>
			</tr>
	        <tr>
	        	<th>备注</th>
				<td colspan="3">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:75%;height:50px;"/>
				</td>		        	
	        </tr>		        			       
		</table>			
	</form>			
</div>				

<!-- 查询条件 -->
<%@include file="../busCommon/salesmanSelect.jsp"%> 

<script type="text/javascript">

$.extend($.fn.validatebox.defaults.rules, { 
	uniqueValue : {
		validator : function(value) {				
		    var success = false;	
		    var params = {
		    	"id": $("#id").val(),
		    	"customerName": value
		    };
			$.ajax({
	            type: "POST",
	            dataType: "json",
	            contentType : "application/json; charset=utf-8",
	            async: false,
	            url: "${api}/bus/customer/unique",
	            data: JSON.stringify(params),
	            success: function(result) {
	            	success = result.entry;
	            }
	        });
	        return success;
			
		},
		message : '客户已存在,请换一个！'
	}          
});

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