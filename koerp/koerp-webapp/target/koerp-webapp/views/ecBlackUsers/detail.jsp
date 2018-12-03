<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%> 

<style type="text/css">

.fsun-wrap {
	border: 1px solid #ccc;
	padding: 15px 10px 5px 10px;
	margin-top: 12px;
}

.fsun-wrap .title {
	position: absolute;
	color: #416AA3;
	font-weight: bold;
	left: 2%;
	line-height: 2em;
	padding: 0 1em;
	background-color: #fff;
}
</style> 

<form id="fm">
 	<div class="fsun-wrap">
	    <span class="title" style="top: 3px;">历史订单记录</span>		
		<div style="height: 260px;width: 100%;">
			<table id="blackUserDetailDataGrid"></table>
		</div>
	</div>			
	<div class="fsun-wrap">
	    <span class="title" style="top: 298px;">订单信息(系统单号:<span id='sysorderid'></span>)</span>		
		<table class="nb-formTable" style="width:100%;">
        <tr>
			<th width="12%">外部单号</th>
        	<td>
				<input id="extorderid" name="extorderid" class="easyui-textbox" editable="false"/>
			</td>	
			<th width="12%">来源平台</th>
			<td>
				<input name="channelname" id="channelname" class="easyui-textbox" editable="false"/>
			</td>
			<th width="12%">来源店铺</th>
        	<td>
				<input id="shopname" name="shopname" class="easyui-textbox" editable="false"/>
			</td>	
			<th width="12%">审核人</th>
			<td>
				<input name="auditcname" id="auditcname" class="easyui-textbox" editable="false" />
			</td>								
        </tr>
        <tr>
        	<th width="12%">用户名</th>
			<td>
				<input name="username" id="username" class="easyui-textbox" editable="false" />
			</td>			
			<th width="12%">收货人姓名</th>
			<td>
				<input name="receivename" id="receivename" class="easyui-textbox" editable="false" />
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
			<th width="12%">省份</th>
			<td>
				<input name="provincename" id="provincename" class="easyui-textbox" editable="false" />
			</td>			
			<th width="12%">城市</th>
			<td>
				<input name="cityname" id="cityname" class="easyui-textbox" editable="false" />
			</td>
			<th width="12%">区县</th>
			<td>
				<input name="regionname" id="regionname" class="easyui-textbox" editable="false" />
			</td>	
			<th width="12%">审核时间</th>
			<td>
				<input name="auditdatetime" id="auditdatetime" class="easyui-datetimebox" editable="false" style="width:150px;"/>
			</td>		
        </tr>
        <tr>	            			
			<th width="12%">详细地址</th>
			<td colspan="3">
				<input id="address" name="address" data-options="multiline:true" class="easyui-textbox" 
					style="width:470px;height:60px;" editable="false"/>
			</td>
			<th width="12%">审核备注</th>
			<td colspan="3">
				<input name="auditremark" id="auditremark" data-options="multiline:true" class="easyui-textbox" 
					style="width:470px;height:60px;" editable="false"/>
			</td>		
        </tr>              
	</table>
	</div>
</form>


<script type="text/javascript">

var columns = [[
	{field:'ck',checkbox:true},	    		
	{field:"sysorderid",title:"系统单号",width:160,align:"center"},
	{field:"extorderid",title:"外部单号",width:160,align:"center"},
	{field:"channelname",title:"来源平台",width:120,align:"center"},	
	{field:"shopname",title:"来源店铺",width:200,align:"center"},
	{field:"ordertype",title:"订单类型",width:100,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.ecOrdertype); 
	}},
	{field:"orderdatetime",title:"下单时间",width:160,align:"center"},
	{field:"tradestatus",title:"交易状态",width:100,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.ecTradestatus); 
	}},
	{field:"orderprice",title:"订单金额",width:100,align:"center",formatter:numBaseFormat}                   
     ]];

$(function () { 
	
	var $fm = $("#fm");  
	var latestsysorderid = '${latestsysorderid}';
	var sysorderids = '${sysorderids}';
	
	$("#blackUserDetailDataGrid").datagrid({
		view:footerStyleView,
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	    
	    remoteSort:false,
	    sortName:"orderdatetime",
        sortOrder:"desc",	  
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	   
	    fitColumns:false,	    
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    showFooter:true,
	    onSelect:function(rowIndex, rowData){	    	
	    	initOrderDetailForm(rowData);
	    },
	    onLoadSuccess:function(result){
	    	//初始化订单明细
	    	var data = result.rows;
	        if(data!=null && data.length>0){	        	
	        	$(this).datagrid("selectRow",0);	        	
	        }
	    },
	    rowStyler:function(index,row){
	    	if (row.sysorderid=="合计"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	    		    	
	    	return "";	    	 	
		},
	    loadFilter:function(data) {		    	
	    	var fields = ["orderprice"];
	    	return commonListFormat(data, fields, "sysorderid");
         }
	});

	
	$.ajax({
		type : "GET",
		url : "${api}/ecblackuser/findOrdersList?sysorderidsStr="+ sysorderids +"&timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {					
			
			/***************************              列表信息初始化                        ************************/
			
			var orderDtos = result.entry;	
			$("#blackUserDetailDataGrid").datagrid("loadData", orderDtos);
			
			
			/***************************              明细信息初始化                        **********************
					
			$.each(orderDtos, function(){
				var orderDto = this;
				if(orderDto.sysorderid==latestsysorderid){
										
					$("#sysorderid", $fm).text(orderDto.sysorderid);
					$("#extorderid", $fm).textbox("setValue", orderDto.extorderid);
					$("#channelname", $fm).textbox("setValue", orderDto.channelname);
					$("#shopname", $fm).textbox("setValue", orderDto.shopname);
					
					$("#username", $fm).textbox("setValue", orderDto.username);
					$("#receivename", $fm).textbox("setValue", orderDto.receivename);				
					$("#mobileno", $fm).textbox("setValue", orderDto.mobileno);	
					$("#tel", $fm).textbox("setValue", orderDto.tel);	
					
					$("#provincename", $fm).textbox("setValue", orderDto.provincename);	
					$("#cityname", $fm).textbox("setValue", orderDto.cityname);	
					$("#regionname", $fm).textbox("setValue", orderDto.regionname);
								
					$("#auditcname", $fm).textbox("setValue", orderDto.auditcname);
					$("#auditdatetime", $fm).datetimebox("setValue", orderDto.auditdatetime);
					$("#address", $fm).textbox("setValue", orderDto.address);
					
					$("#auditremark", $fm).textbox("setValue", orderDto.auditremark);
					return;
				}
			});				
			**/
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
});

/**
 * 初始化订单明细
 */
function initOrderDetailForm(orderDto){
	
	var $fm = $("#fm");  
	$("#sysorderid", $fm).text(orderDto.sysorderid);
	$("#extorderid", $fm).textbox("setValue", orderDto.extorderid);
	$("#channelname", $fm).textbox("setValue", orderDto.channelname);
	$("#shopname", $fm).textbox("setValue", orderDto.shopname);
	
	$("#username", $fm).textbox("setValue", orderDto.username);
	$("#receivename", $fm).textbox("setValue", orderDto.receivename);				
	$("#mobileno", $fm).textbox("setValue", orderDto.mobileno);	
	$("#tel", $fm).textbox("setValue", orderDto.tel);	
	
	$("#provincename", $fm).textbox("setValue", orderDto.provincename);	
	$("#cityname", $fm).textbox("setValue", orderDto.cityname);	
	$("#regionname", $fm).textbox("setValue", orderDto.regionname);
				
	$("#auditcname", $fm).textbox("setValue", orderDto.auditcname);
	$("#auditdatetime", $fm).datetimebox("setValue", orderDto.auditdatetime);
	$("#address", $fm).textbox("setValue", orderDto.address);
	
	$("#auditremark", $fm).textbox("setValue", orderDto.auditremark);
}

</script>