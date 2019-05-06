<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="客户列表"  border="false" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
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

var columns = 
    [[
		{field:'id',checkbox:true},
		{field:'operate',title:'操作',width:100,align:'center',sortable:true, 
			formatter: function(value, row, index){	
				if(row.id!=null){
					return commonAssemBottonHtml('toUnpaidView', index, '挂账结款', 'icon-money');	
				}													
			}
		},		
		{field:'customer_code',title:'客户编号',width:110,align:'center',sortable:true},
		{field:'customer_type',title:'客户类型',width:80,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.busCustomerType); 
		}},
		{field:'customer_name',title:'客户名称',width:150,align:'center',sortable:true},
		{field:"arrears_price",title:"挂账欠款(元)",width:100, align:'center',formatter:numBaseFormat,
			styler:function(value){
				if(value == 0){
					return 'color:green;font-weight:bold';
				}else{
					return 'color:red;font-weight:bold';
				}
			}
		},
		{field:'tel',title:'手机号',width:110,align:'center',sortable:true},
		{field:'salesman',title:'销售代表',width:100,align:'center',sortable:true, formatter:function(value, row){
			return row.salesman_name; 
		}},						
		{field:"credit_price",title:"信用额度(元)",width:80, align:'center',formatter:numBaseFormat,
			styler:function(value){
				if(value > 0){
					return 'color:green;font-weight:bold';
				}else{
					return 'color:red;font-weight:bold';
				}
			}
		},
		{field:"enabled",title:"状态", width:80,align:'center', 
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
		{field:'memo',title:'备注',width:200,align:'center',sortable:true}		
	]];

var currDataGrid;
var footerFirstColumn = "customer_code";

$(function() {
	
	currDataGrid = $("#ordersDataGrid");
	currDataGrid.datagrid({
		view:footerStyleView,
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    queryParams:{firstColumn: footerFirstColumn},
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