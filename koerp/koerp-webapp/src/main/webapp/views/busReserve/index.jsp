<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true">
	<div title="经销商备用金列表" data-options="region:'center',split:true,collapsible:false,border:false" style="padding:5px">
		<table id="ordersDataGrid" ></table>		
	</div>
</div>

<div id="tools" style="display: none;">
	<span style="float:right;">	
		<input id="keywordsSearcher" class="easyui-searchbox" style="width:350px" />
	</span>    
    <!-- 操作按钮及事件  -->
	<%@include file="./indextoolbar.jsp"%>
</div>

<script type="text/javascript">

var columns = 
    [[
		{field:'id',checkbox:true},
		{field:'operate',title:'操作',width:80,align:'center',sortable:true, 
			formatter: function(value, row, index){	
				if(row.id!=null){
					return commonAssemBottonHtml('toDetailView', index, '充值', 'icon-money');	
				}													
			}
		},
		{field:'customer_code',title:'客户编号',width:100,align:'center',sortable:true},
		{field:'customer_name',title:'客户名称',width:140,align:'center',sortable:true},		
		{field:'tel',title:'手机号',width:120,align:'center',sortable:true},	
		{field:"enable_reserve",title:"备用金余额",width:100, align:'center',formatter:numBaseFormat,
			styler:function(value){
				if(value > 0){
					return 'color:green;font-weight:bold';
				}else{
					return 'color:red;font-weight:bold';
				}
			}
		},
		{field:"credit_price",title:"信用额度(元)",width:100, align:'center',formatter:numBaseFormat,
			styler:function(value){
				if(value > 0){
					return 'color:green;font-weight:bold';
				}else{
					return 'color:red;font-weight:bold';
				}
			}
		},
		{field:"enabled",title:"状态", width:70,align:'center', 
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
		{field:'memo',title:'备注',width:360,align:'center',sortable:true}		
	]];

var currDataGrid = $("#ordersDataGrid");
var footerFirstColumn = "customer_code";

$(function() {
	
	//初始化搜索框
	$('#keywordsSearcher').searchbox({
         prompt: '输入客户编号,客户名称,手机号...',
         searcher: function (value, name) {       	 
        	 var queryParams = currDataGrid.datagrid("options").queryParams;		
       		 queryParams.q = value;		
       		 currDataGrid.datagrid("clearSelections");
       		 currDataGrid.datagrid("reload");
         }
     });
		
	currDataGrid.datagrid({
		view:footerStyleView,
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    queryParams:{
	    	firstColumn: footerFirstColumn
	    },
	    url: "${api}/bus/reserve/findPage",
	    remoteSort:true,
	    sortName:"customer_code",
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
	    }
	    
	});
});


</script>
</html>