<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true" >	
	<div title="会员卡列表" data-options="region:'center',split:true,collapsible:false,border:false" style="padding:5px">
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

var columns = 
    [[
		{field:'id',checkbox:true},
		{field:'operate',title:'操作',width:80,align:'center',sortable:true, 
			formatter: function(value, row, index){	
				if(row.id!=null){
					return commonAssemBottonHtml('toRachargeView', index, '充值', 'icon-money');	
				}													
			}
		},	
		{field:'customer_code',title:'所属客户',width:130,align:'center',sortable:true, formatter:function(value, row){
			return row.customer_name; 
		}},						
		{field:'card_type',title:'卡级别',width:80,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.vipCardType); 
		}},
		{field:'card_no',title:'卡号',width:130,align:'center',sortable:true},
		{field:"enable_price",title:"可用余额",width:100, align:'center',formatter:numBaseFormat,
			styler:function(value){
				if(value == 0){
					return 'color:red;font-weight:bold';
				}else{
					return 'color:green;font-weight:bold';
				}
			}	
		},
		{field:"gift_price",title:"赠送金额",width:100, align:'center',formatter:numBaseFormat,
			styler:function(value){
				if(value == 0){
					return 'color:red;font-weight:bold';
				}else{
					return 'color:green;font-weight:bold';
				}
			}
		},
		{field:'mobile',title:'手机号',width:120,align:'center',sortable:true},					
		{field:"cn_name",title:"持卡人",width:80, align:'center'},
		{field:"vip_time",title:"开卡时间",width:130, align:'center'},		
		{field:"neg_balance",title:"允许负余额",width:80, align:'center', formatter:function(value, row){
			if(row.card_type!=null && row.card_type!=''){
				var neg_balance = '否';
				if(row.card_type==2 || row.card_type==3){
					neg_balance = '是';
				}
				return neg_balance;
			}
			return "";			
		}},
		{field:"enabled",title:"状态", width:60,align:'center', 
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
		{field:'memo',title:'备注',width:150,align:'center',sortable:true}		
	]];

var currDataGrid;
var footerFirstColumn = "customer_name";

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