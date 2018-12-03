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
			<span class="title" style="top: 5px;">配送快递</span>		
			<form id="expressfm">			 
			    <input id="sysorderid" name="sysorderid" hidden=true />
				<table class="nb-formTable" style="width:100%;">
			        <tr>
			        	<th width="12%">指定快递<span style="color:red;">*</span></th>
						<td>
							<input id="pointexpresscode" name="pointexpresscode" class="easyui-combobox" editable="false" required />								
						</td>						
			        </tr>
			        <tr>
			        	<th width="12%">配送时间<span style="color:red;">*</span></th>
						<td>
							<input name="assigntime" id="assigntime" class="easyui-combobox" editable="false" required />
						</td>	        	
			        </tr>			       
				</table>
			</form>
		</div>
	</div>
	<div data-options="region:'south'" class="operate-toolbar">
	    <div style="float:right;margin-right:10px;">
	    	<a href="#" class="easyui-linkbutton" iconCls="icon-disk" plain="false" onclick="updateDetail()">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="false" onclick="closeDialog('ordersDialog')">取消</a>
	    </div>
	</div>								
</div>
<!-- BasSku dialog -->


<script type="text/javascript">	

var $expressfm;

$(function() {		
	
	$expressfm = $("#expressfm");	
	$('#pointexpresscode', $expressfm).combobox({  
		panelHeight: 'auto',
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.expressCodeData
   	});	 
		
	$('#assigntime', $expressfm).combobox({ 
		panelHeight: 'auto',
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   		data: window.parent.ecAssigntimeData  	  	
   	});
	
	//去除默认的请选择项
	editInitComboxParams($expressfm, "");
	
	var sysorderid = '${sysorderid}';
	$.ajax({
		type : "GET",
		url : "${api}/ecorder/loadHeader/"+ sysorderid,
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {	
			if(result.status){
				var header = result.entry;				
				$('#sysorderid', $expressfm).val(header.sysorderid);			
				$('#pointexpresscode', $expressfm).combobox("setValue", header.pointexpresscode);	
				
				var assigntime = header.assigntime;
				if(assigntime == '' || assigntime == null){
					assigntime = '${assigntime}';
				}
				$('#assigntime', $expressfm).combobox("setValue", assigntime);				
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
	
	var isValid = $expressfm.form('validate');
	if (!isValid){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}	
	var params = formJson($expressfm);
	var saveData = {
	     "params": params,
	     "saveUrl": "${api}/ecorder/operate/express/update"
	}
	return saveData;
}


</script>