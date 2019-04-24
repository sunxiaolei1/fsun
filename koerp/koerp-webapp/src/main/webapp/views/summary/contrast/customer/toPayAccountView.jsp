<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>


<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="单据编号: ${param.orderId}, 客户名称: ${param.buyerName}, 交易门店: ${param.shopName}" data-options="region:'center',split:true,collapsible:false" style="padding:5px">	
		<table id="currPayAccountDataGrid" ></table> 
	</div>
</div>

<!-- datagrid可编辑单元格 -->
<%@include file="../../../busCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var footerFirstColumn = "line_no";

$(function() {
	
	$("#currPayAccountDataGrid").datagrid({
		view:footerStyleView,
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    sortName:"pay_mode",
	    sortOrder:"asc",	
	    pagination:true,
	    pageNumber:currPageNumber,
	    pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    columns: [[
           	{field:"line_no",title:"行号", width:80,align:"center", checkbox:true},          		
        	{field:"pay_mode",title:"支付方式", width:80,align:"center",sortable:true},            	         	
        	{field:"recept_price",title:"应收金额", width:80, align:"center",formatter:numBaseFormat},
        	{field:"pay_price",title:"应付金额", width:80, align:"center",formatter:numBaseFormat},
        	{field:"dib_price",title:"找零金额", width:80, align:"center",formatter:numBaseFormat},
        	{field:"discount_amount",title:"优惠金额", width:80, align:"center",formatter:numBaseFormat},  
        	{field:"trade_no",title:"支付流水号", width:150, align:"center"},  
        	{field:"card_no",title:"支付卡号", width:150, align:"center"},
        	{field:'trade_time',title:'交易时间',width:130,align:'center'}
        ]],
	    loadFilter:function(data) {    
			var fields = ["recept_price","pay_price","dib_price","discount_amount"];     		
			//排序拦截器
			sortFilter($(this), data);		
		    //分页拦截器
		    var data = pagerFilter($(this), data, fields, footerFirstColumn); 
			return data; 
	    },
	    rowStyler:function(index,row){
			if (row[footerFirstColumn]=="合计:"){//这里是判断哪些行
	            return 'font-weight:bold;';  
	        }	
			return "";
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true
	});
	
	//加载数据
	$.ajax({
		type : "GET",
		url : "${api}/summary/contrast/customer/payAccount/list?orderId=${param.orderId}",   
		dataType : "json",
		success : function(result) {
			if(result.status){			
				$("#currPayAccountDataGrid").datagrid("loadData", result.entry);				
			}			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
	
});


</script>
</html>