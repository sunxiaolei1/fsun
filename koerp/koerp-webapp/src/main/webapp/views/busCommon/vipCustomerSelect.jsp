<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="vipCustomerToolbar" class="datagrid-toolbar" style="display: none;padding: 5px;"> 
    <input id="vipCustomerQ" style="width: 250px;" class="easyui-textbox" data-options="prompt:'输入编号、名称、手机号检索...'"/>
    <a href="#" class="easyui-linkbutton" iconCls="icon-2012092109942" onclick="vipCustomerSearch()">查询</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-20130406015709810_easyicon_net_16" onclick="vipCustomerClear()">重置</a>
    <div style="clear: both"></div>
</div>
	
<script type="text/javascript">

/***************************       初始化查询条件          *****************************/ 

var vipCustomerInitFirst = true;
 
function initVipCustomerGrid(defaultCustomer, $fm){
	//方法中可以传入fm
	if($fm!=null && $fm!=''){
		$orderfm = $fm;
	}	 
	if(defaultCustomer!=null && defaultCustomer!=''){
		$('#vipCustomer', $orderfm).combogrid({
			prompt:'请选择...',
	    	panelWidth:500,
	    	panelHeight:300,
	        idField: 'customer_code', //ID字段
	        textField: 'customer_name', //显示的字段
	        method: 'post',
	        queryParams: {"enabled": true, "customerType":"VIP", "q": defaultCustomer},
	        multiple: false,
	        fitColumns: true,
	        striped: true,
	        pagination: true,//是否分页
	        rownumbers: true,//序号
	        collapsible: false,//是否可折叠的
	        remoteSort:true,
	        editable:false,  
	        url: '${api}/bus/customer/findPage',
		    sortName:"customer_code",
	        sortOrder:"desc",
	        toolbar:'#vipCustomerToolbar', 
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
	        onLoadSuccess:function(data){ 	
	        	if(vipCustomerInitFirst){
	        		 $("#vipCustomer", $orderfm).combogrid('setValue',defaultCustomer);	                            
	        		 vipCustomerInitFirst = false;
	        	}              
            }
	    });
	}else{
		$('#vipCustomer', $orderfm).combogrid({
			prompt:'请选择...',
	    	panelWidth:500,
	    	panelHeight:300,
	        idField: 'customer_code', //ID字段
	        textField: 'customer_name', //显示的字段
	        method: 'post',
	        queryParams: {"enabled": true, "customerType":"VIP"},
	        multiple: false,
	        fitColumns: true,
	        striped: true,
	        pagination: true,//是否分页
	        rownumbers: true,//序号
	        collapsible: false,//是否可折叠的
	        remoteSort:true,
	        editable:false,  
	        //url: '${api}/bus/customer/findPage',
		    sortName:"customer_code",
	        sortOrder:"desc",
	        toolbar:'#vipCustomerToolbar', 
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
	        	$('#vipCustomer').combogrid('grid').datagrid('options').url = '${api}/bus/customer/findPage';
	        	$('#vipCustomer').combogrid('grid').datagrid('reload');
	        },
	        onSelect: function(index, row){
	        	var customer_code = row.customer_code;
       	  		var contacts = row.customer_name;
       	  		var tel = row.tel;
       	  		$('#cnName', $orderfm).textbox("setValue", contacts);
       	  		$('#mobile', $orderfm).textbox("setValue", tel);
       	 		$('#cardNo', $orderfm).textbox("setValue", (tel!=null&&tel!=''?tel:customer_code));
	        }
	        
	    });
	}
		
}

function vipCustomerSearch() {
	var q = $("#vipCustomerQ").val();
	var params = $("#vipCustomer", $orderfm).combogrid("options").queryParams;
	params.q = q;
	$('#vipCustomer', $orderfm).combogrid('grid').datagrid('reload');
}

function vipCustomerClear() {
	$("#vipCustomerQ").textbox("setValue","");
	$("#vipCustomer", $orderfm).combogrid('clear');
	var params = $("#vipCustomer", $orderfm).combogrid("options").queryParams;
	params.q = '';
	$('#vipCustomer', $orderfm).combogrid('grid').datagrid("reload");	
}

</script>