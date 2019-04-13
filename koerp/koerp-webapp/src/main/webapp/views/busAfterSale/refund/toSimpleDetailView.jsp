<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<div class="fsun-wrap">
	<form id="refundfm">
		<span class="title" style="top: 30px;">基本信息(退货单号:<span id='refundId'></span>)</span>		
		<input id="orderId" name="orderId" hidden="true" />
		<input id="extOrderId" name="extOrderId" hidden="true" />		
		<input id="shopId" name="shopId" hidden="true" />
		<input id="buyerId" name="buyerId" hidden="true" />
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	        	<th width="6%">客户名称</th>
				<td>
					<input id="buyerName" name="buyerName" class="easyui-textbox" readOnly />								
				</td>				
				<th width="6%">所属店仓</th>
				<td>
					<input id="shopName" name="shopName" class="easyui-textbox" readOnly />								
				</td> 
				<th width="6%">退货原因</th>
				<td>
					<input id="refundReason" name="refundReason" class="easyui-combobox" editable="false" required />								
				</td>            												
	        </tr>	
	        <tr>
	        	<th width="6%">原订单金额</th>
				<td>
					<input id="orderPrice" class="easyui-numberbox" disabled 
						data-options="min:0,precision:2, formatter: priceFormat" />
				</td>
				<th width="6%">原实收金额</th>
				<td>
					<input id="receptPrice" class="easyui-numberbox" disabled 
						data-options="min:0,precision:2, formatter: priceFormat" />
				</td>	
	      		<th width="6%">退款金额</th>
				<td>
					<input id="refundPrice" name="refundPrice" class="easyui-numberbox" 
						data-options="min:0,precision:2,value:0, formatter: priceFormat" />
				</td>									        			           				
	        </tr>	       		        		        
	        <tr>		        	       			        	
	            <th width="6%">备注</th>
	        	<td colspan="5">
					<input id="memo" name="memo" data-options="multiline:true"
						class="easyui-textbox" style="width:700px;height:50px;" />
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" class="easyui-linkbutton" iconCls="icon-money" 
						plain="false" onclick="openRefundPayAccountView()">退货账单</a>	
				</td>		        			           
	        </tr>
		</table>
	</form>
</div>	

<div style="height: 245px; width: 100%;">
	<span style="float:right;margin-top:2px;margin-bottom:2px;">	
		<input id="refundSkuSearcher" class="easyui-searchbox" style="width:350px">
	</span>
	<div style="height:24px;">
		<b class="skutitle" >
			退货商品
		</b>
	</div>	
	<table id="refundDetailDataGrid"></table>
</div>		
						


<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currRefundDetails = [];
var currRefundPayAccount = [];
var currRefundDetailDataGrid = $("#refundDetailDataGrid");
var $refundfm = $("#refundfm");   
var refundColumns = [[
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:140,align:"center"},
	//{field:"barCode",title:"条形码", width:140,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode); 
	}},
	{field:'property',title:'规格',width:120,align:'center',sortable:true},
	//{field:"originQty",title:"下单数量",width:60,align:"center",formatter:numBaseFormat},
	//{field:"originTotalPrice",title:"实付总价",width:60,align:"center",formatter:numBaseFormat},			
	{field:"qty",title:"退货数量",width:60,align:"center",
		styler: function(value, rowData, rowIndex){
	      	return 'font-weight:bold;color:green;';
	    },
      	formatter:numBaseFormat
	},	
	{field:"salePrice",title:"退货单价",width:60,align:"center",
		styler: function(value, rowData, rowIndex){
	      	return 'font-weight:bold;color:green;';
	    },
      	formatter:numBaseFormat
	},	
	{field:"totalPrice",title:"退款金额",width:60,align:"center",formatter:numBaseFormat}
]];

$(function () { 
				
	$('#payMode', $refundfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.vipUnpaidPayModeData
   	});
	
	$('#refundReason', $refundfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.refundReasonData
   	});
	
	//去除默认的请选择项
	editInitComboxParams($refundfm, "");
	
	//初始化搜索框
	$('#refundSkuSearcher').searchbox({
	     prompt: '输入商品名称、SKU筛选...',
	     searcher: function (value, name) {
	    	 currRefundDetailDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currRefundDetails);
	     }
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
	    pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    columns: refundColumns,
	    loadFilter:function(data) {     		
    		var fields = ["qty", "totalPrice"];       		
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
	    emptyMsg:"没有符合条件的记录"
	});
	
	$.ajax({
		type : "GET",
		url : "${api}/bus/aftersale/refund/getInitData?orderId=${orderId}&refundId=${refundId}",
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var orderDto = result.entry;
			var refundId = orderDto.refundId;
			if(refundId!=null && refundId!=''){
				
				$("#refundId", $refundfm).text(refundId);
				
				var refundHeader = orderDto.refundHeader;
				var orderHeader = orderDto.orderHeader;
				var payAccounts = orderDto.payAccounts;				
				$("#refundReason", $refundfm).combobox("setValue", refundHeader.refundReason);
				$("#orderPrice", $refundfm).numberbox("setValue", orderHeader.orderPrice);
				$("#receptPrice", $refundfm).numberbox("setValue", orderHeader.receptPrice);
				$("#refundPrice", $refundfm).numberbox("setValue", refundHeader.refundPrice);
				$("#shopName",$refundfm).textbox("setValue", refundHeader.shopName);			
				$("#buyerName",$refundfm).textbox("setValue", refundHeader.buyerName);
				$("#memo",$refundfm).textbox("setValue", refundHeader.memo);				
				if(payAccounts!=null && payAccounts.length>0){
					currRefundPayAccount = payAccounts;
				}
				
				if(orderDto.refundDetails!=null && orderDto.refundDetails.length>0){
					currRefundDetails = orderDto.refundDetails;
					currRefundDetailDataGrid.datagrid("loadData", currRefundDetails);
				}				
			}		
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  		
     
});

/**
 * 打开退货账单明细
 */
function openRefundPayAccountView(){
	$("<div></div>").dialog({
		id:"payAccountDialog",
	    title:"&nbsp;退货结款",
	    width:"860px",
		height:"350px",
	    iconCls:"icon-script_delete",
	    closed:false,
	    cache:false,
	    href:"${api}/bus/payAccount/toRefundDetailView",
	    modal:true,
	    minimizable:false,//定义是否显示最小化按钮。
     	maximizable:false,//定义是否显示最大化按钮
     	closable:true,
     	resizable:true,//定义对话框是否可调整尺寸
     	collapsible: false,//是否可折叠的
		onLoad:function(){
     		$('#payAccountDialog').window('center');
     		currRefundPayAccountDataGrid.datagrid("loadData", currRefundPayAccount);    		
		},
    	onClose:function(){
      		$(this).dialog("destroy");
      	}
	});	
}
 

</script>