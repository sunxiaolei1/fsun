<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<style type="text/css">

.easyui-textbox, .easyui-combogrid, .easyui-datebox, .easyui-combobox, .easyui-numberbox, .easyui-datetimebox , .easyui-numberspinner{
	width: 162px;
}

.toolbar{
	height:28px;
	overflow:hidden;
	border: 0px solid #D3D3D3;
	border-bottom:1px solid #D3D3D3;
	background: #f3f3f3;
	padding-top:2px;
}

.fsun-wrap {
	border: 1px solid #ccc;
	padding: 15px 5px 5px 5px;
	margin-top: 10px;
}

.fsun-wrap .title {
	position: absolute;
	color: #416AA3;
	font-weight: bold;
	left: 2%;
	line-height: 2em;
	padding: 0 1em;
	background-color: #fff;
}

</style>

<div class="toolbar">
	<a href="#" id="orderSaveBtn" class="easyui-linkbutton" iconCls="icon-disk" plain="true">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="closeDialog('ordersDialog')">取消</a>
</div>

<div class="fsun-wrap">
	<form id="vipCardfm">
		<span class="title" style="top: 62px;">基础信息</span>		
		<input id="id" name="id" hidden="true"/>									      
	   	<table class="nb-formTable" style="width:100%;">
	   		 <tr>					
				<th width="6%">所属客户<span style="color:red;">*</span></th>
				<td>
					<input name="customerCode" id="vipCustomer" class="easyui-combogrid" required />
					<div title='创建会员' class="icon-customer-btn" onclick="javascript:toAddCustomerView();" 
						style="margin-right:6px;" ></div>	
				</td>											
	        	<th width="6%">卡级别<span style="color:red;">*</span></th>
				<td>
					<input name="cardType" id="cardType" class="easyui-combobox" required />
				</td>	        		
				<th width="6%">本金比例<span style="color:red;">*</span></th>
				<td>
					<input name="originPrecent" id="originPrecent" class="easyui-numberspinner" 
						data-options="min:1,max:2,precision:2,increment:0.01,value:1" required />
				</td>		          			
			</tr>       
	        <tr>
	        	<th width="6%">卡号<span style="color:red;">*</span></th>
				<td>	
					<input id="cardNo" name="cardNo" class="easyui-textbox" data-options="required:true,validType:'uniqueValue'" /> 
				</td>
	        	<th width="6%">持卡人<span style="color:red;">*</span></th>
				<td>
					<input name="cnName" id="cnName" class="easyui-textbox" required />
				</td>	
	        	<th width="6%">手机号</th>
				<td>
					<input name="mobile" id="mobile" class="easyui-textbox" />
				</td>			          																				
			</tr>		
			<tr>
				<th width="6%">微信号</th>
				<td>
					<input name="wechat" id="wechat" class="easyui-textbox" />
				</td>	
	        	<th width="6%">性别</th>
				<td>
					<input name="sex" id="sex" class="easyui-textbox" />
				</td>			          															
				<th width="6%">生日</th>
				<td>
					<input name="brithday" id="brithday" class="easyui-datebox" />
				</td>			
			</tr>
	        <tr>
	        	<th width="6%">邮箱</th>
				<td>
					<input name="email" id="email" class="easyui-textbox" />
				</td>
	        	<th width="6%">备注</th>
				<td colspan="3">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:440px;height:50px;"/>
				</td>		        	
	        </tr>		        			       
		</table>			
	</form>			
</div>	

<div class="fsun-wrap">
	<form id="rachargefm">
		<span class="title" style="top: 276px;">充值信息</span>				
		<input id="shopId" name="shopId" hidden="true" />		
		<table class="nb-formTable" style="width:100%;margin-top:2px;">	               		
	        <tr>
	        	<th width="12%">交易门店<span style="color:red;">*</span></th>
				<td>
					<input id="shopName" name="shopName" class="easyui-textbox" disabled />								
				</td>
				<th width="12%">交易类型</th>
				<td>
					<input id="tradeType" name="tradeType" class="easyui-combobox" readOnly />
				</td>	        		
				<th width="12%">支付方式<span style="color:red;">*</span></th>
				<td>
					<input id="payMode" name="payMode" class="easyui-combobox" editable="false" required />								
				</td>            	        	
	        </tr>
	        <tr>
	        	<th width="12%">充值金额<span style="color:red;">*</span></th>
				<td>
					<input id="rachargePrice"  class="easyui-numberbox" required 
						data-options="min:0,precision:2,value:0, formatter: priceFormat" />								
				</td>
				<th width="12%">交易金额</th>
				<td>
					<input id="tradePrice" name="tradePrice" class="easyui-numberbox" readOnly 
						data-options="min:0,precision:2,value:0, formatter: priceFormat" />								
				</td>		
				<th width="12%">赠送金额</th>
				<td>
					<input id="newGiftPrice" name="newGiftPrice" class="easyui-numberbox" readOnly style="width:90px;"
						data-options="min:0,precision:2,value:0, formatter: priceFormat" />	
					<input id="trimPrice" class="easyui-numberspinner" style="width:70px;"
						data-options="min:0,precision:2,value:0.00" />								
				</td>								
	        </tr>	
	        <tr>	        			
				<th width="12%">备注</th>
				<td colspan="5">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:800px;height:50px;"/>
				</td>							
	        </tr>	
		</table>
	</form>				
</div>				

<!-- 查询条件 -->
<%@include file="../../busCommon/vipCustomerSelect.jsp"%> 

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
	            	'cardNo':value        	
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

var $vipCardfm;
var $rachargefm;

$(function () { 
	
	$vipCardfm = $("#vipCardfm");	
	$rachargefm = $("#rachargefm");	

	$('#cardType', $vipCardfm).combobox({
		editable:false,
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.vipCardTypeData
   	});	

	$('#payMode', $rachargefm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.vipUnpaidPayModeData
   	});
	
	$('#tradeType', $rachargefm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.tradeTypeData
   	});
	
	//去除默认的请选择项
	editInitComboxParams($vipCardfm, "");
	editInitComboxParams($rachargefm, "");
	
	window.setTimeout(function () {
		initVipCustomerGrid("", $vipCardfm);
    }, 100);
	
	$.ajax({
		type : "GET",
		url : "${api}/bus/vip/initActiveData",
		data : {},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docAsnDto = result.entry;
			var vipCardHeader = docAsnDto.vipCardHeader;
			var rachargeHeader = docAsnDto.rachargeHeader;
			if(rachargeHeader!=null){
				$rachargefm.form("load", rachargeHeader);	
			}	
			if(vipCardHeader!=null){
				$('#cardType', $vipCardfm).combobox("setValue",vipCardHeader.cardType);
			}	
			initPriceOnChange();
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  
	
	//添加保存事件
	$("#orderSaveBtn").click(function(){
			
		var isValid = $vipCardfm.form('validate');
		if (!isValid){
			$.messager.alert("错误", "提交的数据不正确!", "error");  
			return;
		}			
		//组装数据
		var vipCardInfo = formJson($vipCardfm);
		if(vipCardInfo.brithday!=''){
			vipCardInfo.brithday = (vipCardInfo.brithday+" 00:00:00");
		}
		var rachargeInfo = formJson($rachargefm);
		var busVipUnpaid = {
			shopId: rachargeInfo.shopId,
			tradePrice:	rachargeInfo.tradePrice,
			giftPrice:	rachargeInfo.newGiftPrice,
			payMode: rachargeInfo.payMode,
			tradeType: rachargeInfo.tradeType,
			memo: rachargeInfo.memo
		};
		//
		var params = {
			busVip: vipCardInfo,	
			busVipUnpaid: busVipUnpaid
		};
		commonPost("${api}/bus/vipUnpaid/active", JSON.stringify(params), function(){
			closeDialog('ordersDialog');
		});	
	});
     
});

/**
 * 金额初始化微调器
 */
function initPriceOnChange(){	
	//优惠微调
	$('#trimPrice', $rachargefm).numberspinner({  
	    onChange:function(newValue,oldValue){ 
	    	var originPrecent = $("#originPrecent", $vipCardfm).numberspinner("getValue");
	    	var rachargePrice = $('#rachargePrice', $rachargefm).numberbox("getValue");	    	
	    	//更新数据
	    	var tradePrice = Number(originPrecent) * Number(rachargePrice) + Number(newValue);
	    	$("#tradePrice", $rachargefm).numberbox("setValue", tradePrice);
			$("#newGiftPrice", $rachargefm).numberbox("setValue", tradePrice - Number(rachargePrice)); 	       
		}  
	});
	//本金比例微调
	$('#originPrecent', $vipCardfm).numberspinner({  
	    onChange:function(newValue,oldValue){ 
	    	var trimPrice = $('#trimPrice', $rachargefm).numberspinner("getValue");
	    	var rachargePrice = $('#rachargePrice', $rachargefm).numberbox("getValue");
	    	//更新数据
	    	var tradePrice = Number(newValue) * Number(rachargePrice) + Number(trimPrice);
	    	$("#tradePrice", $rachargefm).numberbox("setValue", tradePrice);
			$("#newGiftPrice", $rachargefm).numberbox("setValue", tradePrice - Number(rachargePrice)); 	       
		}  
	});
	//充值金额变化
	$('#rachargePrice', $rachargefm).numberbox({  
		onChange:function(newValue,oldValue){	
			var originPrecent = $("#originPrecent", $vipCardfm).numberspinner("getValue");
			var trimPrice = $('#trimPrice', $rachargefm).numberspinner("getValue");
			//更新数据
			var tradePrice = Number(newValue) * Number(originPrecent) + Number(trimPrice);
			$("#tradePrice", $rachargefm).numberbox("setValue", tradePrice);
			$("#newGiftPrice", $rachargefm).numberbox("setValue",tradePrice - Number(newValue)); 
	    }
   	});	
	
}

/**
 * 
 */
function toAddCustomerView(){
	
	$("<div></div>").dialog({
		id:"customerDialog",
	    title:"&nbsp;创建会员",
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
	          		  commonPost("${api}/bus/customer/create", JSON.stringify(baseInfo), function(customerDto){
	          			  var contacts = customerDto.contacts;
	          			  var tel = customerDto.tel;
	          			  var customerCode = customerDto.customerCode;
		          		  $('#cnName', $orderfm).textbox("setValue", contacts);
		           	  	  $('#mobile', $orderfm).textbox("setValue", tel);
		           	 	  $('#cardNo', $orderfm).textbox("setValue", (tel!=null&&tel!=''?tel:customerCode));
	          			  initVipCustomerGrid(customerCode, $vipCardfm);    			
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