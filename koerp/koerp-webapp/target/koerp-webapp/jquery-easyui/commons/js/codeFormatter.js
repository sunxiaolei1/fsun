var expressCodeData = new Array();
var orderTypeData = new Array();
var isTrueData = [{"id":"", "text": "请选择..."},{"id":"true", "text": "是"},{"id": "false", "text": "否"}];
var isEnableData = [{"id":"", "text": "请选择..."},{"id":"1", "text": "是"},{"id": "0", "text": "否"}];
var isAllReturnData = [{"codeCode":"", "codeName": "请选择..."},
       {"codeCode":"true", "codeName": "是"},{"codeCode": "false", "codeName": "否"}];


/**************************   ecorder    *********************************/

var expressCode = {};
var orderType = {};

var isTrue = {'false': '否', 'true': '是'};
var isEnable = {'1': '是', '0': '否'};

$(function () {
	synchronizeData();	
	expressCode = formatterCodeType(expressCodeData);
	orderType = formatterCodeType(orderTypeData);

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
       	url:API_PATH + "/codes/findCodesList",	
       	dataType: "json",
        async:false,
       	success:function(result){
        	if(result && result.entry){
        		$.each(result.entry, function (i, item) {
        			if(item.codeType == 'ExpressCode') {
        				expressCodeData.push(item);
        			}else if(item.codeType == 'OrderType') {
        				orderTypeData.push(item);
        			}
        			
    	        });
        		  		
        		expressCodeData.unshift({
        			codeCode:"",
					codeName:"请选择..."
				});
        		
        		orderTypeData.unshift({
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