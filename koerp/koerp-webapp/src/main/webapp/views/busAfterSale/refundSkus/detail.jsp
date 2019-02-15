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
			idField: 'refundorderid',
			fit: true,
			rownumbers: true,
			fitColumns: true,
			remoteSort:true,
		    sortName:"o.refundorderid",
	        sortOrder:"desc",
			singleSelect: true,
			pagination:true,//分页控件
		    pageSize: GLOBAL_PAGE_SIZE,
		    pageList: GLOBAL_PAGE_SIZE_LIST,
		    showFooter:true,
			loadMsg:'数据加载中请稍后……',
			url:"${api}/ecaftersale/refund/findSkuDetailsPageList",
			queryParams:{"sku":"${sku}", "materialcode":"${materialcode}", "ischangeorder":"${ischangeorder}", "shopid":"${shopid}",
				"companycode":"${companycode}", "bcreatedatetime":"${bcreatedatetime}", "ecreatedatetime":"${ecreatedatetime}",
				"materialname":"${materialname}"},			
    		columns: [
    			[	{field:'refundorderid',title:'退货单号',width:130, align:"center"},
					{field:'extorderid',title:'外部单号',width:130, align:"center"},
					{field:'sysorderid',title:'系统单号',width:130, align:"center"},
					{field:'shopname',title:'所属店铺',width:130,align:'center',sortable:true},					
					{field:"refundstatus",title:"退货状态",width:70,sortable:true, align:'center',formatter:function(value, row){
						return formatter(value, window.parent.ecRefundstatus);
					}},
					{field:'expressno',title:'快递单号',align:'center', width:100,sortable:true},
					{field:"expresscode",title:"配送快递",width:70,sortable:true, align:'center',formatter:function(value, row){
						return formatter(value, window.parent.expressCode);
					}},					
					{field:"refundprice",title:"退款金额",width:70,align:'center',formatter:numBaseFormat}															
    			]
    		],
			onBeforeLoad: function(param){				   		 				   
	        	$(this).datagrid('clearSelections');             		 
    		}
		});	

	});

</script>

