<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<script type="text/javascript" src="${api}/jquery-easyui/jquery.edatagrid.js"></script> 

<style type="text/css">

.fsun-wrap {
	border: 1px solid #ccc;
	padding: 12px 5px 5px 5px;
	margin-top: 12px;
}

.fsun-wrap .title {
	position: absolute;
	color: #416AA3;
	font-weight: bold;
	left: 2%;
	line-height: 2em;
	padding: 0 1em;
	background-color: #fff;
}

</style>

<!-- 查询条件 -->
<%@include file="./detailtoolbar.jsp"%>

<form id="fm"> 
 	<div class="fsun-wrap" style="margin-top: 14px">
	    <span class="title" style="top: 69px;">缺货处理规则</span>		    	
		<div style="height: 130px;width: 100%;">
			<table id="ruleDataGrid"></table>
		</div>
	</div>
				
	<div class="fsun-wrap">
	    <span class="title" style="top: 230px;">指定快递设置</span>	 
	    <input type="checkbox" id="ispointexpressto" name="ispointexpressto" style="zoom:130%;" />		    
	    <label for="ispointexpressto" style="font-size:18;vertical-align:top;">当指定快递不可送达时，等待人工审核</label>    
	</div>
	<div class="fsun-wrap">
	    <span class="title" style="top: 285px;">退货理由设置</span>		
		<div style="height: 196px;width: 100%;">
			<table id="reasonDataGrid"></table>
		</div>
	</div>
</form>


<div id="reasonToolbar" style="display: none;">
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openAddView()">添加</a>
	<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="">删除</a> -->		
</div>

<script type="text/javascript">

var rulecolumns = [[		    		
	{field:"sortcode",title:"优先级",width:100, align:"center",
		editor:{
			type:"numberspinner",
			options:{
				required:true,
		        min:1,		        
		        precision:0
		    }	
		}
	},
	{field:"codename",title:"优先名称",width:460,align:"left"}	                
]];

var reasoncolumns = [[
	//{field:'ck',checkbox:true},	  
	{field:"codecode",title:"理由编码",width:80,align:"center"},
	{field:"sortcode",title:"排序",width:80,align:"left",hidden:true},
	{field:"codename",title:"退货理由",width:460,align:"left"},
	{field:"status",title:"状态",width:80,align:"center"},
	{field:"isenabled",title:"停用/启用",width:80,align:"center", formatter: function(value, row, index){	
		var operate = '<a style="font-weight:bold;color:blue;text-decoration:underline;" href="javascript:changeStatus(\''+ index +'\');">启用</a>';
		if(value!=null && value==1){
			operate = '<a style="font-weight:bold;color:red;text-decoration:underline;" href="javascript:changeStatus(\''+ index +'\');">停用</a>';
		}			
		return operate;
	}},	
	{field:"delete",title:"删除",width:80,align:"center", formatter: function(value, row, index){
		return '<a href="#" style="font-weight:bold;color:red;text-decoration:underline;" onclick="delOneReason(\''+ index +'\')">删除</a>';					
	}}
]];

var currShortStocks = [];
var currReturnReasons = [];
var currShopId = '';

$(function () { 
	  
	currShopId = '${shopid}';		
	
	$("#ruleDataGrid").edatagrid({		
	    nowrap:false,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	    
	    remoteSort:false,
	    sortName:"sortcode",
        sortOrder:"asc",	  
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	   
	    fitColumns:true,	    
	    columns:rulecolumns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"	    
	});
	
	$("#reasonDataGrid").datagrid({		
	    nowrap:false,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	    
	    remoteSort:false,
	    sortName:"sortcode",
        sortOrder:"asc",	  
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	   
	    fitColumns:true,	
	    toolbar:'#reasonToolbar',
	    columns:reasoncolumns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"	   	    	   
	});
	
	//加载数据
	definedLoadData(currShopId,  $("#fm"));	
	
});

/**
 * 自定义加载数据
 */
function definedLoadData(shopid, $fm){
	$.ajax({
		type : "GET",
		url : "${api}/ecorder/config/load/"+ shopid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {								
			var ecOrderConfigDto = result.entry;
			currShortStocks = ecOrderConfigDto.shortStocks;
			currReturnReasons = ecOrderConfigDto.returnReasons;		
			$("#ruleDataGrid").datagrid("loadData", currShortStocks);
			$("#reasonDataGrid").datagrid("loadData", currReturnReasons);
			
			var sysShop = ecOrderConfigDto.sysShop;			
			if(sysShop!=null && sysShop.ispointexpressto!=null){				
				$("#ispointexpressto", $fm).attr("checked", sysShop.ispointexpressto); 
			}			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  
}


/**
 * 打开新增退货理由界面
 */
function openAddView(){
	
	$("#reasonDataGrid").datagrid("acceptChanges");	
	var notInCodes = new Array();
	if(currReturnReasons!=null && currReturnReasons.length>0){
		$.each(currReturnReasons,function(){
			notInCodes.push(this.codecode);
		});
	}
	
	$("<div></div>").dialog({
		id:"codesDialog",
	    title:"&nbsp;退货理由列表",
	    width:"900px;",
	    height:"360px;",
	    closed:false,
	    cache:false,
	    params:{
	    	"codeType":"ECReturnReason",
	    	"notInCodes": notInCodes
	    },
	    savefunc: function(rows, codeType){	
	    	return addReasons(rows, codeType);
		},
	    href: "${api}/codes/toSelectList?dialogName=codesDialog",		   
	    modal:true,
	    minimizable:false,//定义是否显示最小化按钮。
        maximizable:false,//定义是否显示最大化按钮
        closable:true,
        resizable:true,//定义对话框是否可调整尺寸
        //collapsible: true,//是否可折叠的	        
        onLoad:function(){
        	$(this).window('center');
		},
        onClose:function(){
        	$(this).dialog("destroy");
        }
	});	 
}

/**
 * 改变状态
 */
function changeStatus(rowIndex){
	
	//通过索引获取行数据
	var row = $('#reasonDataGrid').datagrid('getRows')[rowIndex];
    if(row.isenabled!=null && row.isenabled==1){
    	row.status = "禁用";
    	row.isenabled = 0;
	}else{	
		row.status = "启用";
		row.isenabled = 1;
	}
	$("#reasonDataGrid").datagrid("refreshRow", rowIndex);
	
}

/**
 * 追加退货理由
 */
function addReasons(rows, codeType){	
	var result = {
   		"success": true,
   		"message":"操作成功!"
   	};
	if("ECReturnReason"==codeType){		
		if(rows!=null && rows.length>0){
			$.each(rows, function(){
				var row = this;
				var newReason = {
					isenabled: 1,
					status: "启用",
					codename: row.codeName,
					codecode: row.codeCode,
					sortcode: row.sortCode,
					shopid: currShopId
				};
				currReturnReasons.push(newReason);
			});
			$("#reasonDataGrid").datagrid("loadData", currReturnReasons);					
			return result;
		}
	}	
	
	result.success = false;
	result.message = "操作未成功!";
    return result;
}

/**
 * 删除单个退货理由
 */
function delOneReason(rowIndex){
	$("#reasonDataGrid").datagrid("deleteRow",rowIndex).datagrid("loadData", currReturnReasons);
}

/**
 * 获取配置信息
 */
function getConfigInfo(){
	
	var isValid = gridIsValidate("ruleDataGrid");
	if (!isValid){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}
	
	$("#ruleDataGrid").datagrid("acceptChanges");
	$("#reasonDataGrid").datagrid("acceptChanges");
	var ecOrderConfigDto = {
		"shortStocks":currShortStocks,
		"returnReasons":currReturnReasons,
		"sysShop":{
			"shopid": currShopId,
			"ispointexpressto": $("#ispointexpressto").prop("checked")
		}
	};	
	return ecOrderConfigDto;
}

</script>