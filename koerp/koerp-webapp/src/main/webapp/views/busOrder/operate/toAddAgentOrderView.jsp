<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true" >
	<!-- 查询条件 -->
	<%@include file="../../addordertoolbar.jsp"%>
	
	<div data-options="region:'center',split:true, border:false" >
		<div class="easyui-layout" data-options="fit:true" >
			<div data-options="region:'north',split:true, border:false" style="height:306px;overflow:hidden;">
				<div class="fsun-wrap">
					<form id="orderfm">
						<span class="title" style="top: 1px;">基本信息(单号:<span id="orderId0"></span>)</span>	
						<input id="shopId" name="shopId" hidden="true" />
						<input id="buyerId" name="buyerId" hidden="true" />
						<input id="buyerName" name="buyerName" hidden="true" />						
						<input hidden=true id="deliveryShopName" name="deliveryShopName" />	
						<input id="cashId" name="cashId" hidden="true" />
						<input id="cashName" name="cashName" hidden="true" />
						<input id="payType" name="payType" hidden="true" />
						<input id="isSettlemented" name="isSettlemented" hidden="true" />	
						<input id="originPrice" name="originPrice" hidden="true" />	
						<input id="takeStatus" name="takeStatus" hidden="true" />
						<input id="orderId" name="orderId" hidden="true" />				
						<table class="nb-formTable" style="width:100%;">
					        <tr>
								<th>单据类型</th>
								<td>
									<input id="orderType" name="orderType" class="easyui-combobox" readOnly 
										required style="width:95%;"/>								
								</td>										
								<th>所属店仓</th>
								<td>
									<input id="shopName" name="shopName" class="easyui-textbox" readOnly style="width:95%;"/>								
								</td>
								<th width="12%">外部单号</th>
								<td>
									<input id="extorderid" name="extorderid" class="easyui-textbox" style="width:95%;" />
								</td>								
					        </tr>
					        <tr>					        	
					        	<th>订单金额</th>
								<td>
									<input id="orderPrice" name="orderPrice" class="easyui-numberbox" readOnly required
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:95%;"/>								
								</td>
					        	<th>商品优惠</th>
								<td>
									<input id="couponPrice" name="couponPrice" class="easyui-numberbox" readOnly required
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:95%;"/>									
								</td>
					        	<th>抹零金额</th>
								<td>
									<input id="toZeroPrice" name="toZeroPrice" class="easyui-numberbox" readOnly required
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:95%;"/>									
								</td>	        						        		        	
					        </tr>
					        <tr>						        	
								<!-- <th>客户名称</th>
								<td>
									<input id="allCustomer" name="buyerId" class="easyui-combogrid" required style="width:95%;"/>
									<input hidden=true id="buyerName" name="buyerName" />		
								</td> -->				        	
					        	<th>订单运费</th>
								<td>
									<input id="shipPrice" name="shipPrice" class="easyui-numberbox" required
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:95%;"/>								
								</td>
					        	<th>打包费</th>
								<td>
									<input id="packagePrice" name="packagePrice" class="easyui-numberbox" required
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:95%;"/>									
								</td>	        						        		        	
					        </tr>
					        <tr>
					        	<th>发货店仓</th>
								<td>
									<input id="shopCombo" name="deliveryShopId" class="easyui-combogrid" required style="width:95%;"/>																
								</td>
						        <th width="12%">发票抬头</th>
								<td colspan="3">
									<input id="invoicestop" name="invoicestop" class="easyui-textbox" style="width: 50%;" />	
									<label for="isInvoice" >
										<input type="checkbox" id="isInvoice" name="isInvoice" style="zoom:130%;vertical-align:middle;" />
										开具发票
									</label>							
									&nbsp;&nbsp;
									<label for="isTrave" >
										<input type="checkbox" id="isTrave" name="isTrave" style="zoom:130%;vertical-align:middle;" />
										货票同行
									</label>					
								</td>								
					        </tr>	
					        <tr>
					        	<th>发票类型</th>
								<td>
									<input id="invoiceType" name="invoiceType" class="easyui-combobox" required style="width:95%;"/>								
								</td>
						        <th width="12%">发票内容</th>
								<td colspan="3">
									<input id="invoiceContent" name="invoiceContent" class="easyui-textbox" style="width:99%;" />															
								</td>								
					        </tr>					        
					        <tr> 					        	  							 
								<th>配送类型</th>
								<td>
									<input id="logisticsType" name="logisticsType" class="easyui-combobox" required style="width:95%;"/>								
								</td>   	
					        	<th>收货人</th>
								<td>
									<input id="receiveName" name="receiveName" class="easyui-textbox" style="width:95%;"/>								
								</td>
					        	<th>联系方式</th>
								<td>
									<input id="mobile" name="mobile" class="easyui-textbox" style="width:95%;"/>							
								</td>								        						        		        	
					        </tr> 
					        <tr> 
					        	<th>省份</th>
								<td>
									<input id="province" name="province" class="easyui-textbox" style="width:95%;"/>		
								</td>      	
					        	<th>地市</th>
								<td>
									<input id="city" name="city" class="easyui-textbox" style="width:95%;"/>								
								</td>
					        	<th>区县</th>
								<td>
									<input id="district" name="district" class="easyui-textbox" style="width:95%;"/>							
								</td>								        						        		        	
					        </tr>      
					        <tr> 
					        	<th>街道(地址)</th>
								<td>
									<input id="address" name="address" class="easyui-textbox" data-options="multiline:true" 
										style="width:95%;height:46px;"/>
								</td>       	
					        	<th>注意事项</th>
								<td colspan="3">
									<input id="sellerNotes" name="sellerNotes" data-options="multiline:true" 
										class="easyui-textbox" style="width:70%;height:46px;"/>
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

<div id="payAccountWin" class="easyui-window" title="结帐信息" iconCls="icon-money" closed="true" align="center" 
	style="display:none;width:95%;height:400px;border: 0px solid #ccc;" modal="true">  
   	 <div class="easyui-layout" id='base_layout' style="height:100%;" >
   	 	<div data-options="region:'north',border:false" style="height:230px;" >
   	 		<div id="payAccountToolbar" style="display:none;">
				<%@include file="./payAccountToolbar.jsp"%>
			</div>
   	 		<table id="payAccountDataGrid"></table>
   	 	</div>	 	
   	 	<div data-options="region:'center'" style="overflow-y:hidden;"  >
   	 	    <form id="payAccountfm">	
				<table class="nb-formTable">
			        <tr>
			            <th>单据编号</th>
						<td>
							<input id="orderId" name="orderId" class="easyui-textbox" readOnly />
						</td>
						<th>单据类型</th>
						<td>
							<input id="orderType" name="orderType" class="easyui-combobox" readOnly />								
						</td>										
						<th>所属店仓</th>
						<td>
							<input id="shopName" name="shopName" class="easyui-textbox" readOnly />							
						</td>													
			        </tr>
			        <tr>
			        	<th>订单金额</th>
						<td>
							<input id="orderPrice" name="orderPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />								
						    <input id="balancePrice" hidden="true" />	
						</td>
			        	<th>客户名称</th>
						<td>
							<input id="buyerName" name="buyerName" class="easyui-textbox" readOnly />
							<input id="buyerId" name="buyerId" hidden="true" />									
						</td>
			        	<th>经办人</th>
						<td>
							<input id="carrierName" name="carrierName" class="easyui-textbox" readOnly />								
						</td>		        			        		        						        		        	
			        </tr>
			        <tr>
			        	<th>实收金额</th>
						<td>
							<input id="receptPrice" name="receptPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />									
						</td>		        	
			        	<th>实付金额</th>
						<td>
							<input id="payPrice" name="payPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />									
						</td>
						<th>找零金额</th>
						<td>
							<input id="dibPrice" name="dibPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />									
						</td>		        			        		        						        		        	
			        </tr> 
			        <tr>
			        	<th>商家优惠</th>
						<td>
							<input id="discountPrice" name="discountPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />									
						</td>		        	
			        	<th>商品优惠</th>
						<td>
							<input id="couponPrice" name="couponPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />									
						</td>
			        	<th>抹零金额</th>
						<td>
							<input id="toZeroPrice" name="toZeroPrice" class="easyui-numberbox" readOnly
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />									
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
<%@include file="../../busCommon/fromToShopSelect.jsp"%>  

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
	{field:"stockOut",title:"操作",width:100,align:"center", 
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
	
	$('#invoiceType', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.invoiceTypeData
   	});
	
	$('#logisticsType', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.logisticsTypeData
   	});
	
	$('#orderType', $payAccountfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.orderTypeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
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
				$("#orderId0", $orderfm).text(header.orderId);
				initShopComboGrid('', '', header.shopId, $orderfm);
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
	//skuDto.totalPrice = skuDto.salePrice * (skuDto.qty-skuDto.giftCount);
	//skuDto.couponPrice = skuDto.giftPrice + (skuDto.qty-skuDto.giftCount)*(skuDto.originSalePrice-skuDto.salePrice);	
	//实付金额
	var receptQty = CalcAmount.subtract(skuDto.qty, skuDto.giftCount);
	var couponPrice = CalcAmount.subtract(skuDto.originSalePrice, skuDto.salePrice);
	skuDto.totalPrice = CalcAmount.multiply(skuDto.salePrice, receptQty, 2);
	//商品优惠
	var tempPrice = CalcAmount.multiply(receptQty, couponPrice);
	skuDto.couponPrice = CalcAmount.add(skuDto.giftPrice, tempPrice, 2);  	
	
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

