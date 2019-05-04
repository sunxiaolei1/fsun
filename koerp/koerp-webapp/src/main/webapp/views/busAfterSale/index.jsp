<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="售后单列表" border="false" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<div class="easyui-layout" data-options="fit:true">	
			<!-- 查询条件 -->
			<%@include file="./searchbar.jsp"%>
			
			<!-- table -->
			<div id="gridDiv" data-options="region:'center'" style="border: 0px solid #D3D3D3;">
				<table id="ordersDataGrid"> 
				</table>
			</div>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
    <!-- 操作按钮及事件  -->
	<%@include file="./indextoolbar.jsp"%>
</div>

<script type="text/javascript">

var frozenColumns = [[
   	{field:'ck',checkbox:true},
   	{field:'refund_id',title:'单据编号',width:180,align:'center',sortable:true},
   	{field:'refund_type',title:'单据类型',width:80,align:'center',sortable:true, formatter:function(value, row){
   		return formatter(value, window.parent.refundType); 
   	}},
   	{field:'refund_status',title:'退货状态',width:100,align:'center',sortable:true, formatter:function(value, row){   		
   		if(value){
			var spanHeader = "<b style='color:green;'>";
			if(value=='40'){
				spanHeader = "<b style='color:red;'>";
			}
			var spanFooter = "</b>";
			return spanHeader + formatter(value, window.parent.refundStatus) + spanFooter;
		}
   	}},
   	/* {field:'trade_status',title:'换发状态',width:80,align:'center',sortable:true, formatter:function(value, row){
   		return formatter(value, window.parent.tradeStatus); 
   	}}, */
   	{field:'buyer_name',title:'客户名称',width:100,align:'center',sortable:true},
   	{field:'shop_id',title:'所属店仓',width:130,align:'center',sortable:true, formatter:function(value, row){
   		return row.shop_name; 
   	}}
   ]];

   var columns = [[		   	
   	{field:'order_id',title:'原订单号',width:140,align:'center',sortable:true},
   	{field:'barter_order_id',title:'换发单号',width:140,align:'center',sortable:true, formatter:function(value, row){
   		if(typeof(value) != "undefined"){
   			return (value!=null && value!='')?value:"--"; 
   		}	
   	}},
   	{field:'all_return',title:'整单退',width:70,align:'center',sortable:true, formatter:function(value, row){
   		if(typeof(value) != "undefined"){
   			var allReturn = "<b style='color:green;'>否</b>";
   	   		if(value==true){
   	   			allReturn = "<b style='color:red;'>是</b>";
   	   		}
   	   		return allReturn;
   		} 		
   	}},
   	{field:'refund_price',title:'退单金额',width:80,align:'center',formatter:numBaseFormat},
   	{field:'diff_price',title:'差价补款',width:80,align:'center',formatter:numBaseFormat},
   	//{field:'carrier_name',title:'经办人',width:100,align:'center',sortable:true},
   	{field:'refund_reason',title:'退换货原因',width:100,align:'center',sortable:true, formatter:function(value, row){
   		return formatter(value, window.parent.refundReason); 
   	}},
   	{field:'refund_time',title:'退单时间',width:130,align:'center',sortable:true},
   	{field:'created_name',title:'制单人',width:80,align:'center'},
   	{field:'updated_time',title:'更新时间',width:130,align:'center',sortable:true},
   	{field:'memo',title:'备注',width:250,align:'center'}
   ]];
var currDataGrid;
var footerFirstColumn = "refund_id";

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
	    sortName:"refund_time",
        sortOrder:"desc",
	    idField:"refund_id",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
	    frozenColumns:frozenColumns,
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
            }
        	return rowStyle;
		},
	    onDblClickRow:function(rowIndex, rowData){
	    	$(this).datagrid("unselectAll");
			$(this).datagrid("selectRow",rowIndex);
			toDetailView();
	    },
	    onLoadSuccess:function(param){	    	
	    	//buttonsEnabledValidator($(this), ["order_detail_view", "order_handle_sign"], ListModuleType.AFTERSALE_REFUND);	    		    	
	    },
	    onSelect:function(rowIndex, rowData){	    	
	    	//buttonsEnabledValidator($(this), ["order_detail_view", "order_handle_sign"], ListModuleType.AFTERSALE_REFUND);	    		    	
	    },
	    onUnselect:function(rowIndex, rowData){    	   		
	    	//buttonsEnabledValidator($(this), ["order_detail_view", "order_handle_sign"], ListModuleType.AFTERSALE_REFUND);			    		    	
	    }
	});
});

</script>
</html>