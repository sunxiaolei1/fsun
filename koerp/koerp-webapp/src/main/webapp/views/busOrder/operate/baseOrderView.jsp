<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" >

$(function () { 
	
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
	    toolbar: "#detailskutoolbar",
	    columns: '${hasEditPricePower}'=='' ? soColumns:soEditColumns,
	    loadFilter:function(data) {     		
    		var fields = ["totalPrice","giftPrice","couponPrice"];       		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "sku"); 

    	    //同步订单头金额信息   	    
   	    	var orderPrice = Number(data.footer[0].totalPrice);    	    	
   	    	$("#orderPrice", $orderfm).numberbox("setValue", orderPrice);
       	    $("#couponPrice", $orderfm).numberbox("setValue", data.footer[0].couponPrice);
       	    $("#toZeroPrice", $orderfm).numberbox("setValue", (Math.round(orderPrice*100)%10)/100);
			return data; 
        },
        rowStyler:function(index,row){	    		    	
    		if (row.sku=="合计:"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	
    		return "";
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true,
	    onAfterEdit: function(rowIndex, rowData, changes){
	    	if(typeof rowData.salePrice !=undefined && typeof rowData.qty!=undefined){
	    		rowData.salePrice = Number(rowData.salePrice);
		    	rowData.qty = Number(rowData.qty);
	    		rowData.totalPrice = rowData.salePrice * (rowData.qty - rowData.giftCount);
	    		rowData.couponPrice = rowData.giftPrice + 
	    			(rowData.qty - rowData.giftCount)*(rowData.originSalePrice - rowData.salePrice);
	    	}else{	    		   	
	    		rowData.totalPrice = 0;
	    		rowData.couponPrice = 0;
	    	}
	    		    	   	
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
	
	if(currDetailData==null || currDetailData.length==0){
		$.messager.alert("错误", "请选择订单商品!", "error");  
		return null;
	}
	currOrderDetailDataGrid.datagrid("acceptChanges");	

	var baseInfo = formJson($orderfm);
	var payAccountInfo = formJson($payAccountfm);
	baseInfo.receptPrice = payAccountInfo.receptPrice;
	baseInfo.payPrice = payAccountInfo.payPrice;
	baseInfo.dibPrice = payAccountInfo.dibPrice;
	baseInfo.discountPrice = payAccountInfo.discountPrice;	
	var saveData = {
	     "params": {
	    	 "orderId": $("#orderId",$orderfm).textbox("getValue"),
			 "header": baseInfo,
			 "details": currDetailData,
			 "payAccounts": currPayAccountData
			},
	     "saveUrl": "${api}/bus/order/saveEntity"
	}
	return saveData;
}

//获取取消订单的参数
function getOrderCancelData(){
	var saveData = {
	     "params": {
	    	"memo":  $("#memo",$orderfm).textbox("getValue")
	      },
	     "saveUrl": "${api}/bus/order/status/${cancelStatus}?orderIds="+ $("#orderId",$orderfm).textbox("getValue")
	}
	return saveData;
	
}

/**
 * 保存成功后触发
 */
function afterSaveFunc(){
	parent.closeCurrTab("reflushDataGrid");
}


/******************************    供选择商品的子页面使用      ********************************/


/**
 * 获取一行中sku的数量
 */
function getSkuQty(skuDto){
	return skuDto.qty;
}

/**
 * 获取一行中sku的数量
 */
function getSkuSalePrice(skuDto){
	return skuDto.salePrice;
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