<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="toShopComboToolbar" class="datagrid-toolbar" style="display: none;padding: 5px;"> 
    <input id="toShopComboQ" style="width: 250px;" class="easyui-textbox" data-options="prompt:'输入编号、名称、手机号检索...'"/>
    <a href="#" class="easyui-linkbutton" iconCls="icon-2012092109942" onclick="toShopComboSearch()">查询</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-20130406015709810_easyicon_net_16" onclick="toShopComboClear()">重置</a>
    <div style="clear: both"></div>
</div>
	

<script type="text/javascript">

/***************************       初始化查询条件          *****************************/

var toShopInitFirst = true;

function initToShopComboGrid(defaultShop, defaultQ, notInShopIdsStr, $fm) {	
	//方法中可以传入fm
	if($fm!=null && $fm!=''){
		$orderfm = $fm;
	}	
	if(defaultShop!=null && defaultShop!=''){	
		$('#toShopCombo', $orderfm).combogrid({
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
	        toolbar:'#toShopComboToolbar', 
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
	        	if(toShopInitFirst){
	        		 $("#toShopCombo", $orderfm).combogrid('setValue',defaultShop);	                            
	        		 toShopInitFirst = false;
	        	}              
            }
	    });
		
	}else{
		$('#toShopCombo', $orderfm).combogrid({
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
	        toolbar:'#toShopComboToolbar', 
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
	        	$('#toShopCombo').combogrid('grid').datagrid('options').url = '${api}/bus/shop/findPage';
	        	$('#toShopCombo').combogrid('grid').datagrid('reload');
	        }
	    });
	}
	
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