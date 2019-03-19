<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="goodsComboToolbar" class="datagrid-toolbar" style="display: none;padding: 5px;"> 
    <input id="goodsTextQ" class="easyui-textbox" />
</div>
	

<script type="text/javascript">

$(function() {
	
	$('#goodsTextQ').searchbox({
		width:"350",
		prompt:'输入商品名称、SKU...',
		searcher: function(value){
			var params = $("#goodsCombo").combogrid("options").queryParams;
			params.q = value;
			$('#goodsCombo').combogrid('grid').datagrid('reload');
		}
	});
	
	$('#goodsCombo').combogrid({
		prompt:'全部',
    	panelWidth:580,
    	panelHeight:300,
        idField: 'sku', //ID字段
        textField: 'goodsName', //显示的字段
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
	    sortName:"sku",
        sortOrder:"asc",
        toolbar:'#goodsComboToolbar', 
        pageSize: GLOBAL_PAGE_SIZE,
        pageList: GLOBAL_PAGE_SIZE_LIST,
        columns: [[
            //{field:'skuId', checkbox: true},
            {field:"sku", title: "SKU", width: 80, align: "center", sortable:true},
            {field:"goodsName", title: "名称", width: 180, align: "center", sortable:true},
            {field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
        		return formatter(value, window.parent.brandCode); 
        	}},
        	{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
        		return formatter(value, window.parent.categoryCode); 
        	}},
        	{field:'property',title:'规格',width:120,align:'center',sortable:true},
        	{field:"unit",title:"单位",width:70,align:"center", formatter:function(value, row){
        		return formatter(value, window.parent.unitCode); 
        	}}
        ]],
        loadMsg: "数据加载中请稍后……",
        emptyMsg: "没有符合条件的记录",
        onShowPanel: function () {
        	$(this).combogrid('grid').datagrid('options').url = '${api}/bus/basSku/findListForPage';
        	$(this).combogrid('grid').datagrid('reload');
        }
    });
	
});

</script>