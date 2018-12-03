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

.operate-toolbar{
    height:32px;
    padding-top:3px;	
	overflow:hidden;	
	border: 0px solid #D3D3D3;	
	border-top: 1px solid #D3D3D3;	
	background: #f3f3f3;	
}

.fsun-operate-wrap {
	border: 1px solid #ccc;
	border-radius:3px;
	padding: 15px 10px 5px 10px;
	margin: 15px 10px 0px 10px;
}

.fsun-operate-wrap .title {
	position: absolute;
	color: #416AA3;
	font-weight: bold;
	left: 4%;
	line-height: 2em;
	padding: 0 1em;
	background-color: #fff;
}

</style>

<!-- BasSku dialog -->
<div class="easyui-layout" fit=true style="height:100%;">	
	<div data-options="region:'center',split:true" style="border: 0px solid #ccc;">
		<div class="fsun-operate-wrap">
			<span class="title" style="top: 5px;">发票抬头</span>		
			<form id="invoicesfm">			 
			    <input id="sysorderid" name="sysorderid" hidden=true />
				<table class="nb-formTable" style="width:100%;">
			        <tr>
			        	<th width="3%">原发票抬头</th>
						<td >
							<input id="originInvoicestop" class="easyui-textbox" disabled 
								style="width:540px;height:46px;" />								
						</td>						
			        </tr>
			        <tr>
			        	<th width="3%">新发票抬头<span style="color:red;">*</span></th>
						<td>
							<input name="invoicestop" id="invoicestop" class="easyui-textbox" 
								data-options="multiline:true,required:true"  style="width:540px;height:46px;"  />	
						</td>	        	
			        </tr>
			        <tr>
			        	<td width="3%"></td>
			        	<td>
			        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="isbilling" >
								<input type="checkbox" id="isbilling" name="isbilling" style="zoom:140%;vertical-align:middle;" />
								开具发票
							</label>							
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="istrave" >
								<input type="checkbox" id="istrave" name="istrave" style="zoom:140%;vertical-align:middle;" />
								货票同行
							</label>											
						</td>		        	
			        </tr>				        		       
				</table>
			</form>
		</div>
	</div>
	<div data-options="region:'south'" class="operate-toolbar" >
	    <div style="float:right;margin-right:10px;">
	    	<a href="#" class="easyui-linkbutton" iconCls="icon-disk" plain="true" onclick="updateDetail()">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="closeDialog('ordersDialog')">取消</a>
	    </div>
	</div>							
</div>
<!-- BasSku dialog -->


<script type="text/javascript">	

var $invoicesfm;

$(function() {		
	
	$invoicesfm = $("#invoicesfm");	
	var sysorderid = '${sysorderid}';
	$.ajax({
		type : "GET",
		url : "${api}/ecorder/loadHeader/"+ sysorderid,
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {	
			if(result.status){
				var header = result.entry;				
				$('#sysorderid', $invoicesfm).val(header.sysorderid);			
				if(header.isbilling!=null && header.isbilling==1){				
					$("#isbilling", $invoicesfm).attr("checked", true); 
				}
				if(header.istrave!=null && header.istrave==1){						
					$("#istrave", $invoicesfm).attr("checked", true);
				} 		
				$('#originInvoicestop', $invoicesfm).textbox("setValue", header.invoicestop);				
			}else{
				$.messager.alert("错误", result.message, "error");
			}			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	}); 	
});


/*********************************  私有方法       ***********************************/

/**
 * 获取提交的数据
 */
function getSaveData(){		
	
	var isValid = $invoicesfm.form('validate');
	if (!isValid){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}	
	var params = formJson($invoicesfm);
	params.isbilling = $("#isbilling", $invoicesfm).prop("checked")?1:0;
	params.istrave = $("#istrave", $invoicesfm).prop("checked")?1:0;
	var saveData = {
	     "params": params,
	     "saveUrl": "${api}/ecorder/operate/invoices/update"
	}
	return saveData;
}


</script>