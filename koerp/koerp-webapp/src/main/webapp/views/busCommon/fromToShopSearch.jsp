<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="fromShopComboToolbar" class="datagrid-toolbar" style="display: none;padding: 5px;"> 
    <input type="text" id="fromShopComboQ" style="width: 250px;" class="easyui-textbox" data-options="prompt:'输入编号、名称、手机号检索...'"/>
    <a href="#" class="easyui-linkbutton" iconCls="icon-2012092109942" onclick="fromShopComboSearch()">查询</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-20130406015709810_easyicon_net_16" onclick="fromShopComboClear()">重置</a>
    <div style="clear: both"></div>
</div>

<div id="toShopComboToolbar" class="datagrid-toolbar" style="display: none;padding: 5px;"> 
    <input type="text" id="toShopComboQ" style="width: 250px;" class="easyui-textbox" data-options="prompt:'输入编号、名称、手机号检索...'"/>
    <a href="#" class="easyui-linkbutton" iconCls="icon-2012092109942" onclick="toShopComboSearch()">查询</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-20130406015709810_easyicon_net_16" onclick="toShopComboClear()">重置</a>
    <div style="clear: both"></div>
</div>
	

<script type="text/javascript">

$(function() {
	
	initFromShopComboGrid();
	
	initToShopComboGrid();
});

/***************************       初始化查询条件          *****************************/

function initFromShopComboGrid() {
	$('#fromShopCombo').combogrid({
		prompt:'全部',
    	panelWidth:500,
    	panelHeight:300,
        idField: 'shop_id', //ID字段
        textField: 'shop_name', //显示的字段
        method: 'post',
        queryParams: {"enabled": true},
        multiple: false,
        fitColumns: true,
        striped: true,
        pagination: true,//是否分页
        rownumbers: true,//序号
        collapsible: false,//是否可折叠的
        remoteSort:true,
        editable:false,  
	    sortName:"shop_code",
        sortOrder:"desc",
        toolbar:'#fromShopComboToolbar', 
        pageSize: GLOBAL_PAGE_SIZE,
        pageList: GLOBAL_PAGE_SIZE_LIST,
        columns: [[
          	{field:'shop_id',checkbox:true},
       		{field:'shop_code',title:'店仓编码',width:80,align:'center',sortable:true},	
       		{field:'shop_name',title:'店仓名称',width:120,align:'center',sortable:true},	
       		{field:'contacts',title:'联系人',width:80,align:'center',sortable:true},
       		{field:'tel',title:'联系方式',width:120,align:'center',sortable:true}
       	]],
        loadMsg: "数据加载中请稍后……",
        emptyMsg: "没有符合条件的记录",
        onShowPanel: function () {
        	$(this).combogrid('grid').datagrid('options').url = '${api}/bus/shop/findPage';
        	$(this).combogrid('grid').datagrid('reload');
        }
    });
}

function fromShopComboSearch() {
	var q = $("#fromShopComboQ").textbox("getValue");
	var params = $("#fromShopCombo").combogrid("options").queryParams;
	params.q = q;
	$('#fromShopCombo').combogrid('grid').datagrid('reload');
}

function fromShopComboClear() {
	$("#fromShopComboQ").textbox("setValue","");
	$("#fromShopCombo").combogrid('clear');
	var params = $("#fromShopCombo").combogrid("options").queryParams;
	params.q = '';
	$('#fromShopCombo').combogrid('grid').datagrid("reload");		
}


function initToShopComboGrid() {
	$('#toShopCombo').combogrid({
		prompt:'全部',
    	panelWidth:500,
    	panelHeight:300,
        idField: 'shop_id', //ID字段
        textField: 'shop_name', //显示的字段
        method: 'post',
        queryParams: {"enabled": true},
        multiple: false,
        fitColumns: true,
        striped: true,
        pagination: true,//是否分页
        rownumbers: true,//序号
        collapsible: false,//是否可折叠的
        remoteSort:true,
        editable:false,  
	    sortName:"shop_code",
        sortOrder:"desc",
        toolbar:'#toShopComboToolbar', 
        pageSize: GLOBAL_PAGE_SIZE,
        pageList: GLOBAL_PAGE_SIZE_LIST,
        columns: [[
          	{field:'shop_id',checkbox:true},
       		{field:'shop_code',title:'店仓编码',width:80,align:'center',sortable:true},	
       		{field:'shop_name',title:'店仓名称',width:120,align:'center',sortable:true},	
       		{field:'contacts',title:'联系人',width:80,align:'center',sortable:true},
       		{field:'tel',title:'联系方式',width:120,align:'center',sortable:true}
       	]],
        loadMsg: "数据加载中请稍后……",
        emptyMsg: "没有符合条件的记录",
        onShowPanel: function () {
        	$(this).combogrid('grid').datagrid('options').url = '${api}/bus/shop/findPage';
        	$(this).combogrid('grid').datagrid('reload');
        }
    });
}

function toShopComboSearch() {
	var q = $("#toShopComboQ").textbox("getValue");
	var params = $("#toShopCombo").combogrid("options").queryParams;
	params.q = q;
	$('#toShopCombo').combogrid('grid').datagrid('reload');
}

function toShopComboClear() {
	$("#toShopComboQ").textbox("setValue","");
	$("#toShopCombo").combogrid('clear');
	var params = $("#toShopCombo").combogrid("options").queryParams;
	params.q = '';
	$('#toShopCombo').combogrid('grid').datagrid("reload");		
}


/***************************       初始化查询条件          *****************************/


</script>