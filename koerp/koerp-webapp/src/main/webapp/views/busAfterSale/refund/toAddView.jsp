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
	left: 5px;
	line-height: 2em;
	font-size: 12px;
    font-family: Tahoma,Verdana,微软雅黑,新宋体;
	padding: 0 1em;
	background-color: #fff;
}

.skutitle{
	margin: 0px 18px 0px 6px;
    padding-top: 0px;
    padding-bottom: 0px;
    height: 26px;
    line-height: 26px;
    width: 182px;
    font-size: 12px;
    font-weight: bold;
    color: #416AA3;
}


</style> 

<!-- 查询条件 -->
<%@include file="../../addrefundtoolbar.jsp"%>

<span style="float:right;margin-top:2px;margin-bottom:2px;">	
	<input id="skuSearcher" class="easyui-searchbox" style="width:350px">
</span>
<div style="height:24px;margin-left:10px;">
	<b class="skutitle" >
		原订单商品[单号:${orderId}]
	</b>
</div>	
<div style="height: 145px;width: 100%;">      		
	<table id="orderDetailDataGrid"></table>
</div>	

<div class="fsun-wrap">
	<span class="title" style="top: 207px;">退货退款信息</span>	
	<div style="height: 155px;width: 100%;">
		<table id="refundDetailDataGrid"></table>
	</div>
	<form id="orderfm">
		<input id="orderId" name="orderId" hidden="true" />
		<input id="extOrderId" name="extOrderId" hidden="true" />		
		<input id="shopId" name="shopId" hidden="true" />
		<input id="buyerId" name="buyerId" hidden="true" />
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	        	<th width="12%">原订单金额</th>
				<td>
					<input id="orderPrice" class="easyui-numberbox" disabled 
						data-options="min:0,precision:2, formatter: priceFormat" />
				</td>
				<th width="12%">原实收金额</th>
				<td>
					<input id="receptPrice" class="easyui-numberbox" disabled 
						data-options="min:0,precision:2, formatter: priceFormat" />
				</td>
	        	<th width="12%">客户名称</th>
				<td>
					<input id="buyerName" name="buyerName" class="easyui-textbox" readOnly />								
				</td>				
				<th width="12%">所属店仓</th>
				<td>
					<input id="shopName" name="shopName" class="easyui-textbox" readOnly />								
				</td>            												
	        </tr>	
	        <tr>	
       			<th width="12%">退款金额</th>
				<td>
					<input id="refundPrice" name="refundPrice" class="easyui-numberbox" 
						data-options="min:0,precision:2,value:0, formatter: priceFormat" />
				</td>									        			           
				<th width="12%">支付方式<span style="color:red;">*</span></th>
				<td>
					<input id="payMode" name="payMode" class="easyui-combobox" editable="false" required />								
				</td>
				<th width="12%">支付流水号</th>
				<td>
					<input id="tradeNo" name="tradeNo" class="easyui-textbox" />								
				</td>
				<th width="12%">支付卡号</th>
				<td>
					<input id="cardNo" name="cardNo" class="easyui-textbox" />								
				</td>
	        </tr>	       		        		        
	        <tr>	
	        	<th width="12%">退货原因<span style="color:red;">*</span></th>
				<td>
					<input id="refundReason" name="refundReason" class="easyui-combobox" editable="false" required />								
				</td>        			        	
	            <th width="12%">备注</th>
	        	<td colspan="5">
					<input id="memo" name="memo" data-options="multiline:true"
						class="easyui-textbox" style="width:600px;height:40px;" />
				</td>		        			           
	        </tr>
		</table>
	</form>	
</div>	
						


<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currOrderDetails = []; 
var currRefundDetails = [];
var currOrderDetailDataGrid = $("#orderDetailDataGrid");
var currRefundDetailDataGrid = $("#refundDetailDataGrid");
var $orderfm = $("#orderfm");   
var soColumns = [[
	{field:'lineNo',hidden:true},
	{field:"sku",title:"SKU", width:60,align:"center"},
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
	{field:"giftCount",title:"赠送数量", width:70,align:"center",formatter:intNumBaseFormat},
	{field:"giftPrice",title:"赠送金额", width:70,align:"center",formatter:numBaseFormat}, */
	{field:"originSalePrice",title:"销售单价", width:70,align:"center",formatter:numBaseFormat},
	{field:"salePrice",title:"实付单价", width:70,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:numBaseFormat
	},
	{field:"qty",title:"数量", width:70,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"costPrice",title:"成本价", width:80, hidden:true},
	{field:"totalPrice",title:"实付金额", width:80,align:"center",formatter:numBaseFormat},
	{field:"totalPartPrice",title:"分摊金额", width:80, hidden:true},
	{field:"couponPrice",title:"商品优惠", width:80,hidden:true},
	{field:"unit",title:"单位",width:50,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.unitCode); 
	}},
	{field:"skuAftersaleStatus",title:"状态",width:70,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.skuAftersaleStatus); 
	}},
	{field:"operate",title:"操作",width:80,align:"center", formatter: function(value, row, index){
		if(row.skuAftersaleStatus==10){
			return commonAssemBottonHtml('refundOne', index, '退货', 'icon-cart_error');	
		}
		return "";								
	}}
]];

var refundColumns = [[
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:140,align:"center"},
	//{field:"barCode",title:"条形码", width:140,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode); 
	}},
	{field:'property',title:'规格',width:120,align:'center',sortable:true},
	{field:"originQty",title:"下单数量",width:60,align:"center",formatter:numBaseFormat},
	{field:"originTotalPrice",title:"实付总价",width:60,align:"center",formatter:numBaseFormat},			
	{field:"qty",title:"退货数量",width:60,align:"center",
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
		}
	},	
	{field:"salePrice",title:"退货单价",width:60,align:"center",
		styler: function(value, rowData, rowIndex){
	      	return 'font-weight:bold;color:green;';
	    },
      	formatter:numBaseFormat,
		editor:{
			type:'numberbox',
			options:{
				required: true,
				min:0,
				precision:2
			}
		}
	},	
	{field:"totalPrice",title:"退款金额",width:60,align:"center",formatter:numBaseFormat},
	{field:"delete",title:"操作",width:80,align:"center", formatter: function(value, row, index){
		if (row.sku!="合计:"){//这里是判断哪些行
			return commonAssemBottonHtml('delOne', index, '删除', 'icon-script_delete');	
        }	
		return "";				
	}}
]];

$(function () { 
			
	//$("#payprice", $orderfm).next().children("input:first-child").css("background-color", "rgb(235, 235, 228)");
	
	$('#payMode', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.vipUnpaidPayModeData
   	});
	
	$('#refundReason', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.refundReasonData
   	});
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	//初始化搜索框
	$('#skuSearcher').searchbox({
	     prompt: '输入商品名称、SKU筛选...',
	     searcher: function (value, name) {
	    	 currOrderDetailDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currOrderDetails);
	     }
	 });
	
	currOrderDetailDataGrid.datagrid({
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    idField:"sku",
	    sortName:"sku",
        sortOrder:"asc",	
        pagination:false,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    //toolbar: "#detailskutoolbar",
	    columns: soColumns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true,
	    rowStyler:function(index,row){
    		if (row.skuAftersaleStatus==20){
                return "background-color:#FFAF33";  
            }	
    		return "";
		},
		loadFilter:function(data) {     		  		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data); 
			return data; 
        },
	});
	
	currRefundDetailDataGrid.datagrid({
		view:footerStyleView,
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
	    showFooter:true,
	    columns: refundColumns,
	    loadFilter:function(data) {     		
    		var fields = ["totalPrice"];       		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "sku"); 
			return data; 
        },
        rowStyler:function(index,row){
    		if (row.sku=="合计:"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	
    		return "";
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    onAfterEdit: function(rowIndex, rowData, changes){
	    	if(typeof rowData.salePrice !=undefined && typeof rowData.qty!=undefined){
	    		rowData.salePrice = Number(rowData.salePrice);
	    		rowData.originSalePrice = rowData.salePrice;
		    	rowData.qty = Number(rowData.qty);
	    		rowData.totalPrice = rowData.salePrice * rowData.qty;
	    	}else{	    		   	
	    		rowData.totalPrice = 0;
	    	}	    	
	    	//更新单头退款金额
	    	updateRefundPrice(currRefundDetails, $("#refundPrice", $orderfm));
	    }
	});
	
	$.ajax({
		type : "GET",
		url : "${api}/bus/aftersale/refund/getInitData?orderId=${orderId}&refundId=${refundId}",
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var orderDto = result.entry;
			var header = orderDto.header;		
			
			/***************************              基本信息初始化                        ************************/			
			$("#payMode", $orderfm).combobox("setValue", header.payMode);
			$("#refundReason", $orderfm).combobox("setValue", header.refundReason);
			$("#orderPrice", $orderfm).numberbox("setValue", header.orderPrice);
			$("#receptPrice", $orderfm).numberbox("setValue", header.receptPrice);
			$("#shopName",$orderfm).textbox("setValue", header.shopName);			
			$("#buyerName",$orderfm).textbox("setValue", header.buyerName);
			$("#orderId",$orderfm).val(header.orderId);
			$("#extOrderId",$orderfm).val(header.extOrderId);
			$("#shopId",$orderfm).val(header.shopId);
			$("#buyerId",$orderfm).val(header.buyerId);
			
			currOrderDetails = orderDto.details;
			if(currOrderDetails!=null && currOrderDetails.length>0){
				$.each(currOrderDetails, function(){
					this.skuAftersaleStatus = 10;
				});
				currOrderDetailDataGrid.datagrid("loadData", currOrderDetails);		
			}
			//currRefundDetailDataGrid.datagrid("loadData", currRefundDetails);
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
	var row = currOrderDetailDataGrid.datagrid('getRows')[rowIndex];   
    $.each(currOrderDetails, function(){
    	if(this.lineNo == row.lineNo){
    		this.skuAftersaleStatus = 20;  	
    		currOrderDetailDataGrid.datagrid("refreshRow", rowIndex);
    		return;
    	}
    });	
 
    var rowdata = cloneObj(row);    
    rowdata.originQty = row.qty;
    rowdata.originTotalPrice = row.totalPrice;
    rowdata.originSalePrice = row.salePrice;
    rowdata.couponPrice = 0;
    rowdata.discountPrice = 0;
    rowdata.totalPartPrice = 0;
    rowdata.partPrice = 0;
    rowdata.isGift = false;
    rowdata.goodsType = null;
    rowdata.giftCount = 0;
    rowdata.giftPrice = 0;
    delete rowdata.skuAftersaleStatus;
    delete rowdata.nid;
	currRefundDetails.push(rowdata);
	currRefundDetailDataGrid.datagrid("loadData",currRefundDetails);	
	//更新单头退款金额
	updateRefundPrice(currRefundDetails, $("#refundPrice", $orderfm));
}

/**
 * 删除单个
 */
function delOne(rowIndex){
	var row = currRefundDetailDataGrid.datagrid('getRows')[rowIndex];	
	//删除商品
	for(var i in currRefundDetails) {	
		if(currRefundDetails[i].lineNo==row.lineNo) {
			currRefundDetails.splice(i,1);	
			currRefundDetailDataGrid.datagrid("loadData", currRefundDetails);	
			break;
		}
	}	
	//同步商品状态
	$.each(currOrderDetails, function(){
    	if(this.lineNo == row.lineNo){
    		this.skuAftersaleStatus = 10;
    		currOrderDetailDataGrid.datagrid("loadData",currOrderDetails);
    		return;
    	}
    });		
	//更新单头退款金额
	updateRefundPrice(currRefundDetails, $("#refundPrice", $orderfm));
}

/**
 * 更新单头退款金额
 */
function updateRefundPrice(refundDetails, $div){

	var refundPrice = 0;
	$.each(refundDetails, function(){
		refundPrice += this.totalPrice;
    });
	$div.numberbox("setValue", refundPrice);
} 

/**
 * 校验并组装保存的数据 
 */
function getSaveData(){
	
	var isValid0 = currRefundDetailDataGrid.datagrid("isValid");		
	var isValid = $orderfm.form('validate');
	if (!isValid || !isValid0){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}			
	currRefundDetailDataGrid.datagrid("acceptChanges");
	var baseInfo = formJson($orderfm);	
	var refundPrice = baseInfo.refundPrice;
	var payAccounts = [];
	if(refundPrice!=null && refundPrice>0){
		payAccounts.push({
			receptPrice: refundPrice,
			payPrice: refundPrice,
			discountAmount: 0,
			dibPrice: 0,
			payMode: baseInfo.payMode,
			tradeNo: baseInfo.tradeNo,
			cardNo: baseInfo.cardNo
		});
	}
	delete baseInfo.payMode;
	delete baseInfo.tradeNo;
	delete baseInfo.cardNo;	
	var saveData = {
	     "params": {
			 "refundHeader": baseInfo,
			 "refundDetails": currRefundDetails,
			 "orderDetails": currOrderDetails,
			 "payAccounts": payAccounts
			},
	     "saveUrl": "${api}/bus/aftersale/refund/create"
	}
	return saveData;
}

</script>


