<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
<!-- 会员卡或备用金充值时出现未结款挂账的记录 -->
<div class="fsun-wrap">
	<form id="vipUnpaidfm">
		<span class="title" style="top: 30px;">基本信息</span>						
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
				<th>客户名称</th>
				<td colspan="3" >
					<input id="customerName" name="customerName" class="easyui-textbox" style="width:256px;" readOnly />								
				</td>
				<th>交易门店</th>
				<td colspan="3">
					<input id="shopName" name="shopName" class="easyui-textbox" style="width:256px;" readOnly />								
				</td>																	
	        </tr>		               		
	        <tr>	
	        	<th>会员卡号</th>
				<td>
					<input id="cardNo" name="cardNo" class="easyui-textbox" readOnly />
				</td>
	        	<th>支付方式</th>
				<td>
					<input id="payMode" name="payMode" class="easyui-combobox" readOnly style="width:120px;" />								
				</td>        						
				<th>交易金额</th>
				<td>
					<input id="tradePrice" name="tradePrice" class="easyui-numberbox" readOnly 
						data-options="min:0,precision:2,value:0, formatter: priceFormat" />								
				</td>		
				<th>赠送金额</th>
				<td>
					<input id="giftPrice" name="giftPrice" class="easyui-numberbox" readOnly  style="width:90px;"
						data-options="min:0,precision:2,value:0, formatter: priceFormat" />													
				</td>		        	
	        </tr>	
		</table>
	</form>			
</div>	
<div style="height: 140px; width: 100%;">
	<table id="vipUnpaidDetailDataGrid"></table>
</div>					

<script type="text/javascript">

var currVipUnpaidDetailData = []; 
var currVipUnpaidDetailDataGrid = $("#vipUnpaidDetailDataGrid");
var $vipUnpaidfm = $("#vipUnpaidfm");
var vipUnpaidColumns = [[
	{field:'unpaidId',checkbox:true},
	{field:"shopName",title:"交易门店", width:120,align:"center"},
	{field:"payMode",title:"支付方式", width:80,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.payMode); 
	}},
	{field:"tradeType",title:"交易类型", width:80,align:"center",sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.tradeType); 
	}},	
	{field:"cardNo",title:"会员卡号", width:100,align:"center"},
	{field:'tradePrice',title:'交易金额',width:80,align:'center',formatter:numBaseFormat},
	{field:"giftPrice",title:"赠送金额", width:80,align:"center",formatter:numBaseFormat},
	{field:"memo",title:"备注", width:200,align:"center"}
]];

$(function () { 
	
	$('#payMode', $vipUnpaidfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.vipUnpaidPayModeData
   	});
	
	//去除默认的请选择项
	editInitComboxParams($vipUnpaidfm, "");
	
	currVipUnpaidDetailDataGrid.datagrid({
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    idField:"tradeType",
	    sortName:"tradeType",
        sortOrder:"asc",	
        pagination:false,
	    singleSelect:true,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:false,	   
	    columns: vipUnpaidColumns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});	
     
});


</script>