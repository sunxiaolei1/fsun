<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true" >	
	<div title="申请单列表" data-options="region:'center',split:true,collapsible:false,border:false" style="padding:5px">
		<div class="easyui-layout" data-options="fit:true" >	
			<!-- 查询条件 -->
			<%@include file="./allotSearchbar.jsp"%>
			
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
	<%@include file="./allotIndextoolbar.jsp"%>
</div>

<script type="text/javascript">

var docPoStatus1 = cloneObj(window.parent.docPoStatus);
docPoStatus1["00"] = "待审核";

var docPoStatusData1 = [];
$.each(window.parent.docPoStatusData, function(){
	var codeCode = this.codeCode;
	var codeName = this.codeName;
	if(codeCode=='00'){
		codeName = "待审核";
	}
	if(codeCode!='' && codeCode=="05"){
		
	}else{
		docPoStatusData1.push({
			codeCode: codeCode,
			codeName: codeName
		});
	}
	
})

var frozenColumns = [[
	{field:'ck',checkbox:true},
	{field:'po_no',title:'单据编号',width:180,align:'center',sortable:true, styler:reportContentStyler},		
	{field:'po_type',title:'单据类型',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.docPoType); 
	}},
	{field:'po_status',title:'单据状态',width:80,align:'center',sortable:true, formatter:function(value, row){
		var spanHeader = "<span style='color:#FF9900;'>";
		if(value=='10'){
			spanHeader = "<span style='color:green;'>";
		}else if(value=='20'){
			spanHeader = "<span style='color:#FF9900;'>";
		}else if(value=='90'){
			spanHeader = "<span style='color:red;'>";
		}
		var spanFooter = "</span>";
		return spanHeader + formatter(value, docPoStatus1) + spanFooter; 
	}}	
]];

var columns = [[	
	{field:'from_shop_id',title:'出库店仓',width:160,align:'center',sortable:true, formatter:function(value, row){
		return row.from_shop_name; 
	}},
	{field:'to_shop_id',title:'入库店仓',width:160,align:'center',sortable:true, formatter:function(value, row){
		return row.to_shop_name; 
	}}, 
	{field:'audit_time',title:'审核时间',width:130,align:'center',sortable:true},
	{field:'auditor',title:'审核人',width:100,align:'center',sortable:true},
	{field:'delivery_time',title:'发货时间',width:130,align:'center',sortable:true, formatter:function(value, row){
		if(typeof value != "undefined"){
			return formatterDate(dateParser(value));
		}	
	}},	
	{field:'expected_time',title:'预收时间',width:130,align:'center',sortable:true},
	/* {field:'print_count',title:'是否打印',width:80,align:'center',sortable:true, formatter:function(value, row){
		return (row.print_count>0?"<span style='color:red;'>是</span>":"否"); 
	}}, */
	{field:'created_name',title:'制单人',width:80,align:'center',sortable:true},
	{field:'created_time',title:'制单时间',width:130,align:'center',sortable:true},
	{field:'updated_time',title:'更新时间',width:130,align:'center',sortable:true},
	{field:'memo',title:'备注',width:350,align:'center',sortable:true}			
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
	    sortName:"created_time",
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