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

</style>
	
<form id="customerfm">									      
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
				<input name="customerName" id="customerName" class="easyui-textbox" 
					data-options="required:true,validType:'uniqueValue'" />
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

$.extend($.fn.validatebox.defaults.rules, { 
	uniqueValue : {
		validator : function(value) {				
		    var success = false;	
		    var params = {
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

var $customerfm;

$(function () { 
	
	$customerfm = $("#customerfm");		
	
	$('#customerType', $customerfm).combobox({ 
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.busCustomerTypeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($customerfm, "");

	window.setTimeout(function () {
		initSalesmanGrid("");
    }, 100);
     
});

</script>