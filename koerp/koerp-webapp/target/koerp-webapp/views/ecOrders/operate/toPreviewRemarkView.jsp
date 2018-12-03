<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%> 

<div id="bcOrdersDialog" class="alert" >
	<form id="remarkfm" >
		<table class="nb-formTable" style="width:100%;">
	        <tr>
	            <th width="12%">原订单备注:</th>
				<td>
					<input id="sellerremark" name="sellerremark" data-options="multiline:true" 
						class="easyui-textbox" style="width:500px;height:260px;" editable="false"/>
				</td>						
	        </tr>
		</table>
	</form>
</div>

<script type="text/javascript">

$(function () { 
		
	var sysorderid = '${sysorderid}';
	if(sysorderid!=''){
		$.ajax({
			type : "GET",
			url : "${api}/ecorder/loadHeader/"+ sysorderid +"?timestamp=" + new Date().getTime(),
			contentType:"application/json;charset=utf-8",	   
			dataType : "json",
			success : function(result) {		
				var header = result.entry;
				if(result.status && header!=null && header.sellerremark!=null){
					$("#sellerremark", "#remarkfm").textbox("setValue", header.sellerremark);	
				}					
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert("错误", errorThrown, "error");
			}
		});  	
	}  
});

</script>