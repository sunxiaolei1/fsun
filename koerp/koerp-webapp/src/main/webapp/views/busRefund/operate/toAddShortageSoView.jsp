<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true" >
	<!-- 查询条件 -->
	<%@include file="../../addtoolbar.jsp"%>
	
	<div data-options="region:'center',split:true, border:false" >
		<div class="easyui-layout" data-options="fit:true" >
			<div data-options="region:'north',split:true, border:false" style="height:140px;overflow:hidden;">
				<div class="fsun-wrap">
					<form id="orderfm">
						<span class="title" style="top: 1px;">基本信息</span>		
						<input id="iId" name="iId" hidden="true" />	
						<input id="fromShopId" name="fromShopId" hidden="true" />	
						<input id="orderPrice" name="orderPrice" hidden="true" />	
						<table class="nb-formTable">
					        <tr>
					            <th>单据编号<span style="color:red;">*</span></th>
								<td>
									<input id="orderNo" name="orderNo" class="easyui-textbox" readOnly />
								</td>
								<th>单据类型<span style="color:red;">*</span></th>
								<td>
									<input id="orderType" name="orderType" class="easyui-combobox" readOnly required/>								
								</td>					
								<th>出库店仓<span style="color:red;">*</span></th>
								<td>
									<input id="fromShopName" name="fromShopName" class="easyui-textbox" readOnly />								
								</td>								
					        </tr>		               		
					        <tr>
					        	<th>备注</th>
								<td colspan="5">
									<input id="memo" name="memo"  data-options="multiline:true" 
										class="easyui-textbox" style="width:70%;height:50px;"/>
								</td>	        	
					        </tr>
						</table>
					</form>			
				</div>
			</div>
			
			<div data-options="region:'center',split:true, border:false" >
				<div id="detailskutoolbar" style="display:none;">
					<%@include file="./detailskutoolbar.jsp"%>
				</div>
				<table id="orderDetailDataGrid"></table>
			</div>
		</div>
	</div>
</div>				

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<!-- datagrid操作公共方法 -->
<%@include file="./baseSoView.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currOrderDetailDataGrid = $("#orderDetailDataGrid");
var $orderfm = $("#orderfm");   
var soColumns = [[
	{field:'ck',checkbox:true},
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:200,align:"center"},		
	{field:"productType",title:"类型", width:80,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.productType); 
	}},
	{field:"categoryCode",title:"分类", width:100,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.categoryCode); 
	}},
	{field:"barCode",title:"条形码", width:110,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode); 
	}},
	{field:'property',title:'规格',width:100,align:'center',sortable:true},
	//{field:"costPrice",title:"成本价", width:80,align:"center",formatter:numBaseFormat},
	{field:"price",title:"单价", width:80,align:"center",formatter:numBaseFormat},
	{field:"shippedQty",title:"数量", width:80,align:"center",
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
	{field:"stockOut",title:"操作",width:100,align:"center", 
		formatter: function(value, row, index){						
			return commonAssemBottonHtml('delOne', index, '删除', 'icon-script_delete');													
		}
	}
]];


$(function () { 
	
	$('#orderType', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docOrderTypeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	$.ajax({
		type : "GET",
		url : "${api}/bus/refund/getInitData",
		data:{
			"orderNo":"",
			"orderType": "${orderType}"
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



/******************************    供选择商品的子页面使用      ********************************/



/**
 * 初始化新增商品
 */
function initAddSku(rowData){
	var skuDto = {};		
	skuDto.goodsName = rowData.goodsName;
	skuDto.sku = rowData.sku; 
	skuDto.property = rowData.property;
	skuDto.shippedQty = rowData.qty; 
	skuDto.orderedQty = rowData.qty; 
	skuDto.unit = rowData.unit;
	skuDto.costPrice = rowData.costPrice;
	skuDto.price = rowData.salePrice;
	skuDto.totalPrice = CalcAmount.multiply(rowData.salePrice, skuDto.shippedQty, 2);
		
	skuDto.barCode = rowData.barCode;  
	skuDto.productType = rowData.productType;  
	skuDto.categoryCode = rowData.categoryCode; 
	skuDto.categoryName = formatter(rowData.categoryCode, window.parent.categoryCode); 
	skuDto.brandCode = rowData.brandCode;
	skuDto.brandName = formatter(rowData.brandCode, window.parent.brandCode); 
	skuDto.memo = "";      	
	return skuDto;
}

//判别该订单是否展开过
function hasExpand(row){	
	for(var i=0; i<expandedBasSkus.length; i++){
		if(expandedBasSkus[i].skuId == row.skuId){					
			return true;
		}
	}
	expandedBasSkus.push(row);
	return false;
}


</script>

