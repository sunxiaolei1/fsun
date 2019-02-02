<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<!-- 查询条件 -->
<%@include file="../../addtoolbar.jsp"%>
	
<div class="fsun-wrap">
	<form id="orderfm">
		<span class="title" style="top: 35px;">挂账结款信息</span>				
		<input id="customerCode" name="customerCode" hidden="true" />	
		<input id="shopId" name="shopId" hidden="true" />		
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>	            
				<th width="12%">客户名称<span style="color:red;">*</span></th>
				<td colspan="3" >
					<input name="customerName" class="easyui-textbox" 
						style="width:400px;" disabled />								
				</td>
				<th width="12%">客户类型</th>
				<td>
					<input name="customerTypeName" class="easyui-textbox" disabled />								
				</td>
				<th width="12%">所属销售代表</th>
				<td>
					<input name="salesman" class="easyui-textbox" disabled />								
				</td>																						                													        	
	        </tr>
	        <tr>	            								
				<th width="12%">结款门店</th>
				<td colspan="3">
					<input id="shopName" name="shopName" class="easyui-textbox" 
						style="width:400px;" disabled />								
				</td>
				<th width="12%">挂账总额</th>
				<td>
					<input id="totalPrice" name="totalPrice" class="easyui-numberbox" disabled
						data-options="min:0,precision:2, formatter: priceFormat" />								
				</td>				
				<th width="12%">已结金额</th>
				<td>
					<input id="paidPrice" name="paidPrice" class="easyui-numberbox" disabled 
						data-options="min:0,precision:2, formatter: priceFormat" />								
				</td>																							                													        	
	        </tr>
	        <tr>
	        	<th width="12%">支付方式<span style="color:red;">*</span></th>
				<td>
					<input id="payMode" name="payMode" class="easyui-combobox" editable="false" required />								
				</td>
	            <th width="12%">交易类型</th>
				<td>
					<input id="tradeType" name="tradeType" class="easyui-combobox" readOnly />
				</td>
				<th width="12%">欠款金额</th>
				<td>
					<input id="unpaidPrice" name="unpaidPrice" class="easyui-numberbox" disabled 
						data-options="precision:2, formatter: priceFormat" />								
				</td>				
				<th width="12%">结款金额<span style="color:red;">*</span></th>
				<td>
					<input id="tradePrice" name="tradePrice" class="easyui-numberbox" required
						data-options="min:0,precision:2,value:0, formatter: priceFormat" />								
				</td>														
	        </tr>	
	        <tr>	        	
				<th width="12%">备注</th>
				<td colspan="7">
					<input id="memo" name="memo" class="easyui-textbox" style="width:800px;"/>
				</td>							
	        </tr>
		</table>
	</form>			
</div>	
<div style="height: 300px; width: 100%;">
	<div id="detailskutoolbar" style="display:none;">
		<%@include file="./detailskutoolbar.jsp"%>
	</div>
	<table id="orderDetailDataGrid"></table>
</div>					

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/vipUnpaidEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currOrderDetailDataGrid  = $("#orderDetailDataGrid");
var $orderfm = $("#orderfm");
var rachargeColumns = [[
	{field:'unpaidId',checkbox:true},
	//{field:"customerName",title:"客户名称", width:120,align:"center"},
	{field:"shopName",title:"交易门店", width:120,align:"center"},
	{field:"payMode",title:"支付方式", width:80,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.payMode); 
	}},
	{field:"tradeType",title:"交易类型", width:80,align:"center",sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.tradeType); 
	}},
	{field:"orderId",title:"销售单号", width:130,align:"center"},
	{field:'tradeStatus',title:'交易状态',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.tradeStatus); 
	}},
	{field:"tradeTime",title:"交易时间", width:130,align:"center",sortable:true},
	{field:'tradePrice',title:'交易金额',width:80,align:'center',formatter:numBaseFormat},
	{field:"memo",title:"备注", width:150,align:"center"}
]];

$(function () { 
	
	$('#payMode', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.vipUnpaidPayModeData
   	});
	
	$('#tradeType', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.tradeTypeData
   	});
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	currOrderDetailDataGrid.datagrid({
		view:footerStyleView,
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    idField:"tradeTime",
	    sortName:"tradeTime",
        sortOrder:"desc",	
        pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    toolbar: "#detailskutoolbar",
	    columns: rachargeColumns,
	    loadFilter:function(data) {     		
    		var fields = ["tradePrice"];       		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "shopName"); 
			return data; 
        },
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    rowStyler:function(index,row){
        	var rowStyle = "";  
        	if (row.shopName=="合计"){//这里是判断哪些行
        		rowStyle = 'font-weight:bold;';  
            }else{
            	if(row.unusual){
     				rowStyle += "background-color:#C8C7BF;";
    			}
            }	
        	return rowStyle;
		}
	});
	
	$.ajax({
		type : "GET",
		url : "${api}/bus/customer/initUnpaidData",
		data:{
			"customerCode": "${customerCode}"
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docAsnDto = result.entry;
			
			/***************************              基本信息初始化                        ************************/			
			var header = docAsnDto.header;
			if(header!=null){
				$orderfm.form("load", header);	
			}			
			var details = docAsnDto.details;	
			if(details!=null && details.length>0){
				currDetailData = details;
				currOrderDetailDataGrid.datagrid("loadData", currDetailData);
			}

			if(header.unpaidPrice!=null && header.unpaidPrice>=0){
				$('#tradePrice', $orderfm).numberbox({  
					max: header.unpaidPrice
			   	});
			}else{
				$('#tradePrice', $orderfm).numberbox({  
					max: 0,
					editable:false
			   	});
			}
								
			//更新明细标题
			$("#skutitle").html(header.customerName);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});

/**
 * 校验并组装保存的数据 
 */
function getSaveData(){
	
	var isValid = $orderfm.form('validate');
	if (!isValid){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}	
	
	//初始化交易记录
	var baseInfo = formJson($orderfm);	
	var busVipUnpaid = {
		shopId: baseInfo.shopId,
		customerCode: baseInfo.customerCode,
		tradePrice:	baseInfo.tradePrice,
		payMode: baseInfo.payMode,
		tradeType: baseInfo.tradeType,
		memo: baseInfo.memo
	};
	
	var saveData = {
	     "params": busVipUnpaid,
	     "saveUrl": "${api}/bus/vipUnpaid/save"
	}
	return saveData;
}

</script>