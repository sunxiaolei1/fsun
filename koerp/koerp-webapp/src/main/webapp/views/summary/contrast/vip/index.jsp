<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 83%;">
			<table id="ordersDataGrid"> 
			</table>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
    <!-- 操作按钮及事件  -->
	<%@include file="./indextoolbar.jsp"%>
</div>

<script type="text/javascript">

var columns = [[
                
	{field:'unpaid_id',checkbox:true},	
	{field:"card_no",title:"会员卡号", width:100,align:"center"},	
	{field:"shop_code",title:"交易门店", width:120,align:"center", formatter:function(value, row){
		return row.shop_name; 
	}},
	{field:"customer_code",title:"客户名称", width:120,align:"center", formatter:function(value, row){
		return row.customer_name; 
	}},
	{field:"pay_mode",title:"支付方式", width:60,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.payMode); 
	}},
	{field:"trade_type",title:"交易类型", width:80,align:"center",sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.tradeType); 
	}},
	{field:"order_id",title:"销售单号", width:140,align:"center"},
	{field:'trade_status',title:'交易状态',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.tradeStatus); 
	}},
	{field:"trade_time",title:"交易时间", width:130,align:"center",sortable:true},
	{field:'trade_price',title:'交易金额',width:65,align:'center',formatter:numBaseFormat},
	{field:"gift_price",title:"赠送金额", width:65,align:"center",formatter:numBaseFormat},
	{field:"memo",title:"备注", width:130,align:"center"}	
]];

var currDataGrid;
var footerFirstColumn = "card_no";

$(function() {
	
	currDataGrid = $("#ordersDataGrid");
	currDataGrid.datagrid({
		view:footerStyleView,
		width:500,
		height:250,
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    queryParams:{firstColumn: footerFirstColumn},
	    remoteSort:true,
	    sortName:"trade_time",
        sortOrder:"desc",
	    //idField:"blackid",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
	    fitColumns:true,
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    toolbar:'#tools',
	    singleSelect: false,
	    selectOnCheck: true,
	    checkOnSelect: true,
	    rowStyler:function(index,row){
        	var rowStyle = "";   
        	if (row[footerFirstColumn]=="合计:"){//这里是判断哪些行
        		rowStyle = 'font-weight:bold;';  
            }else{
            	if(row.unusual){
     				rowStyle += "background-color:#C8C7BF;";
    			}
            }	
        	return rowStyle;
		}
	    
	});
});


</script>
</html>