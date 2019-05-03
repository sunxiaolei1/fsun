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
	   	<table class="nb-formTable" style="width:100%;">
	   		 <tr>					
				<th width="12%">所属客户<span style="color:red;">*</span></th>
				<td>
					<input name="customerCode" id="vipCustomer" class="easyui-combogrid" required />
					<div title='创建客户' class="icon-customer-btn" onclick="javascript:toAddCustomerView();" 
						style="margin-right:65px;" ></div>	
				</td>
				<th width="12%">本金比例<span style="color:red;">*</span></th>
				<td>
					<input name="originPrecent" id="originPrecent" class="easyui-numberspinner" 
						data-options="min:1,max:2,precision:2,increment:0.01,value:1" required />
				</td>							
	        </tr>			   		
	        <tr>
	        	<th width="12%">卡级别<span style="color:red;">*</span></th>
				<td>
					<input name="cardType" id="cardType" class="easyui-combobox" required />
				</td>
	        	<th width="12%">卡号<span style="color:red;">*</span></th>
				<td>	
					<input id="cardNo" name="cardNo" class="easyui-textbox" data-options="required:true,validType:'uniqueValue'" /> 
				</td>			          			
			</tr>       
	        <tr>
	        	<th width="12%">持卡人<span style="color:red;">*</span></th>
				<td>
					<input name="cnName" id="cnName" class="easyui-textbox" required />
				</td>	
	        	<th width="12%">手机号</th>
				<td>
					<input name="mobile" id="mobile" class="easyui-textbox" />
				</td>			          																				
			</tr>		
			<tr>	
	        	<th width="12%">微信号</th>
				<td>
					<input name="wechat" id="wechat" class="easyui-textbox" />
				</td>				          															
				<th width="12%">邮箱</th>
				<td>
					<input name="email" id="email" class="easyui-textbox" />
				</td>			
			</tr>
			<tr>	
	        	<th width="12%">性别</th>
				<td>
					<input name="sex" id="sex" class="easyui-textbox" />
				</td>			          															
				<th width="12%">生日</th>
				<td>
					<input name="brithday" id="brithday" class="easyui-datebox" />
				</td>			
			</tr>
	        <tr>
	        	<th width="12%">备注</th>
				<td colspan="3">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:700px;height:59px;"/>
				</td>		        	
	        </tr>		        			       
		</table>			
	</form>			
</div>				

<!-- 查询条件 -->
<%@include file="../busCommon/vipCustomerSelect.jsp"%> 

<script type="text/javascript">

$.extend($.fn.validatebox.defaults.rules, { 
	uniqueValue : {
		validator : function(value) {				
		    var success = false;	
			$.ajax({
	            type: "GET",
	            dataType: "json",
	            async: false,
	            url: "${api}/bus/vip/unique",
	            data: { 
	            	'cardNo':value,
	            	'id': '${id}'
	            },	            
	            success: function(result) {
	            	success = result.entry;
	            }
	        });
	        return success;
			
		},
		message : '会员卡已存在,请换一个！'
	}          
});

var $orderfm;

$(function () { 
	
	$orderfm = $("#orderfm");	
	var id = '${id}';
	
	$('#cardType', $orderfm).combobox({
		editable:false,
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.vipCardTypeData
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
		if(baseInfo.brithday!=''){
			baseInfo.brithday = (baseInfo.brithday+" 00:00:00");
		}
		commonPost("${api}/bus/vip/save", JSON.stringify(baseInfo), afterSaveFunc);	
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
			url : "${api}/bus/vip/"+ id +"?timestamp=" + new Date().getTime(),
			contentType:"application/json;charset=utf-8",	   
			dataType : "json",
			success : function(result) {		
				var data = result.entry;
				$orderfm.form("load", data);
				initVipCustomerGrid(data.customerCode);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert("错误", errorThrown, "error");
			}
		}); 
	}else{		
		window.setTimeout(function () {
			initVipCustomerGrid("");
	    }, 100);
		
	}		
}

/**
 * 
 */
function toAddCustomerView(){
	
	$("<div></div>").dialog({
		id:"customerDialog",
	    title:"&nbsp;创建客户",
	    width:"75%",
		height:"67%",
	    iconCls:"icon-client",
	    closed:false,
	    cache:false,
	    href:"${api}/bus/customer/toAddView",
	    modal:true,
	    minimizable:false,//定义是否显示最小化按钮。
     	maximizable:false,//定义是否显示最大化按钮
     	closable:true,
     	resizable:true,//定义对话框是否可调整尺寸
     	collapsible: false,//是否可折叠的
      	buttons:[
	      	{
	      		text:"确认",iconCls:"icon-disk",
	              handler:function(data){	            	  
	            	  var isValid = $customerfm.form('validate');
	          		  if (!isValid){
	          			  $.messager.alert("错误", "提交的数据不正确!", "error");  
	          			  return;
	          		  }		
	          		  var baseInfo = formJson($customerfm);					
	          		  commonPost("${api}/bus/customer/create", JSON.stringify(baseInfo), function(customerCode){	          			
	          			  initVipCustomerGrid(customerCode);    			
	          			  $('#customerDialog').dialog("destroy");
	          		  });
	              }
	          },
	          {
	              text:"取消",
	              iconCls:"icon-cancel",
	              handler:function(){
	              	$('#customerDialog').dialog("destroy");
	              }
	          }
      	],
		onLoad:function(){
     		$('#customerDialog').window('center');
     		$('#customerType', $customerfm).combobox('readonly',true).combobox("setValue", "VIP");	  		
		},
    	onClose:function(){
      		$(this).dialog("destroy");
      	}
	});	

}


</script>