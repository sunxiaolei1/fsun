var isTrueData = [{"id":"", "text": "请选择..."},{"id":"true", "text": "是"},{"id": "false", "text": "否"}];
var isEnableData = new Array();
var busCustomerTypeData = new Array();

/**************************   ecorder    *********************************/

var isTrue = {'false': '否', 'true': '是'};
var isEnable = {};
var busCustomerType = {};

$(function () {
	synchronizeData();	
	isEnable = formatterCodeType(isEnableData);
	busCustomerType = formatterCodeType(busCustomerTypeData);

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