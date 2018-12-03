<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<style type="text/css">

.operate-toolbar{
    height:32px;
    padding-top:3px;	
	overflow:hidden;	
	border: 0px solid #D3D3D3;	
	border-top: 1px solid #D3D3D3;	
	background: #f3f3f3;	
}

</style>

<!-- BasSku dialog -->
<div class="easyui-layout" fit=true style="height:100%;">		
	<div data-options="region:'center',split:true" style="border: 0px solid #ccc;" >											
		<form id="blacklistfm" style="margin:10px;">			 
		    <input id="sysorderid" name="sysorderid" value="${sysorderid}" hidden=true />											
			<input name="description" id="description" class="easyui-textbox" style="width:100%;height:90px;"
				data-options="prompt:'填写列为黑名单原因。。。',multiline:true" />					
		</form>
	</div>	
	<div data-options="region:'south'" class="operate-toolbar">
	    <div style="float:right;margin-right:10px;">
	    	<a href="#" class="easyui-linkbutton" iconCls="icon-disk" plain="false" onclick="toBlacklist()">确认</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="false" onclick="closeDialog('ordersDialog')">取消</a>	    
	    </div>
	</div>						
</div>
<!-- BasSku dialog -->

<script type="text/javascript">	

var $blacklistfm = $("#blacklistfm");

/*********************************  私有方法       ***********************************/

/**
 * 获取提交的数据
 */
function getSaveData(){		
	
	var isValid = $blacklistfm.form('validate');
	if (!isValid){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}	
	var params = formJson($blacklistfm);
	var saveData = {
	     "params": params,
	     "saveUrl": "${api}/ecblackuser/save"
	}
	return saveData;
}


</script>