<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="salesmanTextToolbar" class="datagrid-toolbar" style="display: none;padding: 5px;"> 
    <input type="text" id="salesmanTextQ" style="width: 250px;" class="easyui-textbox" data-options="prompt:'输入编号、名称、手机号检索...'"/>
    <a href="#" class="easyui-linkbutton" iconCls="icon-2012092109942" onclick="salesmanTextSearch()">查询</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-20130406015709810_easyicon_net_16" onclick="salesmanTextClear()">重置</a>
    <div style="clear: both"></div>
</div>
	

<script type="text/javascript">

$(function() {
	initSalesmanTextGrid();
});

/***************************       初始化查询条件          *****************************/

function initSalesmanTextGrid() {
	$('#salesmanText').combogrid({
		prompt:'全部',
    	panelWidth:500,
    	panelHeight:300,
        idField: 'customer_code', //ID字段
        textField: 'customer_name', //显示的字段
        method: 'post',
        queryParams: {"enabled": true, "customerType":"YWY"},
        multiple: false,
        fitColumns: true,
        striped: true,
        pagination: true,//是否分页
        rownumbers: true,//序号
        collapsible: false,//是否可折叠的
        remoteSort:true,
        editable:false,  
	    sortName:"customer_code",
        sortOrder:"desc",
        toolbar:'#salesmanTextToolbar', 
        pageSize: GLOBAL_PAGE_SIZE,
        pageList: GLOBAL_PAGE_SIZE_LIST,
        columns: [[
            {field: 'id', checkbox: true},
            {field: "customer_code", title: "编号", width: 80, align: "center", sortable:true},
            {field: "customer_name", title: "名称", width: 80, align: "center", sortable:true},
            {field: "tel", title: "手机号", width: 120, align: "center", sortable:true}
        ]],
        loadMsg: "数据加载中请稍后……",
        emptyMsg: "没有符合条件的记录",
        onShowPanel: function () {
        	$('#salesmanText').combogrid('grid').datagrid('options').url = '${api}/bus/customer/findPage';
        	$('#salesmanText').combogrid('grid').datagrid('reload');
        }
    });
}

function salesmanTextSearch() {
	var q = $("#salesmanTextQ").val();
	var params = $("#salesmanText").combogrid("options").queryParams;
	params.q = q;
	$('#salesmanText').combogrid('grid').datagrid('reload');
}

function salesmanTextClear() {
	$("#salesmanTextQ").textbox("setValue","");
	$("#salesmanText").combogrid('clear');
	var params = $("#salesmanText").combogrid("options").queryParams;
	params.q = '';
	$('#salesmanText').combogrid('grid').datagrid("reload");		
}

/***************************       初始化查询条件          *****************************/


</script>