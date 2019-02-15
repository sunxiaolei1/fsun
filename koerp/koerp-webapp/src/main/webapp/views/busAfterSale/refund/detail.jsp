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
				<span class="title" style="top: 64px;">退货信息(退货单号:<span id='refundorderid'></span>)</span>	
				<span class="title" style="top: 64px;left:50%">原订单信息(系统单号:<span id='sysorderid'></span>)</span>	
				<div style="width:100%;height:206px;">
					<table class="nb-formTable" style="width:49%;float:left;">
				        <tr>
				            <th width="12%">退货状态</th>
							<td>
								<input name="refundstatus" id="refundstatus" class="easyui-textbox" editable="false" />
							</td>
							<th width="12%">配送快递</th>
							<td>
								<input name="expresscode" id="expresscode" class="easyui-textbox" editable="false" />
							</td>							
				        </tr>
				        <tr>
				            <th width="12%">快递单号</th>
							<td>
								<input name="expressno" id="expressno" class="easyui-textbox" editable="false" />
							</td>
							<th width="12%">仓储状态</th>
							<td>
								<input name="stockstatus" id="stockstatus" class="easyui-textbox" editable="false" />
							</td>							
				        </tr>
				        <tr>
				            <th width="12%">参考退款</th>
							<td>
								<input name="adviserefundprice" id="adviserefundprice" class="easyui-numberbox" 
									data-options="min:0,precision:2" editable="false"/>								
							</td>
							<th width="12%">已退金额</th>
							<td>
								<input name="refundprice" id="refundprice" class="easyui-numberbox" 
									data-options="min:0,precision:2" editable="false"/>
							</td>													
				        </tr>
				        <tr>
				            <th width="12%">寄回发票</th>
							<td>
								<input name="isreturninvoices" id="isreturninvoices" class="easyui-textbox"  editable="false" />
							</td>
							<th width="12%">仓库名称</th>
							<td>
								<input name="stockcode" id="stockcode" class="easyui-textbox" editable="false" />
							</td>																			
				        </tr>	
				        <tr>				            
							<th width="12%">备注</th>
							<td colspan="3">
								<input name="remark" id="remark" data-options="multiline:true" class="easyui-textbox" 
									style="width:360px;height:50px;" editable="false" />
							</td>							
				        </tr>				       
			        </table>
			        <table class="nb-formTable" style="width:50%;float:right;">
				        <tr>				            
							<th width="12%">外部单号</th>
							<td>
								<input id="extorderid" name="extorderid" class="easyui-textbox" editable="false"/>
							</td>
							<th width="12%">所属店铺</th>
							<td>
								<input id="shopname" name="shopname" class="easyui-textbox" editable="false"/>
							</td>
				        </tr>
				        <tr>				            
							<th width="12%">订单金额</th>
							<td>
								<input id="orderprice" name="orderprice" class="easyui-numberbox" 
									data-options="min:0,precision:2" editable="false"/>
							</td>
							<th width="12%">实付金额</th>
							<td>
								<input id="payprice" name="payprice" class="easyui-numberbox" 
									data-options="min:0,precision:2" editable="false"/>
							</td>
				        </tr>
				        <tr>				            
							<th width="12%">用户名</th>
							<td colspan="3">
								<input id="username" name="username" class="easyui-textbox" editable="false"/>
							</td>							
				        </tr>
				        <tr>				            
							<th width="12%">备注</th>
							<td colspan="3">
								<input name="sellerremark" id="sellerremark" data-options="multiline:true" 
									class="easyui-textbox" style="width:440px;height:85px;" editable="false" />
							</td>							
				        </tr>				        	       
			        </table>
				</div>										
			</div>					
			<div style="height: 206px;width: 100%;">
				<table id="orderDetailDataGrid"></table>
			</div>
		</div>	
		<div title="补退款信息" closable="false" style="padding:6px;">
		    <div style="width:100%;height:440px;">
		    	<table id="cashordersDataGrid"></table>
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

$(function () { 
	
	var $fm = $("#fm");   		
	var refundorderid = '${refundorderid}';
	
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
        sortOrder:"asc",	   
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	    
	    fitColumns:true,	    
	    columns:[[
			{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
			{field:"tradetype",title:"交易类型",width:60,align:"center"},			
			{field:"materialname",title:"商品名称",width:240,align:"center"},
			{field:"materialcode",title:"商品货号",width:80,align:"center"},	
			{field:"isbuy",title:"商品类型",width:60,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.ecIsbuy); 
			}},
			{field:"materialproperty",title:"商品属性",width:140,align:"center"},
			{field:"saleprice",title:"销售单价",width:60,align:"center",formatter:numBaseFormat},
			{field:"payprice",title:"实付单价",width:60,align:"center",formatter:numBaseFormat},		
			{field:"orderqty",title:"下单数量",width:60,align:"center",formatter:numBaseFormat},	
			{field:"totalprice",title:"实付总价",width:60,align:"center",formatter:numBaseFormat},	
			{field:"memo",title:"备注",width:200,align:"center"}       
	    	]],
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",	   
	    selectOnCheck: true,
	    checkOnSelect: true,
        rowStyler:function(index,row){
        	var rowStyle = "";        	
        	if(row.tradetype == '销售'){
 				rowStyle += "background-color:#42cc06;";
			}else if(row.tradetype == '退货'){
				rowStyle += "background-color:#FF9933;";
			}
        	return rowStyle;
		},
		showFooter:true,
		loadFilter:function(data) {			
			//var fields = ["totalprice","orderqty"];
	    	//return commonListFormat(data, fields, "sku");	
	    	return data;
          }
	});
	
	$("#cashordersDataGrid").datagrid({
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
	      		//{field:'cashid',checkbox:true},
	    		{field:"adddatetime",title:"操作时间",width:180,align:"center"},
	    		{field:"refundcashstatus",title:"补退款状态",width:140,align:"center",formatter:function(value, row){
	    			return formatter(value, window.parent.ecRefundcashstatus);
	    		}},
	    		{field:"isvalid",title:"是否有效",width:80,align:"center",formatter:function(value, row){
	    			return (value==1?'是':'否');
	    		}},	
	    		{field:"refundprice",title:"补退款金额",width:140,align:"center",formatter:numBaseFormat},	    		
	    		{field:"addcname",title:"操作人",width:160,align:"center"},
	    		{field:"remark",title:"备注",width:400,align:"center"}
	    	]],
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
		url : "${api}/ecaftersale/refund/"+ refundorderid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var ecRefundOrderDto = result.entry;
			var refundOrderHeader = ecRefundOrderDto.refundOrderHeader;		
			var originalOrderHeader = ecRefundOrderDto.originalOrderHeader;		
			var cashorders = ecRefundOrderDto.cashorders;	
			var stockInfo = ecRefundOrderDto.stockInfo;
			
			/***************************              基本信息初始化                        ************************/
			
			$("#refundorderid", $fm).text(refundOrderHeader.refundorderid);
			$("#sysorderid", $fm).text(refundOrderHeader.sysorderid);
			
			
			//退货单头信息
			$("#refundstatus", $fm).textbox("setValue", formatter(refundOrderHeader.refundstatus, window.parent.ecRefundstatus));
			$("#expresscode", $fm).textbox("setValue", formatter(refundOrderHeader.expresscode, window.parent.expressCode));			
			$("#stockstatus", $fm).textbox("setValue", formatter(refundOrderHeader.stockstatus, window.parent.ecStockstatus));
			$("#expressno", $fm).textbox("setValue", refundOrderHeader.expressno);
			
			//退单金额求和(EC_RefundDetail: totalprice)
			var adviserefundprice = 0;
			//$("#adviserefundprice", $fm).numberbox("setValue", adviserefundprice);
			
			$("#refundprice", $fm).numberbox("setValue", refundOrderHeader.refundprice!=null?refundOrderHeader.refundprice:0);
			$("#isreturninvoices", $fm).textbox("setValue", formatter(refundOrderHeader.isreturninvoices, window.parent.isEnable));
			$("#stockcode", $fm).textbox("setValue", stockInfo.stockname);
			$("#remark", $fm).textbox("setValue", refundOrderHeader.remark);
			
			//原订单头信息
			$("#extorderid", $fm).textbox("setValue", originalOrderHeader.extorderid);
			$("#shopname", $fm).textbox("setValue", originalOrderHeader.shopname);
			$("#username", $fm).textbox("setValue", originalOrderHeader.username);
			$("#orderprice", $fm).numberbox("setValue", originalOrderHeader.orderprice!=null?originalOrderHeader.orderprice:0);
			$("#payprice", $fm).numberbox("setValue", originalOrderHeader.payprice!=null?originalOrderHeader.payprice:0);
			$("#sellerremark", $fm).textbox("setValue", originalOrderHeader.sellerremark);
				
			var refundOrderDetails = ecRefundOrderDto.refundOrderDetails;
			var originalOrderDetails = ecRefundOrderDto.originalOrderDetails;
			var allDetails = new Array();
			$.each(originalOrderDetails, function() {
				this.tradetype = "销售";
				allDetails.push(this);
		    }); 
			
			$.each(refundOrderDetails, function() { 
				this.tradetype = "退货";
				allDetails.push(this);
				adviserefundprice += this.totalprice;
		    });
			$("#adviserefundprice", $fm).numberbox("setValue", adviserefundprice);
			
			$("#orderDetailDataGrid").datagrid("loadData", allDetails);
			
			
			/***************************              补退款信息初始化                        ************************/			

			var cashorders = ecRefundOrderDto.cashorders;
			$("#cashordersDataGrid").datagrid("loadData", cashorders);
			
			/***************************              操作日志信息初始化                               ************************/
			
			var ecOrderLogs = ecRefundOrderDto.ecOrderLogs;
			$("#orderLogDataGrid").datagrid("loadData", ecOrderLogs);
			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});

</script>