var isTrueData = [{"id":"", "text": "请选择..."},{"id":"true", "text": "是"},{"id": "false", "text": "否"}];
var isEnableData = new Array();
var busCustomerTypeData = new Array();
var vipCardTypeData = new Array();
var categoryCodeData = new Array();
var brandCodeData = new Array();
var unitCodeData = new Array();
var productTypeData = new Array();
var rackNoData = new Array();
var flowStatusData = new Array();
var orderStatusData = new Array();
var tradeStatusData = new Array();
var orderTypeData = new Array();
var payModeData = new Array();
var tradeFromData = new Array();
var tradeTypeData = new Array();
var docAsnStatusData = new Array();
var docAsnTypeData = new Array();
var docOrderModeData = new Array();
var docOrderStatusData = new Array();
var docOrderTypeData = new Array();
var docPoStatusData = new Array();
var docPoTypeData = new Array();
var docTradeStatusData = new Array();
var docTradeTypeData = new Array();
var busGoodsTypeData = new Array();

/**************************   ecorder    *********************************/

var isTrue = {'false': '否', 'true': '是'};
var isEnable = {};
var busCustomerType = {};
var vipCardType = {};
var categoryCode = {};
var brandCode = {};
var unitCode = {};
var productType = {};
var rackNo = {};
var flowStatus = {};
var orderStatus = {};
var tradeStatus = {};
var orderType = {};
var payMode = {};
var tradeFrom = {};
var tradeType = {};
var docAsnStatus = {};
var docAsnType = {};
var docOrderMode = {};
var docOrderStatus = {};
var docOrderType = {};
var docPoStatus = {};
var docPoType = {};
var docTradeStatus = {};
var docTradeType = {};
var busGoodsType = {};

$(function () {
	synchronizeData();	
	isEnable = formatterCodeType(isEnableData);
	busCustomerType = formatterCodeType(busCustomerTypeData);
	vipCardType = formatterCodeType(vipCardTypeData);
	categoryCode = formatterCodeType(categoryCodeData);
	brandCode = formatterCodeType(brandCodeData);
	unitCode = formatterCodeType(unitCodeData);
	productType = formatterCodeType(productTypeData);
	rackNo = formatterCodeType(rackNoData);
	
	flowStatus = formatterCodeType(flowStatusData);
	orderStatus = formatterCodeType(orderStatusData);
	tradeStatus = formatterCodeType(tradeStatusData);
	orderType = formatterCodeType(orderTypeData);
	payMode = formatterCodeType(payModeData);
	tradeFrom = formatterCodeType(tradeFromData);
	
	tradeType = formatterCodeType(tradeTypeData);
	
	docAsnStatus = formatterCodeType(docAsnStatusData);
	docAsnType = formatterCodeType(docAsnTypeData);
	docOrderMode = formatterCodeType(docOrderModeData);
	docOrderStatus = formatterCodeType(docOrderStatusData);
	docOrderType = formatterCodeType(docOrderTypeData);
	docPoStatus = formatterCodeType(docPoStatusData);
	docPoType = formatterCodeType(docPoTypeData);
	docTradeStatus = formatterCodeType(docTradeStatusData);
	docTradeType = formatterCodeType(docTradeTypeData);
	
	busGoodsType = formatterCodeType(busGoodsTypeData); 
});

function formatterCodeType(result) {
	var typeMap = {};
	if(result){
		for(var i = 0; i<result.length; i++) {
			if(result[i].codeCode != '') {
				typeMap[result[i].codeCode] = result[i].codeName;
			}
		}
	}
	return typeMap; 
}

function synchronizeData() {
	$.ajax({
       	url:API_PATH + "/sys/codes/list",	
       	dataType: "json",
        async:false,
       	success:function(result){
        	if(result && result.entry){
        		$.each(result.entry, function (i, item) {
        			if(item.codeType == 'IsEnable') {
        				isEnableData.push(item);
        			}else if(item.codeType == 'BusCustomerType') {
        				busCustomerTypeData.push(item);
        			}else if(item.codeType == 'VipCardType') {
        				vipCardTypeData.push(item);
        			}else if(item.codeType == 'CategoryCode') {
        				categoryCodeData.push(item);
        			}else if(item.codeType == 'BrandCode') {
        				brandCodeData.push(item);
        			}else if(item.codeType == 'UnitCode') {
        				unitCodeData.push(item);
        			}else if(item.codeType == 'ProductType') {
        				productTypeData.push(item);
        			}else if(item.codeType == 'RackNo') {
        				rackNoData.push(item);
        			}else if(item.codeType == 'FlowStatus') {
        				flowStatusData.push(item);
        			}else if(item.codeType == 'OrderStatus') {
        				orderStatusData.push(item);
        			}else if(item.codeType == 'TradeStatus') {
        				tradeStatusData.push(item);
        			}else if(item.codeType == 'OrderType') {
        				orderTypeData.push(item);
        			}else if(item.codeType == 'PayMode') {
        				payModeData.push(item);
        			}else if(item.codeType == 'TradeFrom') {
        				tradeFromData.push(item);
        			}else if(item.codeType == 'TradeType') {
        				tradeTypeData.push(item);
        			}else if(item.codeType == 'DocAsnStatus') {
        				docAsnStatusData.push(item);
        			}else if(item.codeType == 'DocAsnType') {
        				docAsnTypeData.push(item);
        			}else if(item.codeType == 'DocOrderMode') {
        				docOrderModeData.push(item);
        			}else if(item.codeType == 'DocOrderStatus') {
        				docOrderStatusData.push(item);
        			}else if(item.codeType == 'DocOrderType') {
        				docOrderTypeData.push(item);
        			}else if(item.codeType == 'DocPoStatus') {
        				docPoStatusData.push(item);
        			}else if(item.codeType == 'DocPoType') {
        				docPoTypeData.push(item);
        			}else if(item.codeType == 'DocTradeStatus') {
        				docTradeStatusData.push(item);
        			}else if(item.codeType == 'DocTradeType') {
        				docTradeTypeData.push(item);
        			}else if(item.codeType == 'BusGoodsType'){
        				busGoodsTypeData.push(item);
        			}
        			
    	        });
        		  		
        		isEnableData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});

        		busCustomerTypeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
        		
        		vipCardTypeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
        		
        		categoryCodeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
        		
        		brandCodeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
        		
        		unitCodeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
        		
        		productTypeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
        		
        		rackNoData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
        		
        		flowStatusData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
        		
				orderStatusData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				tradeStatusData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				orderTypeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				payModeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				tradeFromData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				
				tradeTypeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				docAsnStatusData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				docAsnTypeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				docOrderModeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				docOrderStatusData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				docOrderTypeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				docPoStatusData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				docPoTypeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				docTradeStatusData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				docTradeTypeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
				busGoodsTypeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
				
        	}
       	}
	});
}

/**
 * 从bascodes中转换的值
 * @param data
 * @returns
 */
function postDate(codeType) {
	var data;
	$.ajax({
       	url:API_PATH + "/sys/codes/list",	
       	dataType: "json",
        async:false,
        data:{"codeType":codeType},
       	success:function(result){
        	if(result && result.entry){
        		data = result.entry;
        		
        		data.unshift({
					codeCode:"",
					codeName:"请选择..."
				});
        	}
       	}
	});
	return data;
}

function formatIsTrue(val, row) { 
	return formatter(val, isTrue); 
}

function formatIsEnable(val, row) { 
	return formatter(val, isEnable); 
}