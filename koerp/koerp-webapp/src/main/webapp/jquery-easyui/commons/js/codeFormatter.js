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