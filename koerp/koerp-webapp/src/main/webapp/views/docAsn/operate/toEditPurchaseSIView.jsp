<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>

<div class="easyui-layout" data-options="fit:true" >
	<!-- 查询条件 -->
	<%@include file="../../busCommon/commonOrderViewToolbar.jsp"%>

	<div data-options="region:'center',split:true, border:false" >
		<div class="easyui-layout" data-options="fit:true" >
			<div data-options="region:'north',split:true, border:false" style="height:160px;overflow:hidden;">
				<div class="fsun-wrap">
					<form id="orderfm">
						<span class="title" style="top: 1px;">采购信息(单号:<span>${asnNo}</span>)</span>
						<input id="iId" name="iId" hidden="true" />
						<input id="toShopId" name="toShopId" hidden="true" />
						<input id="orderPrice" name="orderPrice" hidden="true" />
						<input id="asnNo" name="asnNo" hidden="true" />
						<table class="nb-formTable">
					        <tr>
								<th>单据类型</th>
								<td>
									<input id="asnType" name="asnType" class="easyui-combobox" readOnly />
								</td>
								<th>入库时间</th>
								<td>
									<input id="receivingTime" name="receivingTime" class="easyui-datetimebox" readOnly />
								</td>
								<th>入库店仓</th>
								<td>
									<input id="toShopName" name="toShopName" class="easyui-textbox" readOnly />
									<input id="orderNo" name="orderNo" hidden=true />
								</td>
					        </tr>
					        <tr>

								<th>供应商</th>
								<td>
									<input id="supplierName" name="supplierName" class="easyui-textbox" readOnly />
								</td>
								<th>联系人</th>
								<td>
									<input id="supplierContact" name="supplierContact" class="easyui-textbox" readOnly />
								</td>
					        	<th>联系方式</th>
								<td>
									<input id="supplierTel" name="supplierTel" class="easyui-textbox" readOnly />
								</td>
					        </tr>
					        <tr>
								<th>发货地址</th>
								<td>
									<input id="supplierAddress" name="supplierAddress" class="easyui-textbox"
										data-options="multiline:true" readOnly style="width:95%;height:50px;" />
								</td>
					        	<th>备注</th>
								<td colspan="3">
									<input id="memo" name="memo"  data-options="multiline:true"
										class="easyui-textbox" readOnly style="width:70%;height:50px;" />
									<a id="refundLink" href="#" class="easyui-linkbutton" iconCls="icon-attach"  style="margin-left:10px;"
										plain="false" disabled onclick="openRefundView()">退货明细</a>
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
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<!-- datagrid操作公共方法 -->
<%@include file="./baseSIView.jsp"%>

<script type="text/javascript">

var currDetailData = [];
var currOrderDetailDataGrid  = $("#orderDetailDataGrid");
var $orderfm = $("#orderfm");
var siColumns = [[
	{field:'ck',checkbox:true},
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:200,align:"center"},
	{field:"barCode",title:"条形码", width:110,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode);
	}},
	{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.categoryCode);
	}},
	{field:'property',title:'规格',width:100,align:'center',sortable:true},
	//{field:"costPrice",title:"成本价", width:80,align:"center",formatter:numBaseFormat},
	{field:"price",title:"单价", width:80,align:"center",formatter:numBaseFormat},
	{field:"receiveQty",title:"数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:numBaseFormat,
		editor:{
			type:'numberbox',
			options:{
				min:0.01,
				precision:2,
				required: true
			}
		}
	},
	{field:"unit",title:"单位",width:70,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.unitCode);
	}},
	{field:"stockIn",title:"操作",width:100,align:"center",
		formatter: function(value, row, index){
			return commonAssemBottonHtml('delOne', index, '删除', 'icon-script_delete');
		}
	}
]];

$(function () {

	$('#asnType', $orderfm).combobox({
		prompt: '请选择...',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.docAsnTypeData
   	});

	//去除默认的请选择项
	editInitComboxParams($orderfm, "");

	$.ajax({
		type : "GET",
		url : "${api}/doc/asn/getInitData",
		data:{
			"asnNo": "${asnNo}",
			"asnType": "${asnType}"
		},
		contentType:"application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			var docAsnDto = result.entry;

			/***************************              基本信息初始化                        ************************/
			var header = docAsnDto.header;
			if(header!=null){
				$orderfm.form("load", header);
				var orderNo = header.orderNo;
				if(orderNo!=null && orderNo!=''){
					$("#refundLink").linkbutton("enable");
				}
			}

			var details = docAsnDto.details;
			if(details!=null && details.length>0){
				currDetailData = details;
				skuListReLoad();
			}

		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});


});


/**
 * 创建退货单
 */
function toCreateAsnRefundView(){
	var asnNo = $("#asnNo", $orderfm).val();
	var rows = currOrderDetailDataGrid.datagrid("getSelections");
	if(rows.length==0){
		$.messager.alert("提示", "请勾选要退货的商品", "info");
		return;
	}
	var asnDetailIds = [];
	$.each(rows, function(){
		asnDetailIds.push(this.asnDetailId);
	});
	var url = "${api}/doc/asn/refund/toAddView/" + asnNo+"?asnDetailIds="+ asnDetailIds.join(",");
	var icon = "icon-book_add";
	var subtitle = "创建退货单";
	parent.addTab(subtitle, url, icon);
}

//打开退换货明细
function openRefundView(){
	var orderNo = $("#orderNo", $orderfm).val();
	if(orderNo==""){
		$.messager.alert("提示", "暂无明细!", "info");
		return;
	}
	var url = "${api}/doc/order/purchaseSo/toBaseDetailView/"+ orderNo;
	commonDialog("ordersDialog", "退货明细", "95%", "90%", url, "icon-book_open");
}

/******************************    供选择商品的子页面使用      ********************************/



/**
 * 初始化新增商品
 */
function initAddSku(rowData){
	var skuDto = {};
	skuDto.goodsName = rowData.goodsName;
	skuDto.sku = rowData.sku;
	skuDto.property = rowData.property;
	skuDto.receiveQty = rowData.qty;
	skuDto.damagedQty = 0;
	skuDto.rejectedQty = 0;
	skuDto.unit = rowData.unit;
	skuDto.costPrice = rowData.costPrice;
	skuDto.price = rowData.salePrice;
	skuDto.totalPrice = CalcAmount.multiply(rowData.salePrice, skuDto.receiveQty, 2);


	skuDto.barCode = rowData.barCode;
	skuDto.categoryCode = rowData.categoryCode;
	skuDto.categoryName = formatter(rowData.categoryCode, window.parent.categoryCode);
	skuDto.brandCode = rowData.brandCode;
	skuDto.brandName = formatter(rowData.brandCode, window.parent.brandCode);
	skuDto.memo = "";
	return skuDto;
}


</script>
