<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div border="false" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
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
	<span style="float:right;margin-top:2px;margin-bottom:2px;">	
		<input id="skuSearcher" class="easyui-searchbox" style="width:350px">
	</span>
    <!-- 操作按钮及事件  -->
	<%@include file="./indextoolbar.jsp"%>
</div>

<!-- datagrid可编辑单元格 -->
<%@include file="../../../busCommon/soSkuEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currDataGrid = $("#ordersDataGrid");
var currDetailData = [];

$(function() {
	
	//初始化搜索框
	$('#skuSearcher').searchbox({
	     prompt: '输入商品名称、SKU筛选...',
	     searcher: function (value, name) {
	    	 currDataGrid.datagrid({searchValue: value}).datagrid("loadData", currDetailData);
	     }
	 });
		
	$.ajax({
		type : "GET",
		url : "${api}/base/header/field/${queryType}",   
		dataType : "json",
		success : function(result) {
			if(result.status){
				var columns = result.entry.columns;	
				initColumns(columns);
				currDataGrid.datagrid({
					width:500,
					height:250,
				    nowrap:false,
				    striped:true,
				    border:true,
				    fit:true,//自动大小
				    queryParams:{},
				    remoteSort:false,
				    sortName:"sku",
			        sortOrder:"asc",
				    singleSelect:true,//是否单选
				    pagination:true,
			        pageNumber:currPageNumber,
			        pageSize: currPageSize,
				    pageList: GLOBAL_PAGE_SIZE_LIST,
				    rownumbers:true,//行号
				    //remoteFilter:true,
				    showFooter:true,
				    fitColumns:false,
				    columns:columns,
				    loadMsg:"数据加载中请稍后……",
				    emptyMsg:"没有符合条件的记录",
				    toolbar:'#tools',
				    loadFilter:function(data) {   				    	 	       		
			    		//排序拦截器
			    		sortFilter($(this), data);		
			    	    //分页拦截器
			    	    var data = pagerFilter($(this), data); 
						return data; 				    	
			        },
				    onDblClickRow:function(rowIndex, rowData){
				    	toDetailView(rowData);
				    }    
				});
			}			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
});


</script>
</html>