<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<!-- BasSku dialog -->
<div class="easyui-layout" fit=true style="height:100%;">		
	<div data-options="region:'center',split:true" style="border: 0px solid #ccc;">
		<div class="fsun-operate-wrap">
			<span class="title" style="top: 5px;">备注信息</span>		
			<form id="remarkfm">			 
			    <input id="orderNo" name="orderNo" value="${orderNo}" hidden=true />
				<table class="nb-formTable" style="width:100%;">
			        <tr>
			        	<th width="3%">原备注</th>
						<td >
							<input id="originRemark" class="easyui-textbox" disabled 
								data-options="multiline:true" style="width:540px;height:92px;" />								
						</td>						
			        </tr>
			        <tr>
			        	<th width="3%">追加备注<span style="color:red;">*</span></th>
						<td>														
							<input name="memo" id="memo" class="easyui-textbox" 
								data-options="multiline:true,required:true"  style="width:540px;height:69px;"  />		
						</td>	        	
			        </tr>			       				        		       
				</table>
			</form>
		</div>
	</div>	
	<div data-options="region:'south'" class="operate-toolbar" style="padding-top:3px;">
	    <div style="float:right;margin-right:10px;">
	    	<a href="#" class="easyui-linkbutton" iconCls="icon-disk" plain="false" onclick="updateCommonRemark()">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="false" onclick="closeDialog('ordersDialog')">取消</a>
	    </div>
	</div>							
</div>
<!-- BasSku dialog -->

<script type="text/javascript">	

var $remarkfm;

$(function(){	
	
	$remarkfm = $("#remarkfm");	
	var orderNo = '${orderNo}';
	$.ajax({
		type : "GET",
		url : "${api}/doc/order/getRemark/"+ orderNo,
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {	
			if(result.status){								 		
				$('#originRemark', $remarkfm).textbox("setValue", result.entry);				
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
	
	var isValid = $remarkfm.form('validate');
	if (!isValid){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}	
	var saveData = {
	     "params": formJson($remarkfm),
	     "saveUrl": "${api}/doc/order/appendRemark"
	}
	return saveData;
}


</script>