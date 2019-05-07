<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<div class="fsun-wrap">
	<form id="paymodefm">	
		<span class="title" style="top: 30px;">基本信息</span>	 	
	    <input id="discountAmount" name="discountAmount" value=0 hidden=true />	    		
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>	            
				<th width="12%">支付方式<span style="color:red;">*</span></th>
				<td>
					<input id="payMode" name="payMode" class="easyui-combobox" readOnly
						editable="false" required/>								
				</td>																					
	        </tr>
	        <tr>	        	
	        	<th width="12%">应付金额</th>
				<td>
					<input id="receptPrice" name="receptPrice" class="easyui-numberbox" readOnly 
						required data-options="precision:2,formatter: numBaseFormat"/>									
				</td>	        						        		        	
	        </tr>
	        <tr>	        	
	        	<th width="12%">实付金额</th>
				<td>
					<input id="payPrice" name="payPrice" class="easyui-numberbox" required
						data-options="min: 0.1,precision:2,formatter: numBaseFormat"/>									
				</td>	        						        		        	
	        </tr>
	        <tr>	        	
	        	<th width="12%">找零金额</th>
				<td>
					<input id="dibPrice" name="dibPrice" class="easyui-numberbox" readOnly required
						data-options="precision:2,formatter: numBaseFormat"/>									
				</td>	        						        		        	
	        </tr>   
		</table>
	</form>			
</div>	

<script type="text/javascript">

var $paymodefm = $("#paymodefm"); 
var currPayMode = '${payMode}';

$(function () {
	
	$('#payMode', $paymodefm).combobox({  
		prompt: '请选择...',
		panelHeight: 'auto',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.payModeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($paymodefm, "");

	$("#payPrice", $paymodefm).numberbox({
		onChange:function(newValue,oldValue){	
			var receptPrice = $("#receptPrice", $paymodefm).numberbox("getValue");
			if(Number(newValue)>Number(receptPrice)){
				//$("#dibPrice", $paymodefm).numberbox("setValue",Number(newValue)-Number(receptPrice));
				$("#dibPrice", $paymodefm).numberbox("setValue",CalcAmount.subtract(newValue, receptPrice, 2));			
			}else{
				$("#dibPrice", $paymodefm).numberbox("setValue",0);
			}     
	    }
   	});	
});


</script>


