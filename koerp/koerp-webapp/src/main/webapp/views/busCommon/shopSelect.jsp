<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="shopComboToolbar" class="datagrid-toolbar" style="display: none;padding: 5px;"> 
    <input id="shopComboQ" style="width: 250px;" class="easyui-textbox" data-options="prompt:'输入编号、名称、手机号检索...'"/>
    <a href="#" class="easyui-linkbutton" iconCls="icon-2012092109942" onclick="shopComboSearch()">查询</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-20130406015709810_easyicon_net_16" onclick="shopComboClear()">重置</a>
    <div style="clear: both"></div>
</div>
	

<script type="text/javascript">

/***************************       初始化查询条件          *****************************/

var shopInitFirst = true;

function initShopComboGrid(defaultShop, defaultQ, notInShopIdsStr, $fm) {	
	//方法中可以传入fm
	if($fm!=null && $fm!=''){
		$orderfm = $fm;
	}	
	if(defaultShop!=null && defaultShop!=''){	
		$('#shopCombo', $orderfm).combogrid({
			prompt:'请选择',
	    	panelWidth:500,
	    	panelHeight:300,
	        idField: 'shop_id', //ID字段
	        textField: 'shop_name', //显示的字段
	        method: 'post',
	        queryParams: {
	        	"enabled": true, 
	        	"q": defaultQ, 
	        	"notInShopIdsStr":notInShopIdsStr
	        },
	        url: '${api}/bus/shop/findPage',
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
	        toolbar:'#shopComboToolbar', 
	        pageSize: GLOBAL_PAGE_SIZE,
	        pageList: GLOBAL_PAGE_SIZE_LIST,
	        columns: [[
	            {field: 'shop_id', checkbox: true},
	            {field: "shop_code", title: "编号", width: 80, align: "center", sortable:true},
	            {field: "shop_name", title: "名称", width: 140, align: "center", sortable:true},
	            {field: "tel", title: "手机号", width: 120, align: "center", sortable:true}
	        ]],
	        loadMsg: "数据加载中请稍后……",
	        emptyMsg: "没有符合条件的记录",
	        onLoadSuccess:function(data){ 	
	        	if(shopInitFirst){
	        		 $("#shopCombo", $orderfm).combogrid('setValue',defaultShop);	                            
	        		 shopInitFirst = false;
	        	}              
            }
	    });
		
	}else{
		$('#shopCombo', $orderfm).combogrid({
			prompt:'请选择',
	    	panelWidth:500,
	    	panelHeight:300,
	        idField: 'shop_id', //ID字段
	        textField: 'shop_name', //显示的字段
	        method: 'post',
	        queryParams: {
	        	"enabled": true,
	        	"notInShopIdsStr":notInShopIdsStr
	        },
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
	        toolbar:'#shopComboToolbar', 
	        pageSize: GLOBAL_PAGE_SIZE,
	        pageList: GLOBAL_PAGE_SIZE_LIST,
	        columns: [[
	            {field: 'shop_id', checkbox: true},
	            {field: "shop_code", title: "编号", width: 80, align: "center", sortable:true},
	            {field: "shop_name", title: "名称", width: 140, align: "center", sortable:true},
	            {field: "tel", title: "手机号", width: 120, align: "center", sortable:true}
	        ]],
	        loadMsg: "数据加载中请稍后……",
	        emptyMsg: "没有符合条件的记录",
	        onShowPanel: function () {
	        	$('#shopCombo').combogrid('grid').datagrid('options').url = '${api}/bus/shop/findPage';
	        	$('#shopCombo').combogrid('grid').datagrid('reload');
	        }
	    });
	}
	
}

function shopComboSearch() {
	var q = $("#shopComboQ").textbox("getValue");
	var params = $("#shopCombo").combogrid("options").queryParams;
	params.q = q;
	$('#shopCombo').combogrid('grid').datagrid('reload');
}

function shopComboClear() {
	$("#shopComboQ").textbox("setValue","");
	$("#shopCombo").combogrid('clear');
	var params = $("#shopCombo").combogrid("options").queryParams;
	params.q = '';
	$('#shopCombo').combogrid('grid').datagrid("reload");		
}

/***************************       初始化查询条件          *****************************/


</script>