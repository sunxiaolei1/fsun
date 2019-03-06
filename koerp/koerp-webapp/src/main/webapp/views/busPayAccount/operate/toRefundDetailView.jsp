<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<!-- BasSku dialog -->
<div class="easyui-layout" fit=true style="height:100%;">		
	<div data-options="region:'center',split:true" style="border: 0px solid #ccc;" >		
		<h1 style="font-size:14px;text-align:left;margin:10px 0px 10px 10px;">
			<span style="color:red;">*</span>该订单存在挂账消费记录,故先结款挂账金额,若出现不够结款扣减则以当前选择的支付方式结算!</h1>								
		<table id="refundPayAccountDataGrid"></table>
	</div>						
</div>
<!-- BasSku dialog -->

<script type="text/javascript">	

var currRefundPayAccountDataGrid = $("#refundPayAccountDataGrid");
var payAccountColumns = [[
	{field:'ck',checkbox:true},             		
	{field:"payMode",title:"支付方式", width:80,align:"center",formatter:function(value, row){
		return formatter(value, window.parent.payMode); 
	}},            	         	
	{field:"receptPrice",title:"应收金额", width:80, align:"center",formatter:numBaseFormat},
	{field:"payPrice",title:"应付金额", width:80, align:"center",formatter:numBaseFormat},
	{field:"dibPrice",title:"找零金额", width:80, align:"center",formatter:numBaseFormat},
	{field:"discountAmount",title:"优惠金额", width:80, align:"center",formatter:numBaseFormat},  
	{field:"tradeNo",title:"支付流水号", width:150, align:"center"},  
	{field:"cardNo",title:"支付卡号", width:150, align:"center"}
]];

$(function () { 
	currRefundPayAccountDataGrid.datagrid({
		view:footerStyleView,
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    sortName:"payMode",
        sortOrder:"asc",	
        //pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    //toolbar: "#payAccountToolbar",
	    columns: payAccountColumns,
	    loadFilter:function(data) {     		
    		var fields = ["receptPrice","payPrice","dibPrice","discountAmount"];       		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "payMode"); 
			return data; 
        },
        rowStyler:function(index,row){	    		    	
    		if (row.payMode=="合计:"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	
    		return "";
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true
	});
})

</script>