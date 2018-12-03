<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	request.setAttribute("api", request.getContextPath());
%>


<div style="height:200px;" >
	<table id="list-detial-table-${currIndex}" ></table>
</div>

<script type="text/javascript">
	 	
	 $(function() {
		 var detailGird = $('#list-detial-table-${currIndex}');
		 detailGird.datagrid({
			nowrap: false, 
			pagination: false,
			idField: 'sysorderid',
			fit: true,
			rownumbers: true,
			fitColumns: true,
			remoteSort:true,
		    sortName:"o.sysorderid",
	        sortOrder:"desc",
			singleSelect: true,
			pagination:true,//分页控件
		    pageSize: GLOBAL_PAGE_SIZE,
		    pageList: GLOBAL_PAGE_SIZE_LIST,
		    showFooter:true,
			loadMsg:'数据加载中请稍后……',
			url:"${api}/eclack/findSkuDetailsPageList",
			queryParams:{"sku":"${sku}", "materialcode":"${materialcode}","materialproperty":"${materialproperty}",
				"shopid":"${shopid}", "companycode":"${companycode}","materialname":"${materialname}"},			
    		columns: [
    			[
					{field:'extorderid',title:'外部单号',width:130, align:"center"},
					{field:'sysorderid',title:'系统单号',width:130, align:"center"},
					{field:'companycode',title:'公司代码',width:80,align:'center'},
					{field:'shopname',title:'所属店铺',width:130,align:'center',sortable:true},
					{field:'username',title:'买家用户名',align:'center', width:100,sortable:true},
					{field:"ordertype",title:"订单类型",width:100,sortable:true, align:'center',formatter:function(value, row){
						return formatter(value, window.parent.ecOrdertype);
					}},	
					{field:"orderprice",title:"订单金额",width:100,align:'center',formatter:numBaseFormat},					
					{field:"payprice",title:"实付金额",width:100,align:'center',formatter:numBaseFormat}						
    			]
    		],
			onBeforeLoad: function(param){				   		 				   
	        	$(this).datagrid('clearSelections');             		 
    		}
		});	

	});

</script>

