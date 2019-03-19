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
<%@include file="../../busCommon/commonOrderViewToolbar.jsp"%>

<form id="orderfm">
	<div class="easyui-tabs" >
		<div title="基本信息" style="padding:6px;">
			<div class="fsun-wrap">
				<span class="title" style="top: 66px;">退货信息(退货单号:<span id='refundId'></span>)</span>	
				<span class="title" style="top: 66px;left:50%">原订单信息(订单号:<span id='orderId'></span>)</span>	
				<div style="width:100%;height:206px;">
					<table class="nb-formTable" style="width:49%;float:left;">
						<tr>
				        	<th width="12%">退货类型</th>
							<td>
								<input name="refundType" id="refundType" class="easyui-textbox" editable="false"/>								
							</td>
				            <th width="12%">退货状态</th>
							<td>
								<input name="refundStatus" id="refundStatus" class="easyui-textbox" editable="false" />
							</td>														
				        </tr>
				        <tr>
				            <th width="12%">客户名称</th>
							<td>
								<input name="buyerName" id="buyerName" class="easyui-textbox" editable="false" />
							</td>
							<th width="12%">所属店仓</th>
							<td>
								<input name="shopName" id="shopName" class="easyui-textbox" editable="false" />
							</td>							
				        </tr>				        
				        <tr>
				            <th width="12%">退款金额</th>
							<td>
								<input name="refundPrice" id="refundPrice" class="easyui-numberbox" 
									data-options="min:0,precision:2" editable="false" />
							</td>
							<th width="12%">退货原因</th>
							<td>
								<input name="refundReason" id="refundReason" class="easyui-textbox"  editable="false"/>
							</td>													
				        </tr>
				        <tr>				            
							<th width="12%">单据日期</th>
							<td>
								<input name="refundTime" id="refundTime" class="easyui-datebox" editable="false" />
							</td>																										
				        </tr>
				        <tr>				            							
							<th width="12%">备注</th>
							<td colspan="3">
								<input name="memo" id="memo" data-options="multiline:true" class="easyui-textbox" 
									style="width:360px;height:50px;" />
							</td>																			
				        </tr>					        				       
			        </table>			        	
			        <table class="nb-formTable" style="width:50%;float:right;">
				        <tr>				            
							<th width="12%">单据类型</th>
							<td>
								<input id="orderType" name="orderType" class="easyui-textbox" editable="false"/>
							</td>
							<th width="12%">交易状态</th>
							<td>
								<input id="tradeStatus" name="tradeStatus" class="easyui-textbox" editable="false"/>
							</td>
				        </tr>
				        <tr>				            
							<th width="12%">订单金额</th>
							<td>
								<input id="orderPrice" name="orderPrice" class="easyui-numberbox" 
									data-options="min:0,precision:2" editable="false"/>
							</td>
							<th width="12%">商品优惠</th>
							<td>
								<input id="couponPrice" name="couponPrice" class="easyui-numberbox" 
									data-options="min:0,precision:2" editable="false"/>
							</td>
				        </tr>
				        <tr>
				        	<th width="12%">实收金额</th>
							<td>
								<input id="receptPrice" name="receptPrice" class="easyui-numberbox" 
									data-options="min:0,precision:2" editable="false"/>
							</td>				            
							<th width="12%">商家优惠</th>
							<td>
								<input id="discountPrice" name="discountPrice" class="easyui-numberbox" 
									data-options="min:0,precision:2" editable="false"/>
							</td>						
				        </tr>
				        <tr>				            
							<th width="12%">抹零金额</th>
							<td>
								<input id="toZeroPrice" name="toZeroPrice" class="easyui-numberbox" 
									data-options="min:0,precision:2" editable="false"/>
							</td>							
				        </tr>
				        <tr>				            
							<th width="12%">备注</th>
							<td colspan="3">
								<input name="orderMemo" id="orderMemo" data-options="multiline:true" 
									class="easyui-textbox" style="width:360px;height:50px;" editable="false" />
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

var refundId = '${refundId}';
var $orderfm = $("#orderfm");  

$(function () { 

	$("#orderDetailDataGrid").datagrid({
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    remoteSort:false,
	    sortName:"sku",
        sortOrder:"asc",	   
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	    
	    fitColumns:true,	    
	    columns:[[			
			{field:"sku",title:"SKU", width:80,align:"center",sortable:true},
			{field:"tradeType",title:"交易类型",width:60,align:"center",sortable:true},	
			{field:"goodsName",title:"商品名称", width:140,align:"center",sortable:true},
			//{field:"barCode",title:"条形码", width:140,align:"center"},
			{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
				return formatter(value, window.parent.brandCode); 
			}},
			{field:'property',title:'规格',width:120,align:'center',sortable:true},
			{field:'originSalePrice',title:'原交易单价',width:70,align:'center'},
			{field:"unit",title:"单位",width:50,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.unitCode); 
			}},
			{field:"qty",title:"交易数量",width:60,align:"center",
				styler: function(value, rowData, rowIndex){
			      	return 'font-weight:bold;color:green;';
			    },
		      	formatter:numBaseFormat
			},	
			{field:"salePrice",title:"交易单价",width:60,align:"center",
				styler: function(value, rowData, rowIndex){
			      	return 'font-weight:bold;color:green;';
			    },
		      	formatter:numBaseFormat		
			},	
			{field:"totalPrice",title:"交易金额",width:60,align:"center",formatter:numBaseFormat}			
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
	    sortName:"lineNo",
        sortOrder:"asc",	    
	    singleSelect:true,//是否单选	   
	    rownumbers:true,//行号	
	    fitColumns:true,
	    columns:[[
	      	{field:"lineNo",title:"行号", width:80,align:"center", sortable:true, hidden:true}, 
	      	{field:"tradeType",title:"交易类型",width:60,align:"center",sortable:true},	
			{field:"payMode",title:"支付方式", width:80,align:"center", sortable:true,
				formatter:function(value, row){
					return formatter(value, window.parent.payMode); 
				}
			},            	         	
			{field:"receptPrice",title:"应收金额", width:80, align:"center",formatter:numBaseFormat},
			{field:"payPrice",title:"应付金额", width:80, align:"center",formatter:numBaseFormat},
			{field:"dibPrice",title:"找零金额", width:80, align:"center",formatter:numBaseFormat},
			{field:"discountAmount",title:"优惠金额", width:80, align:"center",formatter:numBaseFormat},  
			{field:"tradeNo",title:"支付流水号", width:150, align:"center"},  
			{field:"cardNo",title:"支付卡号", width:150, align:"center"}	
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
		url : "${api}/bus/aftersale/refund/getInitData?refundId="+ refundId +"&orderId=",
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var refundOrderDto = result.entry;
			var refundHeader = refundOrderDto.refundHeader;		
			var orderHeader = refundOrderDto.orderHeader;		
			
			/***************************              基本信息初始化                        ************************/			
			$("#refundId", $orderfm).text(refundHeader.refundId);
			$("#orderId", $orderfm).text(refundHeader.orderId);
			
			//退货单头信息
			
			$("#buyerName", $orderfm).textbox("setValue", refundHeader.buyerName);
			$("#shopName", $orderfm).textbox("setValue", refundHeader.shopName);
			
			$("#refundStatus", $orderfm).textbox("setValue", formatter(refundHeader.refundStatus, window.parent.refundStatus));
			$("#refundPrice", $orderfm).numberbox("setValue", refundHeader.refundPrice!=null?refundHeader.refundPrice:0);
			
			$("#refundType", $orderfm).textbox("setValue", formatter(refundHeader.refundType, window.parent.refundType));
			$("#refundReason", $orderfm).textbox("setValue", formatter(refundHeader.refundReason, window.parent.refundReason));			
			
			$("#refundTime", $orderfm).datebox("setValue", refundHeader.refundTime);
			$("#memo", $orderfm).textbox("setValue", refundHeader.memo);
			
			//原订单头信息
			$("#orderType", $orderfm).textbox("setValue", formatter(orderHeader.orderType, window.parent.orderType));
			$("#tradeStatus", $orderfm).textbox("setValue", formatter(orderHeader.tradeStatus, window.parent.tradeStatus));
			
			$("#orderPrice", $orderfm).numberbox("setValue", orderHeader.orderPrice);			
			$("#receptPrice", $orderfm).numberbox("setValue", orderHeader.receptPrice);			
			
			$("#discountPrice", $orderfm).numberbox("setValue", orderHeader.discountPrice);
			$("#toZeroPrice", $orderfm).numberbox("setValue", orderHeader.toZeroPrice);
			
			$("#couponPrice", $orderfm).numberbox("setValue", orderHeader.couponPrice);
			$("#orderMemo", $orderfm).textbox("setValue", orderHeader.memo);
				
			var refundDetails = refundOrderDto.refundDetails;
			var orderDetails = refundOrderDto.orderDetails;
			var allDetails = new Array();
			$.each(orderDetails, function() {
				this.tradeType = "销售";
				allDetails.push(this);
		    }); 
			
			$.each(refundDetails, function() { 
				this.tradeType = "退货";
				allDetails.push(this);
		    });
			$("#orderDetailDataGrid").datagrid("loadData", allDetails);
			
			
			/***************************              补退款信息初始化                        ************************/			

			var payAccounts = refundOrderDto.payAccounts;	
			$.each(payAccounts, function() { 
				this.tradeType = "退款";
		    });
			$("#cashordersDataGrid").datagrid("loadData", payAccounts);
			
			/***************************              操作日志信息初始化                               ************************/
			
			var orderLogs = []; //refundOrderDto.orderLogs;
			$("#orderLogDataGrid").datagrid("loadData", orderLogs);
			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
     
});

//获取取消订单的参数
function getOrderCancelData(){
	var refundIfd = $("#refundId", $orderfm).text();
	var memo = $("#memo",$orderfm).textbox("getValue");
	if(memo==''){
		$.messager.alert("提示", "撤销单据请备注撤销原因!", "info");
		return;
	}
	var saveData = {
	     "params": {
	    	"memo":  memo
	      },
	     "saveUrl": "${api}/bus/aftersale/status/${cancelStatus}?refundIds="+ refundIfd
	}
	return saveData;
	
}

/**
 * 保存成功后触发
 */
function afterSaveFunc(){
	parent.closeCurrTab("reflushDataGrid");
}

</script>