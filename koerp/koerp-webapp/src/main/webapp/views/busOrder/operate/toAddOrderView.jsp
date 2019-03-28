<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<!-- 查询条件 -->
<%@include file="../../addordertoolbar.jsp"%>
	
<div class="fsun-wrap">
	<form id="orderfm">
		<span class="title" style="top: 35px;">单据基本信息</span>		
		<input id="shopId" name="shopId" hidden="true" />
		<input id="cashId" name="cashId" hidden="true" />
		<input id="cashName" name="cashName" hidden="true" />
		<input id="payType" name="payType" hidden="true" />
		<input id="isSettlemented" name="isSettlemented" hidden="true" />	
		<input id="originPrice" name="originPrice" hidden="true" />			
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">单据编号<span style="color:red;">*</span></th>
				<td>
					<input id="orderId" name="orderId" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">单据类型<span style="color:red;">*</span></th>
				<td>
					<input id="orderType" name="orderType" class="easyui-combobox" readOnly required/>								
				</td>										
				<th width="12%">所属店仓<span style="color:red;">*</span></th>
				<td>
					<input id="shopName" name="shopName" class="easyui-textbox" readOnly />								
				</td>
				<th width="12%">经办人</th>
				<td>
					<input id="salesman" name="carrierId" class="easyui-combogrid" />	
					<input hidden=true id="carrierName" name="carrierName" />								
				</td>								
	        </tr>
	        <tr>
	        	<th width="12%">客户名称<span style="color:red;">*</span></th>
				<td>
					<input id="allCustomer" name="buyerId" class="easyui-combogrid" required/>
					<input hidden=true id="buyerName" name="buyerName" />		
				</td>
	        	<th width="12%">订单金额</th>
				<td>
					<input id="orderPrice" name="orderPrice" class="easyui-numberbox" readOnly required
						data-options="min:0,precision:2,value:0, formatter: priceFormat"/>									
				</td>
	        	<th width="12%">商品优惠</th>
				<td>
					<input id="couponPrice" name="couponPrice" class="easyui-numberbox" readOnly required
						data-options="min:0,precision:2,value:0, formatter: priceFormat"/>									
				</td>
	        	<th width="12%">抹零金额</th>
				<td>
					<input id="toZeroPrice" name="toZeroPrice" class="easyui-numberbox" readOnly required
						data-options="min:0,precision:2,value:0, formatter: priceFormat"/>									
				</td>	        						        		        	
	        </tr>
	        <tr>       	
	        	<th width="12%">收货人</th>
				<td>
					<input id="receiveName" name="receiveName" class="easyui-textbox" />								
				</td>
	        	<th width="12%">联系方式</th>
				<td>
					<input id="mobile" name="mobile" class="easyui-textbox" />								
				</td>
				<th width="12%">收货地址</th>
				<td colspan="3">
					<input id="address" name="address" class="easyui-textbox" style="width:480px;"/>
				</td>	        						        		        	
	        </tr>        
	        <tr>        	
	        	<th width="12%">注意事项</th>
				<td colspan="7">
					<input id="sellerNotes" name="sellerNotes" data-options="multiline:true" 
						class="easyui-textbox" style="width:800px;height:50px;"/>
				</td>
	        </tr>	        
		</table>
	</form>			
</div>	
<div style="height: 275px; width: 100%;">
	<div id="detailskutoolbar" style="display:none;">
		<%@include file="./detailskutoolbar.jsp"%>
	</div>
	<table id="orderDetailDataGrid"></table>
</div>	

<div id="payAccountWin" class="easyui-window" title="结帐信息" iconCls="icon-money" closed="true" align="center" style="display:none;width:90%;height:85%;top:40px;" modal="true">  
   	 <div class="easyui-layout" fit=true  id='base_layout'>	
   	 	<div data-options="region:'north'" style="height:280px;">
   	 		<div id="payAccountToolbar" style="display:none;">
				<%@include file="./payAccountToolbar.jsp"%>
			</div>
   	 		<table id="payAccountDataGrid"></table>
   	 	</div> 		 	
   	 	<div data-options="region:'center'" >
   	 	    <form id="payAccountfm">	
				<table class="nb-formTable" style="width:100%;margin-top:2px;">
			        <tr>
			            <th width="12%">单据编号</th>
						<td>
							<input id="orderId" name="orderId" class="easyui-textbox" readOnly />
						</td>
						<th width="12%">单据类型</th>
						<td>
							<input id="orderType" name="orderType" class="easyui-combobox" readOnly />								
						</td>										
						<th width="12%">所属店仓</th>
						<td>
							<input id="shopName" name="shopName" class="easyui-textbox" readOnly />								
						</td>
						<th width="12%">经办人</th>
						<td>
							<input id="carrierName" name="carrierName" class="easyui-textbox" readOnly />								
						</td>								
			        </tr>
			        <tr>
			        	<th width="12%">客户名称</th>
						<td>
							<input id="buyerName" name="buyerName" class="easyui-textbox" readOnly/>
							<input id="buyerId" name="buyerId" hidden="true" />									
						</td>
			        	<th width="12%">订单金额</th>
						<td>
							<input id="orderPrice" name="orderPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat"/>									
						    <input id="balancePrice" hidden="true" />	
						</td>
			        	<th width="12%">商品优惠</th>
						<td>
							<input id="couponPrice" name="couponPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat"/>									
						</td>
			        	<th width="12%">抹零金额</th>
						<td>
							<input id="toZeroPrice" name="toZeroPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat"/>									
						</td>	        						        		        	
			        </tr>
			        <tr>
			        	<th width="12%">实收金额</th>
						<td>
							<input id="receptPrice" name="receptPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat"/>									
						</td>		        	
			        	<th width="12%">实付金额</th>
						<td>
							<input id="payPrice" name="payPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat"/>									
						</td>
						<th width="12%">找零金额</th>
						<td>
							<input id="dibPrice" name="dibPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat"/>									
						</td>
			        	<th width="12%">商家优惠</th>
						<td>
							<input id="discountPrice" name="discountPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat"/>									
						</td>		        		        						        		        	
			        </tr>        
				</table>
			</form> 		   	
   	 	</div> 	
   	 </div>	 
</div>
				

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<!-- datagrid操作公共方法 -->
<%@include file="./baseOrderView.jsp"%>

<!-- 查询条件 -->
<%@include file="../../busCommon/salesmanSelect.jsp"%> 
<%@include file="../../busCommon/allCustomerSelect.jsp"%> 

<script type="text/javascript">

var currCustomer = null;
var currDetailData = []; 
var currPayAccountData = [];
var currOrderDetailDataGrid = $("#orderDetailDataGrid");
var currPayAccountDataGrid = $("#payAccountDataGrid");
var $orderfm = $("#orderfm");   
var $payAccountfm = $("#payAccountfm"); 
var soColumns = [[
  	{field:'ck',checkbox:true},
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:140,align:"center"},
	//{field:"barCode",title:"条形码", width:140,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode); 
	}},
	//{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
	//	return formatter(value, window.parent.categoryCode); 
	//}},
	{field:'property',title:'规格',width:120,align:'center',sortable:true},
	{field:'isGift',title:'赠品信息',width:160,align:'center',sortable:true,formatter:function(value, row){
		var info = "--";
		if(value!=null && value){
			debugger
			var goodsType = row.goodsType; 
			if(goodsType!=null && goodsType!=''){
				info = formatter(goodsType, window.parent.busGoodsType) 
					+ "[数量:"+ intNumBaseFormat(row.giftCount)
					+",金额:"+ numBaseFormat(row.giftPrice) +"]";				
			}
		}
		return info; 
	}},
	/* {field:"isGift",title:"有无赠品", width:60,align:"center",formatter:function(value, row){
		return value!=null?(value?'有':"无"):""; 
	}},
	{field:"goodsType",title:"赠送类型", width:80,align:"center", formatter:function(value, row){
		return value!=''?formatter(value, window.parent.busGoodsType):"--"; 
	}},
	{field:"giftCount",title:"赠送数量", width:80,align:"center",formatter:intNumBaseFormat},
	{field:"giftPrice",title:"赠送金额", width:80,align:"center",formatter:numBaseFormat}, */
	{field:"originSalePrice",title:"销售单价", width:80,align:"center",formatter:numBaseFormat},
	{field:"salePrice",title:"实付单价", width:80,align:"center",
		/* styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    }, */
	    formatter:numBaseFormat /* ,
		editor:{
			type:'numberbox',
			options:{					
				min:0,
				precision:2,
				required: true
			}
		} */
	},
	{field:"qty",title:"数量", width:80,align:"center",
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
	{field:"costPrice",title:"成本价", width:80, hidden:true},
	{field:"totalPrice",title:"实付金额", width:80,align:"center",formatter:numBaseFormat},
	{field:"totalPartPrice",title:"分摊金额", width:80, hidden:true},
	{field:"couponPrice",title:"商品优惠", width:80,hidden:true},
	{field:"unit",title:"单位",width:50,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.unitCode); 
	}},
	{field:"stockOut",title:"操作",width:80,align:"center", 
		formatter: function(value, row, index){	
			if (row.sku=="合计:"){//这里是判断哪些行
                return '';  
            }	
			return commonAssemBottonHtml('delOne', index, '删除', 'icon-script_delete');													
		}
	}
]];

var payAccountColumns = [[
	{field:'ck',checkbox:true},             		
	{field:"payMode",title:"支付方式", width:80,align:"center",formatter:function(value, row){
		return formatter(value, window.parent.payMode); 
	}},            	         	
	{field:"receptPrice",title:"应收金额", width:80, align:"center",formatter:numBaseFormat},
	{field:"payPrice",title:"应付金额", width:80, align:"center",formatter:numBaseFormat},
	{field:"dibPrice",title:"找零金额", width:80, align:"center",formatter:numBaseFormat},
	{field:"discountAmount",title:"优惠金额", width:80, align:"center",formatter:numBaseFormat},  
	{field:"tradeNo",title:"支付流水号", width:150, align:"center"},  
	{field:"cardNo",title:"支付卡号", width:150, align:"center"},  
	{field:"operate",title:"操作",width:80, align:"center", 
		formatter: function(value, row, index){	
			if (row.payMode==900 || row.payMode=="合计:"){//这里是判断哪些行
                return '';  
            }	
			return commonAssemBottonHtml('delPayAccountOne', index, '删除', 'icon-script_delete');													
		}
	}
]];

$(function () { 
	
	$('#orderType', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.orderTypeData
   	});			
	
	$('#orderType', $payAccountfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.orderTypeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	initSalesmanGrid('');
	
	$('#salesman', $orderfm).combogrid({
		onSelect:function(index, data){			
			$('#carrierName', $orderfm).val(data.customer_name);      	
        }
    });
	
	initAllCustomerGrid('');
	
	$('#allCustomer', $orderfm).combogrid({
		onSelect:function(index, data){	
			var contacts = data.contacts;
			var customerName = data.customer_name;
			$("#receiveName", $orderfm).textbox("setValue", (contacts!=null&&contacts!='')?contacts:customerName);	
			$('#buyerName', $orderfm).val(data.customer_name);					
			$("#mobile", $orderfm).textbox("setValue", data.tel!=null?data.tel:"");			
			$("#address", $orderfm).textbox("setValue", data.address!=null?data.address:"");
			if(data.salesman!=null && data.salesman!=''){
				reloadSalesmanGrid(data.salesman);
			} 
			if(currCustomer!=null && currCustomer.customer_type!=data.customer_type){				
				if(currDetailData!=null){
					$.messager.alert("提示", "切换该用户将清空已有的商品", "info", function(){
						currDetailData = []; 
						currOrderDetailDataGrid.datagrid("loadData", currDetailData);
					});	
				}						
			}
			currCustomer = data;			
        }
    });

	$.ajax({
		type : "GET",
		url : "${api}/bus/order/getInitData",
		data:{
			"orderId":"",
			"orderType": "${orderType}"
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var busOrderDto = result.entry;
			
			/***************************              基本信息初始化                        ************************/			
			var header = busOrderDto.header;
			if(header!=null){
				$orderfm.form("load", header);	
			}
			
			var details = busOrderDto.details;	
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
	skuDto.skuId = rowData.skuId;
	skuDto.parentSkuId = rowData.parentSkuId;
	skuDto.parentSku = rowData.parentSku;
	skuDto.property = rowData.property;
	skuDto.goodsType = ""; 
	skuDto.isGift = false; 
	skuDto.giftCount = 0; 
	skuDto.giftPrice = 0; 
	skuDto.qty = rowData.qty; 
	skuDto.unit = rowData.unit;
	skuDto.costPrice = rowData.costPrice;
	skuDto.marketPrice = rowData.marketPrice;
	skuDto.originSalePrice = rowData.originSalePrice;
	skuDto.salePrice = rowData.salePrice;
	skuDto.totalPrice = skuDto.salePrice * (skuDto.qty-skuDto.giftCount);
	skuDto.couponPrice = skuDto.giftPrice + (skuDto.qty-skuDto.giftCount)*(skuDto.originSalePrice-skuDto.salePrice);
	skuDto.totalPartPrice = skuDto.totalPrice;
		
	skuDto.barCode = rowData.barCode;  
	skuDto.categoryCode = rowData.categoryCode;  
	skuDto.categoryName = formatter(rowData.categoryCode, window.parent.categoryCode); 
	skuDto.brandCode = rowData.brandCode;
	skuDto.brandName = formatter(rowData.brandCode, window.parent.brandCode); 
	skuDto.memo = "";      	
	return skuDto;
}


</script>


