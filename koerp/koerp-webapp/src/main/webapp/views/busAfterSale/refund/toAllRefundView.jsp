<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>

<style type="text/css">

.fsun-wrap .title {
	position: absolute;
	color: #416AA3;
	font-weight: bold;
	left: 5px;
	line-height: 2em;
	font-size: 12px;
    font-family: Tahoma,Verdana,微软雅黑,新宋体;
	padding: 0 1em;
	background-color: #fff;
}

.skutitle{
	margin: 0px 18px 0px 6px;
    padding-top: 0px;
    padding-bottom: 0px;
    height: 26px;
    line-height: 26px;
    width: 182px;
    font-size: 12px;
    font-weight: bold;
    color: #416AA3;
}

</style>


<div class="easyui-layout" data-options="fit:true" >
	<!-- 查询条件 -->
	<%@include file="../../addrefundtoolbar.jsp"%>

	<div data-options="region:'center',split:true, border:false" >
		<div class="easyui-layout" data-options="fit:true" >
			<div data-options="region:'north',split:true, border:false" style="height:215px;">
				<div class="fsun-wrap">
					<span class="title" style="top: 1px;">退货退款信息</span>
					<form id="orderfm">
						<input id="orderId" name="orderId" hidden="true" />
						<input id="extOrderId" name="extOrderId" hidden="true" />
						<input id="shopId" name="shopId" hidden="true" />
						<input id="buyerId" name="buyerId" hidden="true" />
						<table class="nb-formTable" style="width:100%;">
					        <tr>
					        	<th width="12%">原订单金额</th>
								<td>
									<input id="orderPrice" name="orderPrice" class="easyui-numberbox" disabled
										data-options="min:0,precision:2, formatter: priceFormat" style="width:95%;" />
								</td>
								<th width="12%">原实收金额</th>
								<td>
									<input id="receptPrice" name="receptPrice" class="easyui-numberbox" disabled
										data-options="min:0,precision:2, formatter: priceFormat" style="width:95%;" />
								</td>

								<th width="12%">所属店仓</th>
								<td>
									<input id="shopName" name="shopName" class="easyui-textbox" readOnly style="width:95%;" />
								</td>
					        </tr>
					        <tr>
				       			<th width="12%">退款金额</th>
								<td>
									<input id="refundPrice" name="refundPrice" class="easyui-numberbox"
										data-options="min:0,precision:2,value:0, formatter: priceFormat" style="width:95%;" />
								</td>
								<th width="12%">退货原因</th>
								<td>
									<input id="refundReason" name="refundReason" class="easyui-combobox"
										editable="false" style="width:95%;" />
								</td>
								<th width="12%">客户名称</th>
								<td>
									<input id="buyerName" name="buyerName" class="easyui-textbox" readOnly style="width:95%;" />
								</td>
					        </tr>
					        <tr>
					        	<th width="12%">支付方式</th>
								<td>
									<input id="payMode" name="payMode" class="easyui-combobox"
										editable="false" style="width:95%;" />
								</td>
								<th width="12%">支付流水号</th>
								<td>
									<input id="tradeNo" name="tradeNo" class="easyui-textbox" style="width:95%;" />
								</td>
								<th width="12%">支付卡号</th>
								<td>
									<input id="cardNo" name="cardNo" class="easyui-textbox" style="width:95%;" />
								</td>
					        </tr>
					        <tr>
					            <th width="12%">备注</th>
					        	<td colspan="5">
									<input id="memo" name="memo" data-options="multiline:true"
										class="easyui-textbox" style="width:70%;height:46px;" />
								</td>
					        </tr>
						</table>
					</form>
				</div>
			</div>

			<div data-options="region:'center',split:true, border:false" >
				<table id="refundDetailDataGrid" ></table>
			</div>
		</div>
	</div>
</div>

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currRefundDetails = [];
var currRefundDetailDataGrid = $("#refundDetailDataGrid");
var $orderfm = $("#orderfm");
var currOrderUnpayPrice = 0;
var isOpenShow = false;

var refundColumns = [[
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:140,align:"center"},
	//{field:"barCode",title:"条形码", width:140,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode);
	}},
	{field:'property',title:'规格',width:120,align:'center',sortable:true},
	{field:"originQty",title:"下单数量",width:60,align:"center",
		styler: function(value, rowData, rowIndex){
	      	return 'font-weight:bold;color:green;';
	    },
		formatter:numBaseFormat
	},
	{field:"originTotalPrice",title:"实付总价",width:60,align:"center",
		styler: function(value, rowData, rowIndex){
	      	return 'font-weight:bold;color:green;';
	    },
		formatter:numBaseFormat
	},
	{field:"qty",title:"退货数量",width:60,align:"center",
		styler: function(value, rowData, rowIndex){
			if(rowData.originQty > rowData.qty){
				return 'font-weight:bold;color:#FF9933;';
			}
	      	return 'font-weight:bold;color:green;';
	    },
      	formatter:numBaseFormat
	},
	{field:"salePrice",title:"退货单价",width:60,align:"center",
		styler: function(value, rowData, rowIndex){
			if(rowData.originQty > rowData.qty){
				return 'font-weight:bold;color:#FF9933;';
			}
	      	return 'font-weight:bold;color:green;';
	    },
      	formatter:numBaseFormat
	},
	{field:"totalPrice",title:"退款金额",width:60,align:"center",
		styler: function(value, rowData, rowIndex){
			if(rowData.originQty > rowData.qty){
				return 'font-weight:bold;color:#FF9933;';
			}
	      	return 'font-weight:bold;color:green;';
	    },
		formatter:numBaseFormat
	}
]];

$(function () {

	$('#payMode', $orderfm).combobox({
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.vipUnpaidPayModeData
   	});

	$('#refundReason', $orderfm).combobox({
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.refundReasonData
   	});

	//去除默认的请选择项
	editInitComboxParams($orderfm, "");

	currRefundDetailDataGrid.datagrid({
		view:footerStyleView,
		title: "商品明细",
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    remoteSort:false,
	    sortName:"sku",
        sortOrder:"asc",
	    singleSelect:true,//是否单选
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    columns: refundColumns,
	    loadFilter:function(data) {
    		var fields = ["totalPrice"];
    		//排序拦截器
    		sortFilter($(this), data);
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "sku");
			return data;
        },
        rowStyler:function(index,row){
    		if (row.sku=="合计:"){//这里是判断哪些行
                return 'font-weight:bold;';
            }
    		return "";
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});

	$.ajax({
		type : "GET",
		url : "${api}/bus/aftersale/refund/all/getInitData?orderId=${orderId}",
		contentType:"application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			var orderDto = result.entry;
			var header = orderDto.header;

			/***************************              基本信息初始化                        ************************/
			if(header!=null){
				$orderfm.form("load", header);
			}
			//获取订单挂账合计金额
			var payAccounts = orderDto.payAccounts;
			if(payAccounts!=null && payAccounts.length>0){
				$.each(payAccounts, function(){
					if(this.payMode==6){
						var receptPrice = this.receptPrice;
						currOrderUnpayPrice = CalcAmount.add(currOrderUnpayPrice, receptPrice, 2);
					}
				});
			}

			var refundPrice = 0;
			$.each(orderDto.details, function(){
				delete this.untakeQty;
				if(this.qty>0){
					if(typeof this.originQty == "undefined"){
						this.originQty = this.qty;
						this.originTotalPrice = this.totalPrice;
						this.totalPartPrice = 0;
					}
					refundPrice = CalcAmount.add(refundPrice, this.totalPrice, 2);
					currRefundDetails.push(this);
				}
			});
			if(header.buyerId!=null && header.buyerId.startWith("JXS")){
				refundPrice = 0;
				$("#refundPrice", $orderfm).numberbox({editable:false});
			}
			$("#refundPrice", $orderfm).numberbox("setValue", refundPrice);
			currRefundDetailDataGrid.datagrid("loadData", currRefundDetails);
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
	var baseInfo = formJson($orderfm);
	var refundPrice = Number(baseInfo.refundPrice);
	var payAccounts = [];
	if(refundPrice!=null && refundPrice>0){
		//原订单存在挂账记录
		if(currOrderUnpayPrice>0){
			isOpenShow = true;
			if(currOrderUnpayPrice>=refundPrice){
				payAccounts.push({
					receptPrice: refundPrice,
					payPrice: refundPrice,
					discountAmount: 0,
					dibPrice: 0,
					payMode: 6
				});
			}else{
				var diffPrice = CalcAmount.subtract(refundPrice, currOrderUnpayPrice, 2);
				//挂账记录
				payAccounts.push({
					receptPrice: currOrderUnpayPrice,
					payPrice: currOrderUnpayPrice,
					discountAmount: 0,
					dibPrice: 0,
					payMode: 6
				});
				//多出来的使用当前支付方式记账
				payAccounts.push({
					receptPrice: diffPrice,
					payPrice: diffPrice,
					discountAmount: 0,
					dibPrice: 0,
					payMode: baseInfo.payMode,
					tradeNo: baseInfo.tradeNo,
					cardNo: baseInfo.cardNo
				});
			}
		}else{
			payAccounts.push({
				receptPrice: refundPrice,
				payPrice: refundPrice,
				discountAmount: 0,
				dibPrice: 0,
				payMode: baseInfo.payMode,
				tradeNo: baseInfo.tradeNo,
				cardNo: baseInfo.cardNo
			});
		}

	}
	delete baseInfo.payMode;
	delete baseInfo.tradeNo;
	delete baseInfo.cardNo;
	var saveData = {
	     "params": {
			 "refundHeader": baseInfo,
			 "refundDetails": currRefundDetails,
			 "payAccounts": payAccounts
			},
	     "saveUrl": "${api}/bus/aftersale/refund/create"
	}
	return saveData;
}

</script>
