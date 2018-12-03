<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<style type="text/css">

.easyui-textbox, .easyui-combogrid, .easyui-datebox, .easyui-combobox, .easyui-numberbox, .easyui-datetimebox {
	width: 162px;
}

.toolbar{
	height:28px;
	overflow:hidden;
	border: 1px solid #D3D3D3;	
	background: #f3f3f3;
	padding-top:2px;
}
</style>
			
<div class="easyui-layout" fit=true  id='base_layout'>
	<div data-options="region:'north'" class="toolbar" >
		<a href="#" id="orderSaveBtn" class="easyui-linkbutton" iconCls="icon-disk" plain="true">保存</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="parent.closeCurrTab()">取消</a>
	</div>
	<div data-options="region:'center',title:'基本信息'" >
		<form id="orderfm"  style="height:84%">
			<input id="promotionsid" name="promotionsid" hidden="true"/>
			<table class="nb-formTable" style="width:100%;margin-bottom: 0px;">			   		
		        <tr>			          
					<th width="12%">活动名称<span style="color:red;">*</span></th>
					<td>
						<input id="promotionsname" name="promotionsname" class="easyui-textbox" required />
					</td>
					<th width="12%">活动类型<span style="color:red;">*</span></th>
					<td>	
						<input id="promotionstype" name="promotionstype" hidden=true />
						<input id="promotionstypename"  class="easyui-textbox" disabled required />
					</td>										
		        </tr>
		        <tr>			          					
					<th width="12%">所属公司<span style="color:red;">*</span></th>
					<td>
						<input name="companycode" id="companycode" class="easyui-combogrid" required />
					</td>
					<th width="12%">参与活动门店<span style="color:red;">*</span></th>
					<td>							
						<input id="shopid" name="shopid" class="easyui-combogrid" disabled=true  required />								
					</td>				
		        </tr>
		        <tr>
		        	<th width="12%">订单来源<span style="color:red;">*</span></th>
					<td>
						<input id="orderfrom" name="orderfrom" class="easyui-combobox" editable="false" required />												
					</td>
					<th width="12%">兼容状态<span style="color:red;">*</span></th>
					<td>
						<input id="giftsstatus" name="giftsstatus" class="easyui-combobox" editable="false" required />												
					</td>					
				</tr>
				<tr>
					<td colspan="4">														
						<label for="iscompatible" >
							<input type="checkbox" id="iscompatible" name="iscompatible" style="zoom:120%;vertical-align:middle;" />
							兼容其它活动
						</label>							
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="isgiftover" >
							<input type="checkbox" id="isgiftover" name="isgiftover" style="zoom:120%;vertical-align:middle;" />
							是否赠完即止
						</label>											
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="isall" >
							<input type="checkbox" id="isall" name="isall" style="zoom:120%;vertical-align:middle;" />
							全场商品参与活动
						</label>										
					</td>				
				</tr>
		        <tr>				
					<th width="12%">活动有效时间<span style="color:red;">*</span></th>
					<td colspan="3">
						<input name="startdatetime" id="startdatetime" class="easyui-datetimebox" validType="startDateTime" />
						-
						<input name="enddatetime" id="enddatetime" class="easyui-datetimebox" validType="endDateTime" />
						<input name="originaldatetime" id="originaldatetime" hidden="true" />
					</td>
				</tr>
				<tr>									
					<td colspan="4">
						<span style="font-weight:bold;color:red;">注:</span>
						<b>
							1.梯度兼容: 满足高购买数量的条件,允许同时赠送低购买数量的赠品;<span style="color:red;">(仅在活动出现多个梯度时有效)</span>
							<br />
							2.翻倍赠送: 当单笔订单购买数量满足条件(N)倍时,则赠送(N*单笔赠送数量)的商品;<span style="color:red;">(仅在活动出现一个梯度时有效)</span>
							<br />
						    3.购买数量: 当单笔订单中购买任意指定商品的数量合计
						    <br />
							4.锁定库存: 该库存数量仅限于此促销活动所用;<br />
							5.同一条件下多个赠品,则系统随机赠送一件,所有赠品均按锁定库存赠完即止.
						</b>
					</td>
				</tr>			       
			</table>
		</form>	
	</div>			
	<div data-options="region:'east',split:true,collapsed:true,title:'活动商品列表'" style="width:43%;" >
		<div id="prmotionsskutoolbar" style="display:none;">
			<%@include file="./prmotionsskutoolbar.jsp"%>
		</div>
		<table id="skuDetailDataGrid"></table>
	</div>
	<div data-options="region:'south'" style="height:39%;" >
	   	<div id="skutoolbar" style="display:none;">
			<%@include file="./detailskutoolbar.jsp"%>
		</div>
	    <table id="orderDetailDataGrid"></table>
	</div>
</div>

<!-- 查询条件 -->
<%@include file="../ecCommon/companyToShopSelect.jsp"%>

<!-- datagrid可编辑单元格 -->
<%@include file="../ecCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

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
	},
 	startDateTime: {// 验证
    	validator: function (value) {
 			var endDate =  $('#enddatetime').datetimebox('getValue');
 			if(endDate!=null && endDate!=''){
				if(value > endDate){
					return false;
				}
     		}
     		return true;
     	},
     	message: '开始时间不能晚于结束时间'
 	},
 	endDateTime: {// 验证
    	validator: function (value) {
    		var rules = $.fn.validatebox.defaults.rules;  
            rules.endDateTime.message = '结束时间不能早于开始时间';  
     		var startDate =  $('#startdatetime').datetimebox('getValue');
 			if(startDate!=null && startDate!=''){
				if(value < startDate){
					return false;
				}
     		}
 			var originaldatetime = $("#originaldatetime").val();
 			if(originaldatetime!=null && originaldatetime!=''){
				if(value < originaldatetime){
					rules.endDateTime.message = '结束时间不能早于'+ originaldatetime;
					return false;
				}
     		}			
     		return true;
     	},
     	message: ''
		}
});



var currOrderDetailDataGrid;
var currSkuDetailDataGrid;
var currSkuDetailData = [];
var currGiftDetailData = [];
var $orderfm;

var baseGiftsColumns = [[
	{field:"ck", checkbox:true},
	{field:"orderprice",title:"满赠金额",width:80,align:"center",
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
	{field:"giftsqty",title:"买赠数量",width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat,               
		editor:{
			type:'numberspinner',
			options:{
				required: true,
				min:1,
				precision:0
			}
		}
	},
	{field:"sku",title:"SKU",width:120,align:"center",sortable:true, required:true},			
	{field:"materialname",title:"赠品名称",width:240,align:"center"},
	{field:"materialcode",title:"商品货号",width:100,align:"center"},					
	{field:"giftslockqty",title:"锁定库存",width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat,               
		editor:{
			type:'numberspinner',
			options:{
				required: true,
				min:1,
				precision:0,
				validType: 'enableSku'
			}
		}
	},			
	{field:"giftshasqty",title:"已赠送数",width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat,               
		editor:{
			type:'numberspinner',
			options:{
				required: true,
				min:0,
				precision:0
			}
		}
	},
	{field:"enableqty",title:"可用库存",width:80,align:"center",formatter:intNumBaseFormat},	
	{field:"qty",title:"单笔赠送数量",width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat,               
		editor:{
			type:'numberspinner',
			options:{
				required: true,
				min:1,
				precision:0
			}
		}
	}                          
]];

var readGiftsColumns = [[
   	{field:"ck", checkbox:true},
   	{field:"orderprice",title:"满赠金额",width:80,align:"center", formatter:numBaseFormat},	
   	{field:"giftsqty",title:"买赠数量",width:80,align:"center", formatter:intNumBaseFormat},
   	{field:"sku",title:"SKU",width:120,align:"center",sortable:true, required:true},			
   	{field:"materialname",title:"赠品名称",width:240,align:"center"},
   	{field:"materialcode",title:"商品货号",width:100,align:"center"},					
   	{field:"giftslockqty",title:"锁定库存",width:80,align:"center",formatter:intNumBaseFormat},
   	{field:"giftshasqty",title:"已赠送数",width:80,align:"center",formatter:intNumBaseFormat},
   	{field:"enableqty",title:"可用库存",width:80,align:"center",formatter:intNumBaseFormat},	
   	{field:"qty",title:"单笔赠送数量",width:80,align:"center",formatter:intNumBaseFormat}                        
   ]];


$(function () { 
	
	$orderfm = $("#orderfm");	
	var promotionsid = '${promotionsid}';
	currOrderDetailDataGrid = $("#orderDetailDataGrid");
	currSkuDetailDataGrid = $("#skuDetailDataGrid");
	
	$('#orderfrom', $orderfm).combobox({ 
		prompt: '请选择...',
		panelHeight: 'auto',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.ecOrderFromData
   	});	
	
	$('#giftsstatus', $orderfm).combobox({ 
		prompt: '请选择...',
		panelHeight: 'auto',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.ecGiftsstatusData
   	});	
			
	//去除默认的请选择项
	editInitComboxParams($orderfm, "");
		
	//商品列表初始化
	initSkusDataGrid();
	
	//添加checkbox点击事件
	$("#isall", $orderfm).change(function() { 
		var checked = $(this).is(':checked');
		var east = $('#base_layout').layout('panel', 'east');
		if(checked){
			//全场商品
			if (!east.panel('options').collapsed) {
				$('#base_layout').layout('collapse', 'east');				
			}
			currSkuDetailData = [];
			currSkuDetailDataGrid.datagrid("loadData",currSkuDetailData);
			hiddenPromotionsGoodsBtn();
		}else{
			//部分商品
			if (east.panel('options').collapsed) {
				$('#base_layout').layout('expand', 'east');
			}	
			showPromotionsGoodsBtn();
		}
	});
	
	var saveUrl = "${api}/ecpromotions/addEntity";
	if(promotionsid!=''){					
		//初始化订单信息(基本信息和商品列表)
		initOrderInfo($orderfm, promotionsid);		
		saveUrl = "${api}/ecpromotions/updateEntity";
	}else{
		initCompanyGrid(false);
		initShopGrid(false); 	
		shopOnChange();
		$("#iscompatible", $orderfm).attr("checked", true); 							
		$("#isgiftover", $orderfm).attr("checked", true);						
		$("#isall", $orderfm).attr("checked", true); 
		hiddenPromotionsGoodsBtn();
		var now = getCurrentFormatDate();
		$("#startdatetime", $orderfm).datetimebox("setValue",now);
		$("#enddatetime", $orderfm).datetimebox("setValue",now);	
		$('#orderfrom', $orderfm).combobox("setValue",12);			
		$('#giftsstatus', $orderfm).combobox("setValue",30);
					
		var promotionstype = "${promotionstype}";
		$("#promotionstypename", $orderfm).textbox("setValue",formatter(promotionstype, window.parent.ecPromotionsType));
		$('#promotionstype', $orderfm).val(promotionstype);
		if(promotionstype==10){
			//满赠
			currOrderDetailDataGrid.datagrid("hideColumn", "giftsqty");
		}else if(promotionstype==20){
			//买赠
			currOrderDetailDataGrid.datagrid("hideColumn", "orderprice");
		}
		
	}
	
	$("#orderSaveBtn").click(function(){	
		var isValid0 = currOrderDetailDataGrid.datagrid("isValid");		
		var isValid = $orderfm.form('validate');
		if (!isValid || !isValid0){
			$.messager.alert("错误", "提交的数据不正确!", "error");  
			return;
		}			
		currOrderDetailDataGrid.datagrid("acceptChanges");
		
		var baseInfo = formJson($orderfm);		
		baseInfo.iscompatible = $("#iscompatible", $orderfm).prop("checked")?1:0;
		baseInfo.isgiftover = $("#isgiftover", $orderfm).prop("checked")?1:0;
		baseInfo.isall = $("#isall", $orderfm).prop("checked")?1:0;		

		//参与活动的部分商品时
		if(baseInfo.isall==0){
			if(currSkuDetailData.length==0){
				$.messager.alert("错误", "参与活动的部分商品不存在!", "error");  
				return;
			}
		}
		
		var skuDetails = new Array();
		$.each(currSkuDetailData, function(){
			var skuDto = {};
			skuDto.materialcode = this.materialcode;
			skuDto.materialname = this.materialname;
			skuDto.sku = this.sku;
			skuDetails.push(skuDto); 
		});
		
		var giftDetails = new Array();
		$.each(currGiftDetailData, function(){
			var giftDto = cloneObj(this);
			delete giftDto.enableqty;
			delete giftDto.adddatetime;
			delete giftDto.modifydatetime;
			giftDetails.push(giftDto); 
		});
		
		var ecorderInfo = {
			 "header": baseInfo,
			 "giftDetails": giftDetails,
			 "skuDetails": skuDetails
		}					
		commonPost(saveUrl, JSON.stringify(ecorderInfo), afterSaveFunc);	
	});
     
});



/************************************       内部方法              *******************************************/

/**
 * 保存成功后触发
 */
function afterSaveFunc(){
	parent.closeCurrTab("reflushDataGrid");
}

/**
 * 初始订单信息
 */
function initOrderInfo($orderfm, promotionsid){
	
	$.ajax({
		type : "GET",
		url : "${api}/ecpromotions/"+ promotionsid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var ecorderDto = result.entry;
			var header = ecorderDto.header;			
			
			/***************************              订单信息初始化                        ************************/	
			if(header.iscompatible!=null && header.iscompatible==1){				
				$("#iscompatible", $orderfm).attr("checked", true); 
			}
			if(header.isgiftover!=null && header.isgiftover==1){						
				$("#isgiftover", $orderfm).attr("checked", true);
			} 
			if(header.isall!=null){	
				if(header.isall){
					$("#isall", $orderfm).attr("checked", true); 
				}else{
					var east = $('#base_layout').layout('panel', 'east');
					if (east.panel('options').collapsed) {
						$('#base_layout').layout('expand', 'east');
					}	
					showPromotionsGoodsBtn();
				}	
			}
			if(header.companycode!=null){
				initCompanyGrid(true, header.companycode, header.shopid);	
				shopOnChange();
			} 						
			delete header.iscompatible;
			delete header.isgiftover;
			delete header.isall;
			delete header.companycode;
			delete header.shopid;			
			$orderfm.form("load", header);

			$("#promotionstypename", $orderfm).textbox("setValue",formatter(header.promotionstype, window.parent.ecPromotionsType));

			//重新渲染
			renderForm(header.status);
			
			currSkuDetailData = ecorderDto.skuDetails;
			currSkuDetailDataGrid.datagrid("loadData", currSkuDetailData);
			
			if(header.promotionstype==10){
				//满赠
				currOrderDetailDataGrid.datagrid("hideColumn", "orderprice");
			}else if(header.promotionstype==20){
				//买赠
				currOrderDetailDataGrid.datagrid("hideColumn", "giftsqty");
			}			
			currGiftDetailData = ecorderDto.giftDetails;
			currOrderDetailDataGrid.datagrid("loadData", currGiftDetailData);
	
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
	    singleSelect:true,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,
	    toolbar:"#skutoolbar",
	    columns:baseGiftsColumns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true,
	    onAfterEdit: function(rowIndex, rowData, changes){
	    	if(typeof rowData.giftslockqty !=undefined && typeof rowData.giftshasqty!=undefined){
	    		rowData.giftslockqty = Number(rowData.giftslockqty);
		    	rowData.giftshasqty = Number(rowData.giftshasqty);		    	
	    		rowData.enableqty = rowData.giftslockqty - rowData.giftshasqty;
	    	}else{	    		   	
	    		rowData.enableqty = 0;
	    	}	    		    	   	
	    },
	    loadFilter:function(data) {     		   		  		
    		//排序拦截器
    		sortFilter($(this), data);
    		//分页拦截器
    		return pagerFilter($(this), data);
        }
	});
	
	currSkuDetailDataGrid.datagrid({
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
	    toolbar:"#prmotionsskutoolbar",
	    columns:[[
			{field:"ck", checkbox:true},
			{field:"sku",title:"SKU",width:120,align:"center",sortable:true},			
			{field:"materialname",title:"商品名称",width:240,align:"center"},
			{field:"materialcode",title:"商品货号",width:120,align:"center"}			
			/* {field:"qty",title:"满足数量",width:100,align:"center",
				styler: function(value, rowData, rowIndex){
                	return 'font-weight:bold;color:green;';
                },
                formatter:numBaseFormat,               
				editor:{
					type:'numberspinner',
					options:{
						required: true,
						min:1,
						precision:0
					}
				}
			} */
	    ]],	    
    	loadFilter:function(data) {     		   		  		
    		//排序拦截器
    		sortFilter($(this), data);
    		//分页拦截器
    		return pagerFilter($(this), data);
        },
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true
	});
	
}

/**
 * 根据活动状态渲染表单
 */
function renderForm(status){
	
	if(status==40){
		//已结束
		$("#enddatetime", $orderfm).datetimebox("disable");
		commonRender();	
		$("#orderSaveBtn").linkbutton("disable");
	}else if(status==20 || status==30){
		//进行中
		commonRender();
	}
}

/**
 * 公共渲染方法
 */
function commonRender(){
	$("#iscompatible", $orderfm).attr("disabled", true); 							
	$("#isgiftover", $orderfm).attr("disabled", true);						
	$("#isall", $orderfm).attr("disabled", true); 			
	$("#startdatetime", $orderfm).datetimebox("disable");
	$('#orderfrom', $orderfm).combobox("disable");			
	$('#giftsstatus', $orderfm).combobox("disable");
	$('#companycode', $orderfm).combogrid("disable");	
	$('#shopid', $orderfm).combogrid("disable");
	$('#promotionsname', $orderfm).textbox("disable");
	currOrderDetailDataGrid.datagrid({		
	    columns:readGiftsColumns
	});
	hiddenPromotionsGoodsBtn();	
	hiddenPromotionsGiftsBtn();	
}

/**
 * 添加变更监听事件
 */
function shopOnChange(){
	$("#shopid").combogrid({
		onChange : function(newValue, oldValue) {
			clearEnableSkuQty();
			if(oldValue!=null && oldValue!=''){
				if(currSkuDetailData.length!=0 || currGiftDetailData.length!=0){
					$.messager.alert("提示", "原门店对应的商品会被删除!", "info", function(){
						currSkuDetailData = [];
						currGiftDetailData = [];
						currSkuDetailDataGrid.datagrid("loadData", currSkuDetailData);			
						currOrderDetailDataGrid.datagrid("loadData", currGiftDetailData);
		    		}); 
					$('.panel-tool-close').hide();
				}
			}									
		}
	});
}

</script>