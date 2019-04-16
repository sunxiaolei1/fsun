<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<script type="text/javascript"  src="<%=request.getContextPath()%>/jquery-easyui/commons/js/LodopFuncs.js"></script>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<a href="#" class="easyui-linkbutton" iconCls="icon-user_go" plain="true" onclick="toAddView()">创建寄提单</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-application_view_detail" plain="true" onclick="toDetailView()">查看</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-2012081511202" plain="true" onclick="toPrintOrderView()">打印</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
 -->

<%@include file="./operate/toPrintOrderView.jsp"%>

<script type="text/javascript">

//跳转至新增界面
function toAddView(){
	
	$("<div></div>").dialog({
        id: "ordersDialog",
        title: "关联寄存单",
        width: "96%",
        height: "90%",
        iconCls: "icon-chart_line",
        closed: false,
        cache: false,
        href: "${api}/bus/order/toSelectTakeOrderView",	       
        modal: true,
        minimizable: false,
        maximizable: false,
        closable: true,
        collapsible: false,
        resizable: true,
        buttons:[
         	{
         		text:"确定",iconCls:"icon-disk",
                handler: function (data) {                     	
                	transferToCreateTakeView(function(){
            			$('#ordersDialog').dialog("destroy");
                	});	            	
                }
             },
             {
                 text:"关闭",
                 iconCls:"icon-cancel",
                 handler:function(){
                 	$('#ordersDialog').dialog("destroy");
                 }
             }
         ],
        onClose: function () {
            $(this).dialog("destroy");
        }
    });
}

//跳转至编辑界面
function toDetailView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];
	var url = "${api}/bus/take/toDetailView?takeId="+ row.take_id +"&buttontype=busTake";
	var icon = "icon-application_view_detail";
	var subtitle = "寄提单("+ row.take_id +")详情";
	parent.addTab(subtitle, url, icon);	
}

//刷新DataGrid
function reflushDataGrid(){
	query();
}

//隐藏查询条件
function hide() {
	commonHide("queryDiv", "gridDiv", "100%", currDataGrid);
}

//展开查询条件
function show() {
	commonShow("queryDiv", "gridDiv", "85%", currDataGrid);
}

function toPrintOrderView(){
	var rows = currDataGrid.datagrid('getSelections');
	if (rows.length != 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = rows[0];
	if(row.take_status=="40" || row.take_status=="60"){
		$.messager.alert("提示","取消或关闭的单据不可打印！");
		return;
	}
	$.ajax({
		type : "GET",
		url : "${api}/bus/take/getInitData",
		data:{
			"takeId": row.take_id
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var busTakeDto = result.entry;
			if(busTakeDto!=null){			
				madeOrderView(busTakeDto, reflushDataGrid);			
			}		
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
}

</script>
