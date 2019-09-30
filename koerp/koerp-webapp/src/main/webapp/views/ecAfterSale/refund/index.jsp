<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="退货单管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
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
	<a href="#" id="order_detail_view" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="view()">查看</a>	
	<a href="#" id="order_handle_sign" class="easyui-linkbutton" iconCls="icon-award_star_silver_3" plain="true" onclick="toHandleSignView()">处理标记</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	  
	<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportExcel()">导出</a>	
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
</div>

<script type="text/javascript">

var frozenColumns = 
	[[
		{field:'refundsysorderid',checkbox:true},
		{field:'refundorderstatus',title:'处理标记',width:130, align:"center",sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.ecRefundorderstatus); 
		}},
		{field:"oldorderremark",title:"原订单备注",align:'center', width:100, formatter:function(value, row){
			return '<a style="font-weight:bold;color:blue;" href="javascript:getRemark('+ row.sysorderid +');">查看原订单备注</a>';
		}},
		{field:'refundorderid',title:'退货单号',width:130, align:"center",sortable:true},
   		{field:'extorderid',title:'外部单号',width:130, align:"center",sortable:true},
   		{field:'sysorderid',title:'原系统单号',width:130, align:"center",sortable:true}   		  
   	]];

var columns = 
    [[
		{field:'companycode',title:'公司代码',width:100,align:'center',sortable:true},
		{field:'shopname',title:'所属店铺',width:130,align:'center',sortable:true},
		{field:"stockcode",title:"仓别代码",width:100,align:'center',sortable:true},		
		{field:'receivename',title:'原订单收货人',align:'center',sortable:true, width:100},
		{field:"refundstatus",title:"退单状态",width:100,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.ecRefundstatus); 
		}},
		{field:"stockstatus",title:"仓储状态",width:100,align:'center',sortable:true,formatter:function(value, row){
			return formatter(value, window.parent.ecStockstatus);
		}},
		{field:'expresscode',title:'退货快递',width:100,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.expressCode); 			
		}},
		{field:'expressno',title:'快递单号',width:130,align:'center',sortable:true},
		{field:'iscreatemoney',title:'是否创建补退款单',width:100,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.isTrue); 			
		}},
		{field:'isallreturn',title:'是否整单退',width:80,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.isTrue); 			
		}},
		{field:'addcname',title:'创建人',align:'center',sortable:true, width:100},
		{field:"adddatetime",title:"创建时间",align:'center',sortable:true, width:130},
		{field:"remark",title:"备注",align:'center',sortable:true, width:230}
	
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
	    sortName:"refundorderid",
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
	    },
	    onLoadSuccess:function(param){	    	
	    	buttonsEnabledValidator($(this), ["order_detail_view", "order_handle_sign"], ListModuleType.AFTERSALE_REFUND);	    		    	
	    },
	    onSelect:function(rowIndex, rowData){	    	
	    	buttonsEnabledValidator($(this), ["order_detail_view", "order_handle_sign"], ListModuleType.AFTERSALE_REFUND);	    		    	
	    },
	    onUnselect:function(rowIndex, rowData){    	   		
	    	buttonsEnabledValidator($(this), ["order_detail_view", "order_handle_sign"], ListModuleType.AFTERSALE_REFUND);			    		    	
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

//查看原订单备注
function getRemark(sysorderid){
	$("<div></div>").dialog({
		id:"ordersDialog",
	    title:"&nbsp;订单备注",
	    width:"700px;",
	    height:"360px;",
	    closed:false,
	    cache:false,
	    href:"${api}/ecorder/operate/toPreviewRemarkView/" + sysorderid,		   
	    modal:true,
	    minimizable:false,//定义是否显示最小化按钮。
        maximizable:false,//定义是否显示最大化按钮
        closable:true,
        resizable:true,//定义对话框是否可调整尺寸
        collapsible: true,//是否可折叠的	        
        onLoad:function(){
        	$('#ordersDialog').window('center');
		},
		buttons:[
            {
                text:"关闭",
                iconCls:"icon-cancel",
                handler:function(){
                	$('#ordersDialog').dialog("destroy");
                }
            }
        ],
        onClose:function(){
        	$(this).dialog("destroy");
        }
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
		var url = "${api}/ecaftersale/refund/toDetail/" + row.refundorderid +"?buttontype=refundos";
		var icon = "icon-table";
		var subtitle = "退货单("+ row.refundorderid +")明细";
		parent.addTab(subtitle, url, icon);
	}else{
		$.messager.alert("提示","请选择一行要编辑的退货单！");
	}
	
}

/**
 * 跳转至处理标记页面
 */
function toHandleSignView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length==0) {
		$.messager.alert("提示","请选择至少一行数据！");
		return;
	}	
	var refundorderids = [];
	$.each(rows, function(){
		refundorderids.push(this.refundorderid);
	});
	
	var url = "${api}/ecaftersale/refund/toHandleSignView?refundorderids="+refundorderids.join(",");	
	commonDialog("ordersDialog", "处理标记", "50%", "42%", url, "icon-award_star_silver_3");
}


</script>
</html>