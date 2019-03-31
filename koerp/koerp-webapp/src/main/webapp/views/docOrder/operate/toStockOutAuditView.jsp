<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<!-- 查询条件 -->
<%@include file="../../addtoolbar.jsp"%>
	
<div class="fsun-wrap">
	<form id="orderfm">
		<span class="title" style="top: 35px;">单据基本信息</span>		
		<input id="iId" name="iId" hidden="true" />	
		<input id="poNo" name="poNo" hidden="true" />
		<input id="fromShopId" name="fromShopId" hidden="true" />	
		<input id="toShopId" name="toShopId" hidden="true" />
		<input id="orderPrice" name="orderPrice" hidden="true" />	
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">单据编号<span style="color:red;">*</span></th>
				<td>
					<input id="orderNo" name="orderNo" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">单据类型<span style="color:red;">*</span></th>
				<td>
					<input id="orderType" name="orderType" class="easyui-combobox" readOnly required/>								
				</td>	
				<th width="12%">审核人<span style="color:red;">*</span></th>
				<td>
					<input id="iName" name="iName" class="easyui-textbox" readOnly required />								
				</td>
				<th width="12%">经办人</th>
				<td>
					<input id="salesman" name="carrierId" class="easyui-combogrid" />	
					<input hidden=true id="carrierName" name="carrierName" />								
				</td>													
	        </tr>
	        <tr>
	        	<th width="12%">出库店仓<span style="color:red;">*</span></th>
				<td colspan="3">
					<input id="fromShopName" name="fromShopName" class="easyui-textbox" style="width:400px;" readOnly />								
				</td>
				<th width="16%">发货时间<span style="color:red;">*</span></th>
				<td>
					<input id="deliveryTime" name="deliveryTime" class="easyui-datebox" editable="false" required/>								
				</td>	
				<th width="16%">预期收货时间<span style="color:red;">*</span></th>
				<td>
					<input id="expectedTime" name="expectedTime" class="easyui-datetimebox" editable="false" required/>								
				</td>
			</tr>	
	        <tr>
	        	<th width="12%">收货店仓<span style="color:red;">*</span></th>
				<td colspan="3">
					<input id="toShopName" name="toShopName" class="easyui-textbox" style="width:400px;" readOnly />								
				</td>
				<th width="12%">联系方式</th>
				<td>
					<input id="mobile" name="mobile" class="easyui-textbox" readOnly />								
				</td>
	        	<th width="12%">联系人</th>
				<td>
					<input id="contacts" name="contacts" class="easyui-textbox" />								
				</td>							        	
	        </tr>		               			        	               		
	        <tr>
	        	<th width="12%">收货地址</th>
				<td colspan="3">
					<input id="receiveAddress" name="receiveAddress" class="easyui-textbox"
						data-options="multiline:true"  style="width:400px;height:50px;"/>
				</td>
	        	<th width="12%">备注</th>
				<td colspan="3">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:400px;height:50px;"/>
				</td>	        	
	        </tr>
		</table>
	</form>			
</div>	
<div style="height: 280px; width: 100%;">
	<div id="detailskutoolbar" style="display:none;">
		<%@include file="./detailskutoolbar.jsp"%>
	</div>
	<table id="orderDetailDataGrid"></table>
</div>					

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<!-- datagrid操作公共方法 -->
<%@include file="./baseSoView.jsp"%>

<!-- 查询条件 -->
<%@include file="../../busCommon/salesmanSelect.jsp"%> 

<script type="text/javascript">

var currDetailData = []; 
var currOrderDetailDataGrid = $("#orderDetailDataGrid");
var $orderfm = $("#orderfm");   
var soColumns = [[
	//{field:'ck',checkbox:true},
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:240,align:"center"},
	{field:"barCode",title:"条形码", width:140,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode); 
	}},
	{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.categoryCode); 
	}},
	{field:'property',title:'规格',width:120,align:'center',sortable:true},
	//{field:"costPrice",title:"成本价", width:80,align:"center",formatter:numBaseFormat},
	{field:"price",title:"单价", width:80,align:"center",formatter:numBaseFormat},
	{field:"orderedQty",title:"要货数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"shippedQty",title:"发货数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
			var style='font-weight:bold;color:green;';
			if(rowData.orderedQty!=value){
				style='font-weight:bold;color:red;';
			}
	    	return style;
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
	{field:"unit",title:"单位",width:70,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.unitCode); 
	}},
	{field:"stockOut",title:"操作",width:80,align:"center", 
		formatter: function(value, row, index){						
			return commonAssemBottonHtml('delOne', index, '删除', 'icon-script_delete');													
		}
	}
]];


$(function () { 
	
	$("#addGoodsBtn").css("visibility", "hidden");
	
	$('#orderType', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docOrderTypeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	initSalesmanGrid('');
	
	$('#salesman', $orderfm).combogrid({
		onSelect:function(index, data){			
			$('#carrierName', $orderfm).val(data.customer_name);      	
        }
    });
	
	$.ajax({
		type : "GET",
		url : "${api}/doc/order/getInitData",
		data:{
			"orderNo":"",
			"orderType": "${orderType}",
			"toShopId": "${param.toShopId}",
			"poDetailIds": "${param.poDetailIds}"
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docOrderDto = result.entry;
			
			/***************************              基本信息初始化                        ************************/			
			var header = docOrderDto.header;
			if(header!=null){
				$orderfm.form("load", header);	
			}			
			var details = docOrderDto.details;	
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