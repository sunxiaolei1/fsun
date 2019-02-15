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

<!-- 查询条件 -->
<%@include file="../addtoolbar.jsp"%>

	
	
<div class="fsun-wrap">
	<form id="orderfm">
		<span class="title" style="top: 35px;">补发信息[原系统单号:${sysorderid}]<span style="color:red;">(注:补发单不产生发票)</span></span>		
		<input id="sysorderid" name="sysorderid" hidden="true" />	
		<input id="companycode" name="companycode" hidden="true" />	
		<input id="shopid" name="shopid" hidden="true" />
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">原订单金额</th>
				<td>
					<input id="payprice" class="easyui-textbox" disabled />
				</td>
				<th width="12%">原已付金额</th>
				<td>
					<input id="alreadyprice" class="easyui-textbox" disabled />
				</td>	
				<th width="12%">配送快递<span style="color:red;">*</span></th>
				<td>
					<input id="expresscode" name="expresscode" class="easyui-combobox" editable="false" required/>								
				</td>			
				<th width="12%">所属仓库<span style="color:red;">*</span></th>
				<td>
					<input id="stockname" class="easyui-textbox" disabled />								
				</td>								
	        </tr>		        
       		<tr>
	            <th width="12%">收货人<span style="color:red;">*</span></th>
				<td>
					<input name="receivename" id="receivename" class="easyui-textbox" required/>
				</td>
				<th width="12%">手机号码</th>
				<td>
					<input name="mobileno" id="mobileno" class="easyui-textbox" data-options="validType:'mobile'" />
				</td>
				<th width="12%">固定电话</th>
				<td colspan="3">
					<input id="tel" name="tel" class="easyui-textbox" data-options="validType:'tel'" />
					<span style="color:red;">*手机号码 、固定电话必须填一项</span>
				</td>										
	        </tr>
			<tr>
	            <th width="12%">省份<span style="color:red;">*</span></th>
				<td>							
					<input id="provinceCombo" name="provinceid"  class="easyui-combobox" required editable="false"/>
				</td>
				<th width="12%">城市<span style="color:red;">*</span></th>
				<td>							
					<input id="cityCombo" name="cityid" class="easyui-combobox" required editable="false"/>
				</td>
				<th width="12%">县区<span style="color:red;">*</span></th>
				<td>							
					<input id="regionCombo" name="regionid" class="easyui-combobox" required editable="false" />
				</td>
				<th width="12%">邮编<span style="color:red;">*</span></th>
				<td>
					<input id="zipcode" name="zipcode" class="easyui-textbox" required data-options="validType:'zip'" />
				</td>						
	        </tr>
	        <tr>
	        	<th width="12%">备注</th>
				<td colspan="3">
					<input id="sellerremark" name="sellerremark"  data-options="multiline:true" 
						class="easyui-textbox" style="width:430px;height:50px;"/>
				</td>
	        	<th width="12%">详细地址<span style="color:red;">*</span></th>
				<td colspan="3">
					<input id="address" name="address" data-options="multiline:true"
						class="easyui-textbox" style="width:430px;height:50px;" required/>
				</td>
	        </tr>
		</table>
	</form>			
</div>	
<div style="height: 270px; width: 100%;">
	<div id="detailskutoolbar" style="display:none;">
		<%@include file="./detailskutoolbar.jsp"%>
	</div>
	<table id="orderDetailDataGrid"></table>
</div>					

<%@include file="../../ecCommon/provinceToCityToRegionSelect.jsp"%>
<!-- datagrid可编辑单元格 -->
<%@include file="../../ecCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currOrderDetailDataGrid;
var $orderfm ;

$.extend($.fn.validatebox.defaults.rules, {
	enableSku: {// 验证
    	validator: function (value) {   		
            var companycode = $("#companycode").val(); 		
 			var shopid = $("#shopid").val(); 			
 			var row = currOrderDetailDataGrid.datagrid("getSelected");	
 			if(row != null){
 				var companyShopSku = companycode+"-"+ shopid +"-"+ row.sku;				
	 			var enableQty = localEnableSkuQty(companyShopSku);	 			
 	 			if(enableQty == null){
 	 				enableQty = remoteEnableSkuQty("${api}/invsku/getShopEnableQty", {
 	 					"companycode": companycode,
 	 					"shopid": shopid,
 	 					"sku": row.sku
 	 				}); 
 	 				pushEnableSkuQty(companyShopSku, enableQty);
 	 			}										
 	 			if(value > enableQty){
 	 				$.fn.validatebox.defaults.rules.enableSku.message = '该商品当前可用库存为'+ enableQty;
 					return false;
 				}	
 			}			 									
     		return true;
     	},
     	message: ''
	}
});


$(function () { 
	
	$orderfm = $("#orderfm");   		
	var sysorderid = '${sysorderid}';
	currOrderDetailDataGrid = $("#orderDetailDataGrid");
	
	/************************************      实现手机号和固话至少一个要填，不然设置必填项            ******************************************/
		
	/**
	 * 当input框内容变化时变化是否是必填项
	 */
	function changeReqiured(textbox1, textbox2, value1, value2, $fm){			
		if(value1=='' && value2==''){	    		
			$("#"+textbox1, $fm).textbox({required:true});
			$("#"+textbox2, $fm).textbox({required:true});
    	}else{	    	    		
    		$("#"+textbox1, $fm).textbox({required:false});
    		$("#"+textbox2, $fm).textbox({required:false});
    		//setTimeout('$("div").remove(".tooltip");',200);    		
    		$("div").remove(".tooltip");  		
    	}	
	}
	
	$('#mobileno', $orderfm).textbox({  
		required: true,
	    onChange: function(value1) {		    	
			var value2 = $("#tel", $orderfm).textbox("getValue");	
	    	changeReqiured("mobileno", "tel", value1, value2, $orderfm);	    	 
	    }
	});
	$('#tel', $orderfm).textbox({ 
		required: true,		
	    onChange: function(value2) {		    	
	    	var value1 = $("#mobileno", $orderfm).textbox("getValue");	    		
	    	changeReqiured("mobileno", "tel", value1, value2, $orderfm);		    	
	    }
	}); 		
	$('input').focus(function(){	
		var value1 = $("#mobileno", $orderfm).textbox("getValue");
		var value2 = $("#tel", $orderfm).textbox("getValue");
		changeReqiured("mobileno", "tel", value1, value2, $orderfm);			   
	});
		
	/***************************************                            ************************************/
	
	
	$('#expresscode', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.expressCodeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	//省、市、县级连初始化
	initProvinceCombo("请选择...");
	
	currOrderDetailDataGrid.datagrid({
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    //idField:"sku",
	    sortName:"orderlineid",
        sortOrder:"asc",	
        pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    toolbar: "#detailskutoolbar",
	    columns:[[
			{field:'ck',checkbox:true},
			{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
			{field:"orderlineid",title:"交易类型",width:60,align:"center", sortable:true,
				formatter:function(value, row){				
					if(typeof value == "undefined"){
	            		return "补发";
	            	} 
					return "销售";
				}
			},
			{field:"materialname",title:"商品名称",width:240,align:"center", sortable:true},
			//{field:"materialcode",title:"商品货号",width:80,align:"center"},	
			{field:"isbuy",title:"商品类型",width:60,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.ecIsbuy); 
			}},
			{field:"materialproperty",title:"商品属性",width:140,align:"center"},
			{field:"saleprice",title:"销售单价",width:60,align:"center",formatter:numBaseFormat},
			{field:"payprice",title:"实付单价",width:60,align:"center",
				styler: function(value, rowData, rowIndex){
					var orderlineid = rowData.orderlineid;
					if(typeof orderlineid == 'undefined'){
						return 'font-weight:bold;color:green;';
					}
					return '';
                },
                formatter:numBaseFormat,
				editor:{
					type:'numberbox',
					options:{					
						min:0,
						precision:2						
					}
				}
    		},
			{field:"orderqty",title:"下单数量",width:60,align:"center",
				styler: function(value, rowData, rowIndex){
					var orderlineid = rowData.orderlineid;
					if(typeof orderlineid == 'undefined'){
						return 'font-weight:bold;color:green;';
					}
					return '';
                },
                formatter:numBaseFormat,             
				editor:{
					type:'numberspinner',
					options:{
						required: true,
						min:0.01,
						precision:2,
						validType: 'enableSku'
					}
				}
    		},
			{field:"totalprice",title:"实付总价",width:60,align:"center",formatter:numBaseFormat},			
			{field:"aftersalestatus",title:"售后状态",width:60,align:"center", sortable:true,
				formatter:function(value, row){				
					if(value==10){
						return '<span style="font-weight:bold;color:green;">'+ formatter(value, window.parent.ecAftersalestatus) +'</span>';
					}
					return '<span style="font-weight:bold;color:red;">'+ formatter(value, window.parent.ecAftersalestatus) +'</span>';			
				}
			},
			{field:"torefund",title:"操作",width:80,align:"center", 
				formatter: function(value, row, index){	
					var orderlineid = row.orderlineid;
					if(typeof orderlineid == 'undefined'){
						return commonAssemBottonHtml('delOne', index, '删除', 'icon-script_delete');
					}								
				}
			}
	    ]],
	    onSelect: function(rowIndex, rowData){
	    	var $datagrid = $(this);
	    	var orderlineid = rowData.orderlineid;
			if(typeof orderlineid != 'undefined'){
				$datagrid.datagrid("cancelEdit",rowIndex);
			}	    	 
	    },
	    onAfterEdit: function(rowIndex, rowData, changes){
	    	if(typeof rowData.payprice !=undefined && typeof rowData.orderqty!=undefined){
	    		rowData.payprice = Number(rowData.payprice);
		    	rowData.orderqty = Number(rowData.orderqty);
		    	rowData.saleprice = Number(rowData.saleprice);
	    		rowData.totalprice = rowData.payprice * rowData.orderqty;
	    		rowData.discountprice = rowData.saleprice * rowData.orderqty - rowData.totalprice;
	    	}else{	    		   	
	    		rowData.totalprice = 0;
	    		rowData.discountprice = 0;
	    	}
	    		    	   	
	    },
	    loadFilter:function(data) { 
	    	//排序拦截器
    		sortFilter($(this), data);
    		//分页拦截器
    		return pagerFilter($(this), data);   
        },
	    rowStyler:function(index,row){
        	var rowStyle = "background-color:#e0ecff;";     	
        	if(typeof row.orderlineid == "undefined"){
				rowStyle = "background-color:#FF9933;";
			}
        	return rowStyle;
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
	
	$.ajax({
		type : "GET",
		url : "${api}/ecaftersale/order/base/"+ sysorderid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var ecorderDto = result.entry;
			var header = ecorderDto.header;
			var stockInfo = ecorderDto.stockInfo;
			
			var shopid = header.shopid;
			/***************************              基本信息初始化                        ************************/
			
			$orderfm.form("load", header);
			
			$("#payprice", $orderfm).textbox("setValue", header.payprice.toFixed(2));
			$("#alreadyprice", $orderfm).textbox("setValue", header.alreadyprice.toFixed(2));
			$("#stockname",$orderfm).textbox("setValue", stockInfo.stockname);			
			
			setTimeout(function(){
				$("#regionCombo", $orderfm).combobox("setValue", header.regionid);															
			},100);
			
			currDetailData = ecorderDto.details;
			skuListReLoad();
	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});

/**
 * 删除单个
 */
function delOne(rowIndex){	
	var rowData = currOrderDetailDataGrid.datagrid('getRows')[rowIndex];	
	for(var i in currDetailData) {	
		if(existSku(currDetailData[i], rowData.sku)) {
			currDetailData.splice(i,1);	
			break;
		}
	}	
	currOrderDetailDataGrid.datagrid("deleteRow",rowIndex).datagrid("loadData", currDetailData);
}

//商品列表刷新
function skuListReLoad() {
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);
}

/**
 * 校验并组装保存的数据 
 */
function getSaveData(){
	
	var isValid0 = currOrderDetailDataGrid.datagrid("isValid");		
	var isValid = $orderfm.form('validate');
	if (!isValid || !isValid0){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}			
	currOrderDetailDataGrid.datagrid("acceptChanges");
	var baseInfo = formJson($orderfm);	
	var provincename = $("#provinceCombo", $orderfm).combobox("getText");
	var cityname = $("#cityCombo", $orderfm).combobox("getText");
	var regionname = $("#regionCombo", $orderfm).combobox("getText");
	baseInfo.provincename = provincename;
	baseInfo.cityname = cityname;
	baseInfo.regionname = regionname;	

	var reissueDetails = [];
	$.each(currDetailData, function(){
		if(this.orderlineid==null || this.orderlineid==''){
			reissueDetails.push(this);
		}
	});
	
	baseInfo.orderprice = 0;
	baseInfo.payprice = 0;
	baseInfo.couponprice = 0;
	baseInfo.alreadyprice = 0;
	baseInfo.unpayprice = 0;
	baseInfo.shippingprice = 0;
	baseInfo.distributionpayprice = 0;
	
	var saveData = {
	     "params": {
			 "header": baseInfo,
			 "details": reissueDetails
			},
	     "saveUrl": "${api}/ecaftersale/reissue/create"
	}
	return saveData;
}


</script>


