<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true" >
	<div title="基础商品列表" data-options="region:'center',split:true,collapsible:false,border:false" style="padding:5px;">
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

var frozenColumns = 
	[[
		{field:'sku_id',checkbox:true},
		{field:'sku',title:'SKU',width:80,align:'center',sortable:true},	
		{field:'goods_name',title:'商品名称',width:150,align:'center',sortable:true},
		{field:'brand_code',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.brandCode); 
		}},
		{field:'category_code',title:'商品分类',width:80,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.categoryCode); 
		}}			
   	]];

var columns = 
    [[				
		//{field:'en_name',title:'英文名称',width:100,align:'center',sortable:true},
		{field:'product_type',title:'商品类型',width:80,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.productType); 
		}},
		//{field:'bar_code',title:'条形码',width:120,align:'center',sortable:true},		
		{field:'property',title:'规格',width:120,align:'center',sortable:true},
		{field:'unit_name',title:'单位',width:60,align:'center',sortable:true},		
		{field:"origin_sale_price",title:"原销售价",width:80, align:'center',formatter:numBaseFormat},
		{field:"market_price",title:"分销价",width:80, align:'center',formatter:numBaseFormat},
		{field:"cost_price",title:"成本价",width:80, align:'center',formatter:numBaseFormat},
		{field:"sort_code",title:"排序码",width:80, align:'center',sortable:true},		
		{field:"is_enabled",title:"状态", width:60,align:'center', 
			formatter:function(value, row){
				return formatter(value, window.parent.isEnable); 
			},
			styler:function(value){
				if(value == 1){
					return 'color:green;font-weight:bold';
				}else{
					return 'color:red;font-weight:bold';
				}
			}
		},
		{field:'is_vip_appoint',title:'商品指定VIP',width:120,align:'center',sortable:true, 
			formatter:function(value, row){
				return formatter(value, window.parent.isTrue); 
			},
			styler:function(value){
				if(value == 1){
					return 'color:green;font-weight:bold';
				}else{
					return 'color:red;font-weight:bold';
				}
			}
		},
		{field:'is_channel_appoint',title:'商品指定渠道',width:120,align:'center',sortable:true,
			formatter:function(value, row){
				return formatter(value, window.parent.isTrue); 
			},
			styler:function(value){
				if(value == 1){
					return 'color:green;font-weight:bold';
				}else{
					return 'color:red;font-weight:bold';
				}
			}	
		},
		{field:"created_time",title:"创建时间",width:130, align:'center'},
		{field:"updated_time",title:"更新时间",width:130, align:'center'},
		{field:'memo',title:'备注',width:150,align:'center',sortable:true}		
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
	    sortName:"sort_code",
        sortOrder:"asc",
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