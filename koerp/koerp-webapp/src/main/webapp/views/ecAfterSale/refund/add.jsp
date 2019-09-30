<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>


<style type="text/css">

.easyui-textbox, .easyui-combogrid, .easyui-datebox, .easyui-combobox, .easyui-numberbox, .easyui-datetimebox {
	width: 162px;
}

.fsun-wrap {
	border: 1px solid #ccc;
	padding: 15px 5px 5px 5px;
	margin-top: 10px;
}

.fsun-wrap .title {
	position: absolute;
	color: #416AA3;
	font-weight: bold;
	left: 2%;
	line-height: 2em;
	font-size: 12px;
    font-family: Tahoma,Verdana,微软雅黑,新宋体;
	padding: 0 1em;
	background-color: #fff;
}
</style> 

<!-- 查询条件 -->
<%@include file="../addtoolbar.jsp"%>
	
<div class="fsun-wrap">
	<span class="title" style="top: 35px;">原销售商品</span>	
	<div style="height: 158px;width: 100%;">
		<table id="orderDetailDataGrid"></table>
	</div>	
</div>
<div class="fsun-wrap">
	<span class="title" style="top: 224px;">退货退款信息</span>	
	<div style="height: 130px;width: 100%;">
		<table id="refundDetailDataGrid"></table>
	</div>
	<form id="orderfm">
		<input id="sysorderid" name="sysorderid" hidden="true" />
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">原订单金额</th>
				<td>
					<input id="payprice" class="easyui-textbox" disabled />
				</td>
				<th width="12%">原已付金额</th>
				<td>
					<input id="alreadyprice" class="easyui-textbox" disabled />
				</td>
				<th width="12%">调整后退款金额</th>
				<td>
					<input id="refundprice" name="refundprice" class="easyui-numberbox" 
						data-options="min:0,precision:2,value:0, formatter: priceFormat" />
				</td>
				<th width="12%">所属仓库</th>
				<td>
					<input id="stockname" class="easyui-textbox" disabled />								
				</td>								
	        </tr>	
	        <tr>	
       			<th width="12%">退货快递</th>
				<td>
					<input id="expresscode" name="expresscode" class="easyui-combobox" editable="false" />								
				</td>
				<th width="12%">快递单号</th>
				<td colspan="3">
					<input id="expressno" name="expressno" class="easyui-textbox" style="width:350px;" />								
				</td>
				<th width="12%">寄回发票</th>
				<td>
					<input type="checkbox" id="isreturninvoices" name="isreturninvoices" style="zoom:140%;" />
				</td>										        			           
	        </tr>	       		        		        
	        <tr>	        			        	
	            <th width="12%">备注</th>
	        	<td colspan="7">
					<input id="remark" name="remark" data-options="multiline:true"
						class="easyui-textbox" style="width:800px;height:40px;" />
				</td>		        			           
	        </tr>
		</table>
	</form>	
</div>	
						


<!-- datagrid可编辑单元格 -->
<%@include file="../../ecCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currOrderDetails = []; 
var currRefundDetails = [];
var $orderfm ;

$(function () { 
	
	$orderfm = $("#orderfm");   		
	var sysorderid = '${sysorderid}';
	
	//$("#payprice", $orderfm).next().children("input:first-child").css("background-color", "rgb(235, 235, 228)");
		
	$('#expresscode', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.expressCodeData
   	});	
	
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
        sortOrder:"desc",	    
	    singleSelect:true,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    columns:[[
			{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
			{field:"materialname",title:"商品名称",width:240,align:"center"},
			//{field:"materialcode",title:"商品货号",width:80,align:"center"},	
			{field:"isbuy",title:"商品类型",width:60,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.ecIsbuy); 
			}},
			{field:"materialproperty",title:"商品属性",width:140,align:"center"},
			{field:"saleprice",title:"销售单价",width:60,align:"center",formatter:numBaseFormat},
			{field:"payprice",title:"实付单价",width:60,align:"center",formatter:numBaseFormat},
			{field:"orderqty",title:"下单数量",width:60,align:"center",formatter:numBaseFormat},
			{field:"totalprice",title:"实付总价",width:60,align:"center",formatter:numBaseFormat},			
			{field:"aftersalestatus",title:"售后状态",width:60,align:"center", formatter:function(value, row){				
				if(value==10){
					return '<span style="font-weight:bold;color:green;">'+ formatter(value, window.parent.ecAftersalestatus) +'</span>';
				}
				return '<span style="font-weight:bold;color:#FF6600;">'+ formatter(value, window.parent.ecAftersalestatus) +'</span>';
			}},
			{field:"torefund",title:"操作",width:80,align:"center", formatter: function(value, row, index){
				var aftersalestatus = row.aftersalestatus;
				if(aftersalestatus==10){					
					return commonAssemBottonHtml('refundOne', index, '退货', 'icon-cart_error');		
				}
									
			}}
	    ]],
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
	
	$.ajax({
		type : "GET",
		url : "${api}/ecaftersale/order/base/"+ sysorderid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var ecorderDto = result.entry;
			var header = ecorderDto.header;
			var stockinfo = ecorderDto.stockInfo;
			
			var shopid = header.shopid;
			/***************************              基本信息初始化                        ************************/
			
			$("#payprice", $orderfm).textbox("setValue", header.payprice.toFixed(2));
			$("#alreadyprice", $orderfm).textbox("setValue", header.alreadyprice.toFixed(2));
			$("#stockname",$orderfm).textbox("setValue", stockinfo.stockname);
			$("#sysorderid",$orderfm).val(header.sysorderid);
										
			currOrderDetails = ecorderDto.details;
			$("#orderDetailDataGrid").datagrid("loadData", currOrderDetails);
			
			$("#refundDetailDataGrid").datagrid({
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
			    fitColumns:true,
			    showFooter:true,
			    columns:[[
					{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
					{field:"materialname",title:"商品名称",width:240,align:"center"},
					//{field:"materialcode",title:"商品货号",width:80,align:"center"},	
					{field:"isbuy",title:"商品类型",width:60,align:"center", formatter:function(value, row){
						return formatter(value, window.parent.ecIsbuy); 
					}},
					{field:"materialproperty",title:"商品属性",width:140,align:"center"},
					{field:"payprice",title:"实付单价",width:60,align:"center",formatter:numBaseFormat},
					{field:"oldorderqty",title:"下单数量",width:60,align:"center",formatter:numBaseFormat},
					{field:"oldtotalprice",title:"实付总价",width:60,align:"center",formatter:numBaseFormat},			
					{field:"orderqty",title:"退货数量",width:60,align:"center",
						styler: function(value, rowData, rowIndex){
		                	return 'font-weight:bold;color:green;';
		                },
		                formatter:numBaseFormat,
						editor:{
							type:'numberspinner',
							options:{
								required: true,
								min:0,
								precision:2
							}
						}},	
					{field:"totalprice",title:"退款金额",width:60,align:"center",formatter:numBaseFormat},			
					{field:"reasonid",title:"退货理由",width:160,align:"center",
						editor:{
							type:'combobox',
							options: {
								valueField: 'codecode',
						   	  	textField: 'codename',
						   		url: "${api}/ecorder/config/getRefundReasons/"+ shopid,
		                        panelHeight : 'auto',
		                        editable: false,
		                        required: true,		                        
		                        loadFilter: function(data){			            				
		            		 		return data.entry;
		            			}
		                    }							
						},
						styler: function(value, rowData, rowIndex){
							return 'font-weight:bold;color:green;';
                        },
						formatter:function(value, row){
							return formatter(value, window.parent.ecReturnReason); 
						}	
					},
					{field:"delete",title:"操作",width:80,align:"center", formatter: function(value, row, index){
						return commonAssemBottonHtml('delOne', index, '删除', 'icon-script_delete');					
					}}
			    ]],
			    loadMsg:"数据加载中请稍后……",
			    emptyMsg:"没有符合条件的记录",
			    onAfterEdit: function(rowIndex, rowData, changes){
			    	if(typeof rowData.payprice !=undefined && typeof rowData.orderqty!=undefined){
			    		rowData.payprice = Number(rowData.payprice);
				    	rowData.orderqty = Number(rowData.orderqty);
				    	rowData.saleprice = Number(rowData.saleprice);
			    		rowData.totalprice = rowData.payprice * rowData.orderqty;
			    		rowData.discountprice = rowData.saleprice * rowData.orderqty - rowData.totalprice;
			    	}else{	    		   	
			    		rowData.totalprice = 0;
			    		rowData.discountprice = 0;
			    	}
			    	
			    	//更新退款金额
			    	updateRefundPrice(currRefundDetails, $("#refundprice", $orderfm));
			    }
			}).datagrid("loadData", currRefundDetails);
	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});


/**
 * 退货单个
 */
function refundOne(rowIndex){		
	var row = $('#orderDetailDataGrid').datagrid('getRows')[rowIndex];   
    $.each(currOrderDetails, function(){
    	if(this.orderlineid == row.orderlineid){
    		this.aftersalestatus = 20;  	
    		$("#orderDetailDataGrid").datagrid("refreshRow", rowIndex);
    		return;
    	}
    });	
 
    var rowdata = cloneObj(row);    
    rowdata.oldorderqty = row.orderqty;
    rowdata.oldtotalprice = row.totalprice;
    rowdata.reasonid = 70;
    delete rowdata.returnreason;
    delete rowdata.aftersalestatusname;
    //delete rowdata.aftersalestatus;
    delete rowdata.giftname;
    delete rowdata.nid;
	currRefundDetails.push(rowdata);
	$("#refundDetailDataGrid").datagrid("loadData",currRefundDetails);
	
	//更新退款金额
	updateRefundPrice(currRefundDetails, $("#refundprice", $orderfm));
}

/**
 * 删除单个
 */
function delOne(rowIndex){
	var row = $('#refundDetailDataGrid').datagrid('getRows')[rowIndex];
	$.each(currOrderDetails, function(){
    	if(this.orderlineid == row.orderlineid){
    		this.aftersalestatus = 10;
    		$("#orderDetailDataGrid").datagrid("loadData",currOrderDetails);
    		return;
    	}
    });
	
	$("#refundDetailDataGrid").datagrid("deleteRow",rowIndex).datagrid("loadData", currRefundDetails);
	
	//更新退款金额
	updateRefundPrice(currRefundDetails, $("#refundprice", $orderfm));
}

/**
 * 更新退款金额
 */
function updateRefundPrice(refundDetails, $div){

	var refundprice = 0;
	$.each(refundDetails, function(){
		refundprice += this.totalprice;
    });
	$div.numberbox("setValue", refundprice);
} 

/**
 * 校验并组装保存的数据 
 */
function getSaveData(){
	
	var isValid0 = $("#refundDetailDataGrid").datagrid("isValid");		
	var isValid = $orderfm.form('validate');
	if (!isValid || !isValid0){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}			
	$("#refundDetailDataGrid").datagrid("acceptChanges");
	var baseInfo = formJson($orderfm);	
	baseInfo.isreturninvoices = $("#isreturninvoices", $orderfm).prop("checked")?1:0;

	//计算有效订单商品实收金额
	var newpayprice = 0 ;
	$.each(currOrderDetails, function(){
		if(this.aftersalestatus==10){
			newpayprice += Number(this.totalprice); 
		}		
	});
	$.each(currRefundDetails, function(){		
		newpayprice += (Number(this.oldtotalprice)-Number(this.totalprice)); 				
	});	
	baseInfo.newpayprice = newpayprice;
		
	var saveData = {
	     "params": {
			 "header": baseInfo,
			 "details": currRefundDetails
			},
	     "saveUrl": "${api}/ecaftersale/refund/create"
	}
	return saveData;
}

</script>


