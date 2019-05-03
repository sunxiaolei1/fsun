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
		<input id="skuId" name="skuId" hidden="true"/>	
		<div style="width:100%; height:336px; overflow:auto;" >								      
		   	<table class="nb-formTable" style="width:100%;">
		   		 <tr>					
					<th width="12%">商品名称<span style="color:red;">*</span></th>
					<td>
						<input name="goodsName" id="goodsName" class="easyui-textbox" required />
					</td>
					<th width="12%">商品分类<span style="color:red;">*</span></th>
					<td>	
						<input id="categoryCode" name="categoryCode" class="easyui-combobox" editable=false required />
					</td>							
		        </tr>			   		
		        <tr>	
		        	<th width="12%">商品SKU<span style="color:red;">*</span></th>
					<td>
						<input name="sku" id="sku" class="easyui-textbox" data-options="required:true,validType:'uniqueValue'" /> 
					</td>
		        	<th width="12%">所属品牌<span style="color:red;">*</span></th>
					<td>
						<input name="brandCode" id="brandCode" class="easyui-combobox" editable=false required />
					</td>
		        				          			
				</tr> 
				<tr>
					<th width="12%">英文名称</th>
					<td>	
						<input id="enName" name="enName" class="easyui-textbox" />
					</td>
		        	<th width="12%">单位<span style="color:red;">*</span></th>
					<td>	
						<input id="unit" name="unit" class="easyui-combobox" editable=false required />
					</td>			          			
				</tr>  
				<tr>
					<th width="12%">商品条形码</th>
					<td>
						<input name="barCode" id="barCode" class="easyui-textbox" />
					</td>					
					<th width="12%">分销价</th>
					<td>
						<input name="marketPrice" id="marketPrice" class="easyui-numberspinner" 
							data-options="min:0, precision:2,increment:1,value:0" required />
					</td>							
		        </tr>        
		        <tr>
		        	<th width="12%">成本价</th>
					<td>
						<input name="costPrice" id="costPrice" class="easyui-numberspinner" 
							data-options="min:0, precision:2,increment:1,value:0" required />
					</td>
					<th width="12%">原销售价</th>
					<td>
						<input name="originSalePrice" id="originSalePrice" class="easyui-numberspinner" 
							data-options="min:0, precision:2,increment:1,value:0" required />
					</td>			          																				
				</tr>		
				<tr>
					<th width="12%">商品规格<span style="color:red;">*</span></th>
					<td>
						<input name="property" id="property" class="easyui-textbox" required   />				
					</td>
					<th width="12%">告警阀值</th>
					<td>
						<input name="warningQty" id="warningQty" class="easyui-numberspinner" 
							data-options="precision:0" />
					</td>    				
				</tr>
				<tr>
		        	<th width="12%"></th>
					<td colspan="3">
						<label for="isVipAppoint" >
							<input type="checkbox" id="isVipAppoint" name="isVipAppoint" style="zoom:130%;vertical-align:middle;" />
							<span style="font-weight:bold;">是否作为普通会员指定VIP商品</span>
						</label>
						<label for="isChannelAppoint" style="margin-left:30px;">
							<input type="checkbox" id="isChannelAppoint" name="isChannelAppoint" style="zoom:130%;vertical-align:middle;" />
							<span style="font-weight:bold;">是否作为渠道指定商品</span>
						</label>					
						<span style="font-weight:bold;margin:0 5px 0 30px;">排序码<span style="color:red;">*</span></span>
						<input name="sortCode" id="sortCode" class="easyui-numberspinner" required
							data-options="min:1, precision:0, increment:1, value:1" style="width: 100px;" />						
					</td>		        	
		        </tr>
				<tr>
		        	<th width="12%">商品详情</th>
					<td>
						<input id="descr" name="descr"  data-options="multiline:true" 
							class="easyui-textbox" style="width:300px;height:65px;"/>
					</td>		        	
		        	<th width="12%">备注</th>
					<td>
						<input id="memo" name="memo"  data-options="multiline:true" 
							class="easyui-textbox" style="width:300px;height:65px;"/>
					</td>		        	
		        </tr>		        			       
			</table>
		</div>			
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
	            url: "${api}/bus/basSku/unique",
	            data: { 'sku':value },
	            success: function(result) {
	            	success = result.entry;
	            }
	        });
	        return success;
			
		},
		message : 'sku已经存在,请换一个！'
	}          
});

var $orderfm;

$(function () { 
	
	$orderfm = $("#orderfm");	
	var skuId = '${skuId}';
	
	$('#categoryCode', $orderfm).combobox({ 
		panelHeight:'auto',
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.categoryCodeData
   	});	
	
	$('#brandCode', $orderfm).combobox({ 
		panelHeight:'auto',
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.brandCodeData
   	});	
	
	$('#unit', $orderfm).combobox({ 
		panelHeight:'auto',
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.unitCodeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");

	initInfo($orderfm, skuId);		

	$("#orderSaveBtn").click(function(){
			
		var isValid = $orderfm.form('validate');
		if (!isValid){
			$.messager.alert("错误", "提交的数据不正确!", "error");  
			return;
		}		
		var baseInfo = formJson($orderfm);
		var unitName = $("#unit", $orderfm).combobox("getText");
		baseInfo.unitName = unitName;
		baseInfo.isVipAppoint = $("#isVipAppoint", $orderfm).prop("checked")?1:0;
		baseInfo.isChannelAppoint = $("#isChannelAppoint", $orderfm).prop("checked")?1:0;
		commonPost("${api}/bus/basSku/save", JSON.stringify(baseInfo), afterSaveFunc);	
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
function initInfo($orderfm, skuId){	
	if(skuId!=''){		
		$.ajax({
			type : "GET",
			url : "${api}/bus/basSku/"+ skuId +"?timestamp=" + new Date().getTime(),
			contentType:"application/json;charset=utf-8",	   
			dataType : "json",
			success : function(result) {		
				var data = result.entry;				
				if(data.isVipAppoint!=null && data.isVipAppoint==1){				
					$("#isVipAppoint", $orderfm).attr("checked", true); 
				}
				delete data.isVipAppoint;
				if(data.isChannelAppoint!=null && data.isChannelAppoint==1){				
					$("#isChannelAppoint", $orderfm).attr("checked", true); 
				}
				delete data.isChannelAppoint;
				$("#sku", $orderfm).textbox("disable");
				$orderfm.form("load", data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert("错误", errorThrown, "error");
			}
		}); 
	}	
}


</script>