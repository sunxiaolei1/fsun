<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%> 


<!-- 查询条件 -->
<%@include file="./detailtoolbar.jsp"%>

<form id="fm">				
	<table class="nb-formTable" style="width:100%;">
        <tr>
        	<th width="12%">快递单号</th>
			<td>
				<input name="expressno" id="expressno" class="easyui-textbox" editable="false" />
			</td>
			<th width="12%">快递公司</th>
        	<td>
				<input id="expresscode" name="expresscode" class="easyui-textbox" editable="false"/>
			</td>	
			<th width="12%">入库单号</th>
			<td>
				<input name="refundorderid" id="refundorderid" class="easyui-textbox" editable="false"/>
			</td>
			<th width="12%">所属仓库</th>
        	<td>
				<input id="stockname" name="stockname" class="easyui-textbox" editable="false"/>
			</td>									
        </tr>
        <tr>
        	<th width="12%">外部单号</th>
			<td>
				<input name="extorderid" id="extorderid" class="easyui-textbox" editable="false" />
			</td>			
			<th width="12%">用户姓名</th>
			<td>
				<input name="postcname" id="postcname" class="easyui-textbox" editable="false" />
			</td>	
			<th width="12%">联系电话</th>
			<td>
				<input name="mobileno" id="mobileno" class="easyui-textbox" editable="false" />
			</td>			
			<th width="12%">固定电话</th>
			<td>
				<input name="tel" id="tel" class="easyui-textbox" editable="false" />
			</td>	        	
        </tr>
        <tr>	
        	<th width="12%">系统单号</th>
			<td>
				<input name="sysorderid" id="sysorderid" class="easyui-textbox" editable="false"/>
			</td>            
			<th width="12%">省份</th>
			<td>
				<input name="provincename" id="provincename" class="easyui-textbox" editable="false" />
			</td>			
			<th width="12%">城市</th>
			<td>
				<input name="cityname" id="cityname" class="easyui-textbox" editable="false" />
			</td>
			<th width="12%">区县</th>
			<td colspan="3">
				<input name="regionname" id="regionname" class="easyui-textbox" editable="false" />
			</td>			
        </tr>
        <tr>	            			
			<th width="12%">详细地址</th>
			<td colspan="7">
				<input id="address" name="address" data-options="multiline:true" class="easyui-textbox" style="width:800px;height:50px;" editable="false" />
			</td>		
        </tr>
        <tr>	        			            				       
        	<th width="12%">仓储留言</th>
			<td colspan="7">
				<input name="stockmsg" id="stockmsg" data-options="multiline:true" class="easyui-textbox" style="width:800px;height:50px;" editable="false"/>
			</td>			           	
        </tr>        
	</table>
	<div style="height: 250px;width: 100%;">
		<table id="packageDetailDataGrid"></table>
	</div>

</form>


<script type="text/javascript">

var columns = [[
	//{field:'ck',checkbox:true},	    		
	{field:"sku",title:"商品SKU",width:120,align:"center",sortable:true},
	{field:"materialname",title:"商品名称",width:400,align:"center"},
	//{field:"materialcode",title:"商品货号",width:80,align:"center"},	
	{field:"materialproperty",title:"销售属性",width:180,align:"center"},
	{field:"payprice",title:"价格",width:70,align:"center",formatter:numBaseFormat},
	{field:"orderqty",title:"数量",width:70,align:"center",formatter:numBaseFormat},
	{field:"memo",title:"备注",width:240,align:"center"}                   
     ]];

$(function () { 
	
	var $fm = $("#fm");   		
	var packageid = '${packageid}';
	
	$("#packageDetailDataGrid").datagrid({
		view:footerStyleView,
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	    
	    remoteSort:false,
	    sortName:"sku",
        sortOrder:"desc",	  
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	   
	    fitColumns:false,	    
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    showFooter:true,
	    rowStyler:function(index,row){
	    	if (row.sku=="合计"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	    		    	
	    	return "";	    	 	
		},
	    loadFilter:function(data) {	    	
	    	var fields = ["payprice","orderqty"];
	    	return commonListFormat(data, fields, "sku");			                  
        }
	});

	
	$.ajax({
		type : "GET",
		url : "${api}/ecaftersale/package/noorder/"+ packageid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var ecPackageDto = result.entry;
			var header = ecPackageDto.header;
			var stockInfo = ecPackageDto.stockInfo;
			
			/***************************              基本信息初始化                        ************************/
			
			$("#expressno", $fm).textbox("setValue", header.expressno);
			$("#expresscode", $fm).textbox("setValue", formatter(header.expresscode, window.parent.expressCode));				
			$("#refundorderid", $fm).textbox("setValue", header.refundorderid);
			$("#stockname", $fm).textbox("setValue", stockInfo.stockname);
			
			$("#extorderid", $fm).textbox("setValue", header.extorderid);				
			$("#postcname", $fm).textbox("setValue", header.postcname);	
			$("#mobileno", $fm).textbox("setValue", header.mobileno);	
			$("#tel", $fm).textbox("setValue", header.tel);	
			
			$("#sysorderid", $fm).textbox("setValue", header.sysorderid);
			$("#provincename", $fm).textbox("setValue", header.provincename);	
			$("#cityname", $fm).textbox("setValue", header.cityname);	
			$("#regionname", $fm).textbox("setValue", header.regionname);				
			
			$("#address", $fm).textbox("setValue", header.address);
			$("#stockmsg", $fm).textbox("setValue", header.stockmsg);	
			
			var details = ecPackageDto.details;
			$("#packageDetailDataGrid").datagrid("loadData", details);		
	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});

</script>