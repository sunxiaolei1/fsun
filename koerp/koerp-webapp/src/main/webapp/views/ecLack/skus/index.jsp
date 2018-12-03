<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../headerJS.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/datagrid-detailview.js"></script>
	
<div class="easyui-layout" style="width:100%;height:100%;"> 
	<div title="缺货商品管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">		
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 85%">
			<table id="skusDataGrid"></table>
		</div>	
	</div>	
</div>
						

<script type="text/javascript">

var lastExpandRowIndex = '';
var columns = 
    [[
		{field:'companycode',title:'公司代码',width:90,align:'center',sortable:true},
		{field:'materialcode',title:'货号',width:140,align:'center',sortable:true},
		{field:'sku',title:'SKU',width:120,align:'center',sortable:true},
		{field:"materialname",title:"商品名称",width:360,align:'center',sortable:true},
		{field:'materialproperty',title:'属性',align:'center',sortable:true, width:170},
		{field:'qty',title:'缺货数量',align:'center', width:100,formatter:numBaseFormat},
		{field:'ordernum',title:'缺货订单数',align:'center', width:100,formatter:numBaseFormat}
	]];
	
var currDataGrid;

$(function() {
	
	currDataGrid = $("#skusDataGrid");
	currDataGrid.datagrid({
		width:"auto",
		height:"460",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    remoteSort:true,
	    sortName:"sku",
        sortOrder:"asc",
	    //idField:"sku",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,	    
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	   // toolbar:'#toolbar',	   
	    selectOnCheck: true,
	    checkOnSelect: true,
	    view: detailview,
   		detailFormatter:function(index,row){  
            return '<div id="detailForm-'+index+'"></div>';  
        }, 
   		onBeforeLoad: function (param){
   		 	expandedOrderIds = new Array();
   		},
        onExpandRow: function(index,row){ 
	        if(lastExpandRowIndex!=index){
	        	if(lastExpandRowIndex!=''){
	        		$(this).datagrid('collapseRow', lastExpandRowIndex);
	        	}	        	
 		    }		        			        	
			if(!hasExpand(row)){
				
				var queryParams = initQueryParams();
				var shopid = queryParams.shopid;
				var companycode = queryParams.companycode;
				$('#detailForm-'+index).panel({  
	                doSize:true,  
	                border:false,  
	                cache:false,  
	               	href:'${api}/eclack/skus/toDetail?currIndex='+ index +'&sku='+ row.sku 
	               		+'&materialname='+ encodeURI(encodeURI(row.materialname))
	               		+'&materialproperty='+ encodeURI(encodeURI(row.materialproperty))
	  					+'&materialcode='+ row.materialcode +'&shopid='+ shopid +'&companycode='+ companycode,
	                onLoad:function(){
	                    currDataGrid.datagrid('selectRow',index);
	                    currDataGrid.datagrid('fixDetailRowHeight',index);
	                }  
	            });
			} 				
            currDataGrid.datagrid('fixDetailRowHeight',index);
            lastExpandRowIndex = index;
        }
	});
	
});

//刷新DataGrid
function reflushDataGrid(){
	query();
}

//展开过的订单id
var expandedOrderIds = new Array();

//判别该订单是否展开过
function hasExpand(row){
	var sku2code = row.sku + "-" + row.materialcode;
	for(var i=0; i<expandedOrderIds.length; i++){
		if(expandedOrderIds[i]==sku2code){					
			return true;
		}
	}
	expandedOrderIds.push(sku2code);
	return false;
}

</script>
</html>