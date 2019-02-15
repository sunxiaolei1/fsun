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
		<h1 style="font-size:14px;text-align:center;margin:15px 0px 10px 0px;">此操作将撤销该单据的补发操作,请确认是否继续?</h1>								
		<form id="remarkfm" style="margin:0 10px;">			 
		    <input id="sysorderid" name="sysorderid" value="${sysorderid}" hidden=true />											
			<input name="remark" id="remark" class="easyui-textbox" style="width:100%;height:90px;"
				data-options="prompt:'输入备注信息。。。',multiline:true" />					
		</form>
	</div>	
	<div data-options="region:'south'" class="operate-toolbar">
	    <div style="float:right;margin-right:10px;">
	    	<a href="#" class="easyui-linkbutton" iconCls="icon-disk" plain="false" onclick="closeReissue()">确认</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="false" onclick="closeDialog('ordersDialog')">取消</a>	    
	    </div>
	</div>						
</div>
<!-- BasSku dialog -->

<script type="text/javascript">	

var $remarkfm = $("#remarkfm");

/*********************************  私有方法       ***********************************/

/**
 * 获取提交的数据
 */
function getSaveData(){		
	
	var isValid = $remarkfm.form('validate');
	if (!isValid){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}	
	var params = formJson($remarkfm);
	var saveData = {
	     "params": params,
	     "saveUrl": "${api}/ecaftersale/reissue/close"
	}
	return saveData;
}


</script>