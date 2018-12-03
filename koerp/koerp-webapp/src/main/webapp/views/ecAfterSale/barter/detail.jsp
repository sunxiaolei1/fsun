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
	<div class="easyui-tabs">
		<div title="换货信息" style="padding:6px;">
			<div class="fsun-wrap">
				<span class="title" style="top: 64px;">换货信息(换退单号:<span id='refundorderid'></span>)</span>	
				<span class="title" style="top: 64px;left:50%">原订单信息(系统单号:<span id='sysorderid'></span>)</span>
				<div style="width:100%;height:164px;">
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
							<th width="12%">换退备注</th>
							<td colspan="3">
								<input name="remark" id="remark" data-options="multiline:true" class="easyui-textbox" 
									style="width:360px;height:46px;" editable="false" />
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
							<th width="12%">仓库名称</th>
							<td>
								<input id="stockcode" name="stockcode" class="easyui-textbox" editable="false"/>
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
							<th width="12%">订单备注</th>
							<td colspan="3">
								<input name="orderremark" id="orderremark" data-options="multiline:true" class="easyui-textbox" 
									style="width:360px;height:46px;" editable="false" />
								<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="false" onclick="toAftersaleRemarkView('YD')">添加</a>
							</td>							
				        </tr>					        	       
			        </table>
				</div>	
			</div>		
			<div class="fsun-wrap" style="margin-top:13px;">					
				<span class="title" style="top: 264px;">换发信息(换发单号:<span id='reneworderid'></span>)</span>					
				<table class="nb-formTable" style="width:100%;">
			        <tr>
			            <th width="12%">换发状态</th>
						<td>
							<input name="systemstatus" id="b_systemstatus" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">仓储状态</th>
						<td>
							<input name="stockstatus" id="b_stockstatus" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">交易状态</th>
						<td>
							<input name="tradestatus" id="b_tradestatus" class="easyui-textbox" editable="false" />
						</td>											        
			            <th width="12%">指定快递</th>
						<td>
							<input name="pointexpresscode" id="b_pointexpresscode" class="easyui-textbox" editable="false" />
						</td>														
			        </tr>
			        <tr>
			        	<th width="12%">收货人</th>
						<td>
							<input name="receivename" id="b_receivename" class="easyui-textbox" editable="false" />
						</td>											        
			            <th width="12%">手机号</th>
						<td>
							<input name="mobileno" id="b_mobileno" class="easyui-textbox" editable="false" />
						</td>
			            <th width="12%">固定电话</th>
						<td>
							<input name="tel" id="b_tel" class="easyui-textbox"  editable="false" />
						</td>
						<th width="12%">邮编</th>
						<td>
							<input name="zipcode" id="b_zipcode" class="easyui-textbox"  editable="false" />
						</td>													
			        </tr>					        				        
			        <tr>				        	
			        	<th width="12%">省份</th>
						<td>
							<input name="provincename" id="b_provincename" class="easyui-textbox" editable="false" />
						</td>											        
			            <th width="12%">城市</th>
						<td>
							<input name="cityname" id="b_cityname" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">区县</th>
						<td>
							<input name="regionname" id="b_regionname" class="easyui-textbox" editable="false" />
						</td>																							       			            							
			        </tr>
			        <tr>
			        	<th width="12%">配送快递</th>
						<td>
							<input name="expresscode" id="b_expresscode" class="easyui-textbox" editable="false" />
						</td>	
						<th width="12%">运单号</th>
						<td>
							<input name="expressno" id="b_expressno" class="easyui-textbox" editable="false" />
						</td>	
						<th width="12%">详细地址</th>
						<td colspan="3">
							<input name="address" id="b_address" class="easyui-textbox" style="width:460px;" editable="false" />
						</td>										        								
			        </tr>	
			        <tr>			        				        																		       			            
						<th width="12%">换发备注</th>
						<td colspan="7">
							<input name="sellerremark" id="b_remark" data-options="multiline:true" class="easyui-textbox" 
								style="width:860px;height:40px;" editable="false" />
							<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="false" onclick="toAftersaleRemarkView('HF')">添加</a>	
						</td>							
			        </tr>				       
		        </table>			        
			</div>					
		</div>	
		<div title="订单商品" closable="false" style="padding:6px;">						   			        		   
			<div style="width:100%;height:440px;">
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
        sortOrder:"desc",
	    singleSelect:true,//是否单选
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    columns:[[
			{field:"tradetype",title:"交易类型",width:70,align:"center"},
			{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
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
        rowStyler:function(index,row){
        	var rowStyle = "";        	
        	if(row.tradetype == '换发'){
 				rowStyle += "background-color:#FF9933;";
			}else if(row.tradetype == '退货'){
				rowStyle += "background-color:#42cc06;";
			}
        	return rowStyle;
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
	    //idField:"orderlineid",
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	    
	    fitColumns:true,
	    showFooter:true,
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
	    showFooter:true,
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
		url : "${api}/ecaftersale/barter/"+ refundorderid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var ecBarterOrderDto = result.entry;
			var barterOrderHeader = ecBarterOrderDto.barterOrderHeader;		
			var originalOrderHeader = ecBarterOrderDto.originalOrderHeader;		
			var renewOrderHeader = ecBarterOrderDto.renewOrderHeader;	
			var cashorders = ecBarterOrderDto.cashorders;	
			var stockInfo = ecBarterOrderDto.stockInfo;
			
			/***************************              基本信息初始化                        ************************/
			
			$("#refundorderid", $fm).text(barterOrderHeader.refundorderid);
			$("#sysorderid", $fm).text(barterOrderHeader.sysorderid);	
			$("#reneworderid", $fm).text(renewOrderHeader.sysorderid);	
			
			//退货单头信息
			$("#refundstatus", $fm).textbox("setValue", formatter(barterOrderHeader.refundstatus, window.parent.ecRefundstatus));
			$("#expresscode", $fm).textbox("setValue", formatter(barterOrderHeader.expresscode, window.parent.expressCode));			
			$("#stockstatus", $fm).textbox("setValue", formatter(barterOrderHeader.stockstatus, window.parent.ecStockstatus));
			$("#expressno", $fm).textbox("setValue", barterOrderHeader.expressno);					
			$("#refundprice", $fm).numberbox("setValue", barterOrderHeader.refundprice!=null?barterOrderHeader.refundprice:0);
			$("#isreturninvoices", $fm).textbox("setValue", formatter(barterOrderHeader.isreturninvoices, window.parent.isEnable));			
			$("#remark", $fm).textbox("setValue", barterOrderHeader.remark);
			
			//原订单头信息
			$("#extorderid", $fm).textbox("setValue", originalOrderHeader.extorderid);
			$("#shopname", $fm).textbox("setValue", originalOrderHeader.shopname);			
			$("#stockcode", $fm).textbox("setValue", stockInfo.stockname);
			$("#payprice", $fm).numberbox("setValue", originalOrderHeader.payprice!=null?originalOrderHeader.payprice:0);
			$("#username", $fm).textbox("setValue", originalOrderHeader.username);
			$("#orderremark", $fm).textbox("setValue", originalOrderHeader.sellerremark);
			
			//换发单信息
			$("#b_systemstatus", $fm).textbox("setValue", formatter(renewOrderHeader.systemstatus, window.parent.ecSystemstatus));
			$("#b_stockstatus", $fm).textbox("setValue", formatter(renewOrderHeader.stockstatus, window.parent.ecStockstatus));
			$("#b_tradestatus", $fm).textbox("setValue", formatter(renewOrderHeader.tradestatus, window.parent.ecTradestatus));
			$("#b_pointexpresscode", $fm).textbox("setValue", formatter(renewOrderHeader.pointexpresscode, window.parent.expressCode));
			$("#b_receivename", $fm).textbox("setValue", renewOrderHeader.receivename);
			$("#b_mobileno", $fm).textbox("setValue", renewOrderHeader.mobileno);
			$("#b_tel", $fm).textbox("setValue", renewOrderHeader.tel);
			$("#b_zipcode", $fm).textbox("setValue", renewOrderHeader.zipcode);
			$("#b_provincename", $fm).textbox("setValue", renewOrderHeader.provincename);
			$("#b_cityname", $fm).textbox("setValue", renewOrderHeader.cityname);
			$("#b_regionname", $fm).textbox("setValue", renewOrderHeader.regionname);
			$("#b_expresscode", $fm).textbox("setValue", formatter(renewOrderHeader.expresscode, window.parent.expressCode));
			$("#b_expressno", $fm).textbox("setValue", renewOrderHeader.expressno);
			$("#b_address", $fm).textbox("setValue", renewOrderHeader.address);
			$("#b_remark", $fm).textbox("setValue", renewOrderHeader.sellerremark);
			
			var barterOrderDetails = ecBarterOrderDto.barterOrderDetails;
			var renewOrderDetails = ecBarterOrderDto.renewOrderDetails;
			var allDetails = new Array();
			$.each(renewOrderDetails, function() {
				this.tradetype = "换发";
				allDetails.push(this);
		    }); 
			
			$.each(barterOrderDetails, function() { 
				this.tradetype = "退货";
				allDetails.push(this);				
		    });
			
			
			/***************************              商品信息初始化                               ************************/

			$("#orderDetailDataGrid").datagrid("loadData", allDetails);
			
			
			/***************************              补退款信息初始化                        ************************/			

			var cashorders = ecBarterOrderDto.cashorders;
			$("#cashordersDataGrid").datagrid("loadData", cashorders);
			
			/***************************              操作日志信息初始化                               ************************/
			
			var ecOrderLogs = ecBarterOrderDto.ecOrderLogs;
			$("#orderLogDataGrid").datagrid("loadData", ecOrderLogs);
					
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});

/**
 * 跳转到对应类型的修改备注页面
 */
function toAftersaleRemarkView(aftersaleType){	
	var $fm = $("#fm");  
	var sysorderid = "";
	if(aftersaleType=='YD'){
		sysorderid = $("#sysorderid", $fm).text();
	}else if(aftersaleType=='HF'){
		sysorderid = $("#reneworderid", $fm).text();		
	}else if(aftersaleType=='BF'){
		sysorderid = $("#sysorderid", $fm).text();
	}
	toRenewRemarkView(sysorderid);
}

</script>