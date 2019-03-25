<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<div style="height:280px;" >
	<table id="list-detial-table-${param.currIndex}" ></table>
</div>
	
<script>
	 	
	 $(function() {
		 var detailGird = $('#list-detial-table-${param.currIndex}');
		 detailGird.datagrid({
			nowrap: false, 
			pagination: false,
			idField: 'poDetailId',
			fit: true,
			rownumbers: true,
			fitColumns: true,
			singleSelect: false,
			loadMsg:'加载中，请稍等。。。',
			url:"${api}/doc/po/details/${param.poNo}",
			queryParams:{},
			onBeforeLoad: function(param){				   		 				   
	        	$(this).datagrid('clearSelections');             		 
    		},
    		columns: [[
				{field:'ck',checkbox:true},
				{field:"sku",title:"SKU", width:80,align:"center"},
				{field:"goodsName",title:"商品名称", width:240,align:"center"},
				{field:"barCode",title:"条形码", width:140,align:"center"},
				{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
					return formatter(value, window.parent.brandCode); 
				}},
				{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
					return formatter(value, window.parent.categoryCode); 
				}},
				{field:'property',title:'规格',width:120,align:'center',sortable:true},				
				{field:"price",title:"单价", width:80,align:"center",formatter:numBaseFormat},
				{field:"orderedQty",title:"申请数量", width:80,align:"center",
					styler: function(value, rowData, rowIndex){
				    	return 'font-weight:bold;color:green;';
				    },
				    formatter:intNumBaseFormat
				},
				{field:"unit",title:"单位",width:70,align:"center", formatter:function(value, row){
					return formatter(value, window.parent.unitCode); 
				}}
   			]],
			onSelect: function(rowIndex, rowData){
				addSelectedDetail(rowData);
			},
			onUnselect: function(rowIndex, rowData){			
				delUnSelectedDetail(rowData);
			},
			onSelectAll: function(rows){	
				$.each(rows, function() {
					addSelectedDetail(this);
				});	
			},
			onUnselectAll: function(rows){			
				$.each(rows, function() {
					delUnSelectedDetail(this);
				});	
			},
			loadFilter : function(data){
    			var rows = data.entry;	
		    	for (var i = 0; i < rows.length; i++) {
		    		rows[i].toShopId = '${param.toShopId}';
				} 
		    	return rows;
    		}
		});	

	});

</script>