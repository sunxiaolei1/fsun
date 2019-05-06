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
			<table id="takeGoodsDataGrid"></table>				
		</div>		
	</div>
</div>

<div id="takeGoodsToolbar" style="display: none;">	
	<span style="float:right;margin-right:10px;" >	
		<input id="takeGoodsSearcher" class="easyui-searchbox" style="width:350px" />
	</span>		
	<div style="height:26px;">
		<span class="skutitle" >商品列表</span>
	</div>
</div>

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/takeGoodsEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currTakeGoodsDataGrid = $("#takeGoodsDataGrid");
var currTakeGoodsDetailData = [];


$(function() {
	
	//初始化搜索框
	$('#takeGoodsSearcher').searchbox({
	     prompt: '输入寄提单号、商品名称、SKU...',
	     searcher: function (value, name) {
	    	 currTakeGoodsDataGrid.datagrid({searchValue: value})
	    	 	.datagrid("loadData", currTakeGoodsDetailData);
	     }
	 });

	//初始化寄存单列表
	currTakeGoodsDataGrid.datagrid({
		view:footerStyleView,
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    remoteSort:false,
	    sortName:"take_time",
        sortOrder:"desc",
	    idField:"goods_id",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:false,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
	    frozenColumns:[[
			//{field:'ck',checkbox:true},
			//{field:'order_id',title:'寄存单号',width:140,align:'center',sortable:true},
			{field:'take_id',title:'寄提单号',width:220,align:'center',sortable:true},
			{field:"sku",title:"SKU", width:60,align:"center",sortable:true},
			{field:"goods_name",title:"商品名称", width:130,align:"center",sortable:true}	
        ]],
	    columns: [[			
			{field:'qty',title:'提货数量',width:70,align:'center',
				styler: function(value, rowData, rowIndex){
		    		return 'font-weight:bold;color:green;';
		    	},
		    	formatter:intNumBaseFormat
		    },
			{field:'sale_price',title:'实付单价',width:70,align:'center',
		    	styler: function(value, rowData, rowIndex){
		    		return 'font-weight:bold;color:green;';
		    	},
		    	formatter:numBaseFormat
		    },
			{field:"unit",title:"单位",width:50,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.unitCode); 
			}},
			{field:'take_time',title:'提货时间',width:130,align:'center'},
			{field:'shop_name',title:'提货店仓',width:130,align:'center',sortable:true},								
			{field:"bar_code",title:"条形码", width:110,align:"center",sortable:true},
			{field:'brand_code',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
				return formatter(value, window.parent.brandCode); 
			}},
			{field:"category_code",title:"商品分类", width:100,align:"center",sortable:true, formatter:function(value, row){
				return formatter(value, window.parent.categoryCode); 
			}},
			{field:'property',title:'规格',width:120,align:'center',sortable:true}
	    ]],
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    toolbar:'#takeGoodsToolbar',
	    singleSelect: true,
	    selectOnCheck: true,
	    checkOnSelect: true,
	    fitColumns: false,
	    loadFilter:function(data) {     		
    		var fields = ["qty"];       		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "take_id"); 
			return data; 
        },
        rowStyler:function(index,row){
    		if (row.take_id=="合计:"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	
    		return "";
		}
	});
	
	$.ajax({
		type : "GET",
		url : "${api}/bus/take/goodsHistory/${orderId}",
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			if(result.status){
				var takeGoods = result.entry;
				if(takeGoods!=null && takeGoods.length>0){
					currTakeGoodsDetailData = takeGoods; 
					currTakeGoodsDataGrid.datagrid("loadData", currTakeGoodsDetailData);	
				}
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});	

});

</script>
</html>