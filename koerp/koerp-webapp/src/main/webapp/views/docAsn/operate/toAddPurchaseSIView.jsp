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
		<span class="title" style="top: 35px;">基本信息</span>		
		<input id="iId" name="iId" hidden="true" />	
		<input id="toShopId" name="toShopId" hidden="true" />	
		<input id="orderPrice" name="orderPrice" hidden="true" />	
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">单据编号<span style="color:red;">*</span></th>
				<td>
					<input id="asnNo" name="asnNo" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">单据类型<span style="color:red;">*</span></th>
				<td>
					<input id="asnType" name="asnType" class="easyui-combobox" required readOnly />								
				</td>
				<th width="12%">入库店仓<span style="color:red;">*</span></th>
				<td colspan="3" >
					<input id="toShopName" name="toShopName" class="easyui-textbox" 
					  style="width:400px;" readOnly />								
				</td>																
	        </tr>	
	        <tr>
	        	<th width="12%">外部单号</th>
				<td>
					<input id="extOrderNo" name="extOrderNo" class="easyui-textbox" />
				</td>	            
				<th width="12%">供应商</th>
				<td>
					<input id="supplierId" name="supplierId" class="easyui-combogrid" />
					<input hidden=true id="supplierName" name="supplierName" />									
				</td>					
				<th width="12%">联系人</th>
				<td>
					<input id="supplierContact" name="supplierContact" class="easyui-textbox" />								
				</td>
	        	<th width="12%">联系方式</th>
				<td>
					<input id="supplierTel" name="supplierTel" class="easyui-textbox" />								
				</td>	        									
	        </tr>
	        <tr>
				<th width="12%">发货地址</th>
				<td colspan="3">
					<input id="supplierAddress" name="supplierAddress" class="easyui-textbox" 
						data-options="multiline:true"  style="width:400px;height:46px;"/>
				</td>
	        	<th width="12%">备注</th>
				<td colspan="3">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:400px;height:46px;"/>
				</td>	        	
	        </tr>
		</table>
	</form>			
</div>	

<div style="height: 320px; width: 100%;">
	<div id="detailskutoolbar" style="display:none;">
		<%@include file="./detailskutoolbar.jsp"%>
	</div>
	<table id="orderDetailDataGrid"></table>
</div>					

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<!-- datagrid操作公共方法 -->
<%@include file="./baseSIView.jsp"%>

<%@include file="../../busCommon/supplierSelect.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currOrderDetailDataGrid  = $("#orderDetailDataGrid");
var $orderfm = $("#orderfm");
var siColumns = [[
	{field:'ck',checkbox:true},
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:140,align:"center"},
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
	{field:"receiveQty",title:"数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat,
		editor:{
			type:'numberbox',
			options:{					
				min:1,
				precision:0,
				required: true
			}
		}
	},
	{field:"unit",title:"单位",width:70,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.unitCode); 
	}},
	{field:"stockIn",title:"操作",width:80,align:"center", 
		formatter: function(value, row, index){						
			return commonAssemBottonHtml('delOne', index, '删除', 'icon-script_delete');													
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
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	initSupplierGrid('');
	
	$('#supplierId', $orderfm).combogrid({
		onSelect:function(index, data){			
			$('#supplierName', $orderfm).val(data.customer_name);
			$("#supplierContact", $orderfm).textbox("setValue", data.contacts!=null?data.contacts:"");			
			$("#supplierTel", $orderfm).textbox("setValue", data.tel!=null?data.tel:"");			
			$("#supplierAddress", $orderfm).textbox("setValue", data.address!=null?data.address:"");			
        }
    });
	
	$.ajax({
		type : "GET",
		url : "${api}/doc/asn/getInitData",
		data:{
			"asnNo":"",
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


/******************************    供选择商品的子页面使用      ********************************/



/**
 * 初始化新增商品
 */
function initAddSku(rowData){
	var skuDto = {};		
	skuDto.goodsName = rowData.goodsName;
	skuDto.sku = rowData.sku; 
	skuDto.property = rowData.property;
	skuDto.receiveQty = rowData.qty; 
	skuDto.damagedQty = 0; 
	skuDto.rejectedQty = 0; 
	skuDto.unit = rowData.unit;
	skuDto.costPrice = rowData.costPrice;
	skuDto.price = rowData.salePrice;
	skuDto.totalPrice = CalcAmount.multiply(rowData.salePrice, skuDto.receiveQty, 2);
	
	skuDto.barCode = rowData.barCode;  
	skuDto.categoryCode = rowData.categoryCode;  
	skuDto.categoryName = formatter(rowData.categoryCode, window.parent.categoryCode); 
	skuDto.brandCode = rowData.brandCode;
	skuDto.brandName = formatter(rowData.brandCode, window.parent.brandCode); 
	skuDto.memo = "";      	
	return skuDto;
}


</script>