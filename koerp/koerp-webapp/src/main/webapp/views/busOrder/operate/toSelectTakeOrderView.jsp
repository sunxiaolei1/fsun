<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
<style type="text/css">

.skutitle{
	margin: 0px 18px 0px 4px;
    padding-top: 0px;
    padding-bottom: 0px;
    height: 22px;
    line-height: 22px;
    width: 182px;
    font-size: 12px;
    font-weight: bold;
    color: #575765;
}

</style>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 100%">
			<div class="easyui-layout" style="width:100%;height:100%;">
				<div data-options="region:'west',split:true" style="width:66%;" >
					<table id="takeOrdersDataGrid"></table>
				</div>	
				<div data-options="region:'east',split:true, collapsed: false," style="width:34%;" >					
					<table id="takeDetailsDataGrid"></table>
				</div>
			</div>		
		</div>		
	</div>
</div>

<div id="takeTools" style="display: none;">	
	<span style="float:right;">	
		<input id="keywordsText" class="easyui-searchbox" style="width:300px"
		data-options="searcher:queryOrder,prompt:'输入客户名称、单据编号、手机号搜索...'"  />
	</span>		
	<div style="height:26px;">
		<span class="skutitle" >
			寄存单列表(<span style="color:red;">选中一条寄存单进行创建</span>)
		</span>
	</div>
</div>

<div id="takeGoodsTools" style="display: none;">
	<span style="float:right;">	
		<a href="#" class="easyui-linkbutton" iconCls="icon-book_red" plain="true" onclick="openTakeGoodsHistoryView()">寄提历史</a>
	</span>			
	<div style="height:26px;">	
		<span class="skutitle" >寄提商品库存</span>
	</div>
</div>

<!-- 查询条件 -->
<%@include file="../../busCommon/commonOrderFunc.jsp"%>

<script type="text/javascript">

var currTakeOrdersDataGrid = $("#takeOrdersDataGrid");
var currTakeDetailsDataGrid = $("#takeDetailsDataGrid");
var currSelectedRowId;
	
$(function() {
	
	//初始化商品明细
	initDetailsDataGrid();
	//初始化寄存单列表
	currTakeOrdersDataGrid.datagrid({
		width:500,
		height:250,
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    url: '${api}/bus/order/findTakePage',
	    remoteSort:true,
	    sortName:"order_time",
        sortOrder:"desc",
	    idField:"order_id",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
	    columns: [[
			{field:'ck',checkbox:true},
			{field:'order_id',title:'单据编号',width:140,align:'center'},
			{field:'trade_status',title:'交易状态',width:80,align:'center', formatter:function(value, row){
				if(value){
					var spanHeader = "<b style='color:green;'>";
					if(value=='40'){
						spanHeader = "<b style='color:red;'>";
					}
					var spanFooter = "</b>";
					return spanHeader + formatter(value, window.parent.tradeStatus) + spanFooter;
				}
			}},
			{field:'take_status',title:'寄提状态',width:80,align:'center', formatter:function(value, row){
				if(value){
					var spanHeader = "<b style='color:green;'>";
					if(value=='00'){
						spanHeader = "<b style='color:red;'>";
					}else if(value=='10'){
						spanHeader = "<b style='color:#FF9933;'>";
					}
					var spanFooter = "</b>";
					return spanHeader + formatter(value, window.parent.orderTakeStatus) + spanFooter;
				}
				return "--";
			}},
			{field:'refund_status',title:'退货状态',width:100,align:'center', formatter:function(value, row){
				var refundStatus = formatter(value, window.parent.refundStatus);
				return refundStatus!=null?"<b style='color:red;'>"+ refundStatus +"</b>":"--"; 
			}},
			{field:'buyer_name',title:'客户名称',width:100,align:'center'},
			{field:'shop_id',title:'所属店仓',width:130,align:'center', formatter:function(value, row){
				return row.shop_name; 
			}}//,
			//{field:'order_price',title:'订单金额',width:80,align:'center',formatter:numBaseFormat}
			
	    ]],
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    toolbar:'#takeTools',
	    singleSelect: true,
	    selectOnCheck: true,
	    checkOnSelect: true,
	    fitColumns: true,
	    onSelect:function(index, data){	  
	    	currSelectedRowId = data.order_id;
	    	initDetailsDataGrid(currSelectedRowId);
        },
	    onLoadSuccess:function(result){
	    	var data = result.entry;
	    	if(data.length>0 && currSelectedRowId==null){
	    		currSelectedRowId = data[0].order_id;	    		
	    	}
	    	$(this).datagrid("selectRecord",currSelectedRowId);
	    }
	});

	
});


//查询待选商品
function queryOrder() {		
	var keywords = trim($("#keywordsText").textbox("getValue"));	
	var queryParams = currTakeOrdersDataGrid.datagrid("options").queryParams;		
	queryParams.keywords = keywords;	
	currSelectedRowId = null;
	currTakeOrdersDataGrid.datagrid("clearSelections");
	currTakeOrdersDataGrid.datagrid("reload");
}

/**
 * 初始化商品库存明细
 */
function initDetailsDataGrid(currSelectedRowId){
	
	if(currSelectedRowId!=null && currSelectedRowId!=''){
		$.ajax({
			type : "GET",
			url : "${api}/bus/order/loadEntity/"+ currSelectedRowId,
			contentType:"application/json;charset=utf-8",	   
			dataType : "json",
			success : function(result) {		
				var docOrderDto = result.entry;
				if(docOrderDto!=null && docOrderDto.details!=null){
					currTakeDetailsDataGrid.datagrid("loadData", docOrderDto.details);
				}									
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert("错误", errorThrown, "error");
			}
		});  			
	}else{
		currTakeDetailsDataGrid.datagrid({
			width:500,
			height:250,
		    nowrap:false,
		    striped:true,
		    border:true,
		    collapsible:false,//是否可折叠的
		    fit:true,//自动大小		
		    remoteSort:false,
		    sortName:"sku",
	        sortOrder:"asc",
		    singleSelect:true,//是否单选
		    pagination:false,//分页控件
		    rownumbers:true,//行号
		    showFooter:true,
		    columns: [[
	           //{field:'ck',checkbox:true},
	        	{field:"sku",title:"SKU",width:80,align:'center',sortable:true},	
	        	{field:"goodsName",title:"商品名称",width:120,align:'center',sortable:true},
	        	{field:"untakeQty",title:"可寄提库存",width:80,align:'center'},
	        	{field:"unit",title:"单位",width:50,align:"center", formatter:function(value, row){
	        		return formatter(value, window.parent.unitCode); 
	        	}}
	        ]],
	        toolbar:'#takeGoodsTools',
		    loadMsg:"数据加载中请稍后……",
		    emptyMsg:"没有符合条件的记录",
		    singleSelect: false,
		    selectOnCheck: true,
		    checkOnSelect: true,
		    fitColumns: false
		});
	}
	
}

/**
 * 转换至创建寄提单页面
 */
function transferToCreateTakeView(func){
	var row = currTakeOrdersDataGrid.datagrid("getSelected");
	if(row){
		var tradeStatus = row.trade_status;
		var refundStatus = row.refund_status;
		var takeStatus = row.take_status;
		if(tradeStatus==30 //&& (refundStatus!=null && refundStatus!='')
			&& (takeStatus!=null && takeStatus!='20')){
			var url = "${api}/bus/take/toTakeOutView/" + row.order_id +"?buttontype=busTake";
			var icon = "icon-user_edit";
			var subtitle = "创建寄提单";
			parent.addTab(subtitle, url, icon);	
			func();			
		}else{			
			$.messager.alert("提示", "单据状态不可用!", "info");
		}
	}	
}

/**
 * 打开该单据寄提商品历史
 */
function openTakeGoodsHistoryView(){
	var row = currTakeOrdersDataGrid.datagrid("getSelected");
	if(row){
		toTakeGoodsHistoryView(row.order_id);
	}
}

</script>
</html>