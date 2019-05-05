<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>


<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="商品名称: ${param.goodsName}, SKU: ${param.sku}" data-options="region:'center',split:true,collapsible:false" style="padding:5px">	
		<table id="orderDetailDataGrid" ></table> 
	</div>
</div>

<script type="text/javascript">

var columns = [[
    {field:'order_no',title:'单据编号',width:200,align:'center',sortable:true},
    {field:'trade_type',title:'交易类型',width:90,align:'center',sortable:true},
    {field:'shop_name',title:'交易店仓',width:120,align:'center',sortable:true},
	{field:'customer_name',title:'客户名称',width:130,align:'center',sortable:true},
	//{field:'sku',title:'SKU',width:80,align:'center'},
	//{field:'goods_name',title:'商品名称',width:140,align:'center'},
	{field:"unit",title:"单位",width:50,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.unitCode); 
	}},	   
	{field:'ordered_qty',title:'交易数量',width:60,align:'center',styler: reportNumberStyler, formatter:intNumBaseFormat},	
	{field:'price',title:'交易单价',width:70,align:'center',styler: reportNumberStyler,formatter:numBaseFormat},	
	{field:'cost_price',title:'成本价',width:70,align:'center',styler: reportNumberStyler,formatter:numBaseFormat},
	{field:'total_price',title:'交易金额',width:80,align:'center',styler: reportNumberStyler,formatter:numBaseFormat},
	{field:'cost_total_price',title:'成本金额',width:80,align:'center',styler: reportNumberStyler,formatter:numBaseFormat},
	{field:'delivery_time',title:'交易时间',width:130,align:'center',sortable:true},
]];

var footerFirstColumn = "order_no";

$(function() {
	
	$("#orderDetailDataGrid").datagrid({
		view:footerStyleView,
		width:500,
		height:250,
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    queryParams:{
	    	"shopId": "${param.shopId}",
	    	"startDate": "${param.startDate}",
	    	"endDate": "${param.endDate}",
	    	"sku": "${param.sku}",
	    	"firstColumn": footerFirstColumn
	    },
	    remoteSort:true,
	    sortName:"delivery_time",
        sortOrder:"desc",
        url: "${api}/summary/report/sku/details/so/all/findPage",
	    //idField:"blackid",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
	    fitColumns:false,
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    singleSelect: true,
	    rowStyler:function(index,row){
        	var rowStyle = "";        	
        	if (row[footerFirstColumn]=="合计:"){//这里是判断哪些行
        		rowStyle = 'font-weight:bold;';  
            }
        	return rowStyle;
		}
	});
});


</script>
</html>