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
			<span class="title" style="top: 5px;">收货信息</span>		
			<form id="receivefm">			 
			    <input id="sysorderid" name="sysorderid" hidden=true />
				<table class="nb-formTable" style="width:100%;">
			        <tr>
			            <th width="12%">收货人<span style="color:red;">*</span></th>
						<td>
							<input name="receivename" id="receivename" class="easyui-textbox" required />
						</td>						
			        	<th width="12%">指定快递<span style="color:red;">*</span></th>
						<td>
							<input id="pointexpresscode" name="pointexpresscode" class="easyui-combobox" editable="false" required />								
						</td>										       
			        	<th width="12%">配送时间<span style="color:red;">*</span></th>
						<td>
							<input name="assigntime" id="assigntime" class="easyui-combobox" editable="false" required />
						</td>	        					    																
			        </tr>
					<tr>
			            <th width="12%">省份<span style="color:red;">*</span></th>
						<td>							
							<input id="provinceCombo" name="provinceid"  class="easyui-combobox" required editable="false"/>
						</td>
						<th width="12%">城市<span style="color:red;">*</span></th>
						<td>							
							<input id="cityCombo" name="cityid" class="easyui-combobox" required editable="false"/>
						</td>
						<th width="12%">县区<span style="color:red;">*</span></th>
						<td>							
							<input id="regionCombo" name="regionid" class="easyui-combobox" required editable="false" />
						</td>												
			        </tr>
			        <tr>			        				        						
						<th width="12%">手机号码</th>
						<td>
							<input name="mobileno" id="mobileno" class="easyui-textbox" data-options="validType:'mobile'" />
						</td>
						<th width="12%">固定电话</th>
						<td colspan="3">
							<input id="tel" name="tel" class="easyui-textbox" data-options="validType:'tel'" />
							<span style="color:red;">*手机号码 、固定电话必须填一项</span>
						</td>
			        </tr>	
			        <tr>			        	
			        	<th width="12%">详细地址<span style="color:red;">*</span></th>
						<td colspan="3">
							<input id="address" name="address" data-options="multiline:true"
								class="easyui-textbox" style="width:380px;height:46px;" required/>
						</td>
						<th width="12%">邮编<span style="color:red;">*</span></th>
						<td>
							<input id="zipcode" name="zipcode" class="easyui-textbox" required data-options="validType:'zip'" />
						</td>
			        </tr>			       
				</table>
			</form>
		</div>
	</div>
	<div data-options="region:'south'" class="operate-toolbar" >
	    <div style="float:right;margin-right:10px;">
	    	<a href="#" class="easyui-linkbutton" iconCls="icon-disk" plain="false" onclick="updateDetail()">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="false" onclick="closeDialog('ordersDialog')">取消</a>
	    </div>
	</div>							
</div>
<!-- BasSku dialog -->

<%@include file="../../ecCommon/provinceToCityToRegionSelect.jsp"%>

<script type="text/javascript">	

var $receivefm;

$(function() {		
	
	$receivefm = $("#receivefm");		
	/**
	 * 当input框内容变化时变化是否是必填项
	 */
	function changeReqiured(textbox1, textbox2, value1, value2, $receivefm){			
		if(value1=='' && value2==''){	    		
			$("#"+ textbox1, $receivefm).textbox({required:true});
			$("#"+ textbox2, $receivefm).textbox({required:true});
    	}else{	    	    		
    		$("#"+ textbox1, $receivefm).textbox({required:false});
    		$("#"+ textbox2, $receivefm).textbox({required:false});
    		//setTimeout('$("div").remove(".tooltip");',200);    		
    		$("div").remove(".tooltip");  		
    	}	
	}
	
	$('#mobileno', $receivefm).textbox({  
		required: true,
	    onChange: function(value1) {		    	
			var value2 = $("#tel", $receivefm).textbox("getValue");	
	    	changeReqiured("mobileno", "tel", value1, value2, $receivefm);	    	 
	    }
	});
	$('#tel', $receivefm).textbox({ 
		required: true,		
	    onChange: function(value2) {		    	
	    	var value1 = $("#mobileno", $receivefm).textbox("getValue");	    		
	    	changeReqiured("mobileno", "tel", value1, value2, $receivefm);		    	
	    }
	}); 		
	$('input').focus(function(){	
		var value1 = $("#mobileno", $receivefm).textbox("getValue");
		var value2 = $("#tel", $receivefm).textbox("getValue");
		changeReqiured("mobileno", "tel", value1, value2, $receivefm);			   
	});
		
	/***************************************                            ************************************/
	
	
	$('#pointexpresscode', $receivefm).combobox({  
		panelHeight: 'auto',
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.expressCodeData
   	});	 
		
	$('#assigntime', $receivefm).combobox({ 
		panelHeight: 'auto',
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   		data: window.parent.ecAssigntimeData  	  	
   	});
	
	//去除默认的请选择项
	editInitComboxParams($receivefm, "");
	
	//省、市、县级连初始化
	initProvinceCombo("请选择...");

	var sysorderid = '${sysorderid}';
	$.ajax({
		type : "GET",
		url : "${api}/ecorder/loadHeader/"+ sysorderid,
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {	
			if(result.status){
				var header = result.entry;									
				if(header.assigntime == '' || header.assigntime == null){
					header.assigntime = '${assigntime}';
				}
				$receivefm.form("load", header);			
				setTimeout(function(){
					$("#cityCombo", $receivefm).combobox("setValue", header.cityid);	
					setTimeout(function(){
						$("#regionCombo", $receivefm).combobox("setValue", header.regionid);															
					},200);																				
				},200);				
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
	
	var isValid = $receivefm.form('validate');
	if (!isValid){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}	
	var params = formJson($receivefm);
	var provincename = $("#provinceCombo", $receivefm).combobox("getText");
	var cityname = $("#cityCombo", $receivefm).combobox("getText");
	var regionname = $("#regionCombo", $receivefm).combobox("getText");
	params.provincename = provincename;
	params.cityname = cityname;
	params.regionname = regionname;			
	var saveData = {
	     "params": params,
	     "saveUrl": "${api}/ecorder/operate/receive/update"
	}
	return saveData;
}


</script>