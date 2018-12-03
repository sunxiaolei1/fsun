<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
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
	margin-top: 8px;
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


<!-- 查询条件 -->
<%@include file="../detailtoolbar.jsp"%>

<form id="fm">
	<div class="easyui-tabs" >
		<div title="基本信息" style="padding:6px;">
		    <div class="fsun-wrap">
				<span class="title" style="top: 64px;">补发单信息(补发单号:<span id='sysorderid'></span>)</span>		
								
				<table class="nb-formTable" style="width:100%;">
			        <tr>
			            <th width="12%">外部单号</th>
						<td>
							<input name="extorderid" id="extorderid" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">原订单号</th>
						<td>
							<input name="relationid" id="relationid" class="easyui-textbox" editable="false" />
						</td>							
						<th width="12%">所属店铺</th>
						<td>
							<input name="shopname" id="shopname" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">买家用户名</th>
						<td>
							<input name="username" id="username" class="easyui-textbox" editable="false" />
						</td>	
			        </tr>				  
			        <tr>
			            <th width="12%">补发状态</th>
						<td>
							<input name="flowstatus" id="flowstatus" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">运单号</th>
						<td>
							<input name="expressno" id="expressno" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">配送快递</th>
						<td>
							<input name="expresscode" id="expresscode" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">指定快递</th>
						<td>
							<input name="pointexpresscode" id="pointexpresscode" class="easyui-textbox" editable="false" />
						</td>								
			        </tr>
			        <tr>
			            <th width="12%">收货人</th>
						<td>
							<input name="receivename" id="receivename" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">手机号</th>
						<td>
							<input name="mobileno" id="mobileno" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">固定电话</th>
						<td>
							<input name="tel" id="tel" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">邮编</th>
						<td>
							<input name="zipcode" id="zipcode" class="easyui-textbox" editable="false" />
						</td>													
			        </tr>				      
			        <tr>
			            <th width="12%">配送状态</th>
						<td>
							<input name="systemstatus" id="systemstatus" class="easyui-textbox"  editable="false" />
						</td>
						<th width="12%">省份</th>
						<td>
							<input name="provincename" id="provincename" class="easyui-textbox" editable="false" />
						</td>	
						<th width="12%">城市</th>
						<td>
							<input name="cityname" id="cityname" class="easyui-textbox"  editable="false" />
						</td>
						<th width="12%">区县</th>
						<td>
							<input name="regionname" id="regionname" class="easyui-textbox" editable="false" />
						</td>																			
			        </tr>
			        <tr>
			            <th width="12%">仓储状态</th>
						<td>
							<input name="stockstatus" id="stockstatus" class="easyui-textbox"  editable="false" />
						</td>
						<th width="12%">仓库名称</th>
						<td>
							<input name="stockname" id="stockname" class="easyui-textbox" editable="false" />
						</td>	
						<th width="12%">详细地址</th>
						<td colspan="3">
							<input name="address" id="address" class="easyui-textbox"  editable="false"  style="width:480px;"/>
						</td>																										
			        </tr>		
			        <tr>				            
						<th width="12%">备注</th>
						<td colspan="7">
							<input name="sellerremark" id="sellerremark" data-options="multiline:true" class="easyui-textbox" 
								style="width:850px;height:40px;" editable="false" />
						</td>							
			        </tr>				       
		        </table>		        				        														
			</div>					
			<div style="height: 180px;width: 100%;">
				<table id="orderDetailDataGrid"></table>
			</div>					
		</div>							
		<div title="操作日志" closable="false" style="padding:6px;">
		    <div style="width:100%;height:440px;">
		    	<table id="orderLogDataGrid"></table>
		    </div>				
		</div>	
	</div>									
</form>
	

<script type="text/javascript">

var columns = [[
	{field:"sku",title:"SKU",width:100,align:"center",sortable:true},
	{field:"tradetype",title:"交易类型",width:60,align:"center",sortable:true},
	{field:"materialname",title:"商品名称",width:240,align:"center"},
	//{field:"materialcode",title:"商品货号",width:80,align:"center"},	
	{field:"isbuy",title:"商品类型",width:60,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.ecIsbuy); 
	}},
	{field:"materialproperty",title:"销售属性",width:140,align:"center"},
	{field:"saleprice",title:"销售单价",width:60,align:"center",formatter:numBaseFormat},
	{field:"payprice",title:"实付单价",width:60,align:"center",formatter:numBaseFormat},		
	{field:"shipedqty",title:"数量",width:60,align:"center",formatter:numBaseFormat},	
	{field:"totalprice",title:"实付总价",width:60,align:"center",formatter:numBaseFormat},	
	{field:"memo",title:"备注",width:200,align:"center"} 	
]];

$(function () { 
	
	var $fm = $("#fm");   		
	var sysorderid = '${sysorderid}';
	
	$("#orderDetailDataGrid").datagrid({
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    remoteSort:false,
	    sortName:"tradetype",
        sortOrder:"desc",	   
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	    
	    fitColumns:true,	    
	    columns:columns,
	    rowStyler:function(index,row){
        	var rowStyle = "";        	
        	if(row.tradetype == '销售'){
 				rowStyle += "background-color:#42cc06;";
			}else if(row.tradetype == '补发'){
				rowStyle += "background-color:#FF9933;";
			}
        	return rowStyle;
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});	
	
	$("#orderLogDataGrid").datagrid({		
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    sortName:"adddatetime",
        sortOrder:"desc",
	    singleSelect:true,//是否单选
	    rownumbers:true,//行号
	    fitColumns:true,
	    columns:[[				
	    		{field:"adddatetime",title:"操作时间",width:200,align:"center"},
	    		{field:"addcname",title:"操作人",width:200,align:"center"},
	    		//{field:"typeid",title:"类别",width:200,align:"center"},
	    		{field:"typename",title:"操作类别",width:200,align:"center"},
	    		{field:"remark",title:"操作事件",width:460,align:"center"}
	    	]],
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录" 
	});	
	
	$.ajax({
		type : "GET",
		url : "${api}/ecaftersale/reissue/"+ sysorderid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var ecOrderDto = result.entry;
			var header = ecOrderDto.header;									
			var stockInfo = ecOrderDto.stockInfo;
			
			/***************************              基本信息初始化                        ************************/

			$("#sysorderid", $fm).text(header.sysorderid);
						
			//补发单头信息
			$("#extorderid", $fm).textbox("setValue", header.extorderid);
			$("#relationid", $fm).textbox("setValue", header.relationid);
			$("#shopname", $fm).textbox("setValue", header.shopname);
			$("#username", $fm).textbox("setValue", header.username);
				
			$("#flowstatus", $fm).textbox("setValue", formatter(header.flowstatus, window.parent.ecFlowstatus));
			$("#expressno", $fm).textbox("setValue", header.expressno);
			$("#expresscode", $fm).textbox("setValue", formatter(header.expresscode, window.parent.expressCode));						
			$("#pointexpresscode", $fm).textbox("setValue", formatter(header.pointexpresscode, window.parent.expressCode));	
			
			$("#receivename", $fm).textbox("setValue", header.receivename);
			$("#mobileno", $fm).textbox("setValue", header.mobileno);
			$("#tel", $fm).textbox("setValue", header.tel);
			$("#zipcode", $fm).textbox("setValue", header.zipcode);
			
			$("#systemstatus", $fm).textbox("setValue", formatter(header.systemstatus, window.parent.ecSystemstatus));
			$("#provincename", $fm).textbox("setValue", header.provincename);
			$("#cityname", $fm).textbox("setValue", header.cityname);
			$("#regionname", $fm).textbox("setValue", header.regionname);
	
			$("#stockstatus", $fm).textbox("setValue", formatter(header.stockstatus, window.parent.ecStockstatus));
			$("#stockname", $fm).textbox("setValue", stockInfo.stockname);
			$("#address", $fm).textbox("setValue", header.address);
			
			$("#sellerremark", $fm).textbox("setValue", header.sellerremark);
					
			var details = ecOrderDto.details;
			var originOrderDetails = ecOrderDto.originOrderDetails;
			
			var allDetails = new Array();
			$.each(originOrderDetails, function() {
				this.tradetype = "销售";
				allDetails.push(this);
		    }); 
			
			$.each(details, function() { 
				this.tradetype = "补发";
				allDetails.push(this);				
		    });			
			$("#orderDetailDataGrid").datagrid("loadData", allDetails);	
			/***************************              操作日志信息初始化                               ************************/
			
			var ecOrderLogs = ecOrderDto.ecOrderLogs;
			$("#orderLogDataGrid").datagrid("loadData", ecOrderLogs);
						
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});

</script>