<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="补发单管理" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 79%;">
			<table id="ordersDataGrid"> 
			</table>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
	<shiro:hasPermission name="orders:view">  
		<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="view()">查看</a>
	</shiro:hasPermission>
	<a href="#" class="easyui-linkbutton" iconCls="icon-award_star_silver_3" plain="true" onclick="">处理标记</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
	<shiro:hasPermission name="orders:exportExcel">  
		<a href="#" class="easyui-linkbutton" iconCls="icon-page_white_excel" plain="true" onclick="exportExcel()">导出</a>
	</shiro:hasPermission>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
</div>

<script type="text/javascript">

var frozenColumns = 
	[[
		{field:'ck',checkbox:true},
		{field:'auditflag',title:'待审核原因',width:130, align:"center",sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.ecAuditflag); 
		}},
		{field:'sysorderid',title:'补发单号',width:130, align:"center",sortable:true},
		{field:'receivename',title:'收货人',width:100, align:"center",sortable:true},
   		{field:'extorderid',title:'外部单号',width:130, align:"center",sortable:true},
   		{field:'relationid',title:'原系统单号',width:130, align:"center",sortable:true}  		
   	]];

var columns = 
    [[
		{field:'companycode',title:'公司代码',width:100,align:'center',sortable:true},
		{field:'shopname',title:'所属店铺',width:130,align:'center',sortable:true},
		{field:"stockcode",title:"仓别代码",width:100,align:'center',sortable:true},		
		{field:'username',title:'买家用户名',align:'center',sortable:true, width:100},
		{field:"expressinfo",title:"物流信息",align:'center', width:100, formatter:function(value, row){
			var expressinfo = '暂无';
			if(row.expressno!=null && row.expressno!=''){
				expressinfo = '<a style="font-weight:bold;color:blue;" href="javascript:getLogistics('+ row.expressno +');">查看</a>';
			}			
			return expressinfo;
		}},
		{field:"systemstatus",title:"补发状态",width:100,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.ecSystemstatus); 
		}},
		{field:'mobileno',title:'手机号',align:'center',sortable:true, width:100},
		{field:'tel',title:'固定电话',align:'center',sortable:true, width:100},
		{field:"adddatetime",title:"创建时间",align:'center',sortable:true, width:130},
		{field:'expresscode',title:'补发快递',width:100,align:'center',sortable:true, formatter:function(value, row){
			return formatter(value, window.parent.expressCode); 			
		}},
		{field:'expressno',title:'运单号',width:130,align:'center',sortable:true},		
		{field:"remark",title:"备注",align:'left',sortable:true, width:260}
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
	    queryParams:{"ordermodel":70},
	    remoteSort:true,
	    sortName:"sysorderid",
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
	$('#gridDiv').height("79%");
	
	currDataGrid.datagrid('resize',{   
		height:($(window).height())   
    });
}


//查看物流信息
function getLogistics(expressno){
	$("<div></div>").dialog({
		id:"ordersDialog",
	    title:"&nbsp;物流信息",
	    width:"700px;",
	    height:"360px;",
	    closed:false,
	    cache:false,
	    href:"${api}/thirdparty/order/getLogistics/" + expressno,		   
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
		var url = "${api}/ecaftersale/reissue/toDetail/" + row.sysorderid +"?buttontype=reissueos";
		var icon = "icon-table";
		var subtitle = "补发单("+ row.sysorderid +")明细";
		parent.addTab(subtitle, url, icon);
	}else{
		$.messager.alert("提示","请选择一行要编辑的补发单！");
	}
	
}


</script>
</html>