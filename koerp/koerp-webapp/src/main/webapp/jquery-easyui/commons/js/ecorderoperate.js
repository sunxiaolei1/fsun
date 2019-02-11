

/*******************************    EC订单操作实现        **********************************/

$.extend($.fn.validatebox.defaults.rules, {
 	startDate: {// 验证
    	validator: function (value) {
 			var endDate =  $('#endDate').datebox('getValue');
 			if(endDate!=null && endDate!=''){
				if(value > endDate){
					return false;
				}
     		}
     		return true;
     	},
     	message: '开始日期不能晚于结束日期'
 	},
 	endDate: {// 验证
    	validator: function (value) {
     		var startDate =  $('#startDate').datebox('getValue');
 			if(startDate!=null && startDate!=''){
				if(value < startDate){
					return false;
				}
     		}
     		return true;
     	},
     	message: '结束日期不能早于开始日期'
		}
});


/**
 * 隐藏查询条件
 * queryDiv 查询条件DIV对象ID
 * gridDiv 列表DIV对象ID
 * percent 列表的百分比
 * dataGrid 列表对象ID
 */
function commonHide(queryDiv, gridDiv, percent, dataGrid){
	$("#"+ queryDiv).slideUp();
	$('#'+ gridDiv).height(percent);	
	dataGrid.datagrid('resize',{   
        height:($(window).height())   
    });
}

/**
 * 展开查询条件
 * queryDiv 查询条件DIV对象ID
 * gridDiv 列表DIV对象ID
 * percent 列表的百分比
 * dataGrid 列表对象ID
 */
function commonShow(querydiv, griddiv, percent, datagrid){
	$("#"+ querydiv).slideDown();
	$('#'+ griddiv).height(percent);	
	datagrid.datagrid('resize',{   
		height:($(window).height())   
    });
}


/**
 * 查询明细
 * row 数据对象
 * url 请求地址
 * urlparams 跟在路径后面的变量
 * typename 类型名称
 */
function commonDetailView(row, url, urlparams, typename, callback){
	if (row) {
		var realurl = url + row.sysorderid + "?" + urlparams;
		var subtitle = typename +"("+ row.sysorderid +")明细";
		if(typeof callback === "function"){
			callback(subtitle, realurl, "icon-table");
		}		
	}else{
		$.messager.alert("提示","请选择一行要编辑的"+ typename +"!");
	}
}

/**
 * 公共对话框
 * @param dialogid id-ordersDialog
 * @param title 标题-一键退货
 * @param width 宽度-70%
 * @param height 高度-70%
 * @param url 页面地址-${api}/ecorder/toOneKeyRefundView/sysorderid
 */
function commonDialog(dialogid, title, width, height, url, iconcls){
	$("<div></div>").dialog({
		id: dialogid,
	    title: "&nbsp;"+title,
	    width: width,
	    height: height,
	    iconCls: typeof(iconcls)!='undefined'? iconcls :"icon-add",
	    closed:false,
	    cache:false,
	    href: url,
	    modal:true,
	    minimizable:false,//定义是否显示最小化按钮。
	    maximizable:false,//定义是否显示最大化按钮
	    closable:true,
	    resizable:true,//定义对话框是否可调整尺寸
	    collapsible: true,//是否可折叠的	        
	    onLoad:function(){
	    	$('#'+dialogid).window('center');		        	
		},
	    onClose:function(){
	    	$(this).dialog("destroy");
	    }
	});	
}

/**
 * 按钮是否可用验证
 * @param $datagrid 表格对象
 * @param buttonids 按钮ID集合
 * @param ordertype 单据类型(ecorder, ecrefund)
 */
function buttonsEnabledValidator($datagrid, buttonids, moduletype){
	if(buttonids.length>0){
		for(i=0; i<buttonids.length; i++){
			var buttonid = buttonids[i];
			var toEnable = "enable";
			var rows = $datagrid.datagrid('getSelections');	
			switch (moduletype) {
				case ListModuleType.ORDER_BASE:	
					toEnable = switchButton(rows, buttonid);
					break;
				case ListModuleType.AFTERSALE_REFUND:
					toEnable = switchButton(rows, buttonid);		
					break;
				case ListModuleType.AFTERSALE_BARTER:				
					toEnable = switchButton(rows, buttonid);				
					break;
				default:
					  break;
			}					
			$("#" + buttonid).linkbutton(toEnable);
		}
	}		
}
	
/**
 * 选择按钮对应的操作
 * @returns {String}
 */
function switchButton(rows, buttonid){
	var toEnable = "enable";	
	switch (buttonid) {
		case "order_handle_sign":
			if(rows.length==0){
				toEnable = "disable";
			}else{
				$.each(rows, function(){
					if (this.refundorderstatus == 2) {
						toEnable = "disable";
						return;							
					}							
				});	
			}						
			break;	
		case "order_detail_view":
			if(rows.length==0 || rows.length>1){
				toEnable = "disable";
			}
			break;
		case "order_reaudit":
			if(rows.length==0 || rows.length>1){
				toEnable = "disable";
				break;
			}
			$.each(rows, function(){
				if(55==this.flowstatus || 75==this.flowstatus){
					toEnable = "disable"; return;
				}else{
		        	if(30>this.tradestatus && 90>this.flowstatus && (30==this.auditstatus||0==this.auditstatus)
		        		&& (90>this.systemstatus && 24<this.systemstatus && 40!=this.systemstatus)){	        		      		
		        	}else{
		        		toEnable = "disable"; return;
		        	}					
				}
			});			
			break;
		default:
			  break;
	}	
	return toEnable;
}

/**
 * 关闭对话框
 * @param dialogid
 */
function closeDialog(dialogid){	
	 $("#"+dialogid).dialog("destroy");	    
}

/**
 * 深拷贝 对象和数组
 */
var cloneObj = function(obj){
    var str, newobj = obj.constructor === Array ? [] : {};
    if(typeof obj !== 'object'){
        return;
    } else if(window.JSON){
        str = JSON.stringify(obj), //系列化对象
        newobj = JSON.parse(str); //还原
    } else {
        for(var i in obj){
            newobj[i] = typeof obj[i] === 'object' ?
            cloneObj(obj[i]) : obj[i];
        }
    }
    return newobj;
};


/**
 * js数组排序规则(按对象属性、顺序进行排序)
 */
function arrayCompare(sortColumn, orderby){
    return function(a,b){
        var value1 = a[sortColumn];
        var value2 = b[sortColumn];
        if(regExp.test(value1) && regExp.test(value2)){
        	if(orderby=='asc'){
            	return compareCalendar(value1, value2);        	
            }else{
            	return compareCalendar(value2, value1);
            } 
        }else{
        	if(orderby=='asc'){
            	return value1 - value2;        	
            }else{
            	return value2 - value1;
            } 
        }        
    }
}


/********************************       编辑单据数据时使用的公共方法        *********************************/

var reg = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/;
var regExp = new RegExp(reg);


//比较日期，时间大小
function compareCalendar(logintime, logouttime) {
	if (logintime.indexOf(" ") != -1 && logouttime.indexOf(" ") != -1) {
		//包含时间，日期
		return compareTime(logintime, logouttime);
	}else {
		//不包含时间，只包含日期
		return compareDate(logintime, logouttime);
	}
}

//比较日期大小
function compareDate(logintime, logouttime) {
    var arys1 = new Array();
    var arys2 = new Array();
    if (logintime != null && logouttime != null) {
        arys1 = logintime.split('-');
        var logindate = new Date(arys1[0], parseInt(arys1[1] - 1), arys1[2]);
        arys2 = logouttime.split('-');
        var logoutdate = new Date(arys2[0], parseInt(arys2[1] - 1), arys2[2]);
        return logindate - logoutdate;
    } else {
        return NAN;
    }
}
 
//判断日期，时间大小
function compareTime(logintime, logouttime) {
    if (logintime.length > 0 && logouttime.length > 0) {
        var logintimeTemp = logintime.split(" ");
        var logouttimeTemp = logouttime.split(" ");
 
        var arrloginDate = logintimeTemp[0].split("-");
        var arrlogoutDate = logouttimeTemp[0].split("-");
 
        var arrloginTime = logintimeTemp[1].split(":");
        var arrlogoutTime = logouttimeTemp[1].split(":");
 
        var allLoginDate = new Date(arrloginDate[0], arrloginDate[1], arrloginDate[2], arrloginTime[0], arrloginTime[1], arrloginTime[2]);
        var allLogoutDate = new Date(arrlogoutDate[0], arrlogoutDate[1], arrlogoutDate[2], arrlogoutTime[0], arrlogoutTime[1], arrlogoutTime[2]);
 
        return allLoginDate.getTime() - allLogoutDate.getTime();
    } else {
        return NAN;
    }
}



/**
 * 格式化numberbox的默认值(空字符串和null都为0.00)
 */
var priceFormat = function(value){
	if(value==null || value ==''){
		return "0.00";
	}
	return value;
}

/**
 * 数值格式化(保留2位小数)
 */
var numBaseFormat = function(value, row){
	if(typeof value != "undefined"){
		return Number(value).toFixed(2);
	}   				
}

/**
 * 数值格式化(保留0位小数)
 */
var intNumBaseFormat = function(value, row){
	if(typeof value != "undefined"){
		return Number(value).toFixed(0);
	}   				
}


/**
 * 初始化下拉框的默认参数(用于编辑、新增)
 */
function editInitComboxParams($fm, toDelKey){
	
	$fm.find(".easyui-combobox").each(function(){				
		$(this).combobox({
			loadFilter: function(data){	
				var newData = [];
		 		$.each(data, function(){ 
		 			if(this.codeCode != toDelKey){
		 				newData.push(this);
		 			}		 												
		 		});
				return newData;
			}
		}); 
	});
}

/**
 * 初始化下拉框的默认参数(用于搜索)
 */
function initComboxParams(){
	
	$("#orderfm").find(".easyui-combobox").each(function(){				
		$(this).combobox({
			loadFilter: function(data){	
				var newData = [];
		 		$.each(data, function(){  
		 			newData.push(this.codeCode == ""?{"codeCode":"","codeName":"全部"}:this);									
		 		});
				return newData;
			}
		}); 
	});
}

/**
 * 判别可编辑的grid中的可编辑行是否通过验证
 * (注:只试用于非commonEdatagridCellediting.js的可编辑表单验证)
 */
function gridIsValidate(id){
	//获取可编辑行
	var editIndex = $('#'+id).datagrid('options').editIndex;
	//可编辑行存在
	if("undefined" != typeof editIndex){
		if ($('#'+id).datagrid('validateRow', editIndex)){  		
			$('#'+id).datagrid('acceptChanges'); 	
			return true;
        }else{       	
        	return false;
        }
	}else{
		return true;
    }
}

/**
 * 列表展示格式化(添加表格底部合计一行)
 */
function commonListFormat(data, fields, totalcolumn){
	var resultData ={
			total:data.length,
			rows:data			
		};		           
        resultData.footer = commonGetFooter(data, fields, totalcolumn);             
        return resultData;
}

/**
 * 获取合计行对象
 */
function commonGetFooter(rows, fields, totalcolumn){
	var footerData = {};
    for(var i=0; i<rows.length; i++){  
    	var row = rows[i];
    	for(var field in fields){
    		var fieldname = fields[field];
    		if(typeof(row[fieldname]) != "undefined" ){
    			if(isNaN(footerData[fieldname])){
        			footerData[fieldname] = Number(row[fieldname]);
        		}else{
        			footerData[fieldname] += Number(row[fieldname]);
        		} 
    		}           		
    	}    			          			             		            		            	  		          
    }
    footerData[totalcolumn] = "合计:"; 
    for(var field in footerData){
    	if(typeof footerData[field] === 'number'){   		
    		footerData[field] = footerData[field].toFixed(2);
		}
    }  
    return [footerData];
}

/**
 * 创建按钮并添加点击事件
 * @param func onclick方法名
 * @param funcParam 方法参数
 * @param BottonName 按钮名称
 * @param BottonIcon 按钮图标
 * @returns {String}
 */
function commonAssemBottonHtml(func, funcParam, BottonName, BottonIcon){
	var html = '<a href="#" class="l-btn l-btn-small l-btn-plain" plain="true" onclick="'+ func +'('+ funcParam +')" group="" id="">'
					+'<span class="l-btn-left l-btn-icon-left">'
						+'<span class="l-btn-text">'+ BottonName +'</span>'
						+'<span class="l-btn-icon '+ BottonIcon +'">&nbsp;</span>'
					+'</span>'
				+'</a>';
	return html;
}

/**
 * 公共post方法
 * url 请求地址
 * params 入参
 * callback 回调函数
 */
function commonPost(url, params, callback, callback2){	
	$.ajax({
        type: "POST",
        dataType: "json",
        contentType:"application/json;charset=utf-8",
        async:true,
        url: url,
        data: params,
        beforeSend: function (jqXHR) {  		        	
        	$.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700});       	
        },
        success: function(result, textStatus) {       	
        	if(result.status){
        		if(typeof callback2==="function"){
        			callback2(result.entry);
        		}else{
        			$.messager.alert("提示", "操作成功！", "info", function(){
            			if(typeof callback==="function"){
                			callback(result.entry);
                		}
            		}); 
        		}       		     			        						
        	}else{
        		$.messager.alert("错误", result.message, "error");        		          	
        	}    			                				                															                	
        },
        error: function(jqXHR, textStatus, errorThrown) {         	
        	$.messager.alert("错误", errorThrown, "error"); 
		},
		complete: function (jqXHR, textStatus) {					
			$.messager.progress('close');
	    }
    });
}
