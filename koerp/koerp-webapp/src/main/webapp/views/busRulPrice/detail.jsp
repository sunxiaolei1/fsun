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
	    <span class="title" style="top: 69px;">关联商品价格</span>		    	
		<div style="height: 210px;width: 100%;">
			<div id="skutoolbar" style="display:none;">
				<%@include file="./detailskutoolbar.jsp"%>
			</div>
			<table id="rulSkuDataGrid"></table>
		</div>
	</div>
	<div class="fsun-wrap">
	    <span class="title" style="top: 310px;">关联店仓</span>		
		<div style="height: 171px;width: 100%;">
			<table id="rulShopDataGrid"></table>
		</div>
	</div>
</form>

<!-- datagrid可编辑单元格 -->
<%@include file="../busCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var rulSkuColumns = [[		    		
	{field:"skuId",checkbox:true},
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:140,align:"center"},
	{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.categoryCode); 
	}},			
	{field:"productType",title:"商品类型", width:80,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.productType); 
	}},
	{field:"marketPrice",title:"市场价", width:80,align:"center",formatter:numBaseFormat},
	//{field:"lastSalePrice",title:"上次修改售价", width:80,align:"center"},
	{field:"costPrice",title:"成本价", width:80,align:"center",formatter:numBaseFormat},
	{field:"salePrice",title:"销售价", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:numBaseFormat,
		editor:{
			type:'numberbox',
			options:{					
				min:0,
				precision:2						
			}
		}
	},
	{field:"vipPrice",title:"会员价", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:numBaseFormat,
		editor:{
			type:'numberbox',
			options:{					
				min:0,
				precision:2						
			}
		}
	},
	{field:"unitName",title:"单位",width:70,align:"center"}                
]];

var rulShopcolumns = [[
	{field:'shopId',checkbox:true},	  
	{field:"shopCode",title:"店仓编码",width:100,align:"center"},
	{field:"shopName",title:"店仓名称",width:160,align:"center"},
	{field:"enabled",title:"状态", width:60,align:'center', formatter:function(value, row){
		return formatter(value, window.parent.isEnable); 
	}},
	{field:"delete",title:"删除",width:80,align:"center", formatter: function(value, row, index){
		return '<a href="#" style="font-weight:bold;color:red;text-decoration:underline;" onclick="delOneShop(\''+ index +'\')">删除</a>';					
	}}
]];

var currSkusData = [];
var currRulShops = [];
var currOrderDetailDataGrid;
var currRulId = '';

$(function () { 
	  
	currRulId = '${rulId}';
	currOrderDetailDataGrid = $("#rulSkuDataGrid");
	
	currOrderDetailDataGrid.edatagrid({		
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,	    
	    idField:"sku",
	    sortName:"sku",
        sortOrder:"asc",	      
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
	    toolbar:"#skutoolbar",
	    columns:rulSkuColumns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true,
	    loadFilter:function(data) {     		   		  		
    		//排序拦截器
    		sortFilter($(this), data);
    		//分页拦截器
    		return pagerFilter($(this), data);
        }    
	});
	
	$("#rulShopDataGrid").datagrid({		
	    nowrap:false,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	    
	    remoteSort:false,
	    sortName:"shopCode",
        sortOrder:"asc",	  
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	   
	    fitColumns:true,	
	    columns:rulShopcolumns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"	   	    	   
	});
	
	//加载数据
	definedLoadData(currRulId,  $("#fm"));	
	
});

/**
 * 自定义加载数据
 */
function definedLoadData(rulId, $fm){
	$.ajax({
		type : "GET",
		url : "${api}/bus/rule/price/loadEntity/"+ rulId +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {								
			var rulPriceDto = result.entry;
			currSkusData = rulPriceDto.rulSkus;
			currRulShops = rulPriceDto.rulShops;		
			currOrderDetailDataGrid.datagrid("loadData", currSkusData);
			$("#rulShopDataGrid").datagrid("loadData", currRulShops);			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  
}




/**************************************        门店操作          *****************************************/


/**
 * 打开新增店仓界面
 */
function openAddView(){
	
	$("#rulShopDataGrid").datagrid("acceptChanges");	
	var notInShops = new Array();
	if(currRulShops!=null && currRulShops.length>0){
		$.each(currRulShops,function(){
			notInShops.push(this.shopId);
		});
	}
	
	$("<div></div>").dialog({
		id:"codesDialog",
	    title:"&nbsp;店仓选择列表",
	    width:"900px;",
	    height:"360px;",
	    closed:false,
	    cache:false,
	    params:{
	    	"notInShops": notInShops
	    },
	    savefunc: function(rows){	
	    	return addShops(rows);
		},
	    href: "${api}/bus/shop/toSelectList?dialogName=codesDialog",		   
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
 * 追加门店
 */
function addShops(rows){	
	var result = {
   		"success": true,
   		"message":"操作成功!"
   	};
		
	if(rows!=null && rows.length>0){
		$.each(rows, function(){
			var row = this;
			var newShop = {
				shopCode: row.shopCode,
				shopName: row.shopName,
				shopId: row.shopId,
				enabled: row.enabled 
			};
			currRulShops.push(newShop);
		});
		$("#rulShopDataGrid").datagrid("loadData", currRulShops);					
		return result;
	}	
	result.success = false;
	result.message = "操作未成功!";
    return result;
}

/**
 * 删除单个
 */
function delOneShop(rowIndex){
	$("#rulShopDataGrid").datagrid("deleteRow",rowIndex).datagrid("loadData", currRulShops);
}

/**
 * 获取配置信息
 */
function getRulPriceInfo(){
	
	var isValid = gridIsValidate("rulSkuDataGrid");
	if (!isValid){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}
	
	currOrderDetailDataGrid.datagrid("acceptChanges");
	$("#rulShopDataGrid").datagrid("acceptChanges");
	var rulPriceDto = {
		"rulId": currRulId,
		"rulSkus":currSkusData,
		"rulShops":currRulShops
	};	
	return rulPriceDto;
}

</script>