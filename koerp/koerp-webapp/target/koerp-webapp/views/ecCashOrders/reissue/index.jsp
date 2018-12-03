<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="补款单管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 73%;">
			<table id="ordersDataGrid"> 
			</table>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
	<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="">修改</a>	
	<a href="#" class="easyui-linkbutton" iconCls="icon-award_star_silver_3" plain="true" onclick="">补款确认</a>	
	<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>		
	<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_undo" plain="true" onclick="">取消补款</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="">添加备注</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportExcel()">导出</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
</div>

<script type="text/javascript">

Array.prototype.contains = function (obj) {
  	var i = this.length;
  	while (i--) {
    	if (this[i] === obj) {
      	return true;
    	}
  	}
  	return false;
}

var frozenColumns = 
	[[
		{field:'ck',checkbox:true},			
		{field:'cashid',title:'补款单号',width:230, align:"center",sortable:true},
   		{field:'extorderid',title:'外部单号',width:130, align:"center",sortable:true},
   		{field:"salestatus",title:"销售状态",width:80,align:'center',sortable:true,formatter:function(value, row){
			return formatter(value, window.parent.ecSalestatus);
		}},  	
		{field:"officialcashorder",title:"官网补款单",align:'center', width:80, formatter:function(value, row){
			var orderinfo = '暂无';
			if(row.extorderid!=null && row.extorderid!=''){
				orderinfo = '<a style="font-weight:bold;color:blue;" href="javascript:getOrderInfo('+ row.extorderid +');">查看</a>';
			}			
			return orderinfo;
		}},
   		{field:'sysorderid',title:'关联订单号',width:130, align:"center",sortable:true}  		
   	]];

var columns = 
    [[
		{field:'companycode',title:'公司代码',width:80,align:'center',sortable:true},
		{field:'shopname',title:'所属店铺',width:130,align:'center',sortable:true},
		{field:"stockcode",title:"仓别代码",width:80,align:'center',sortable:true},
		{field:'username',title:'买家用户名', width:130,align:'center',sortable:true},
		{field:"ordertype",title:"订单类型",width:80,align:'center',sortable:true,formatter:function(value, row){
			return formatter(value, window.parent.ecOrdertype);
		}},
		{field:"refundcashstatus",title:"补款状态",width:80,align:'center',sortable:true,formatter:function(value, row){
			return formatter(value, window.parent.ecRefundcashstatus);
		}},
		{field:"orderprice",title:"订单金额",width:80,align:'center',sortable:true,formatter:numBaseFormat},
		{field:"payprice",title:"实付金额",width:80,align:'center',sortable:true,formatter:numBaseFormat},
		{field:"refundprice",title:"应补金额",width:80,align:'center',sortable:true,formatter:numBaseFormat},
		{field:"integralamount",title:"积分",width:80,align:'center',sortable:true,formatter:numBaseFormat},
		{field:"refundreason",title:"补款原因",width:100,align:'center',sortable:true,formatter:function(value, row){
			return formatter(value, window.parent.ecRefundreason);
		}},
		{field:"remark",title:"备注",align:'center',sortable:true, width:180},
		{field:"returnmode",title:"补款方式",width:80,align:'center',sortable:true,formatter:function(value, row){
			return formatter(value, window.parent.ecReturnmode);
		}},
		{field:"bankaccount",title:"补款账户",align:'center',sortable:true, width:140},
		{field:"realname",title:"真实姓名",align:'center',sortable:true, width:80},
		{field:"bankname",title:"开户银行",align:'center',sortable:true, width:140},		
		{field:"addcname",title:"创建人",align:'center',sortable:true, width:80},
		{field:"adddatetime",title:"创建时间",align:'center',sortable:true, width:130},		
		{field:"modyfycname",title:"修改人",align:'center',sortable:true, width:80},
		{field:"modifydatetime",title:"修改时间",align:'center',sortable:true, width:130}
				
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
	    queryParams:{"isrefund":0},
	    remoteSort:true,
	    sortName:"adddatetime",
        sortOrder:"desc",
	    //idField:"sysorderid",
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
	    },
        rowStyler:function(index,row){
        	var rowStyle = "";
        	var flowstatus = row.flowstatus;
        	if(flowstatus == -1){
 				rowStyle = rowStyle + "background-color:#FFA07A;";
			}
        	return rowStyle;
		},
		onBeforeLoad:function(param){
			var sortColumns = ["extorderid","sysorderid","cashid","companycode","shopname",
				               "stockcode","refundcashstatus","refundprice","refundreason",
				               "remark","returnmode","bankaccount","realname","bankname",
				               "addcname","adddatetime","modyfycname","modifydatetime"];
            if(sortColumns.contains(param.sort)){
            	param.sort = ("c."+param.sort);
            }else{
            	param.sort = ("o."+param.sort);
            }
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
	$('#gridDiv').height("73%");
	
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
		var url = "${api}/ecorder/toDetail/" + row.sysorderid +"?buttontype=baseos";
		var icon = "icon-table";
		var subtitle = "销售单("+ row.sysorderid +")明细";
		parent.addTab(subtitle, url, icon);
	}else{
		$.messager.alert("提示","请选择一行要编辑的补款单！");
	}	
	
}


function getOrderInfo(orderid){
	$.messager.alert("提示","开发未完成！");
}

</script>
</html>