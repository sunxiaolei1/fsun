//客户端类型
var clientType = 1;
var GLOBAL_PAGE_SIZE = 15;
var GLOBAL_PAGE_SIZE_LIST = [15, 30, 50, 100, 200, 500];

/**
 * 给时间框控件扩展一个清除的按钮
 */
$.fn.datebox.defaults.cleanText = '清空';
var buttons = $.extend([], $.fn.datebox.defaults.buttons);
buttons.splice(1, 0, {
    text: function (target) {
        return $(target).datebox("options").cleanText
    },
    handler: function (target) {
        $(target).datebox("setValue", "");
        $(target).datebox("hidePanel");
    }
});
$.extend($.fn.datebox.defaults, {
    buttons: buttons
});

//easyui验证的删除和恢复
$.extend($.fn.validatebox.methods, {  
    remove: function(jq, newposition){  
        return jq.each(function(){  
            $(this).removeClass("validatebox-text validatebox-invalid").unbind('focus').unbind('blur');
        });  
    },
    reduce: function(jq, newposition){
        return jq.each(function(){  
           var opt = $(this).data().validatebox.options;
           $(this).addClass("validatebox-text").validatebox(opt);
        });  
    }   
});

/**
 * 扩展数据验证
 */
$.extend($.fn.validatebox.defaults.rules, {
	mobile: { //验证手机号
		validator: function(value, param) {
			return /^1[3-8]+\d{9}$/.test(value);
		},
		message: '请输入正确的手机号码'
	},
	tel: { //既验证手机号，又验证座机号
		validator: function(value) {
			return /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\d3)|(\d{3}\-))?(1[358]\d{9})$)/.test(value);
		},
		message: '请输入正确的电话号码'
	},
	zip: { // 验证邮政编码
		validator: function(value) {
			return /^[1-9]\d{5}$/i.test(value);
		},
		message: '邮政编码格式不正确'
	},
	idcard : {// 验证身份证
		validator : function(value) {
			return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
		},
		message : '身份证号码格式不正确'
	},
	integer: {// 验证正整数 
        validator: function (value) {
    	 	var type = /^[0-9]*[1-9][0-9]*$/;
    	 	var re = new RegExp(type);
            return value.match(re) != null;
        },
        message: '请输入正整数'
    },
    email : {     
        validator: function(value){     
            return /^[a-zA-Z0-9_+.-]+\@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}$/i.test($.trim(value));     
        },     
        message: '电子邮箱格式错误'    
    }     
});

/**
 *  获取当前datagrid中在编辑状态的行编号列表
 *  $('#id').datagrid('getEditingRowIndexs');
 */
$.extend($.fn.datagrid.methods, {
    getEditingRowIndexs: function(jq) {
        var rows = $.data(jq[0], "datagrid").panel.find('.datagrid-row-editing');
        var indexs = [];
        rows.each(function(i, row) {
            var index = row.sectionRowIndex;
            if (indexs.indexOf(index) == -1) {
                indexs.push(index);
            }
        });
        return indexs;
    }
});

//自动调整行号的宽度
$.extend($.fn.datagrid.methods, { 
    fixRownumber : function (jq) { 
    	return jq.each(function () { 
    		var panel = $(this).datagrid("getPanel"); 
    		var clone = $(".datagrid-cell-rownumber", panel).last().clone();
        	clone.css({ "position" : "absolute", left : -1000 }).appendTo("body"); 
        	var width = clone.width("auto").width(); 
        	if (width > 25) { //多加5个像素,保持一点边距 
	        	$(".datagrid-header-rownumber,.datagrid-cell-rownumber", panel).width(width + 5); 
	        	$(this).datagrid("resize"); //一些清理工作 
	        	clone.remove(); 
	        	clone = null; 
	    	} else { //还原成默认状态 
		    	$(".datagrid-header-rownumber,.datagrid-cell-rownumber", panel).removeAttr("style");
	   	 	}
    	}); 
	} 
}); 

/**
 * datagrid页脚样式渲染
 */
var footerStyleView = $.extend({}, $.fn.datagrid.defaults.view, { 
    renderFooter: function(target, container, frozen){ 
        var opts = $.data(target, 'datagrid').options;
        var rows = $.data(target, 'datagrid').footer || []; 
        var fields = $(target).datagrid('getColumnFields', frozen);
        var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];
        for(var i=0; i<rows.length; i++){
            var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
            var style = styleValue ? 'style="' + styleValue + '"' : ''; 
            table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
            table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
            table.push('</tr>');
        } 
        table.push('</tbody></table>');
        $(container).html(table.join(''));
    }
});

//动态修改datagrid单元格
$.extend($.fn.datagrid.methods, {
	editCell: function(jq, param) {
		return jq.each(function() {
			var opts = $(this).datagrid("options");
			var fields = $(this).datagrid("getColumnFields", true).concat($(this).datagrid("getColumnFields"));
			for(var i = 0; i < fields.length; i++) {
				var col = $(this).datagrid("getColumnOption", fields[i]);
				col.editor1 = col.editor;
				if(fields[i] != param.field) {
					col.editor = null;
				}
			}
			$(this).datagrid("beginEdit", param.index);
			for(var i = 0; i < fields.length; i++) {
				var col = $(this).datagrid("getColumnOption", fields[i]);
				col.editor = col.editor1;
			}
		});
	}
});

var editIndex = undefined;

function endEditing(id) {
	if(editIndex == undefined) { return true; }
	if($("#" + id).datagrid("validateRow", editIndex)) {
		$("#" + id).datagrid("endEdit", editIndex);
		editIndex = undefined;
		return true;
	} else {
		return false;
	}
}


/**
 * loading层开始
 */
function ajaxLoading() {
	$("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: $(window).height() }).appendTo("body");
	$("<div class=\"datagrid-mask-msg\"></div>").html("正在处理，请稍候。。。").appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(window).height() - 45) / 2 });
}

/**
 * loading层结束
 */
function ajaxLoadEnd() {
	$(".datagrid-mask").remove();
	$(".datagrid-mask-msg").remove();
}

/** 
 * 在页面中任何嵌套层次的窗口中获取顶层窗口 
 * @return 当前页面的顶层窗口对象 
 */
function getTopWinow(){
   var p = window;
   while(p != p.parent){
       p = p.parent;
   }
   return p;
}

/**
 * 居中弹出提示信息
 * @param title
 * @param msg
 */
function showMessageCenter(title, msg, height) {
	$.messager.show({
		width: '300px',
		height: height||'auto',
		title: title,
		msg: msg,
		timeout: 2000,
		showType: 'slide',
		style: {
			right: '',
			bottom: ''
		}
	});
}


/**
 * jsom转map
 * @param json
 * @returns {Array}
 */
function mapTrans(json) {
	var o = [];
	$.each(json, function(k, v) {
		o.push({ label: k, value: v });
	})
	return o;
}

/**
 * 获取map值
 * @param val
 * @param map
 * @returns
 */
function formatter(val, map) {
	if(map[val]) {
		return map[val];
	} else {
		return val;
	}
}

/**
 * 表单数据转json
 * @param fm
 * @returns json
 */
function formJson(fm) {
	var json = {};
	var data = fm.serializeArray();
	$.each(data, function(index, m) {
		if(json[m.name]) {
			if(m.value && m.value != '') {
				json[m.name] += ',' + m.value;
			}
		} else {
			json[m.name] = m.value;
		}

	});
	return json;
}


/**
 * 日期格式化
 * @param date
 * @returns
 */
function dateFormatter(date) {
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	var h = date.getHours();
	var min = date.getMinutes();
	var sec = date.getSeconds();
	var str = y + '-' + (m < 10 ? ('0' + m) : m) + '-' +
		(d < 10 ? ('0' + d) : d) + '' + ' ' +
		(h < 10 ? ('0' + h) : h) + ':' +
		(min < 10 ? ('0' + min) : min) + ':' +
		(sec < 10 ? ('0' + sec) : sec);
	return str;
}

/**
 * 格式化时间日期（调用方法：new Date().format("yyyy-MM-dd")）
 * @param fmt
 * @returns
 */
Date.prototype.format = function(fmt) { 
    var o = { 
       "M+" : this.getMonth()+1,                 //月份 
       "d+" : this.getDate(),                    //日 
       "h+" : this.getHours(),                   //小时 
       "m+" : this.getMinutes(),                 //分 
       "s+" : this.getSeconds(),                 //秒 
       "q+" : Math.floor((this.getMonth()+3)/3), //季度 
       "S"  : this.getMilliseconds()             //毫秒 
   }; 
   if(/(y+)/.test(fmt)) {
           fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
   }
    for(var k in o) {
       if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
   return fmt; 
};

/**
 * 字符转日期
 * @param s
 * @returns
 */
function dateParser(s) {
	if(!s)
		return new Date();
	var ss = (s.split('-'));
	var y = parseInt(ss[0], 10);
	var m = parseInt(ss[1], 10);
	var d = parseInt(ss[2], 10);
	if(!isNaN(y) && !isNaN(m) && !isNaN(d)) {
		return new Date(y, m - 1, d);
	} else {
		return new Date();
	}
}

/**
 * 去字符串空格
 * @param str
 * @returns
 */
function trim(str) {
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

/**
 * 字符串替换
 * @param s1
 * @param s2
 * @returns
 */
String.prototype.replaceAll = function(s1,s2){    
    return this.replace(new RegExp(s1,"gm"),s2);    
};

String.prototype.endWith = function(s){
	if(s==null||s==""||this.length==0||s.length>this.length)
		return false;
	if(this.substring(this.length-s.length)==s)
		return true;
	else
		return false;
	return true;
};

String.prototype.startWith = function(s){
	if(s==null||s==""||this.length==0||s.length>this.length)
		return false;
	if(this.substr(0,s.length)==s)
		return true;
	else
		return false;
	return true;
};

/**
 * 获取字符串的长度(英文占1个字符，中文汉字占2个字符)
 */
String.prototype.getLength=function(){
	var len = 0;
	if(this.length!=null){
		 for (var i = 0; i < this.length; i++) {
			if (this.charCodeAt(i) > 127 || this.charCodeAt(i) == 94) {
				len += 2;
			} else {
				len++;
			}
		}  
	}
    return len;
};

/**
 * 截取字符串(支持中英文混合) 
 */
String.prototype.getSub = function(n) {
	var r = /[^\x00-\xff]/g;
	if (this.replace(r, "mm").length <= n) {
		return this;
	}
	var m = Math.floor(n / 2);
	for (var i = m; i < this.length; i++) {
		if (this.substr(0, i).replace(r, "mm").length >= n) {
			return this.substr(0, i) + "...";
		}
	}
	return this;
};


//换行
function formatStr(str){
	return str.replace(/(.{18})/g,'$1\n');
}

//换行
function formatStr30(str,number){
	return str.replace(/(.{30})/g,'$1\n');
}

//获取字节长度
function getCharacterByteLen(str){
    var char = str.match(/[^\x00-\xff]/ig);
    return str.length + (char == null ? 0 : char.length);
}

/**
 * 获取当前格式化后的日期(yyyy-MM-dd HH:MM:SS)
 */
function getCurrentFormatDate() {
	var date = new Date();
	var seperator1 = "-";
	var seperator2 = ":";
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	if(month >= 1 && month <= 9) {
		month = "0" + month;
	}
	if(strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate +
		" " + date.getHours() + seperator2 + date.getMinutes() +
		seperator2 + date.getSeconds();
	return currentdate;
}

//格式化年月日时分秒
formatterDateTime = function(date) {
	var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
	var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0" +
		(date.getMonth() + 1);
	var hor = date.getHours();
	var min = date.getMinutes();
	var sec = date.getSeconds();
	return date.getFullYear() + '-' + month + '-' + day + " " + hor + ":" + min + ":" + sec;
};

//格式化年月日
formatterDate = function(date) {
	var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
	var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0" +
		(date.getMonth() + 1);
	return date.getFullYear() + '-' + month + '-' + day;
};


Array.prototype.contains = function(needle) {
	for(i in this) {
		if(this[i] == needle) {
			return true;
		}
	}
	return false;
};

/**
 * 删除数组指定下标或指定对象
 */
Array.prototype.remove = function(obj) {
	for(var i = 0; i < this.length; i++) {
		var temp = this[i];
		if(!isNaN(obj)) {
			temp = i;
		}
		if(temp == obj) {
			for(var j = i; j < this.length; j++) {
				this[j] = this[j + 1];
			}
			this.length = this.length - 1;
		}
	}
};

/******************************  解决js金额精度误差问题   **************************************/

/*** method **
 *  add / subtract / multiply /divide
 * CalcAmount.add(0.1, 0.2) >> 0.3
 * CalcAmount.multiply(19.9, 100) >> 1990
 *
 */
var CalcAmount = function() {
	/*
	 * 数值格式化
	 */
	function formatFloat(value, digit){	 
		var m = Math.pow(10, digit);	 
		return Math.round(value*m, 10)/m;
	}
    /*
     * 判断obj是否为一个整数
     */
    function isInteger(obj) {
        return Math.floor(obj) === obj;
    }
    /*
     * 将一个浮点数转成整数，返回整数和倍数。如 3.14 >> 314，倍数是 100
     * @param floatNum {number} 小数
     * @return {object}
     *   {times:100, num: 314}
     */
    function toInteger(floatNum) {
        var ret = {times: 1, num: 0};
        if (isInteger(floatNum)) {
            ret.num = floatNum;
            return ret;
        }
        var strfi  = floatNum + '';
        var dotPos = strfi.indexOf('.');
        var len    = strfi.substr(dotPos+1).length;
        var times  = Math.pow(10, len);
        var intNum = Number(floatNum.toString().replace('.',''));
        ret.times  = times;
        ret.num    = intNum;
        return ret;
    }
    /*
     * 核心方法，实现加减乘除运算，确保不丢失精度
     * 思路：把小数放大为整数（乘），进行算术运算，再缩小为小数（除）
     *
     * @param a {number} 运算数1
     * @param b {number} 运算数2
     * @param digits {number} 精度，保留的小数点数，比如 2, 即保留为两位小数
     * @param op {string} 运算类型，有加减乘除（add/subtract/multiply/divide）
     *
     */
    function operation(a, b, digits, op) {
    	a = Number(a);
    	b = Number(b);
        var o1 = toInteger(a);
        var o2 = toInteger(b);
        var n1 = o1.num;
        var n2 = o2.num;
        var t1 = o1.times;
        var t2 = o2.times;
        var max = t1 > t2 ? t1 : t2;
        var result = null;
        switch (op) {
            case 'add':
                if (t1 === t2) { // 两个小数位数相同
                    result = n1 + n2;
                } else if (t1 > t2) { // o1 小数位 大于 o2
                    result = n1 + n2 * (t1 / t2);
                } else { // o1 小数位 小于 o2
                    result = n1 * (t2 / t1) + n2;
                }
                result = result / max;
                break;
            case 'subtract':
                if (t1 === t2) {
                    result = n1 - n2;
                } else if (t1 > t2) {
                    result = n1 - n2 * (t1 / t2);
                } else {
                    result = n1 * (t2 / t1) - n2;
                }
                result = result / max;
                break;
            case 'multiply':
                result = (n1 * n2) / (t1 * t2);
                break;
            case 'divide':
                result = (n1 / n2) * (t2 / t1); 
                break;
        }   
        if(typeof(digits) == "undefined"){
        	return result;
        }
        return formatFloat(result, digits);
    }
    // 加减乘除的四个接口
    function add(a, b, digits) {
        return operation(a, b, digits, 'add');
    }
    function subtract(a, b, digits) {
        return operation(a, b, digits, 'subtract');
    }
    function multiply(a, b, digits) {
        return operation(a, b, digits, 'multiply');
    }
    function divide(a, b, digits) {
        return operation(a, b, digits, 'divide');
    }
    // exports
    return {
        add: add,
        subtract: subtract,
        multiply: multiply,
        divide: divide
    };
}();


