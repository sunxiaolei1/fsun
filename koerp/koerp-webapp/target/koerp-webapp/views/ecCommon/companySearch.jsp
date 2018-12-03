<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="companyToolbar" class="datagrid-toolbar" style="display: none;padding: 5px;"> 
    <input type="text" id="companyQ" style="width: 150px;" class="easyui-textbox" data-options="prompt:'输入公司代码或名称检索...'"/>
    <a href="#" class="easyui-linkbutton" iconCls="icon-2012092109942" onclick="companySearch()">查询</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-20130406015709810_easyicon_net_16" onclick="companyClear()">重置</a>
    <div style="clear: both"></div>
</div>
	

<script type="text/javascript">

$(function() {
	initCompanyGrid();
});

/***************************       初始化查询条件          *****************************/

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
        }
    });
}

function companySearch() {
	var q = $("#companyQ").val();
	$('#companycode').combogrid('grid').datagrid('reload', {'q': q});
}

function companyClear() {
	$("#companyQ").textbox("setValue","");
	$("#companycode").combogrid('clear');
	var companyParams = $("#companycode").combogrid("options").queryParams;
	companyParams.q = '';
	$('#companycode').combogrid('grid').datagrid("reload");		
}

/***************************       初始化查询条件          *****************************/


</script>