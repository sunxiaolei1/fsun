<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" >

$(function () { 
	
	currOrderDetailDataGrid.datagrid({
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
	    toolbar: "#detailskutoolbar",
	    columns: soColumns,
	    onBeforeLoad:function(param){
	    	if('1' == '${hasEditPricePower}'){
	    		var columnOption = $(this).datagrid("getColumnOption", "price");
	    		columnOption.editor = {
	    			type:'numberbox',
	    			options:{					
	    				min:0,
	    				precision:2,
	    				required: true
	    			}
	    		};
		    	columnOption.styler = function(value, rowData, rowIndex){
	    	    	return 'font-weight:bold;color:green;';
	    	    };
	    	}else{
	    		//领用出库单价显示
	    		if('16'=='${orderType}'){
	    			
	    		}else{
	    			$(this).datagrid("hideColumn", "price");
	    		}
	    		
	    	}    	
	    },	
	    loadFilter:function(data) { 
	    	//排序拦截器
    		sortFilter($(this), data);
    		//分页拦截器
    		return pagerFilter($(this), data);   
        },
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
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

	var baseInfo = formJson($orderfm);
	var orderType = baseInfo.orderType;
	//调拨单
	if(orderType=='11' && baseInfo.deliveryTime!=''){
		//baseInfo.deliveryTime = (baseInfo.deliveryTime +" 00:00:00");
	}
	var saveData = {
	     "params": {
	    	 "orderNo": $("#orderNo",$orderfm).val(),
			 "header": baseInfo,
			 "details": currDetailData
			},
	     "saveUrl": "${api}/doc/order/saveEntity"
	}
	return saveData;
}

//获取取消订单的参数
function getOrderCancelData(){
	var saveData = {
	     "params": {
	    	"memo":  $("#memo",$orderfm).textbox("getValue")
	      },
	     "saveUrl": "${api}/doc/order/status/${cancelStatus}?orderNos="+ $("#orderNo",$orderfm).val()
	}
	return saveData;
	
}

/**
 * 保存成功后触发
 */
function afterSaveFunc(){
	var orderType = $("#orderType",$orderfm).combobox("getValue");
	if(orderType=='13'){
		parent.closeCurrTab("parent.refreshCurrTab");
	}else{
		parent.closeCurrTab("reflushDataGrid");
	}
	
}

/******************************    供选择商品的子页面使用      ********************************/


/**
 * 获取一行中sku的数量
 */
function getSkuQty(skuDto){
	return skuDto.shippedQty;
}

/**
 * 更新一行中sku的数量
 */
function setRowSkuQty(targetRow, sourceRow){
	targetRow.shippedQty = sourceRow.qty;
}


/**
 * 获取一行中sku的单价
 */
function getSkuPrice(skuDto){
	return skuDto.price;
}


/**
 * 补发商品列表中是否存在该sku对应的商品
 */
function existSku(skuData, sku){		
	if(skuData.sku == sku) {		
		return true;				
	}
	return false;
}

</script>