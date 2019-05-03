<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="入库单管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
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
	{field:'asn_no',title:'单据编号',width:140,align:'center',sortable:true},	
	{field:'asn_type',title:'单据类型',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.docAsnType); 
	}},
	{field:'asn_status',title:'单据状态',width:80,align:'center',sortable:true, formatter:function(value, row){
		var spanHeader = "<b style='color:green;'>";
		if(value=='A90' || value=='A91'){
			spanHeader = "<b style='color:red;'>";
		}else if(value=='A00'|| value=='A10'){
			spanHeader = "<b style='color:#FF9933;'>";
		}
		var spanFooter = "</b>";
		return spanHeader + formatter(value, window.parent.docAsnStatus) + spanFooter;
	}},
	{field:'is_refund',title:'存在退货',width:80,align:'center', 
		formatter:function(value, row){
			var spanDiv = "<b style='color:green;'>--</b>";		
			if(row.asn_type=="23"){
				//采购入库存在退货
				if(row.order_no!=null && row.order_no!=''){
					spanDiv = "<b style='color:red;'>是</b>";
				}else{
					spanDiv = "<b style='color:green;'>否</b>";
				}
			}else if(row.asn_type=="21"){
				//调拨入库存在退货
				spanDiv = "<b style='color:green;'>否</b>";
				if(row.asn_status =="A10" || row.asn_status =="A91"){
					if(row.order_no!=null && row.order_no!=''){
						spanDiv = "<b style='color:red;'>是</b>";
					}
				}				
			}			
			return spanDiv;
		}
     }
]];

var columns = [[
	{field:'to_shop_id',title:'入库店仓',width:140,align:'center',sortable:true, formatter:function(value, row){
		return row.to_shop_name; 
	}},
	{field:'receiving_time',title:'入库时间',width:100,align:'center',sortable:true, formatter:function(value, row){
		if(typeof value != "undefined"){
			return formatterDate(dateParser(value));
		}		
	}},	
	{field:'from_shop_id',title:'出库店仓',width:140,align:'center',sortable:true, formatter:function(value, row){
		return row.from_shop_name; 
	}},	 
	{field:'delivery_time',title:'出库时间',width:100,align:'center',sortable:true, formatter:function(value, row){
		if(typeof value != "undefined"){
			return formatterDate(dateParser(value));
		}		
	}},
	{field:'expected_time',title:'预期收货时间',width:130,align:'center',sortable:true},	
	{field:'supplier_name',title:'供应商名称',width:100,align:'center',sortable:true},	
	//{field:'print_count',title:'是否打印',width:80,align:'center',sortable:true, formatter:function(value, row){
	//	return (row.print_count>0?"<span style='color:red;'>是</span>":"否"); 
	//}}, 
	{field:'created_name',title:'制单人',width:80,align:'center',sortable:true},
	{field:'created_time',title:'单据时间',width:130,align:'center',sortable:true},
	{field:'memo',title:'备注',width:200,align:'center',sortable:true},	
	{field:'ext_order_no',title:'外部订单号',width:140,align:'center',sortable:true},
	{field:'po_no',title:'申请单号',width:150,align:'center',sortable:true},
	{field:'order_no',title:'出库单号',width:150,align:'center',sortable:true}
		
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
	    sortName:"asn_no",
        sortOrder:"desc",
	    //idField:"blackid",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
	    fitColumns:false,
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