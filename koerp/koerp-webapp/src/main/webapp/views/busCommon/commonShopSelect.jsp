<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<style>
.toolbar{
	height:28px;
	overflow:hidden;
	border: 0px solid #D3D3D3;
	border-bottom:0px;
	background: #f3f3f3;
	padding-top:2px;
}
</style>

<div id="shopToolbar" class="toolbar">
	<a href="#" id="saveBotton" class="easyui-linkbutton" iconCls="icon-application_osx_get" plain="true" >提交</a>
</div>
<div style="height:291px;" >
	<table id="shopDataGrid"></table>
</div>



<script type="text/javascript">

var shopcolumns = 
   [[
	{field:'shopId',checkbox:true},
	{field:'shopCode',title:'店仓编码',width:80,align:'center',sortable:true},	
	{field:'shopName',title:'店仓名称',width:120,align:'center',sortable:true},
	{field:'address',title:'地址',width:180,align:'center',sortable:true},		
	{field:'contacts',title:'联系人',width:80,align:'center',sortable:true},
	{field:'tel',title:'联系方式',width:120,align:'center',sortable:true},						
	{field:"enabled",title:"状态", width:60,align:'center', formatter:function(value, row){
		return formatter(value, window.parent.isEnable); 
	}},		
	{field:'memo',title:'备注',width:160,align:'center',sortable:true}
]];

var currDialog;

$(function () { 
	
	//回显使用数据
	currDialog = $('#${param.dialogName}');
	var obj = currDialog.dialog('options');	

	$("#shopDataGrid").datagrid({	
	    nowrap:false,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    fitColumns:false,
	    queryParams:{
	    	enabled : true
	    },
	    url: "${api}/bus/shop/list",
	    loadFilter: function(data){			            				
	 		return data.entry;
		},
	    remoteSort:false,
	    sortName:"shopCode",
        sortOrder:"asc",	  
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	   
	    toolbar:'#shopToolbar',
	    columns:shopcolumns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"	   	    	   
	});
	
    //绑定保存按钮事件
	$("#saveBotton").click(function(){
		var row = $("#shopDataGrid").datagrid("getSelected");
		if(row!=null){
			var savefunc = obj["savefunc"];					
			if(typeof(savefunc) === "function") {
				var result = savefunc(row.shopId);
				if(!result.success){
					$.messager.alert('异常', result.message, 'error');
					return;
				}
				currDialog.dialog("destroy");
			}			
		}else{
			$.messager.alert('提示', "请选择一个店仓", 'info');
		}
	});
	
})

</script>