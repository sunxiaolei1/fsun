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
		<form id="remarkfm" style="margin:10px;">			 
		    <input id="refundorderids" name="refundorderids" value="${refundorderids}" hidden=true />
		    <div style="margin-bottom:10px;">
			    <label for="unhandle" >
					<input type="checkbox" value="0" id="unhandle" name="refundorderstatus" style="zoom:120%;vertical-align:middle;" />
					未处理
				</label>							
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="handling" >
					<input type="checkbox" value="1" id="handling" name="refundorderstatus" style="zoom:120%;vertical-align:middle;" />
					处理中
				</label>											
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="handled" >
					<input type="checkbox" value="2" id="handled" name="refundorderstatus" style="zoom:120%;vertical-align:middle;" />
					处理完成
				</label>
			</div>														
			<input name="remark" id="remark" class="easyui-textbox" style="width:100%;height:90px;"
				data-options="prompt:'输入备注信息。。。',multiline:true" />					
		</form>
	</div>	
	<div data-options="region:'south'" class="operate-toolbar">
	    <div style="float:right;margin-right:10px;">
	    	<a href="#" class="easyui-linkbutton" iconCls="icon-disk" plain="false" onclick="toHandleSign()">确认</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="false" onclick="closeDialog('ordersDialog')">取消</a>	    
	    </div>
	</div>						
</div>
<!-- BasSku dialog -->

<script type="text/javascript">	

var $remarkfm;

$(function(){
	
	$remarkfm = $("#remarkfm");
	
	$.each(parent.ecRefundorderstatusData, function(){
		var isDefault = this.isDefault;
		var refundorderstatus = this.codeCode;
		if(isDefault==1){
			$("[name='refundorderstatus']").each(function() {
				if ($(this).val() == refundorderstatus) {
					$(this).attr("checked", true); 
				}
			});
		}
	});	
	
	$("[name='refundorderstatus']").click(function() {
		var refundorderstatus = this.value;
		$("[name='refundorderstatus']").each(function() {
			if ($(this).val() != refundorderstatus) {
				//取消选中
				$(this).removeAttr("checked");
			}
		});
	});
});

/*********************************  私有方法       ***********************************/
 

/**
 * 获取提交的数据
 */
function getSaveData() {

	var isValid = $remarkfm.form('validate');
	if (!isValid) {
		$.messager.alert("错误", "提交的数据不正确!", "error");
		return null;
	}
	var params = formJson($remarkfm);
	var saveData = {
		"params" : params,
		"saveUrl" : "${api}/ecaftersale/refund/toHandleSign"
	}
	return saveData;
}

/**
 * 处理标记
 */
function toHandleSign(){
	
	var saveData = getSaveData();	
	if(saveData!=null){		
		commonPost(
			saveData.saveUrl, 
			JSON.stringify(saveData.params), 
			null, 
			function(refundorderids){
				$.messager.progress('close');
				if(refundorderids!=null && refundorderids!=''){					
					var msg = (refundorderids!='${refundorderids}'?"部分成功,":"异常,");
					$.messager.alert("提示",msg + "退货单号("+ refundorderids +")操作失败!", "error", function(){
						$("#ordersDialog").dialog("destroy");
						if(refundorderids!='${refundorderids}'){
							reflushDataGrid();
						}
					});
				}else{
					$.messager.alert("提示","操作成功!", "info", function(){
						$("#ordersDialog").dialog("destroy");
						reflushDataGrid();
					});
				}
				
			}
	    );						
	}	
}
</script>