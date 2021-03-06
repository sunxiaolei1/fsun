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
		<input id="fromShopId" name="fromShopId" hidden="true" />	
		<input id="orderPrice" name="orderPrice" hidden="true" />	
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
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:800px;height:50px;"/>
					<a href="#" class="easyui-linkbutton" iconCls="icon-money" style="margin-left:90px;"
						plain="false" onclick="openPayAccountView()">账单明细</a>			
				</td>	        	
	        </tr>
		</table>
	</form>			
</div>	
<div style="height: 245px; width: 100%;">
	<span style="float:right;margin-top:2px;margin-bottom:2px;">	
		<input id="skuSearcher" class="easyui-searchbox" style="width:350px">
	</span>
	<table id="orderDetailDataGrid"></table>
</div>

<div id="payAccountWin" class="easyui-window" title="账单明细" closed="true" align="center" 
	style="display:none;width:80%;height:65%;top:100px;" modal="true">  
   	 <div class="easyui-layout" fit=true  id='base_layout'>	
   	 	<div data-options="region:'center'" style="height:280px;">
   	 		<table id="payAccountDataGrid"></table>
   	 	</div> 		 	
   	 </div>	 
</div>					

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<!-- datagrid操作公共方法 -->
<%@include file="./baseOrderView.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currPayAccountData = [];
var currOrderDetailDataGrid = $("#orderDetailDataGrid");
var currPayAccountDataGrid = $("#payAccountDataGrid");
var $orderfm = $("#orderfm");   
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
	{field:"isGift",title:"有无赠品", width:60,align:"center",formatter:function(value, row){
		return value!=null?(value?'有':"无"):""; 
	}},
	{field:"goodsType",title:"赠送类型", width:80,align:"center", formatter:function(value, row){
		return value!=''?formatter(value, window.parent.busGoodsType):"--"; 
	}},
	{field:"giftCount",title:"赠送数量", width:80,align:"center",formatter:intNumBaseFormat},
	{field:"giftPrice",title:"赠送金额", width:80,align:"center",formatter:numBaseFormat},
	{field:"originSalePrice",title:"销售单价", width:80,align:"center",formatter:numBaseFormat},
	{field:"salePrice",title:"实付单价", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:numBaseFormat
	},
	{field:"qty",title:"数量", width:80,align:"center",
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
	}}
]];

var payAccountColumns = [[
	{field:"lineNo",title:"行号", width:80,align:"center", sortable:true, hidden:true},          		
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
]];


$(function () { 			
	
	$('#orderType', $orderfm).combobox({  		
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.orderTypeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	
	//初始化搜索框
	$('#skuSearcher').searchbox({
	     prompt: '输入商品名称、SKU筛选...',
	     searcher: function (value, name) {
	    	 currOrderDetailDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currDetailData);
	     }
	 });
	
	currOrderDetailDataGrid.datagrid({
		view:footerStyleView,
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
        pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    toolbar: "#detailskutoolbar",
	    columns: soColumns,
	    loadFilter:function(data) {     		
    		var fields = ["totalPrice","giftPrice","couponPrice"];       		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "sku"); 
			return data; 
        },
        rowStyler:function(index,row){
    		if (row.sku=="合计"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	
    		return "";
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true
	});
	
	$.ajax({
		type : "GET",
		url : "${api}/bus/order/getInitData",
		data:{
			"orderId":"${orderId}",
			"orderType": "${orderType}"
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docOrderDto = result.entry;
			
			/***************************              基本信息初始化                        ************************/			
			//获取当前单据的基本信息
			var header = docOrderDto.header;
			if(header!=null){
				$orderfm.form("load", header);	
			}
			//获取当前单据的账单明细
			currPayAccountData =  docOrderDto.payAccounts;
			//获取当前单据的商品明细
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

//商品列表刷新
function skuListReLoad() {
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);
}

//打开账单明细
function openPayAccountView(){
	currPayAccountDataGrid.datagrid({
		view:footerStyleView,
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
        //pagination:true,       
	    singleSelect:true,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    //toolbar: "#payAccountToolbar",
	    columns: payAccountColumns,
	    loadFilter:function(data) {     		
    		var fields = ["receptPrice","payPrice","dibPrice","discountAmount"];       		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "sku"); 
			return data; 
        },
        rowStyler:function(index,row){	    		    	
    		if (row.sku=="合计"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	
    		return "";
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true
	}).datagrid("loadData", currPayAccountData);
	
	$("#payAccountWin").window("open");
}

</script>