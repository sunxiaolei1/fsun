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

<div class="easyui-tabs" >		
	<div title="订单信息" style="padding:2px 6px 0px 6px;">						
		<div class="fsun-wrap">
			<span class="title" style="top: 65px;">换货信息[原系统单号:${sysorderid}]
				<span style="color:red;">(注:同款商品之间的替换不会产生金额差异。当存在金额差异时，有可能产生额外应收或退款)</span>
			</span>	
			<form id="orderfm">
				<input id="sysorderid" name="sysorderid" hidden="true" />
				<input id="companycode" name="companycode" hidden="true" />	
				<input id="shopid" name="shopid" hidden="true" />
				<table class="nb-formTable" style="width:100%;margin-top:2px;">
					<tr>
			            <th width="12%">新订单金额</th>
						<td>
							<input id="newpayprice" class="easyui-numberbox" disabled					
								data-options="precision:2, formatter: priceFormat" />
						</td>
						<th width="12%">差异金额</th>
						<td>
							<input id="orgindiffprice" class="easyui-numberbox" disabled					
								data-options="precision:2, formatter: priceFormat" />
						</td>
						<th width="12%">原订单金额</th>
						<td>
							<input id="oldpayprice" class="easyui-numberbox" disabled				
								data-options="precision:2, formatter: priceFormat" />
						</td>
						<th width="12%">原已付金额</th>
						<td>
							<input id="oldalreadyprice" class="easyui-numberbox" disabled				
								data-options="precision:2, formatter: priceFormat" />
						</td>																					
			        </tr>
			        <tr>
			        	<th width="12%">配送快递<span style="color:red;">*</span></th>
						<td>
							<input id="deliverexpresscode" name="expresscode" class="easyui-combobox" editable="false" required/>								
						</td>
			            <th width="12%">调整后金额差异<span style="color:red;">*</span></th>
						<td colspan="3">
							<input id="diffprice" name="diffprice" class="easyui-numberbox" 					
								data-options="precision:2, formatter: priceFormat" required/>								
							<span style="color:red;">*调整为负值时,将会导致退款发生</span>
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
						<td colspan="3">
							<input name="mobileno" id="mobileno" class="easyui-textbox" data-options="validType:'mobile'" />
							<span style="color:red;">*手机号码 、固定电话必须填一项</span>
						</td>						
						<th width="12%">固定电话</th>
						<td>
							<input id="tel" name="tel" class="easyui-textbox" data-options="validType:'tel'" />							
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
							<input id="zipcode" name="zipcode" class="easyui-textbox" data-options="validType:'zip'" />
						</td>						
			        </tr>
			        <tr>
			        	<th width="12%">换货备注</th>
						<td colspan="3">
							<input id="barterremark" name="sellerremark"  data-options="multiline:true" 
								class="easyui-textbox" style="width:400px;height:56px;"/>
						</td>
			        	<th width="12%">详细地址<span style="color:red;">*</span></th>
						<td colspan="3">
							<input id="address" name="address" data-options="multiline:true"
								class="easyui-textbox" style="width:400px;height:56px;" required/>
						</td>
			        </tr>			       
				</table>	
			</form>		
		</div>				
		<div class="fsun-wrap">
			<span class="title" style="top: 320px;">退货信息</span>
			<form id="refundOrderfm">	
				<table class="nb-formTable" style="width:100%;margin-top:2px;">	
					 <tr>	
			        	<th width="12%">寄回发票</th>
						<td>
							<input id="isreturninvoices" name="isreturninvoices" type="checkbox"  style="zoom:140%;" />
						</td>
		       			<th width="12%">退货快递</th>
						<td>
							<input id="refundexpresscode" name="expresscode" class="easyui-combobox" editable="false" />								
						</td>
						<th width="12%">快递单号</th>
						<td colspan="3">
							<input id="expressno" name="expressno" class="easyui-textbox" style="width:350px;" />								
						</td>														        			           
			        </tr>	  
			        <tr>
			        	<th width="12%">原订单备注</th>
						<td colspan="3">
							<input id="oldremark" data-options="multiline:true" disabled
								class="easyui-textbox" style="width:400px;height:56px;"/>
						</td>
			        	<th width="12%">退货备注</th>
						<td colspan="3">
							<input id="refundremark" name="remark"  data-options="multiline:true" 
								class="easyui-textbox" style="width:400px;height:56px;"/>
						</td>
			        </tr>		
				</table>
			</form>
		</div>					
		
	</div>		
	<div title="订单商品" closable="false" style="padding:6px;">
	    <div style="width:100%;height:260px;">
	    	<div id="detailskutoolbar" style="display:none;">
				<%@include file="./detailskutoolbar.jsp"%>
			</div>
			<table id="orderDetailDataGrid"></table>			
	    </div> 
	    <div style="width:100%;height:180px;margin-top:5px;">	    	
			<table id="refundDetailDataGrid"></table> 			
	    </div> 	    				
	</div>
</div>	

<%@include file="../../ecCommon/provinceToCityToRegionSelect.jsp"%>
<!-- datagrid可编辑单元格 -->
<%@include file="../../ecCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currRefundDetail = [];
var currOrderDetailDataGrid;
var currRefundDetailDataGrid;
var $orderfm ;
var $refundOrderfm;

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
	$refundOrderfm = $("#refundOrderfm"); 
	var sysorderid = '${sysorderid}';
	$("#sysorderid").val(sysorderid);
	currOrderDetailDataGrid = $("#orderDetailDataGrid");
	currRefundDetailDataGrid = $("#refundDetailDataGrid");
	
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
	
	
	$('#deliverexpresscode', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.expressCodeData
   	});	
	
	$('#refundexpresscode', $refundOrderfm).combobox({  
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
	    sortName:"aftersalestatus",
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
			{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
			{field:"orderlineid",title:"交易类型",width:60,align:"center", sortable:true,
				formatter:function(value, row){				
					if(typeof value == "undefined"){
	            		return "换发";
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
					if(typeof orderlineid != 'undefined'){
						if(row.aftersalestatus == 10){
							return commonAssemBottonHtml('refundOne', index, '换退', 'icon-script_gear');
						}						 					
					}else{
						return commonAssemBottonHtml('delDeliverOne', index, '删除', 'icon-script_delete');
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
	    	afterEditFunc(rowData);	    		    	   	
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
						
			$("#oldpayprice", $orderfm).numberbox("setValue", header.payprice.toFixed(2));
			$("#oldalreadyprice",$orderfm).numberbox("setValue", header.alreadyprice.toFixed(2));
			$("#deliverexpresscode", $orderfm).combobox("setValue", header.expresscode);		
			$("#stockname",$orderfm).textbox("setValue", stockInfo.stockname);	
			$("#barterremark",$orderfm).textbox("clear");	
			
			
			setTimeout(function(){
				$("#regionCombo", $orderfm).combobox("setValue", header.regionid);															
			},100);
			
			$("#refundexpresscode", $refundOrderfm).combobox("setValue", header.expresscode);
			$("#oldremark", $refundOrderfm).textbox("setValue", header.remark);
			
			currDetailData = ecorderDto.details;
			skuListReLoad();
			
			currRefundDetailDataGrid.datagrid({
				title:"换退商品列表",
				width:"auto",
			    height:"auto",
			    nowrap:false,
			    striped:true,
			    border:true,
			    collapsible:false,//是否可折叠的
			    fit:true,//自动大小	   
			    remoteSort:false,
			    sortName:"sku",
		        sortOrder:"desc",	    
			    singleSelect:true,//是否单选   
			    rownumbers:true,//行号
			    fitColumns:true,
			    showFooter:true,
			    columns:[[
					{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
					{field:"materialname",title:"商品名称",width:240,align:"center"},
					//{field:"materialcode",title:"商品货号",width:80,align:"center"},	
					{field:"isbuy",title:"商品类型",width:60,align:"center", formatter:function(value, row){
						return formatter(value, window.parent.ecIsbuy); 
					}},
					{field:"materialproperty",title:"商品属性",width:140,align:"center"},
					{field:"payprice",title:"实付单价",width:60,align:"center",formatter:numBaseFormat},
					{field:"oldorderqty",title:"下单数量",width:60,align:"center",formatter:numBaseFormat},
					{field:"oldtotalprice",title:"实付总价",width:60,align:"center",formatter:numBaseFormat},			
					{field:"orderqty",title:"退货数量",width:60,align:"center",
						styler: function(value, rowData, rowIndex){
		                	return 'font-weight:bold;color:green;';
		                },
		                formatter:numBaseFormat,
						editor:{
							type:'numberspinner',
							options:{
								required: true,
								min:0,
								precision:2
							}
						}},	
					{field:"totalprice",title:"退款金额",width:60,align:"center",formatter:numBaseFormat},			
					{field:"reasonid",title:"退货理由",width:160,align:"center",
						editor:{
							type:'combobox',
							options: {
								valueField: 'codecode',
						   	  	textField: 'codename',
						   		url: "${api}/ecorder/config/getRefundReasons/"+ shopid,
		                        panelHeight : 'auto',
		                        editable: false,
		                        required: true,		                        
		                        loadFilter: function(data){			            				
		            		 		return data.entry;
		            			}
		                    }							
						},
						styler: function(value, rowData, rowIndex){
							return 'font-weight:bold;color:green;';
                        },
						formatter:function(value, row){
							return formatter(value, window.parent.ecReturnReason); 
						}	
					},
					{field:"delete",title:"操作",width:80,align:"center", formatter: function(value, row, index){
						return commonAssemBottonHtml('delRefundOne', index, '删除', 'icon-script_delete');					
					}}
			    ]],
			    loadMsg:"数据加载中请稍后……",
			    emptyMsg:"没有符合条件的记录",
			    onAfterEdit: function(rowIndex, rowData, changes){
			    	afterEditFunc(rowData);
			    }
			}).datagrid("loadData", currRefundDetail);
	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  		
     
});


/*****************************     商品操作方法          ******************************************/

/**
 * 退货单个
 */
function refundOne(rowIndex){
	var row = currOrderDetailDataGrid.datagrid('getRows')[rowIndex];   
    $.each(currDetailData, function(){
    	if(this.orderlineid == row.orderlineid){
    		this.aftersalestatus = 20;  	
    		currOrderDetailDataGrid.datagrid("refreshRow", rowIndex);
    		return;
    	}
    });	
 
    var rowdata = cloneObj(row);    
    rowdata.oldorderqty = row.orderqty;
    rowdata.oldtotalprice = row.totalprice;
    rowdata.reasonid = 70;
    delete rowdata.returnreason;
    delete rowdata.aftersalestatusname;
    //delete rowdata.aftersalestatus;
    delete rowdata.giftname;
    delete rowdata.nid;
    
    currRefundDetail.push(rowdata);
    currRefundDetailDataGrid.datagrid("loadData",currRefundDetail);
	
	//同步订单头金额信息
	synHeaderPrices();
}

/**
 * 删除单个发货商品
 */
function delDeliverOne(rowIndex){	
	var rowData = currOrderDetailDataGrid.datagrid('getRows')[rowIndex];	
	for(var i in currDetailData) {	
		if(existSku(currDetailData[i], rowData.sku)) {
			currDetailData.splice(i,1);	
			break;
		}
	}
	currOrderDetailDataGrid.datagrid("deleteRow",rowIndex).datagrid("loadData", currDetailData);
	
	//同步订单头金额信息
	synHeaderPrices();
}

/**
 * 删除单个退货商品
 */
function delRefundOne(rowIndex){
	
	var row = currRefundDetailDataGrid.datagrid('getRows')[rowIndex];
	$.each(currDetailData, function(){
    	if(this.orderlineid == row.orderlineid){
    		this.aftersalestatus = 10;
    		currOrderDetailDataGrid.datagrid("loadData",currDetailData);
    		return;
    	}
    });
	
	currRefundDetailDataGrid.datagrid("deleteRow",rowIndex).datagrid("loadData", currRefundDetail);
	
	//同步订单头金额信息
	synHeaderPrices();
}

//商品列表刷新
function skuListReLoad(isAdd) {	
	
	if(typeof isAdd != 'undefined' && isAdd){
		$.each(currDetailData, function(){
			if((this.orderlineid==null||this.orderlineid=='') && this.aftersalestatus == 40){
				this.aftersalestatus = 30;
				
				//同款商品之间的替换不会产生金额差异。------当存在金额差异时，有可能产生额外应收或退款
				var skuDto = getRefundSku(currRefundDetail, this);
				if(skuDto!=null && this.payprice != skuDto.payprice){
					this.payprice = Number(skuDto.payprice);
					this.totalprice = this.payprice * this.orderqty;
					this.discountprice = this.saleprice * this.orderqty - this.totalprice;
				}
				
			}
		});
		//同步订单头金额信息
		synHeaderPrices();
	}	
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);
}

/**
 * 行结束编辑时执行更新单行金额
 */
function afterEditFunc(rowData){
	
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
	//同步订单头金额信息
	synHeaderPrices();
}


/**
 * 同步订单头信息金额
 */
function synHeaderPrices(){
	
	var newpayprice = 0;
	var refundprice = 0;
    $.each(currDetailData, function(){
    	var orderlineid = this.orderlineid;
    	if(typeof orderlineid == 'undefined'){
    		newpayprice += Number(this.totalprice);
    	}   	
    });	 
	$.each(currRefundDetail, function(){
		refundprice += Number(this.totalprice);
	});
	 
	var diffprice = newpayprice - refundprice;
	$("#newpayprice", $orderfm).numberbox("setValue", newpayprice);
    $("#orgindiffprice", $orderfm).numberbox("setValue", diffprice);
    $("#diffprice", $orderfm).numberbox("setValue", diffprice);
}

/*****************************    私有方法          ******************************************/

/**
 * 从退货列表中获取sku同款商品
 */
function getRefundSku(currRefundDetail, row){
	var skuDto = null;
	$.each(currRefundDetail, function(){
		if(this.sku == row.sku){
			skuDto = this;
			return ;
		}
	});
	return skuDto;
}

/**
 * 校验并组装保存的数据 
 */
function getSaveData(){
	
	var isValid0 = currOrderDetailDataGrid.datagrid("isValid");	
	var isValid1 = currRefundDetailDataGrid.datagrid("isValid");	
	var isValid = $orderfm.form('validate');
	var isValid3 = $refundOrderfm.form('validate');
	if (!isValid || !isValid3 || !isValid0 || !isValid1){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}			
	
	//获取头信息
	var orderInfo = formJson($orderfm);	
	var provincename = $("#provinceCombo", $orderfm).combobox("getText");
	var cityname = $("#cityCombo", $orderfm).combobox("getText");
	var regionname = $("#regionCombo", $orderfm).combobox("getText");
	orderInfo.provincename = provincename;
	orderInfo.cityname = cityname;
	orderInfo.regionname = regionname;	
	
	var refundInfo = formJson($refundOrderfm);
	refundInfo.isreturninvoices = $("#isreturninvoices", $refundOrderfm).prop("checked")?1:0;

	//获取明细
	currOrderDetailDataGrid.datagrid("acceptChanges");
	currRefundDetailDataGrid.datagrid("acceptChanges");
	var orderprice = 0;
	var payprice = 0;
	var reissueDetails = [];
	$.each(currDetailData, function(){
	    
		if(this.orderlineid==null || this.orderlineid==''){
			orderprice += Number(this.saleprice)*Number(this.orderqty);	
		}else{
			if(this.aftersalestatus == 20){
				payprice += Number(this.totalprice);
			}
		}
		reissueDetails.push(initReissueDetails(this));
	});
	
	orderInfo.diffprice = Number(orderInfo.diffprice);
	orderInfo.orderprice = orderprice;
	orderInfo.payprice = payprice + orderInfo.diffprice;
	if(orderInfo.payprice<0){
		$.messager.alert("错误", "提交的数据不正确!", "error"); 
		return null;
	}	
	orderInfo.couponprice = orderInfo.orderprice-orderInfo.payprice;
	orderInfo.alreadyprice = orderInfo.payprice;
	orderInfo.unpayprice = 0;
	orderInfo.shippingprice = 0;
	orderInfo.distributionpayprice = 0;
	
	//计算有效订单商品实收金额
	var newpayprice = 0;
	$.each(currRefundDetail, function(){		
		newpayprice += (Number(this.oldtotalprice)-Number(this.totalprice)); 				
	});	
	refundInfo.newpayprice = (newpayprice + payprice);
		
	var saveData = {
	     "params": {
			 "orderHeader": orderInfo,
			 "refundHeader": refundInfo,
			 "reissueDetails": reissueDetails,
			 "refundDetails": currRefundDetail
			},
	     "saveUrl": "${api}/ecaftersale/barter/create"
	}
	return saveData;
}


</script>