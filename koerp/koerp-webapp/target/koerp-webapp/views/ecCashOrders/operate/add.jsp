<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>


<style type="text/css">

.easyui-textbox, .easyui-combogrid, .easyui-datebox, .easyui-combobox, .easyui-numberbox, .easyui-datetimebox {
	width: 162px;
}

.fsun-wrap {
	border: 1px solid #ccc;
	padding: 15px 5px 5px 5px;
	margin-top: 10px;
	height: 80%;
}

.fsun-wrap .title {
	position: absolute;
	color: #416AA3;
	font-weight: bold;
	left: 2%;
	line-height: 2em;
	padding: 0 1em;
	background-color: #fff;
}

</style> 

<div class="easyui-layout" fit=true  id="base_layout" >	 
	<div data-options="region:'north'" style="height:60%;" >
		<div id="addtoolbar" style="display:none;">
			<%@include file="./addtoolbar.jsp"%>
		</div>
 	 	<table id="orderSkuDataGrid"></table>
 	</div> 	 	
  	<div data-options="region:'center'" >
 	 	<div class="fsun-wrap">
			<span class="title" style="top: 2px;">补退款信息</span>				
  	 		<form id="cashOrderfm" name="cashOrderfm">  		   	 	
				<input name="companycode" hidden="true" />
				<input name="shopid" hidden="true" />
				<input name="shopname" hidden="true" />
				<input name="refundreason" hidden="true" />
				<input name="stockcode" hidden="true">	
				<input name="extorderid" hidden="true">	
				<input name="sysorderid" hidden="true">	
				<input id="relationid" name="relationid" hidden="true">	
				<input name="relationorigin" hidden="true">	
			    <input name="isbeforeshipment" hidden="true">
			    <input name="supplyprice" hidden="true">			    
		   	 	<table class="nb-formTable">		   	 		
			         <tr>
			         	<th width="12%">单据类别</th>
						<td>
							<input id="tradetype" name="tradetype" class="easyui-textbox" disabled />								
						</td>
			         	<th width="12%">单据编号</th>
						<td>
							<input id="originorderid" name="originorderid" class="easyui-textbox" disabled />								
						</td>							
			         	<th width="12%">配送费用</th>
						<td>
							<input id="shippingprice" name="shippingprice" class="easyui-numberbox" disabled
							  data-options="min:0,precision:2, formatter: priceFormat" />								
						</td>			          
						<th width="12%">红包金额</th>
						<td>	
						    <input id="bonusamount" name="bonusamount" class="easyui-numberbox" disabled
							  data-options="min:0,precision:2, formatter: priceFormat" />					    
						</td>														
					</tr>
					<tr>
						<th width="12%">补退类型<span style="color:red;">*</span></th>
						<td>
							<input id=isrefund name="isrefund" class="easyui-combobox" editable="false" required/>								
						</td>				         	
						<th width="12%">支付方式<span style="color:red;">*</span></th>
						<td>	
						    <input id="returnmode" name="returnmode" class="easyui-combobox" editable="false" required/>					    
						</td>			          						
						<th width="12%">支付账号</th>
						<td>
							<input id="bankaccount" name="bankaccount" class="easyui-textbox" />								
						</td>					
						<th width="12%">补退款原因<span style="color:red;">*</span></th>
						<td>	
						    <input id="refundreason" name="refundreason" class="easyui-combobox" editable="false" required/>					    
						</td>															
					</tr>
					<tr>
						<th width="12%">补退金额<span style="color:red;">*</span></th>
						<td>
							<input id="refundprice" name="refundprice" class="easyui-numberbox" required
							  data-options="min:0,precision:2, formatter: priceFormat" />								
						</td>
			         	<th width="12%">真实姓名</th>
						<td>
							<input id="realname" name="realname" class="easyui-textbox" />								
						</td>			         							
			         	<th width="12%">开户银行</th>
						<td colspan="3">
							<input id="bankname" name="bankname" class="easyui-textbox" style="width:440px;" />								
						</td>																					
					</tr>
					<tr>			        	
			        	<th width="12%">流水号</th>
						<td colspan="3">
							<input id="transcode" name="transcode" data-options="multiline:true"
								class="easyui-textbox" style="width:440px;height:50px;" />
						</td>
						<th width="12%">备注<span style="color:red;">*</span></th>
						<td colspan="3">
							<input id="remark" name="remark" data-options="multiline:true"
								class="easyui-textbox" style="width:440px;height:50px;" required/>
						</td>
			        </tr>
											         	
		   	 	</table>				   	 				   			   	 
			</form>			   	 
		</div>
	</div>	 
</div>	    

<!-- datagrid可编辑单元格 -->
<%@include file="../../ecCommon/commonEdatagridCellediting.jsp"%> 					

<script type="text/javascript">

var orderSkuDataGrid;
var currDetailData = [];
var $cashOrderfm;

$(function () { 
		
	$cashOrderfm = $("#cashOrderfm");
	orderSkuDataGrid = $("#orderSkuDataGrid");	
	orderSkuDataGrid.datagrid({
		view:footerStyleView,
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    //idField:"sku",
	    sortName:"tradetype",
        sortOrder:"asc",	
        pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    toolbar: "#addtoolbar",
	    columns:[[
			{field:"sku",title:"SKU",width:100,align:"center",sortable:true},
			{field:"tradetype",title:"交易类型",width:60,align:"center", sortable:true},
			{field:"materialname",title:"商品名称",width:220,align:"center", sortable:true},
			{field:"materialcode",title:"商品货号",width:100,align:"center"},	
			{field:"isbuy",title:"商品类型",width:50,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.ecIsbuy); 
			}},
			{field:"materialproperty",title:"商品属性",width:140,align:"center"},
			{field:"saleprice",title:"销售单价",width:50,align:"center",formatter:numBaseFormat},
			{field:"payprice",title:"实付单价",width:50,align:"center",formatter:numBaseFormat},
			{field:"orderqty",title:"交易数量",width:50,align:"center",formatter:numBaseFormat},
			{field:"totalprice",title:"实付总价",width:60,align:"center",formatter:numBaseFormat}			
	    ]],	        
	    loadFilter:function(data) { 	    	
	    	var fields = ["totalprice"];       		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "sku");
    		return data;   
        },
	    rowStyler:function(index,row){	    		    	
    		if (row.sku=="合计"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	    	
        	var rowStyle = "";     	
        	if(row.tradetype == "退货" || row.tradetype == "换退"){
				rowStyle = "background-color:#FF9933;";
			}else if(row.tradetype == "换发" || row.tradetype == "补发"){
				rowStyle = "background-color:#e0ecff;";
			}
        	return rowStyle;
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
	
	$('#isrefund', $cashOrderfm).combobox({ 
		prompt: '请选择...',
		panelHeight: 'auto',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.ecIsrefundData
   	});	
	
	$('#returnmode', $cashOrderfm).combobox({ 
		prompt: '请选择...',
		panelHeight: 'auto',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.ecPaymodeData
   	});	
	
	$('#refundreason', $cashOrderfm).combobox({ 
		prompt: '请选择...',
		panelHeight: 'auto',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.ecRefundreasonData
   	});	
	
	$("#bankaccount", $cashOrderfm).textbox({
	    "onChange":function(newValue,oldValue){
	    	if(newValue!=null && newValue!=''){
	    		$.ajax({
		    		type : "GET",
		    		url : "${api}/thirdparty/cash/getBankName/"+ newValue +"?timestamp=" + new Date().getTime(),
		    		contentType:"application/json;charset=utf-8",	   
		    		dataType : "json",
		    		success : function(result) {		
		    			var bankname = result.entry;
		    			if(result.status && bankname!=null){
		    				$("#bankname", $cashOrderfm).textbox("setValue", bankname);
		    			}					
		    		},
		    		error : function(XMLHttpRequest, textStatus, errorThrown) {
		    			$.messager.alert("错误", errorThrown, "error");
		    		}
		    	}); 
	    	}    	      
	    }
	});
	
	
	//去除默认的请选择项
	editInitComboxParams($cashOrderfm, "");
	
	var sysorderid = '${sysorderid}';
	var refundorderid = '${refundorderid}';
	$.ajax({
		type : "GET",
		url : "${api}/eccash/initOrder?sysorderid="+ sysorderid 
			+"&refundorderid="+ refundorderid +"&timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var cashOrderDto = result.entry;
			if(cashOrderDto!=null){
				initCashOrder(cashOrderDto);
			}else{
				$.messager.alert("错误", "初始化补退款信息异常", "error");
			}						
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  
	
});


/*****************************    私有方法          ******************************************/

/**
 * 初始化补退款信息
 */
function initCashOrder(cashOrderDto){
	var details = cashOrderDto.details;
	if(details!=null && details.length>0){
		currDetailData = details;
		orderSkuDataGrid.datagrid("loadData", currDetailData);	
	}
	var ecCashOrders = cashOrderDto.ecCashOrders;
	var reasonchangeenabled = ecCashOrders.reasonchangeenabled;
	if(!reasonchangeenabled){				
		$("#refundreason", $cashOrderfm).combobox('readonly',true);
		$("#refundreason", $cashOrderfm).next().children("input:first").css("background-color", "#F3F3F3");
	}	
	$cashOrderfm.form("load", ecCashOrders);
}

/**
 * 校验并组装保存的数据 
 */
function getSaveData(){
	
	var isValid = $cashOrderfm.form('validate');
	if (!isValid){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return;
	}	
	var ecCashOrders = formJson($cashOrderfm);	
	var saveData =  {
	     "params": ecCashOrders,
	     "saveUrl": "${api}/eccash/create"
	};
	return saveData;
}

/**
 *  获取当前relationid
 */
function getCurrRelationid(){
	var relationid = $("#relationid",$cashOrderfm).val();
	return relationid;
}

</script>