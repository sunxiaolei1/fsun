<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../headerJS.jsp" %>
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

<!-- 查询条件-->
<%@include file="../ecAfterSale/addtoolbar.jsp"%> 

<!-- 编辑差异单头金额信息 -->		
<div id="editDiffOrderWin" class="easyui-window" title="差异单信息" closed="true" align="center" style="display:none;width:95%;height:90%;top:40px;" modal="true">  
   	 <div class="easyui-layout" fit=true  id='base_layout'>
   	 	<div data-options="region:'north'" class="toolbar" >
			<a href="#" class="easyui-linkbutton" iconCls="icon-cog_add" plain="true" onclick="saveData()">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="$('#editDiffOrderWin').window('close');">取消</a>  
			<div style="margin:8px 5px 0px 0px;float:right;">
				<span style="font-weight:bold;color:red;">注:1.订单商品更改产生的差价自动生成补退款,负值为退款,正值为补款; 2.实付金额包含商品实付,配送费用.</span>																	
			</div>
		</div>  	 	
   	 	<div data-options="region:'center'" >
   	 		<div class="fsun-wrap">
				<span class="title" style="top: 2px;">原订单费用(单号:<span id='originalsysorderid'></span>)</span>	
				<span class="title" style="top: 2px;left:50%">差异单费用</span>	
	   	 		<form id="diffOrderfm" name="diffOrderfm">  
			   	 	<input id="sysorderid" name="sysorderid" hidden="true" />	
					<input id="companycode" name="companycode" hidden="true" />
					<input id="shopid" name="shopid" hidden="true" />	
					<div style="width:100%;height:140px;">
				   	 	<table class="nb-formTable" style="width:49%;float:left;">
					        <tr>			          
								<th width="12%">订单金额</th>
								<td>
									<input id="originalorderprice" name="originalorderprice" class="easyui-numberbox" 
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
								<th width="12%">实付金额</th>
								<td>																	
									<input id="originalpayprice" name="originalpayprice" class="easyui-numberbox" 
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
							</tr>
					        <tr>				
								<th width="12%">积分数</th>
								<td>
									<input id="originalintegralamount" name="originalintegralamount" class="easyui-numberbox" 
										disabled data-options="formatter: intNumBaseFormat" />
								</td>
								<th width="12%">红包金额</th>
								<td>
									<input id="originalbonusamount" name="originalbonusamount" class="easyui-numberbox" 
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>														
					        </tr>				        
					        <tr>
								<th width="12%">商品优惠</th>
								<td>
									<input id="originaldiscountprice" name="originaldiscountprice" class="easyui-numberbox"
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
								<th width="12%">商家优惠</th>
								<td>
									<input id="originalsellercouponprice" name="originalsellercouponprice" class="easyui-numberbox"
										disabled data-options="min:0,precision:2,formatter: priceFormat" />								
								</td>						
					        </tr>
					        <tr>
					        	<th width="12%">配送费用</th>
								<td>
									<input id="originalshippingprice" name="originalshippingprice" class="easyui-numberbox" 
										disabled data-options="min:0,precision:2,formatter:priceFormat" />								
								</td>			          								
								<th width="12%">已付金额</th>
								<td>	
									<input id="originalalreadyprice" name="originalalreadyprice" class="easyui-numberbox"
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
							</tr>	 	
				   	 	</table>
				   	 	<table class="nb-formTable" style="width:50%;float:right;">
				   	 		<tr>			          
								<th width="12%">订单金额</th>
								<td>
									<input id="neworderprice" name="neworderprice" class="easyui-numberbox" 
										readonly data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
								<th width="12%">实付金额</th>
								<td>	
									<input id="newpayprice" name="newpayprice" class="easyui-numberbox" 
										readonly data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
							</tr>
					        <tr>				
								<th width="12%">积分数</th>
								<td>
									<input id="integralamount" name="integralamount" class="easyui-numberbox" 
										disabled data-options="formatter: intNumBaseFormat" />
								</td>
								<th width="12%">红包金额</th>
								<td>
									<input id="bonusamount" name="bonusamount" class="easyui-numberbox" 
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>														
					        </tr>					       
					        <tr>
								<th width="12%">商品优惠</th>
								<td>
									<input id="discountprice" name="discountprice" class="easyui-numberbox"
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
								<th width="12%">商家优惠</th>
								<td>
									<input id="couponfee" name="couponfee" hidden=true />
									<input id="sellercouponprice" name="sellercouponprice" class="easyui-numberbox"
										 data-options="min:0,precision:2,formatter: priceFormat" />								
								</td>						
					        </tr>
					         <tr>	
					         	<th width="12%">配送费用</th>
								<td>
									<input id="shippingfee" name="shippingfee" class="easyui-numberbox" 
									  data-options="min:0,precision:2, formatter: priceFormat" />								
								</td>			          
								<th width="12%">补退金额</th>
								<td>	
								    <input id="difforderprice" name="difforderprice" hidden=true />							    
									<input id="changeprice" name="changeprice" class="easyui-numberbox"
										readonly data-options="precision:2,formatter: priceFormat" />
								</td>														
							</tr>						         	
				   	 	</table>				   	 	
				   	 </div>				   	 
			   	 </form>			   	 
			</div>
   	 	</div>
   	 	<div data-options="region:'south'" style="height:50%;" >
   	 		<table id="diffOrderSkuDataGrid"></table>
   	 	</div>
   	 </div>	 
</div>

		
<div style="width:100%;height:60%;">
  	<div id="detailskutoolbar" style="display:none;">
		<%@include file="./detailskutoolbar.jsp"%>
	</div>
	<table id="orderDetailDataGrid"></table>			
</div> 
<div style="width:100%;height:32%;margin-top:5px;">	    	
	<table id="refundDetailDataGrid"></table> 			
</div> 	    					
	

<!-- datagrid可编辑单元格 -->
<%@include file="../ecCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currRefundDetail = [];
var currOrderDetailDataGrid;
var currRefundDetailDataGrid;
var diffOrderSkuDataGrid;
var currDiffid;
var $diffOrderfm;

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
	
	currDiffid = '${diffid}'; 
	$diffOrderfm = $("#diffOrderfm");
	currOrderDetailDataGrid = $("#orderDetailDataGrid");
	currRefundDetailDataGrid = $("#refundDetailDataGrid");
	diffOrderSkuDataGrid = $("#diffOrderSkuDataGrid");
	
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
			{field:"sku",title:"SKU",width:100,align:"center",sortable:true},
			{field:"orderlineid",title:"交易类型",width:60,align:"center", sortable:true,
				formatter:function(value, row){				
					if(typeof value == "undefined"){
	            		return "变更";
	            	} 
					return "销售";
				}
			},
			{field:"materialname",title:"商品名称",width:220,align:"center", sortable:true},
			{field:"materialcode",title:"商品货号",width:100,align:"center"},	
			{field:"isbuy",title:"商品类型",width:50,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.ecIsbuy); 
			}},
			{field:"materialproperty",title:"商品属性",width:140,align:"center"},
			{field:"saleprice",title:"销售单价",width:50,align:"center",formatter:numBaseFormat},
			{field:"payprice",title:"实付单价",width:50,align:"center",
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
			{field:"orderqty",title:"下单数量",width:50,align:"center",
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
			{field:"invstatus",title:"库存状态",width:60,align:"center", sortable:true,
				formatter:function(value, row){				
					if(value==20){
						return '<span style="font-weight:bold;color:green;">'+ formatter(value, window.parent.ecINVstatus) +'</span>';
					}
					return '<span style="font-weight:bold;color:red;">'+ formatter(value, window.parent.ecINVstatus) +'</span>';			
				}
			},
			{field:"torefund",title:"操作",width:60,align:"center", 
				formatter: function(value, row, index){	
					var orderlineid = row.orderlineid;
					if(typeof orderlineid != 'undefined'){
						if(row.aftersalestatus == 10){
							return commonAssemBottonHtml('refundOne', index, '替换', 'icon-script_gear');
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
	
	currRefundDetailDataGrid.datagrid({
		title:"被换商品列表",
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
			{field:"orderqty",title:"被换数量",width:60,align:"center",
				styler: function(value, rowData, rowIndex){
                	return 'font-weight:bold;color:green;';
                },
                formatter:numBaseFormat,
				editor:{
					type:'numberspinner',
					options:{
						required: true,
						min:0.01,
						precision:2
					}
				}},	
			{field:"totalprice",title:"被换金额",width:60,align:"center",formatter:numBaseFormat},						
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
	
	if(currDiffid!=''){
		$.ajax({
			type : "GET",
			url : "${api}/ecdiff/order/"+ currDiffid +"?timestamp=" + new Date().getTime(),
			contentType:"application/json;charset=utf-8",	   
			dataType : "json",
			success : function(result) {		
				var ecDiffOrderDto = result.entry;
				initGridData(ecDiffOrderDto);				
				initPreviewOrder(currDiffid, ecDiffOrderDto.oldHeader, ecDiffOrderDto.newHeader);													
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert("错误", errorThrown, "error");
			}
		}); 
	}else{
		
		$.ajax({
			type : "GET",
			url : "${api}/ecorder/base/${sysorderid}?timestamp=" + new Date().getTime(),
			contentType:"application/json;charset=utf-8",	   
			dataType : "json",
			success : function(result) {		
				var ecorderDto = result.entry;			
				currDetailData = ecorderDto.details;
				initPreviewOrder(currDiffid, ecorderDto.header);
				skuListReLoad();	
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert("错误", errorThrown, "error");
			}
		});  
	}  
	
	$("#neworderprice",$diffOrderfm).next().find("input:first").css("background-color","#F3F3F3");
	$("#newpayprice",$diffOrderfm).next().find("input:first").css("background-color","#F3F3F3");	
	$("#changeprice",$diffOrderfm).next().find("input:first").css("background-color","#F3F3F3");	
	$("#editDiffOrderWin").show();
});


/*****************************     商品操作方法          ************************************/

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
    delete rowdata.rowno;
    delete rowdata.invstatus;
    
    currRefundDetail.push(rowdata);
    currRefundDetailDataGrid.datagrid("loadData",currRefundDetail);
}

/**
 * 删除单个发货商品
 */
function delDeliverOne(rowIndex){
		
	var rowData = currOrderDetailDataGrid.datagrid('getRows')[rowIndex];	
	if(typeof updateIsbuy === "function"){
		updateIsbuy(rowData.isbuy);
		for(var i in currDetailData) {	
			if(existSku(currDetailData[i], rowData.sku)) {
				currDetailData.splice(i,1);	
				break;
			}
		}
	}else{
		for(var i in currDetailData) {
			var orderlineid = currDetailData[i].orderlineid;
			var sku = currDetailData[i].sku;
			if(typeof orderlineid == 'undefined' && sku == rowData.sku) {		
				currDetailData.splice(i,1);
				break;
			}
		}
	}
	
	currOrderDetailDataGrid.datagrid("deleteRow",rowIndex).datagrid("loadData", currDetailData);	
}

/**
 * 补发商品列表中是否存在该sku对应的商品
 */
function existSku0(skuData, sku){	
	var orderlineid = skuData.orderlineid;
	
	if(typeof orderlineid == 'undefined' && skuData.sku == sku) {		
		return true;				
	}
	return false;
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
}

//商品列表刷新
function skuListReLoad(isAdd) {	
	
	if(typeof isAdd != 'undefined' && isAdd){
		$.each(currDetailData, function(){
			if((this.orderlineid==null||this.orderlineid=='')){	
				//同款商品之间的替换不会产生金额差异。------当存在金额差异时，有可能产生额外应收或退款
				var skuDto = getRefundSku(currRefundDetail, this);
				if(skuDto!=null && this.payprice != skuDto.payprice){
					this.payprice = Number(skuDto.payprice);
					this.totalprice = this.payprice * this.orderqty;
					this.discountprice = this.saleprice * this.orderqty - this.totalprice;
				}
				
			}
		});		
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
}

/**
 * 初始化表格数据
 */
function initGridData(ecDiffOrderDto){
	
	var newDetails = ecDiffOrderDto.newDetails;
	var oldDetails = ecDiffOrderDto.oldDetails;
	
	//循环原订单明细
	$.each(oldDetails,function(){
		if(this.iscolor==1){
			var that = this;			
			//默认原商品不存在于新单中
			var istrue = false;
			$.each(newDetails,function(){				
				//当前商品不是新增的
				if(this.aftersalestatus != 40 && typeof(this.orderlineid)=="undefined"){					
					//获取唯一对应的商品
					if(this.sku == that.sku && this.isbuy == that.isbuy){																						
						if((that.orderqty - this.orderqty)>0){
							var row = cloneObj(this);	
							row.orderqty = (that.orderqty - row.orderqty);
							row.orderlineid = that.orderlineid;
							row.oldorderqty = that.orderqty;
							row.oldtotalprice = that.totalprice;
							delete row.rowno;
							delete row.invstatus;
							currRefundDetail.push(row);
							istrue = true;		
							return;
						}					
					}
				}				
			});			
			if(!istrue){
				var row = cloneObj(this);					
				row.orderlineid = that.orderlineid;
				row.oldorderqty = that.orderqty;
				row.oldtotalprice = that.totalprice;
				delete row.rowno;
				delete row.invstatus;
				currRefundDetail.push(row);
			}	
			this.aftersalestatus = 20;
		}
		currDetailData.push(this);
	});
	
	//当前商品是新增的
	$.each(newDetails,function(){						
		if(this.aftersalestatus == 40 && this.iscolor == 1){
			var row = cloneObj(this);
			row.invstatus = 0;
			currDetailData.push(row);	      			
		}				
	});	
	
	skuListReLoad();
	currRefundDetailDataGrid.datagrid("loadData", currRefundDetail);
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
	if (!isValid0 || !isValid1){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}	
	
	var ecDiffOrdersHeader = formJson($diffOrderfm);	

	//获取明细
	currOrderDetailDataGrid.datagrid("acceptChanges");
	currRefundDetailDataGrid.datagrid("acceptChanges");
	
	var reissueDetails = [];
	$.each(currDetailData, function(){
		reissueDetails.push(initReissueDetails(this));
	});
	
	var saveData = {};
	if(currDiffid!=''){
		saveData = {
		     "params": {
				 "diffid": currDiffid,
				 "ecDiffOrdersHeader": ecDiffOrdersHeader,
				 "diffOrderDetails": reissueDetails,
				 "deleteSkuDetails": currRefundDetail
				},
		     "saveUrl": "${api}/ecdiff/order/update"
		};
	}else{
		saveData = {
		     "params": {
				 "sysorderid": $("#sysorderid").val(),
				 "ecDiffOrdersHeader": ecDiffOrdersHeader,
				 "diffOrderDetails": reissueDetails,
				 "deleteSkuDetails": currRefundDetail
				},
		     "saveUrl": "${api}/ecdiff/order/create"
		};
	}
	
	return saveData;
}

/**
 * 保存成功后回调函数
 */
function afterSaveFunc(diffid){

	$.messager.confirm("确认", "保存成功,是否打开差异单明细？", function (sure) {
        if (sure) {   	
        	//打开差异单明细窗口
        	var url = "${api}/ecdiff/order/toDetail/" + diffid;
        	var icon = "icon-table";
        	var subtitle = "差异单("+ diffid +")明细";
        	parent.updateCurrTab(url, subtitle, icon);     	
        }else{
        	//关闭当前窗口
        	closeCurrTab();
        }
    });		
}


/**
 * 初始化差异单表单
 */
function initPreviewOrder(diffid, originOrderHeader, newdiffHeader){
	
	var diffHeader = {}; 
	//原订单信息
	diffHeader.sysorderid = originOrderHeader.sysorderid;
	diffHeader.companycode = originOrderHeader.companycode;
	diffHeader.shopid = originOrderHeader.shopid;	
	
	diffHeader.originalorderprice = originOrderHeader.orderprice;
	diffHeader.originalpayprice = originOrderHeader.payprice;
	diffHeader.originalintegralamount = originOrderHeader.integralamount;
	diffHeader.originalbonusamount = originOrderHeader.bonusamount;
	diffHeader.originaldiscountprice = originOrderHeader.couponprice - originOrderHeader.sellercouponprice;
	diffHeader.originalsellercouponprice = originOrderHeader.sellercouponprice;
	diffHeader.originalshippingprice = originOrderHeader.shippingprice;
	diffHeader.originalalreadyprice = originOrderHeader.alreadyprice;

	if(diffid!=''){
		//差异单信息
		diffHeader.integralamount = originOrderHeader.integralamount;		
		diffHeader.orderprice = newdiffHeader.orderprice;
		diffHeader.payprice = newdiffHeader.payprice;		
		diffHeader.bonusamount = newdiffHeader.bonusamount;
		diffHeader.discountprice = newdiffHeader.couponfee - newdiffHeader.sellercouponprice;
		diffHeader.couponfee = newdiffHeader.couponfee;
		diffHeader.sellercouponprice = newdiffHeader.sellercouponprice;
		diffHeader.shippingfee = newdiffHeader.shippingfee;
		diffHeader.difforderprice = newdiffHeader.difforderprice;
		diffHeader.changeprice = newdiffHeader.changeprice;		
	}else{			
		diffHeader.integralamount = originOrderHeader.integralamount;
		diffHeader.bonusamount = originOrderHeader.bonusamount;
		diffHeader.sellercouponprice = originOrderHeader.sellercouponprice;		
		diffHeader.shippingfee = originOrderHeader.shippingprice;		
	}
	$("#originalsysorderid").text(originOrderHeader.sysorderid);
	$diffOrderfm.form("load", diffHeader);	
	
	$("#shippingfee", $diffOrderfm).numberbox({
	    "onChange":function(newValue,oldValue){
	    	var newpayprice = $("#newpayprice", $diffOrderfm).numberbox("getValue");
	    	var newpayprice0 = Number(newpayprice) + Number(newValue) - Number(oldValue);
	        if(newpayprice0<0){
	        	$.messager.alert("错误", "差异单实收金额不能小于零!", "error"); 
	        	$(this).numberbox("setValue", oldValue);
	        	$("#newpayprice", $diffOrderfm).numberbox("setValue", newpayprice);
	        }else{
	        	$("#newpayprice", $diffOrderfm).numberbox("setValue", newpayprice0);
	        }	        
	    }
	});
	
	$("#sellercouponprice", $diffOrderfm).numberbox({
	    "onChange":function(newValue,oldValue){
	    	var newpayprice = $("#newpayprice", $diffOrderfm).numberbox("getValue");
	    	var newpayprice0 = Number(newpayprice) - (Number(newValue) - Number(oldValue));
	        if(newpayprice0<0){
	        	$.messager.alert("错误", "差异单实收金额不能小于零!", "error"); 	        	
	        	$(this).numberbox("setValue", oldValue);
	        	$("#newpayprice", $diffOrderfm).numberbox("setValue", newpayprice);
	        }else{
	        	$("#newpayprice", $diffOrderfm).numberbox("setValue", newpayprice0);
	        }	        
	    }
	});
	
	$("#newpayprice", $diffOrderfm).numberbox({
	    "onChange":function(newValue,oldValue){
	    	var changeprice = $("#changeprice", $diffOrderfm).numberbox("getValue");
	    	changeprice = Number(changeprice) + Number(newValue) - Number(oldValue);	        
	        $("#changeprice", $diffOrderfm).numberbox("setValue", changeprice);	
	        $("#difforderprice", $diffOrderfm).val(changeprice);
	    }
	});
}

</script>