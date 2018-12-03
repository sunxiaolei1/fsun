<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../headerJS.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
<script type="text/javascript" src="${api}/jquery-easyui/jquery.checkbox.js"></script>

<style type="text/css">

.easyui-textbox, .easyui-combogrid, .easyui-datebox, .easyui-combobox, .easyui-numberbox, .easyui-datetimebox {
	width: 162px;
}

.fsun-wrap {
	border: 1px solid #ccc;
	padding: 14px 0px 5px 10px;
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

.toolbar{
	height:28px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	border-bottom:0px;
	background: #f3f3f3;
	padding-top:2px;
}

.icon-syn-btn{
	padding: 0px 7px;
	height:14px; 
	width:14px;
	cursor: pointer;
	display: inline-block;
	background:url('${api}/jquery-easyui/commons/css/IconsExtension/2013040601125064_easyicon_net_16.png') no-repeat center center;	
}


</style>

<div class="toolbar">
	<a href="#" id="orderSaveBtn" class="easyui-linkbutton" iconCls="icon-disk" plain="true">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="parent.closeCurrTab()">取消</a>
</div>

<div class="easyui-tabs" >		
	<div title="订单信息" style="padding:2px 6px 0px 6px;">
		<form id="orderfm">
			<input id="sysorderid" name="sysorderid" hidden="true"/>					
			<div class="fsun-wrap">
		       	<span class="title" style="top: 61px;">基本信息</span>			      
			   	<table class="nb-formTable">			   		
			        <tr>			          
						<th width="12%">外部单号<span style="color:red;">*</span></th>
						<td>
							<input id="extorderid" name="extorderid" class="easyui-textbox" required />
						</td>
						<th width="12%">订单类型<span style="color:red;">*</span></th>
						<td>	
							<input id="ordertype" name="ordertype" class="easyui-combobox" editable="false" required />
						</td>
						<th width="12%">下单时间</th>
						<td>
							<input id="orderdatetime" name="orderdatetime" class="easyui-datetimebox" />
						</td>
						<th width="12%">付款时间</th>
						<td>	
							<input id="paymentdatetime" name="paymentdatetime" class="easyui-datetimebox" />
						</td>						
			        </tr>
			        <tr>			          					
						<th width="12%">所属公司<span style="color:red;">*</span></th>
						<td>
							<input name="companycode" id="companycode" class="easyui-combogrid" required />
						</td>
						<th width="12%">所属门店<span style="color:red;">*</span></th>
						<td>							
							<input id="shopid" name="shopid" class="easyui-combogrid" disabled=true required />								
						</td>
						<th width="12%">所属仓库<span style="color:red;">*</span></th>
						<td>
							<input id="stockcode" name="stockcode" class="easyui-combogrid" disabled=true required />								
						</td>						
						<th width="12%">买家用户名<span style="color:red;">*</span></th>
						<td>
							<input name="username" id="username" class="easyui-textbox" required />
						</td>
			        </tr>
			        <tr>
			        	<th width="12%">配送快递</th>
						<td>
							<input id="expresscode" name="expresscode" class="easyui-combobox" editable="false" />								
						</td>
						<th width="12%">快递单号</th>
						<td>
							<input id="expressno" name="expressno" class="easyui-textbox" />								
						</td>					
						<th width="12%">配送时间</th>
						<td colspan="3">
							<input name="assigntime" id="assigntime" class="easyui-combobox" editable="false" />
						</td>
					</tr>			       
				</table>
			</div>
			<div class="fsun-wrap">
		       	<span class="title" style="top: 205px;">
		       	支付信息
		       	<span style="color:red;">注:同步支付信息时，出现商品明细的实收金额差异导致未付金额出现负数时，则支付信息中包括(积分数、红包金额、已付金额、商家优惠)都会被清零!</span>
		       	</span>		
			   	<table class="nb-formTable">			   		
			        <tr>			          
						<th width="12%">订单金额</th>
						<td>
							<input id="orderprice" name="orderprice" class="easyui-numberbox" editable="false" style="width: 130px;"
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />
						</td>
						<th width="12%">实付金额</th>
						<td>	
							<input id="payprice" name="payprice" class="easyui-numberbox" editable="false" style="width: 110px;"
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />
								<div class="icon-syn-btn" onclick="javascript:headerPricesSyn();"></div>
						</td>
						<th width="12%">积分数</th>
						<td>
							<input name="integralamount" id="integralamount" class="easyui-numberbox" style="width: 130px;"
								data-options="min:0,precision:0,value:0, formatter: intNumBaseFormat" />
						</td>
						<th width="12%">红包金额</th>
						<td>
							<input id="bonusamount" name="bonusamount" class="easyui-numberbox" style="width: 130px;"
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />								
						</td>
						<th width="12%">配送费用</th>
						<td>
							<input id="shippingprice" name="shippingprice" class="easyui-numberbox" style="width: 130px;"
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />								
						</td>						
			        </tr>
			        <tr>			          
						<th width="12%">商品优惠</th>
						<td>
							<input id="discountprice" name="discountprice" class="easyui-numberbox" editable="false" style="width: 130px;"
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />
						</td>
						<th width="12%">商家优惠</th>
						<td>
							<input id="sellercouponprice" name="sellercouponprice" class="easyui-numberbox" style="width: 130px;"
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />
						</td>
						<th width="12%">已付金额</th>
						<td>	
							<input id="alreadyprice" name="alreadyprice" class="easyui-numberbox" style="width: 130px;"
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />
						</td>
						<th width="12%">流水号</th>
						<td colspan="3">	
							<input id="serialnum" name="serialnum" class="easyui-textbox" style="width: 250px;" />
						</td>																	
			        </tr>	
			        <tr>			          
						<th width="12%">支付方式</th>
						<td>
							<input id="paymode" name="paymode" class="easyui-combobox" editable="false" style="width: 130px;" />
						</td>
						
						<th width="12%">支付账号</th>
						<td>
							<input name="bankaccount" id="bankaccount" class="easyui-textbox" style="width: 130px;" />
						</td>						
						<th width="12%">未付金额</th>
						<td>
							<input name="unpayprice" id="unpayprice" class="easyui-numberbox" style="width: 130px;" editable="false"
								data-options="min:0,precision:2,value:0, formatter: priceFormat" />
						</td>
						<th width="12%">发票抬头</th>
						<td colspan="3">
							<input id="invoicestop" name="invoicestop" class="easyui-textbox" style="width: 200px;" />	
							<label for="isbilling" >
								<input type="checkbox" id="isbilling" name="isbilling" style="zoom:130%;vertical-align:middle;" />
								开具发票
							</label>							
							&nbsp;&nbsp;
							<label for="istrave" >
								<input type="checkbox" id="istrave" name="istrave" style="zoom:130%;vertical-align:middle;" />
								货票同行
							</label>							
						</td>
										
			        </tr>		       
				</table>
			</div>			
		    <div class="fsun-wrap">		    	
		        <span class="title" style="top: 347px;">收货信息</span>			   
				<table class="nb-formTable">
					<tr>
			            <th width="12%">收货人<span style="color:red;">*</span></th>
						<td>
							<input name="receivename" id="receivename" class="easyui-textbox" required />
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
			        	<th width="12%">客服备注</th>
						<td colspan="3">
							<input id="sellerremark" name="sellerremark"  data-options="multiline:true" 
								class="easyui-textbox" style="width:440px;height:50px;"/>
						</td>
			        	<th width="12%">详细地址<span style="color:red;">*</span></th>
						<td colspan="3">
							<input id="address" name="address" data-options="multiline:true"
								class="easyui-textbox" style="width:440px;height:50px;" required/>
						</td>
			        </tr>
			  	</table>
		  	</div>		  	
		</form>			
	</div>		
	<div title="订单商品" closable="false" style="padding:6px;">
	    <div style="width:100%;height:440px;">
	    	<div id="skutoolbar" style="display:none;">
				<%@include file="./detailskutoolbar.jsp"%>
			</div>
	    	<table id="orderDetailDataGrid"></table>
	    </div>				
	</div>
</div>		

<!-- 查询条件 -->
<%@include file="../../ecCommon/companyToShopStockSelect.jsp"%>
<%@include file="../../ecCommon/provinceToCityToRegionSelect.jsp"%>

<!-- datagrid可编辑单元格 -->
<%@include file="../../ecCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currOrderDetailDataGrid;
var currDetailData = [];
var $orderfm;
var firstDetailLoad = true;

//data-options="validType:['unique[\'C_COMEDOCNUM\']']"
$.extend($.fn.validatebox.defaults.rules, {
	enableSku: {// 验证
    	validator: function (value) {   		
            var companycode = $("#companycode").combogrid("getValue");			
 			var shopid = $("#shopid").combogrid("getValue"); 			
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
	
	$("#orderprice", $orderfm).next().children("input:first-child").css("background-color", "#F3F3F3");
	$("#discountprice", $orderfm).next().children("input:first-child").css("background-color", "#F3F3F3");
	$("#unpayprice", $orderfm).next().children("input:first-child").css("background-color", "#F3F3F3");
	$("#payprice", $orderfm).next().children("input:first-child").css("background-color", "#F3F3F3");	
	
	/**
	 * 当input框内容变化时变化是否是必填项
	 */
	function changeReqiured(textbox1, textbox2, value1, value2, $orderfm){			
		if(value1=='' && value2==''){	    		
			$("#"+ textbox1, $orderfm).textbox({required:true});
			$("#"+ textbox2, $orderfm).textbox({required:true});
    	}else{	    	    		
    		$("#"+ textbox1, $orderfm).textbox({required:false});
    		$("#"+ textbox2, $orderfm).textbox({required:false});
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
	
	$('#ordertype', $orderfm).combobox({ 
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.ecOrdertypeData
   	});	
		
	$('#assigntime', $orderfm).combobox({ 
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   		data: window.parent.ecAssigntimeData  	  	
   	});	 
	
	$('#paymode', $orderfm).combobox({
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.ecPaymodeData
   	});	 
	
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
	
	//省、市、县级连初始化
	initProvinceCombo("请选择...");
	
	//商品列表初始化
	initSkusDataGrid();
	
	var saveUrl = "${api}/ecorder/store/addEntity";
	if(sysorderid!=''){					
		//初始化订单信息(基本信息和商品列表)
		initOrderInfo($orderfm, sysorderid);		
		saveUrl = "${api}/ecorder/store/updateEntity";
	}else{
		initCompanyGrid(false);
		initShopGrid(false);
		shopOnChange();
		initStockGrid(false);
		var now = getCurrentFormatDate();
		$("#orderdatetime", $orderfm).datetimebox("setValue",now);
		$("#paymentdatetime", $orderfm).datetimebox("setValue",now);
		$("#bonusamount", $orderfm).val(0);
		
		//添加订单金额变更监听事件
		addOrderPriceListener();
	}	
		
	
	$("#orderSaveBtn").click(function(){
		
		var isValid0 = currOrderDetailDataGrid.datagrid("isValid");		
		var isValid = $orderfm.form('validate');
		if (!isValid || !isValid0){
			$.messager.alert("错误", "提交的数据不正确!", "error");  
			return;
		}
		currOrderDetailDataGrid.datagrid("acceptChanges");
		
		if(currDetailData.length==0){
			$.messager.alert("错误", "订单商品明细不存在!", "error");
			return;
		}
		
		if(headerPricesSyn()){	
			$.messager.alert("错误", "单头订单金额有变动,请查看!", "error");
			return;
		}
		
		var baseInfo = formJson($orderfm);
		var shopname = $("#shopid", $orderfm).combogrid("getText");
		var provincename = $("#provinceCombo", $orderfm).combobox("getText");
		var cityname = $("#cityCombo", $orderfm).combobox("getText");
		var regionname = $("#regionCombo", $orderfm).combobox("getText");
		baseInfo.shopname = shopname;
		baseInfo.provincename = provincename;
		baseInfo.cityname = cityname;
		baseInfo.regionname = regionname;		
		baseInfo.isbilling = $("#isbilling", $orderfm).prop("checked")?1:0;
		baseInfo.istrave = $("#istrave", $orderfm).prop("checked")?1:0;
		baseInfo.couponprice = Number(baseInfo.sellercouponprice) + Number(baseInfo.discountprice);
		delete baseInfo.discountprice;
		
		var ecorderInfo = {
			 "header": baseInfo,
			 "details": currDetailData
		}					
		commonPost(saveUrl, JSON.stringify(ecorderInfo), afterSaveFunc);	
	});
     
});


/**
 * 订支付信息同步(与商品明细)
 */
function headerPricesSyn(){
	
	var skuorderprice = 0;
	var skutotalprice = 0;
	$.each(currDetailData, function(){
		skuorderprice += Number(this.saleprice)*Number(this.orderqty);
		skutotalprice += Number(this.totalprice);
	});
	var orderprice = $("#orderprice", $orderfm).numberbox("getValue");	
	var payprice = $("#payprice", $orderfm).numberbox("getValue");	
	var sellercouponprice = $("#sellercouponprice", $orderfm).numberbox("getValue");
	var shippingprice = $("#shippingprice", $orderfm).numberbox("getValue");
	var unpayprice = $("#unpayprice", $orderfm).numberbox("getValue");	
	
	//配送费用保持不变，其他字段均有变动
	var oldskutotalprice =  Number(payprice) + Number(sellercouponprice) - Number(shippingprice);	
	if(skuorderprice!=Number(orderprice) || oldskutotalprice!=skutotalprice){		
		if(oldskutotalprice<skutotalprice){
			$("#orderprice", $orderfm).numberbox("setValue", skuorderprice);	
			$("#payprice", $orderfm).numberbox("setValue", (Number(payprice) + skutotalprice - oldskutotalprice));	
			$("#discountprice", $orderfm).numberbox("setValue", skuorderprice - skutotalprice);
			$("#unpayprice", $orderfm).numberbox("setValue", (Number(unpayprice) + skutotalprice - oldskutotalprice));
		}else if(oldskutotalprice>skutotalprice){
			if(Number(unpayprice) + skutotalprice - oldskutotalprice>=0){
				$("#orderprice", $orderfm).numberbox("setValue", skuorderprice);	
				$("#payprice", $orderfm).numberbox("setValue", (Number(payprice) + skutotalprice - oldskutotalprice));	
				$("#discountprice", $orderfm).numberbox("setValue", skuorderprice - skutotalprice);
				$("#unpayprice", $orderfm).numberbox("setValue", (Number(unpayprice) + skutotalprice - oldskutotalprice));
			}else{
				$("#sellercouponprice", $orderfm).numberbox("setValue", 0);
				$("#alreadyprice", $orderfm).numberbox("setValue", 0);
				$("#integralamount", $orderfm).numberbox("setValue", 0);
				$("#bonusamount", $orderfm).numberbox("setValue", 0);
				
				$("#orderprice", $orderfm).numberbox("setValue", skuorderprice);	
				$("#payprice", $orderfm).numberbox("setValue", Number(shippingprice) + skutotalprice);	
				$("#discountprice", $orderfm).numberbox("setValue", skuorderprice - skutotalprice);
				$("#unpayprice", $orderfm).numberbox("setValue", Number(shippingprice) + skutotalprice);	
			}	
		}else{						
			$("#orderprice", $orderfm).numberbox("setValue", skuorderprice);	
			$("#discountprice", $orderfm).numberbox("setValue", skuorderprice - skutotalprice);
				
			var alreadyprice = $("#alreadyprice", $orderfm).numberbox("getValue");
			var integralamount = $("#integralamount", $orderfm).numberbox("getValue");
			var bonusamount = $("#bonusamount", $orderfm).numberbox("getValue");
			var unpayprice = Number(payprice) - Number(alreadyprice) - Number(integralamount) - Number(bonusamount);
			$("#unpayprice", $orderfm).numberbox("setValue", unpayprice);
		}							
		return true;
	}
	return false;
}

/**
 * 保存成功后触发
 */
function afterSaveFunc(){
	parent.closeCurrTab("reflushDataGrid");
}

/**
 * 初始订单信息
 */
function initOrderInfo($orderfm, sysorderid){
	
	$.ajax({
		type : "GET",
		url : "${api}/ecorder/base/"+ sysorderid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var ecorderDto = result.entry;
			var header = ecorderDto.header;			
			
			/***************************              订单信息初始化                        ************************/			
		
			if(header.isbilling!=null && header.isbilling==1){				
				$("#isbilling", $orderfm).attr("checked", true); 
			}
			if(header.istrave!=null && header.istrave==1){						
				$("#istrave", $orderfm).attr("checked", true);
			} 
			if(header.companycode!=null){
				initCompanyGrid(true, header.companycode, header.shopid, header.stockcode);
				shopOnChange();
			} 						
			delete header.isbilling;
			delete header.istrave;
			delete header.companycode;
			delete header.shopid;
			delete header.stockcode;

			header.discountprice = header.couponprice - header.sellercouponprice;
	
			$orderfm.form("load", header);
			setTimeout(function(){
				$("#regionCombo", $orderfm).combobox("setValue", header.regionid);															
			},100);		
	
			//添加订单金额变更监听事件
			addOrderPriceListener();
			
			currDetailData = ecorderDto.details;
			currOrderDetailDataGrid.datagrid("loadData", currDetailData);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	}); 	
}

/**
 * 初始化商品列表
 */
function initSkusDataGrid(){
	
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
	    idField:"sku",
	    sortName:"sku",
        sortOrder:"asc",	
        pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    toolbar:"#skutoolbar",
	    columns:[[
			{field:"ck", checkbox:true},
			{field:"sku",title:"SKU",width:120,align:"center",sortable:true, required:true},
			{field:"isbuy",title:"商品类型",width:80,align:"center",sortable:true,
				styler: function(value, rowData, rowIndex){
                	return 'font-weight:bold;color:green;';
                },
				editor:{
					type:'combobox',
					options: {
						valueField: 'codeCode',
				   	  	textField: 'codeName',
				   		data: window.parent.ecIsbuyData,
                        panelHeight : 'auto',
                        loadFilter: function(data){	
            				var newData = [];
            		 		$.each(data, function(){ 
            		 			if(this.codeCode != ""){
            		 				newData.push(this);
            		 			}		 												
            		 		});
            				return newData;
            			}
                    }
					
				},
				formatter:function(value, row){
					return formatter(value, window.parent.ecIsbuy); 
				}
			},
			{field:"materialname",title:"商品名称",width:240,align:"center", sortable:true,
				styler: function(value, rowData, rowIndex){
                	return 'font-weight:bold;color:green;';
                },
                editor:{type:'textbox'}},
			{field:"materialcode",title:"商品货号",width:100,align:"center", sortable:true,
				styler: function(value, rowData, rowIndex){
                	return 'font-weight:bold;color:green;';
                },
				editor:{
					type:'textbox',
					options: {
						required: true
					}
				}
			},
			{field:"materialproperty",title:"商品属性",width:140,align:"center", sortable:true,
				styler: function(value, rowData, rowIndex){
                	return 'font-weight:bold;color:green;';
                },
				editor:{type:'textbox'}
            },
			{field:"saleprice",title:"销售单价",width:80,align:"center",sortable:true, formatter:numBaseFormat},	
			{field:"payprice",title:"实付单价",width:80,align:"center", sortable:true,
				styler: function(value, rowData, rowIndex){
                	return 'font-weight:bold;color:green;';
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
			{field:"orderqty",title:"下单数量",width:80,align:"center",sortable:true,
				styler: function(value, rowData, rowIndex){
                	return 'font-weight:bold;color:green;';
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
			{field:"totalprice",title:"实付总价",width:80,align:"center",sortable:true,formatter:numBaseFormat},	
			{field:"discountprice",title:"优惠金额",width:80,align:"center",hidden:true},	
			{field:"invstatus",title:"库存状态",width:80,align:"center", sortable:true,
				formatter:function(value, row){
					return formatter(value, window.parent.ecINVstatus); 
				}
			},
			{field:"memo",title:"备注",width:160,align:"center", sortable:true,
				styler: function(value, rowData, rowIndex){
                	return 'font-weight:bold;color:green;';
                },
                editor:{type:'textbox'}
            }
	    ]],	    
    	loadFilter:function(data) {     		
    		var fields = ["totalprice","orderqty","discountprice"];       		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "sku"); 

    	    //同步订单头金额信息
    	    /* if(!firstDetailLoad){
    	    	var orderprice = Number(data.footer[0].totalprice) + Number(data.footer[0].discountprice);    	    	
    	    	$("#orderprice", $orderfm).numberbox("setValue", orderprice);
        	    $("#payprice", $orderfm).numberbox("setValue", data.footer[0].totalprice);
        	    $("#discountprice", $orderfm).numberbox("setValue", data.footer[0].discountprice);
    	    }else{
    	    	firstDetailLoad = false;	
    	    } */
			return data; 
        },
        rowStyler:function(index,row){	    		    	
    		if (row.sku=="合计"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	
    		return "";
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true,
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
	    onDblClickRow:function(rowIndex, rowData){
			$(this).datagrid('scrollToCell', { index: rowIndex, startfield: 'sku', endfield: 'memo' });
		}
	});
	
}

/**
 * 添加门店变更监听事件
 */
function shopOnChange(){
	$("#shopid").combogrid({
		onChange : function(newValue, oldValue) {
			clearEnableSkuQty();
			if(oldValue!=null && oldValue!=''){
				if(currDetailData.length!=0){
					$.messager.alert("提示", "原门店对应的商品会被删除!", "info", function(){
						currDetailData = [];						
						currOrderDetailDataGrid.datagrid("loadData", currDetailData);			
						
		    		}); 
					$('.panel-tool-close').hide();
				}
			}									
		}
	});
}

/**
 * 添加订单金额字段变更监听事件
 */
function addOrderPriceListener(){
	
	$("#shippingprice", $orderfm).numberbox({
	    "onChange":function(newValue,oldValue){
	    	var payprice = $("#payprice", $orderfm).numberbox("getValue");
	    	var minshippingprice = Number(oldValue) - Number(payprice);
	    	var diffprice = Number(newValue) - Number(oldValue);
	    	//newValue-payprice>=0
	        if(minshippingprice>0 && (diffprice + minshippingprice <0)){
	        	$.messager.alert("错误", "配送费用不能小于"+ minshippingprice+"!" , "error"); 
	        	$(this).numberbox("setValue", oldValue);
	        	//$("#payprice", $orderfm).numberbox("setValue", payprice);
	        }else{	 
	        	//newValue>=oldValue-unpayprice
	        	var unpayprice = $("#unpayprice", $orderfm).numberbox("getValue"); 	        	
	        	if(diffprice<0 && diffprice + Number(unpayprice)<0){	        	
	        		var minValue = Number(oldValue) - Number(unpayprice);
	        		$.messager.alert("错误", "配送费用不能小于"+ minValue+"!" , "error"); 
		        	$(this).numberbox("setValue", oldValue);
	        	}else{
		        	$("#payprice", $orderfm).numberbox("setValue", Number(payprice) + diffprice);		        	
		        	$("#unpayprice", $orderfm).numberbox("setValue", Number(unpayprice) + diffprice);
	        	}
		    	
	        }	        
	    }
	});
	
	
	$("#sellercouponprice", $orderfm).numberbox({
	    "onChange":function(newValue,oldValue){
	    	var payprice = $("#payprice", $orderfm).numberbox("getValue");	    		    	
	    	var unpayprice = $("#unpayprice", $orderfm).numberbox("getValue"); 
	    	var maxsellercouponprice = Number(unpayprice) + Number(oldValue);	 
	    	
	    	//Number(newValue) > Number(unpayprice) + Number(oldValue);	 
	        if(Number(newValue)>maxsellercouponprice){
	        	$.messager.alert("错误", "商家优惠不能大于"+ maxsellercouponprice +"!", "error"); 	        	
	        	$(this).numberbox("setValue", oldValue);
	        	$("#payprice", $orderfm).numberbox("setValue", payprice);
	        	$("#unpayprice", $orderfm).numberbox("setValue", unpayprice);
	        }else{	
	        	var diffprice = Number(newValue) - Number(oldValue);
	        	$("#payprice", $orderfm).numberbox("setValue", Number(payprice) - diffprice);	        	 
	        	$("#unpayprice", $orderfm).numberbox("setValue", Number(unpayprice) - diffprice);
	        }	         
	    }
	});
	
	$("#integralamount", $orderfm).numberbox({
	    "onChange":function(newValue,oldValue){
	    	var alreadyprice = $("#alreadyprice", $orderfm).numberbox("getValue");
	    	var unpayprice = $("#unpayprice", $orderfm).numberbox("getValue");
	    	var bonusamount = $("#bonusamount", $orderfm).numberbox("getValue"); 
	    	var payprice = $("#payprice", $orderfm).numberbox("getValue");
	    	var maxintegralamount = (Number(payprice) - Number(alreadyprice) - Number(bonusamount))*100;
	        if(maxintegralamount < newValue){
	        	$.messager.alert("错误", "积分数不能大于"+ maxintegralamount +"!", "error"); 	        	
	        	$(this).numberbox("setValue", oldValue);	
	        	$("#unpayprice", $orderfm).numberbox("setValue",  unpayprice);
	        }else{
	        	var diffprice = (Number(newValue) - Number(oldValue))/100;
	        	if(diffprice>0 && Number(unpayprice)<diffprice){
	        		var minintegralamount = Number(oldValue) + Number(unpayprice)*100;
	        		$.messager.alert("错误", "积分数不能小于"+ minintegralamount +"!", "error"); 	        	
		        	$(this).numberbox("setValue", oldValue);
		        	$("#unpayprice", $orderfm).numberbox("setValue",  unpayprice);
	        	}else{	        		
		        	$("#unpayprice", $orderfm).numberbox("setValue",  Number(unpayprice)- diffprice);
	        	}	        	
	        }
	    }
	});
	
	$("#bonusamount", $orderfm).numberbox({
		"onChange":function(newValue,oldValue){
	    	var alreadyprice = $("#alreadyprice", $orderfm).numberbox("getValue");
	    	var unpayprice = $("#unpayprice", $orderfm).numberbox("getValue");
	    	var integralamount = $("#integralamount", $orderfm).numberbox("getValue"); 
	    	var payprice = $("#payprice", $orderfm).numberbox("getValue");
	    	var maxbonusamount = Number(payprice) - Number(alreadyprice) - Number(integralamount)/100;
	        if(maxbonusamount < Number(newValue)){
	        	$.messager.alert("错误", "红包金额不能大于"+ maxbonusamount +"!", "error"); 	        	
	        	$(this).numberbox("setValue", oldValue);
	        	$("#unpayprice", $orderfm).numberbox("setValue",  unpayprice);
	        }else{
	        	var diffprice = Number(newValue) - Number(oldValue);
	        	if(diffprice>0 && Number(unpayprice)<diffprice){
	        		var minbonusamount = Number(oldValue) + Number(unpayprice);
	        		$.messager.alert("错误", "红包金额不能小于"+ minbonusamount +"!", "error"); 	        	
		        	$(this).numberbox("setValue", oldValue);
		        	$("#unpayprice", $orderfm).numberbox("setValue",  unpayprice);
	        	}else{	        		
		        	$("#unpayprice", $orderfm).numberbox("setValue",  Number(unpayprice)- diffprice);
	        	}	        	
	        }
	    }
	});
	
	$("#alreadyprice", $orderfm).numberbox({
		"onChange":function(newValue,oldValue){			
			var bonusamount = $("#bonusamount", $orderfm).numberbox("getValue");	    	
	    	var integralamount = $("#integralamount", $orderfm).numberbox("getValue"); 
	    	var payprice = $("#payprice", $orderfm).numberbox("getValue");
	    	var maxalreadyprice = Number(payprice) - Number(bonusamount) - Number(integralamount)/100;
	    	var diffprice = maxalreadyprice - Number(newValue);
	        if(diffprice<0){
	        	$.messager.alert("错误", "已付金额不能大于"+ maxalreadyprice +"!", "error"); 	        	
	        	$(this).numberbox("setValue", oldValue);
	        	$("#unpayprice", $orderfm).numberbox("setValue",  unpayprice);
	        }else{	        	
		        $("#unpayprice", $orderfm).numberbox("setValue", diffprice);    
	        }	
	    }
	});
}


</script>