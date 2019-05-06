<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<style type="text/css">

.nb-formTable th {width:9%;}
.nb-formTable td {width:16%;}

</style>

<div class="easyui-layout" data-options="fit:true" >

	<!-- 查询条件 -->
	<%@include file="../../addtoolbar.jsp"%>
	
	<div data-options="region:'center',split:true, border:false" >
		<div class="easyui-layout" data-options="fit:true" >
			<div data-options="region:'north',split:true, border:false" style="height:170px;overflow:hidden;">
				<div class="fsun-wrap">
					<form id="orderfm">
						<span class="title" style="top: 1px;">充值信息</span>				
						<input id="customerCode" name="customerCode" hidden="true" />	
						<input id="shopId" name="shopId" hidden="true" />		
						<table class="nb-formTable">
					        <tr>
					            <th>会员卡号</th>
								<td>
									<input id="cardNo" name="cardNo" class="easyui-textbox" readOnly style="width:90%;" />
								</td>
								<th>客户名称</th>
								<td>
									<input id="customerName" name="customerName" class="easyui-textbox" readOnly style="width:90%;" />						
								</td>
								<th>交易类型</th>
								<td>
									<input id="tradeType" name="tradeType" class="easyui-combobox" readOnly style="width:90%;" />
								</td>
								<th>交易门店</th>
								<td>
									<input id="shopName" name="shopName" class="easyui-textbox" disabled style="width:90%;" />							
								</td>																	
					        </tr>
					        <tr>
					        	<th>卡类型</th>
								<td>
									<input id="cardType" name="cardType" class="easyui-combobox" disabled style="width:90%;" />								
								</td>
					            <th>持卡人</th>
								<td>
									<input id="cnName" name="cnName" class="easyui-textbox" disabled style="width:90%;" />
								</td>				
								<th>可用余额</th>
								<td>
									<input id="enablePrice" name="enablePrice" class="easyui-numberbox" disabled 
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:90%;" />						
								</td>	
								<th>赠金余额</th>
								<td>
									<input id="giftPrice" name="giftPrice" class="easyui-numberbox" disabled 
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:90%;" />							
								</td>							
					        </tr>		               		
					        <tr>	        		
								<th>充值金额<span style="color:red;">*</span></th>
								<td>
									<input id="rachargePrice"  class="easyui-numberbox" required 
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:90%;" />						
								</td>
								<th>本金比例</th>
								<td>
									<input id="originPrecent" name="originPrecent" class="easyui-numberbox" disabled 
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:90%;" />							
								</td>
								<th>交易金额<span style="color:red;">*</span></th>
								<td>
									<input id="tradePrice" name="tradePrice" class="easyui-numberbox" readOnly 
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:90%;" />							
								</td>		
								<th>赠送金额</th>
								<td>
									<input id="newGiftPrice" name="newGiftPrice" class="easyui-numberbox" readOnly style="width:45%;"
										data-options="min:0,precision:2,value:0, formatter: priceFormat" />	
									<input id="trimPrice" class="easyui-numberspinner" style="width:52%;"
										data-options="min:0,precision:2,value:0.00" />										
								</td>		        	
					        </tr>
					        <tr>
					        	<th>支付方式</th>
								<td>
									<input id="payMode" name="payMode" class="easyui-combobox" 
										editable="false" required style="width:90%;" />							
								</td>				
								<th>备注</th>
								<td colspan="5" >
									<input id="memo" name="memo" class="easyui-textbox" style="width:70%;" />
								</td>							
					        </tr>	
						</table>
					</form>			
				</div>
			</div>
			
			<div data-options="region:'center',split:true, border:false" >
				<div id="detailskutoolbar" style="display:none;">
					<%@include file="./detailskutoolbar.jsp"%>
				</div>
				<table id="orderDetailDataGrid"></table>
			</div>
		</div>
	</div>
	
</div>

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/vipUnpaidEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currOrderDetailDataGrid  = $("#orderDetailDataGrid");
var $orderfm = $("#orderfm");
var rachargeColumns = [[
	{field:'unpaidId',hidden:true},
	//{field:"customerName",title:"客户名称", width:120,align:"center"},
	{field:"shopName",title:"交易门店", width:120,align:"center"},
	{field:"payMode",title:"支付方式", width:80,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.payMode); 
	}},
	{field:"tradeType",title:"交易类型", width:90,align:"center",sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.tradeType); 
	}},
	{field:"orderId",title:"销售单号", width:130,align:"center"},
	{field:'tradeStatus',title:'交易状态',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.tradeStatus); 
	}},
	{field:"tradeTime",title:"交易时间", width:130,align:"center",sortable:true},
	{field:'tradePrice',title:'交易金额',width:100,align:'center',formatter:numBaseFormat},
	{field:"giftPrice",title:"赠送金额", width:100,align:"center",formatter:numBaseFormat},
	{field:"memo",title:"备注", width:150,align:"center"},
	{field: "selected", title: "操作", width: 100, align: "center",
		formatter: function(value, row, index){	
			var tradeType = row.tradeType;
			var unusual = row.unusual;
			if(!unusual && tradeType == 4){	
				var unpaidId = row.unpaidId;
				var relationId = (typeof(row.relationId) == "undefined")?"":row.relationId;
				return commonAssemBottonHtml('cancelOrderOne', "'"+ unpaidId +"','"+ relationId +"'", '取消', 'icon-script_delete');			
			}
											
		}
	}
]];

$(function () { 
	
	$('#cardType', $orderfm).combobox({  
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.vipCardTypeData
   	});
	
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
	
	$('#trimPrice', $orderfm).numberspinner({  
	    onChange:function(newValue,oldValue){ 
	    	var diffPrice = Number(newValue) - Number(oldValue);
	    	var tradePrice = $("#tradePrice", $orderfm).numberbox("getValue");
	    	var newGiftPrice = $("#newGiftPrice", $orderfm).numberbox("getValue");
	    	$("#tradePrice", $orderfm).numberbox("setValue", Number(tradePrice) + diffPrice);
			$("#newGiftPrice", $orderfm).numberbox("setValue", Number(newGiftPrice) + diffPrice); 	       
		}  
	});
	
	$('#rachargePrice', $orderfm).numberbox({  
		onChange:function(newValue,oldValue){	
			var originPrecent = $("#originPrecent", $orderfm).numberbox("getValue");
			var trimPrice = $('#trimPrice', $orderfm).numberspinner("getValue");
			var tradePrice = Number(newValue) * Number(originPrecent);
			$("#tradePrice", $orderfm).numberbox("setValue", tradePrice + Number(trimPrice));
			$("#newGiftPrice", $orderfm).numberbox("setValue",tradePrice-Number(newValue) + Number(trimPrice)); 
	    }
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
    		var fields = ["tradePrice","giftPrice"];       		
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
        	if (row.shopName=="合计:"){//这里是判断哪些行
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
		url : "${api}/bus/vip/initRachargeData",
		data:{
			"cardNo": "${cardNo}"
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
	
	//赠送金额不能大于充值金额
	if(baseInfo.tradePrice<2*baseInfo.newGiftPrice){
		$.messager.alert("错误", "赠送金额不能大于充值金额!", "error");  
		return null;
	} 
	
	if(baseInfo.tradePrice==0){
		$.messager.alert("错误", "交易金额必须大于零!", "error");  
		return null;
	} 
	
	var busVipUnpaid = {
		cardNo: baseInfo.cardNo,
		shopId: baseInfo.shopId,
		customerCode: baseInfo.customerCode,
		customerName: baseInfo.customerName,
		tradePrice:	baseInfo.tradePrice,
		giftPrice:	baseInfo.newGiftPrice,
		payMode: baseInfo.payMode,
		tradeType: baseInfo.tradeType,
		memo: baseInfo.memo
	};
	
	var saveData = null;
	var unpaidAmount = getUnpaidAmount(busVipUnpaid);	
	if(unpaidAmount!=null){		
		$("<div></div>").dialog({
			id:"vipUnpaidDialog",
		    title:"&nbsp;会员卡充值明细",
		    width:"960px",
			height:"350px",
		    iconCls:"icon-add",
		    closed:false,
		    cache:false,
		    href:"${api}/bus/vipUnpaid/toVipUnpaidView",
		    modal:true,
		    minimizable:false,//定义是否显示最小化按钮。
	     	maximizable:false,//定义是否显示最大化按钮
	     	closable:true,
	     	resizable:true,//定义对话框是否可调整尺寸
	     	collapsible: false,//是否可折叠的
	      	buttons:[
		      	{
		      		text:"保存",iconCls:"icon-disk",
		              handler:function(data){	              	
	              		 saveData = {
              				"params": unpaidAmount,
              				"saveUrl": "${api}/bus/vipUnpaid/saveEntity"
              			 }
	              		 if(typeof afterSaveFunc === 'function'){	
	            			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), null, afterSaveFunc);
	            		 }else{
	            			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), cancel);
	            		 }
		              }
		          },
		          {
		              text:"取消",
		              iconCls:"icon-cancel",
		              handler:function(){
		              	$('#vipUnpaidDialog').dialog("destroy");
		              }
		          }
	      	],
			onLoad:function(){
	     		$('#vipUnpaidDialog').window('center');
	     		var header = unpaidAmount.header;
	     		var details = unpaidAmount.details;
	     		$vipUnpaidfm.form("load", header);					
	     		currVipUnpaidDetailData = details;
				currVipUnpaidDetailDataGrid.datagrid("loadData", currVipUnpaidDetailData);    		
			},
	    	onClose:function(){
	      		$(this).dialog("destroy");
	      	}
		});	
		return null;
	}else{
		delete busVipUnpaid.customerName;
		saveData = {
		     "params": busVipUnpaid,
		     "saveUrl": "${api}/bus/vipUnpaid/save"
		}
	}
	return saveData;
}

function afterSaveFunc(){
	parent.closeCurrTab("reflushDataGrid");
}

/**
 * 获取客户对应的挂账欠款
 */
function getUnpaidAmount(busVipUnpaid){
	
	var unpaidAmount = {};
	$.ajax({
		type : "POST",
		url : "${api}/bus/vipUnpaid/initUnpaidAmount",
		data : JSON.stringify(busVipUnpaid),
		contentType:"application/json;charset=utf-8",
		async: false,
		dataType : "json",
		success : function(result) {		
			if(result.status){
				unpaidAmount = result.entry;
			}else{
				$.messager.alert("错误", result.message, "error");
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	}); 	
	return unpaidAmount;
}

/**
 * 取消一笔充值交易
 */
function cancelOrderOne(unpaidId, relationId){	
	if(relationId!=null && relationId!=''){	
		var unpaidAmount = getUnpaidAmount({
			relationId:relationId
		});
		if(unpaidAmount!=null){		
			$("<div></div>").dialog({
				id:"vipUnpaidDialog",
			    title:"&nbsp;取消会员卡充值",
			    width:"960px",
				height:"350px",
			    iconCls:"icon-script_delete",
			    closed:false,
			    cache:false,
			    href:"${api}/bus/vipUnpaid/toVipUnpaidView",
			    modal:true,
			    minimizable:false,//定义是否显示最小化按钮。
		     	maximizable:false,//定义是否显示最大化按钮
		     	closable:true,
		     	resizable:true,//定义对话框是否可调整尺寸
		     	collapsible: false,//是否可折叠的
		      	buttons:[
			      	{
			      		text:"确认",iconCls:"icon-disk",
			              handler:function(data){	              	
			            	  var ids = [];
			            	  $.each(currVipUnpaidDetailData,function(){
			            		  ids.push(this.unpaidId);
			            	  });
			            	  $.ajax({
			          			type : "POST",
			          			url : "${api}/bus/vipUnpaid/status/40?ids="+ ids.join(","),
			          			data: JSON.stringify({
			          				"memo":""
			          			}),
			          			contentType:"application/json;charset=utf-8",	   
			          			dataType : "json",
			          			success : function(result) {		
			          				if(result.status){
			          					$.messager.alert("提示", "操作成功", "info", function(){
			          						parent.refreshCurrTab();
			          					});
			          				}else{
			          					$.messager.alert("错误", result.message, "error");
			          				}
			          			},
			          			error : function(XMLHttpRequest, textStatus, errorThrown) {
			          				$.messager.alert("错误", errorThrown, "error");
			          			}
			          		});  
			              }
			          },
			          {
			              text:"取消",
			              iconCls:"icon-cancel",
			              handler:function(){
			              	$('#vipUnpaidDialog').dialog("destroy");
			              }
			          }
		      	],
				onLoad:function(){
		     		$('#vipUnpaidDialog').window('center');
		     		var header = unpaidAmount.header;
		     		var details = unpaidAmount.details;
		     		$vipUnpaidfm.form("load", header);					
		     		currVipUnpaidDetailData = details;
					currVipUnpaidDetailDataGrid.datagrid("loadData", currVipUnpaidDetailData);    		
				},
		    	onClose:function(){
		      		$(this).dialog("destroy");
		      	}
			});	
		}
	}else{
		$.ajax({
			type : "POST",
			url : "${api}/bus/vipUnpaid/status/40?ids="+ unpaidId,
			data: JSON.stringify({
				"memo":""
			}),
			contentType:"application/json;charset=utf-8",	   
			dataType : "json",
			success : function(result) {		
				if(result.status){
					$.messager.alert("提示", "操作成功", "info", function(){
						parent.refreshCurrTab();
					});
				}else{
					$.messager.alert("错误", result.message, "error");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert("错误", errorThrown, "error");
			}
		});  
	}
	
}


</script>