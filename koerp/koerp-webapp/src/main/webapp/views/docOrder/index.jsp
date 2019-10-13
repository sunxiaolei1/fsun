<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%> 
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true" >
	<div title="出库单列表" data-options="region:'center',split:true,collapsible:false,border:false" style="padding:5px">
		<div class="easyui-layout" data-options="fit:true" >	
			<!-- 查询条件 -->
			<%@include file="./searchbar.jsp"%>
			
			<!-- table -->
			<div id="gridDiv" data-options="region:'center',border:false" >
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
	{field:'order_no',title:'单据编号',width:130,align:'center',sortable:true, styler:reportContentStyler},		
	{field:'order_type',title:'单据类型',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.docOrderType); 
	}},
	{field:'order_status',title:'单据状态',width:80,align:'center',sortable:true, formatter:function(value, row){		
		var spanHeader = "<b style='color:green;'>";
		if(value=='B90'){
			spanHeader = "<b style='color:red;'>";
		}
		var spanFooter = "</b>";
		return spanHeader + formatter(value, window.parent.docOrderStatus) + spanFooter;
	}}
]];

var columns = [[	
	{field:'from_shop_id',title:'出库店仓',width:140,align:'center',sortable:true, formatter:function(value, row){
		return row.from_shop_name; 
	}},
	/* {field:'to_shop_id',title:'入库店仓',width:120,align:'center',sortable:true, formatter:function(value, row){
		return row.to_shop_name; 
	}},  */
	{field:'delivery_time',title:'出库时间',width:100,align:'center',sortable:true, formatter:function(value, row){
		if(typeof value != "undefined"){
			return formatterDate(dateParser(value));
		}	
	}},
	{field:'print_count',title:'已打印',width:60,align:'center', sortable:true, formatter:function(value, row){
		return (value>0?"<b style='color:green;'>是</b>":(value==0?"<b style='color:red;'>否</b>":"")); 
	}},
	{field:'created_name',title:'制单人',width:80,align:'center',sortable:true},
	{field:'memo',title:'备注',width:300,align:'center',sortable:true}
		
]];

var currDataGrid;

$(function() {
	
	currDataGrid = $("#ordersDataGrid");
	currDataGrid.datagrid({
		width:500,
		height:250,
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    queryParams:{},
	    remoteSort:true,
	    sortName:"delivery_time",
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
	    frozenColumns:frozenColumns,
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    toolbar:'#tools',
	    singleSelect: false,
	    selectOnCheck: true,
	    checkOnSelect: true,
	    onDblClickRow:function(rowIndex, rowData){
	    	$(this).datagrid("unselectAll");
			$(this).datagrid("selectRow",rowIndex);
			toDetailView();
	    }
	    
	});
});


</script>
</html>