<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="shopToolbar" class="datagrid-toolbar" style="display: none;padding: 5px;"> 
    <input type="text" id="shopQ" style="width: 150px;" class="easyui-textbox" data-options="prompt:'输入门店编码或名称检索...'"/>
    <a href="#" class="easyui-linkbutton" iconCls="icon-2012092109942" onclick="shopSearch()">查询</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-20130406015709810_easyicon_net_16" onclick="shopClear()">重置</a>
    <div style="clear: both"></div>
</div>

<div id="companyToolbar" class="datagrid-toolbar" style="display: none;padding: 5px;"> 
    <input type="text" id="companyQ" style="width: 150px;" class="easyui-textbox" data-options="prompt:'输入公司代码或名称检索...'"/>
    <a href="#" class="easyui-linkbutton" iconCls="icon-2012092109942" onclick="companySearch()">查询</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-20130406015709810_easyicon_net_16" onclick="companyClear()">重置</a>
    <div style="clear: both"></div>
</div>
	

<script type="text/javascript">

$(function() {
	initCompanyGrid();
	initShopGrid();	
});

/***************************       初始化查询条件          *****************************/

function initShopGrid() {
	$('#shopid').combogrid({
		prompt:'全部',
    	panelWidth:500,
    	panelHeight:300,
        idField: 'shopid', //ID字段
        textField: 'shopname', //显示的字段
        method: 'post',    
        multiple: false,
	    fitColumns: true,  
	    striped: true,  
	    pagination : true,//是否分页  
	    rownumbers:true,//序号  
	    collapsible:false,//是否可折叠的  
	    remoteSort:true,
	    editable:false,  
	    sortName:"shopid",
        sortOrder:"desc",
        pageSize: GLOBAL_PAGE_SIZE,
        pageList: GLOBAL_PAGE_SIZE_LIST,
        toolbar:'#shopToolbar',  
        columns: [[
            {field: 'ck', checkbox: true},
            {field: "companycode", title: "公司代码", width: 30, align: "center", sortable:true},
            {field: "shopcode", title: "门店编码", width: 80, align: "center", sortable:true},
            {field: "shopname", title: "门店名称", width: 100, align: "center", sortable:true}
        ]],
        loadMsg: "数据加载中请稍后……",
        emptyMsg: "没有符合条件的记录",
        onShowPanel: function () {
        	$('#shopid').combogrid('grid').datagrid('options').url = '${api}/shop/findShopPageList';
        	$('#shopid').combogrid('grid').datagrid('reload');
        },
        onSelect:function(rowIndex, rowData){
        	$("#shopQ").textbox("setValue","");
        }
    });
}

function shopSearch() {
	var q = $("#shopQ").val();
	var shopParams = $("#shopid").combogrid("options").queryParams;
	shopParams.q = q;
	$('#shopid').combogrid('grid').datagrid('reload');
}

function shopClear() {
	$("#shopQ").textbox("setValue","");
	$("#shopid").combogrid('clear');
	var shopParams = $("#shopid").combogrid("options").queryParams;
	shopParams.q = '';
	$('#shopid').combogrid('grid').datagrid("reload");	
}


function initCompanyGrid() {
	$('#companycode').combogrid({
		prompt:'全部',
    	panelWidth:500,
    	panelHeight:300,
        idField: 'companycode', //ID字段
        textField: 'companyname', //显示的字段
        method: 'post',
        queryParams: {"isenable": true},
        multiple: false,
        fitColumns: true,
        striped: true,
        pagination: true,//是否分页
        rownumbers: true,//序号
        collapsible: false,//是否可折叠的
        remoteSort:true,
        editable:false,  
	    sortName:"companycode",
        sortOrder:"desc",
        toolbar:'#companyToolbar', 
        pageSize: GLOBAL_PAGE_SIZE,
        pageList: GLOBAL_PAGE_SIZE_LIST,
        columns: [[
            {field: 'ck', checkbox: true},
            {field: "companycode", title: "公司代码", width: 40, align: "center", sortable:true},
            {field: "companyname", title: "公司名称", width: 80, align: "center", sortable:true},
            {field: "printtitle", title: "打印抬头", width: 90, align: "center", sortable:true}
        ]],
        loadMsg: "数据加载中请稍后……",
        emptyMsg: "没有符合条件的记录",
        onShowPanel: function () {
        	$('#companycode').combogrid('grid').datagrid('options').url = '${api}/company/findCompanyPageList';
        	$('#companycode').combogrid('grid').datagrid('reload');
        },
        onSelect:function(rowIndex, rowData){
        	var companycode = rowData.companycode;
        	var shopParams = $("#shopid").combogrid("options").queryParams;
        	shopParams.companycode = companycode;      	
        	shopClear();
        
        }
    });
}


function companySearch() {
	var q = $("#companyQ").val();
	var companyParams = $("#companycode").combogrid("options").queryParams;
	companyParams.q = q;
	$('#companycode').combogrid('grid').datagrid("reload");
}

function companyClear() {
	$("#companyQ").textbox("setValue","");
	$("#companycode").combogrid('clear');
	var companyParams = $("#companycode").combogrid("options").queryParams;
	companyParams.q = '';
	$('#companycode').combogrid('grid').datagrid("reload");
	allForCompanyInit();
}

/**
 * 对和公司编号关联的控件做初始化
 */
function allForCompanyInit() {
	var shopParams = $("#shopid").combogrid("options").queryParams;
	shopParams.companycode = '';
	shopClear();
}


/***************************       初始化查询条件          *****************************/


</script>