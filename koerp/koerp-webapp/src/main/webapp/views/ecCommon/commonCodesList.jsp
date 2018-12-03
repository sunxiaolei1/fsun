<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<style>
.toolbar{
	height:30px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	border-bottom:0px;
	background: #f3f3f3;
	padding-top:2px;
}
</style>

<div id="codesToolbar" class="toolbar">
	<a href="#" id="saveBotton" class="easyui-linkbutton" iconCls="icon-application_osx_get" plain="true" >提交</a>
</div>
<div style="height:291px;" >
	<table id="codesDataGrid"></table>
</div>



<script type="text/javascript">

var codescolumns = 
   [[
	{field:'codesId',checkbox:true},
	{field:"codeType",title:"代码类别",width:170,align:"center"},
	{field:"codeCode",title:"代码",width:100,align:"center"},
	{field:"codeName",title:"名称",width:140,align:"center"},
	{field:"sortCode",title:"排序",width:80,align:"center"},
	{field:"userDefine1",title:"自定义1",width:100,align:"center"},
	{field:"userDefine2",title:"自定义2",width:100,align:"center"},
	{field:"userDefine3",title:"自定义3",width:100,align:"center"}
]];

var currCodeType = "";
var currNotInCodes = [];
var currDialog;

$(function () { 
	
	//回显使用数据
	currDialog = $('#${param.dialogName}');
	var obj = currDialog.dialog('options');		
	var queryParams = obj["params"];		
	if(typeof(queryParams) != "undefined") {
		currCodeType = queryParams.codeType;
		currNotInCodes = queryParams.notInCodes;
	}

	$("#codesDataGrid").datagrid({	
	    nowrap:false,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    fitColumns:false,	
	    remoteSort:false,
	    sortName:"sortCode",
        sortOrder:"asc",	  
	    singleSelect:false,//是否单选	    
	    rownumbers:true,//行号	   
	    //toolbar:'#codesToolbar',
	    columns:codescolumns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"	   	    	   
	}).datagrid("loadData", formatData(getOriginData(currCodeType), currNotInCodes));
	
    //绑定保存按钮事件
	$("#saveBotton").click(function(){
		var rows = $("#codesDataGrid").datagrid("getSelections");
		if(rows!=null){
			var savefunc = obj["savefunc"];					
			if(typeof(savefunc) === "function") {
				var result = savefunc(rows, currCodeType);
				if(!result.success){
					$.messager.alert('异常', result.message, 'error');
					return;
				}
				currDialog.dialog("destroy");
			}			
		}
	});
	
})

/**
 * 格式化列表加载数据
 */
function formatData(originCodes, currNotInCodes){
	var newCodes = [];
	$.each(originCodes, function(){
		var codeCode = this.codeCode;
		if(codeCode!=''){
			var isTrue = true;
			for(var i=0; i<currNotInCodes.length; i++){
				var notCode = currNotInCodes[i];
				if(codeCode==notCode){
					isTrue = false;
					break;
				}
			}
			if(isTrue){
				newCodes.push(this);
			}
		}
	});
	return newCodes;
}

/**
 * 获取原始数据
 */
function getOriginData(codeType){
	var originCodes = [];
	if(codeType=="ECReturnReason"){
		originCodes = window.parent.ecReturnReasonData;
	}
	return originCodes;
}

</script>