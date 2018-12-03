<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="促销活动列表" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 85%;">
			<table id="ordersDataGrid"> 
			</table>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
	<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="view()">查看</a>		
	<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	  	
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
</div>

<script type="text/javascript">

var frozenColumns = 
	[[
		{field:'promotionsid',checkbox:true},
		{field: "selected", title: "操作", width: 80, align: "center",
			formatter: function(value, row, index){	
				if(row.status!=null){
					if(row.status==10 || row.status==30){						
						return commonAssemBottonHtml('enablePro', index, '启用', 'icon-lock_open');
					}else if(row.status==20){						
						return commonAssemBottonHtml('disablePro', index, '暂停', 'icon-lock_start');						
					}
				}
												
			}
		},
		{field:'promotionsname',title:'活动名称',width:200,align:'center',sortable:true},
		{field:"status",title:"活动状态",width:80,align:'center',sortable:true, 
			styler: function(value, rowData, rowIndex){
				if(value==20){
					return 'font-weight:bold;color:green;';
				}else if(value==30){
					return 'font-weight:bold;color:red;';
				}          	
            },
			formatter:function(value, row){
				return formatter(value, window.parent.ecPromotionsStatus); 
			}
		}
		
   	]];

var columns = 
    [[		
		{field:'companycode',title:'公司代码',width:100,align:'center',sortable:true},
		{field:'shopid',title:'所属店铺',width:130,align:'center',sortable:true, formatter:function(value, row){
			return row.shopname; 			
		}},
		//{field:"stockcode",title:"仓别代码",width:100,align:'center',sortable:true},		
		{field:'orderfrom',title:'订单来源',width:80,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.ecOrderFrom); 			
		}},
		{field:'promotionstype',title:'活动类型',width:80,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.ecPromotionsType); 			
		}},
		{field:"prioritycode",title:"优先级",width:80,align:'center',sortable:true},	
		{field:"startdatetime",title:"开始时间",align:'center',sortable:true, width:130},
		{field:"enddatetime",title:"停止时间",align:'center',sortable:true, width:130},
		{field:"originaldatetime",title:"原结束时间",align:'center',sortable:true, width:130},		
		{field:'giftorders',title:'活动订单数',width:100,align:'center',sortable:true},
		{field:'addcname',title:'创建人',align:'center',sortable:true, width:100}	
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
	    sortName:"startdatetime",
        sortOrder:"desc",
	    //idField:"refundorderid",
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
	    onDblClickRow:function(rowIndex, rowData){
	    	$(this).datagrid("unselectAll");
			$(this).datagrid("selectRow",rowIndex);
			view();
	    }
	});
});


//刷新DataGrid
function reflushDataGrid(){
	query();
}

//隐藏查询条件
function hide() {
	$("#queryDiv").slideUp();
	$('#gridDiv').height("100%");
	
    currDataGrid.datagrid('resize',{   
        height:($(window).height())   
    });
}

//展开查询条件
function show() {
	$("#queryDiv").slideDown();
	$('#gridDiv').height("85%");
	
	currDataGrid.datagrid('resize',{   
		height:($(window).height())   
    });
}

//查询明细
function view(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length > 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = currDataGrid.datagrid('getSelected');
	if (row) {
		var url = "${api}/ecpromotions/toDetail/" + row.promotionsid;
		var icon = "icon-table";
		var subtitle = "促销活动("+ row.promotionsname +")明细";
		parent.addTab(subtitle, url, icon);
	}else{
		$.messager.alert("提示","请选择一行要编辑的活动！");
	}
}

/**
 * 启用活动
 */
function enablePro(rowIndex){
	var rowData = currDataGrid.datagrid('getRows')[rowIndex];
	var ecorderInfo = {
	   		"promotionsid": rowData.promotionsid,
	   		"status": 20
	   	}
	changeStatus(ecorderInfo);
}

/**
 * 禁用活动
 */
function disablePro(rowIndex){
	var rowData = currDataGrid.datagrid('getRows')[rowIndex];
	var ecorderInfo = {
   		"promotionsid": rowData.promotionsid,
   		"status": 30
   	}
	changeStatus(ecorderInfo);
}


/*****************************       内部方法    把       **********************************/

/**
 * 改变活动状态
 */
function changeStatus(ecorderInfo){
	$.messager.confirm("确认", "是否确认执行该操作？", function (sure) {
        if (sure) {        	       	
        	commonPost("${api}/ecpromotions/status", JSON.stringify(ecorderInfo), null, reflushDataGrid);
        }
	});
}

</script>
</html>