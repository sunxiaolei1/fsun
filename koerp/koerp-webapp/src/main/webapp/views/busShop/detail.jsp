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
		<input id="shopId" name="shopId" hidden="true"/>									      
	   	<table class="nb-formTable" style="width:100%;">
	   		 <tr>					
				<th width="12%">店仓名称<span style="color:red;">*</span></th>
				<td>
					<input name="shopName" id="shopName" class="easyui-textbox" required />
				</td>
				<th width="12%">店仓编码<span style="color:red;">*</span></th>
				<td>
					<input name="shopCode" id="shopCode" class="easyui-textbox" data-options="required:true,validType:'uniqueValue'" /> 
				</td>						
	        </tr>			   		
			<tr>
				<th width="12%">联系人</th>
				<td>	
					<input id="contacts" name="contacts" class="easyui-textbox" />
				</td>
	        	<th width="12%">手机号</th>
				<td>	
					<input id="tel" name="tel" class="easyui-textbox" />
				</td>			          			
			</tr> 
			<tr>
	        	<th width="12%">地址</th>
				<td colspan="3">
					<input id="address" name="address"
						class="easyui-textbox" style="width:600px;"/>
				</td>		        	
	        </tr> 	
	        <tr>
	        	<th width="12%">备注</th>
				<td colspan="3">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:600px;height:60px;"/>
				</td>		        	
	        </tr>		        			       
		</table>			
	</form>			
</div>


<script type="text/javascript">

$.extend($.fn.validatebox.defaults.rules, { 
	uniqueValue : {
		validator : function(value) {				
		    var success = false;	
			$.ajax({
	            type: "GET",
	            dataType: "json",
	            async: false,
	            url: "${api}/bus/shop/unique",
	            data: { 'shopCode':value },
	            success: function(result) {
	            	success = result.entry;
	            }
	        });
	        return success;
			
		},
		message : '店仓已存在,请换一个！'
	}          
});

var $orderfm;

$(function () { 
	
	$orderfm = $("#orderfm");	
	var shopId = '${shopId}';

	initInfo($orderfm, shopId);		

	$("#orderSaveBtn").click(function(){
			
		var isValid = $orderfm.form('validate');
		if (!isValid){
			$.messager.alert("错误", "提交的数据不正确!", "error");  
			return;
		}		
		var baseInfo = formJson($orderfm);
		commonPost("${api}/bus/shop/save", JSON.stringify(baseInfo), afterSaveFunc);	
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
function initInfo($orderfm, shopId){	
	if(shopId!=''){		
		$.ajax({
			type : "GET",
			url : "${api}/bus/shop/"+ shopId +"?timestamp=" + new Date().getTime(),
			contentType:"application/json;charset=utf-8",	   
			dataType : "json",
			success : function(result) {		
				var data = result.entry;								
				$("#shopCode", $orderfm).textbox("disable");
				$orderfm.form("load", data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert("错误", errorThrown, "error");
			}
		}); 
	}	
}


</script>