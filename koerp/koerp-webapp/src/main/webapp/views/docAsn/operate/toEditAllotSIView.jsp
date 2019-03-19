<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<!-- 查询条件 -->
<%@include file="../../busCommon/commonOrderViewToolbar.jsp"%>
	
<div class="fsun-wrap">
	<form id="orderfm">
		<span class="title" style="top: 35px;">单据基本信息</span>		
		<input id="iId" name="iId" hidden="true" />	
		<input id="toShopId" name="toShopId" hidden="true" />	
		<input id="fromShopId" name="fromShopId" hidden="true" />	
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">单据编号</th>
				<td>
					<input id="asnNo" name="asnNo" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">出库单号</th>
				<td>
					<input id="orderNo" name="orderNo" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">申请单号</th>
				<td>
					<input id="poNo" name="poNo" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">单据类型</th>
				<td>
					<input id="asnType" name="asnType" class="easyui-combobox" readOnly />								
				</td>																				
	        </tr>	
	        <tr>	
	        	<th width="12%">入库店仓</th>
				<td colspan="3" >
					<input id="toShopName" name="toShopName" 
						class="easyui-textbox" style="width:400px;" readOnly />								
				</td>	        		        		
				<th width="12%">经办人</th>
				<td>
					<input id="carrierName" name="carrierName" class="easyui-textbox" readOnly />
				</td>
	        	<th width="12%">预期收货时间</th>
				<td>
					<input id="expectedTime" name="expectedTime" class="easyui-datetimebox" disabled />
				</td>				        		            													        						        									
	        </tr>
	        <tr>		        	
				<th width="12%">出库店仓</th>
				<td colspan="3" >
					<input id="fromShopName" name="fromShopName" 
						class="easyui-textbox" style="width:400px;" readOnly />								
				</td>
				<th width="12%">联系方式</th>
				<td>
					<input id="mobile" name="mobile" class="easyui-textbox" readOnly />								
				</td>	
				<th width="12%">出库时间</th>
				<td>
					<input id="deliveryTime" name="deliveryTime" class="easyui-datebox" disabled />								
				</td>	        			        		            													        						        									
	        </tr>
	        <tr>
				<th width="12%">发货地址</th>
				<td colspan="3">
					<input id="address" name="address" 
						class="easyui-textbox" style="width:400px;" readOnly/>
				</td>
	        	<th width="12%">签收人</th>
				<td>
					<input id="checkName" name="checkName" class="easyui-textbox" readOnly />
					<input hidden="true" id="checkUserId" name="checkUserId" />								
				</td>	
				<th width="12%">签收状态</th>
				<td>
					<input id="checkStatus" name="checkStatus" class="easyui-combobox" readOnly />								
				</td>	        	
	        </tr>
	        <tr>
	        	<th width="12%">备注</th>
				<td colspan="7">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:800px;height:46px;"/>
				</td>	        	
	        </tr>
		</table>
	</form>			
</div>	

<div style="height: 250px; width: 100%;">
	<div id="detailskutoolbar" style="display:none;">
		<%@include file="./detailskutoolbar.jsp"%>
	</div>
	<table id="orderDetailDataGrid"></table>
</div>					

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<!-- datagrid操作公共方法 -->
<%@include file="./baseSIView.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currOrderDetailDataGrid  = $("#orderDetailDataGrid");
var $orderfm = $("#orderfm");
var siColumns = [[
	{field:'ck',checkbox:true},
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:200,align:"center"},
	{field:"barCode",title:"条形码", width:140,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode); 
	}},
	{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.categoryCode); 
	}},
	{field:'property',title:'规格',width:120,align:'center',sortable:true},
	{field:"unit",title:"单位",width:70,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.unitCode); 
	}},
	{field:"price",title:"单价", width:80,align:"center",formatter:numBaseFormat},
	{field:"orderQty",title:"申请数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"expectedQty",title:"发货数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"receiveQty",title:"签收数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat,
		editor:{
			type:'numberbox',
			options:{					
				min:0,
				precision:0,
				required: true
			}
		}
	},
	{field:"damagedQty",title:"破损数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:red;';
	    },
	    formatter:intNumBaseFormat,
		editor:{
			type:'numberbox',
			options:{					
				min:0,
				precision:0,
				required: true
			}
		}
	}
]];

$(function () { 
	
	$('#asnType', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docAsnTypeData
   	});	
	
	$('#checkStatus', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docAsnCheckStatusData
   	});
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	$.ajax({
		type : "GET",
		url : "${api}/doc/asn/getInitData",
		data:{
			"asnNo":"${asnNo}",
			"asnType": "${asnType}"
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docAsnDto = result.entry;
			
			/***************************              基本信息初始化                        ************************/			
			var header = docAsnDto.header;
			if(header!=null){
				$orderfm.form("load", header);	
			}
			
			var details = docAsnDto.details;	
			if(details!=null && details.length>0){
				currDetailData = details;
				skuListReLoad();
			}		
	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});	
     
});

</script>