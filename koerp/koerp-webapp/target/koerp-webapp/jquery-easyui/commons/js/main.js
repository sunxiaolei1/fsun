//后台管理界面初始化
$(function () {
	initTopMenu();
    tabClose();
    tabCloseEven();
    openPwd();

    $('#editpass').click(function () {
        $('#w').window('open');
    });

    $('#btnEp').click(function () {
        modifyPassword();
    });

    $('#btnCancel').click(function () {
        closePwd();
    });

    $('#loginOut').click(function () {
        $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function (r) {
            if (r) {
                location.href = API_PATH + "/logout";
            }
        });
    });
});

//初始化顶部系统
function initTopMenu() {
	var menuStr = '', currentIndex = 0;
	
	$.ajax({
	    url: API_PATH + "/user/current/modules",
	    type: "GET",
	    success: function (result) {
	    	result = JSON.parse(result);
	    	_menus = result.entry;
	    	
	    	$.each(_menus, function (i, n) {//$.each 遍历_menu中的元素
	    		menuStr += '<li class="pf-nav-item project" data-sort="'+ i +'" data-menu="system_menu_"' + i + '"">'
    	        +  '<a href="#" onclick="createLeftMenu(this, \'' + n.id + '\')">'
    	        +  '<span class="iconfont">'+ n.icon +'</span>'
    	        +  '<span class="pf-nav-title">'+ n.text +'</span>'
    	        +  '</a>'
    	        +  '</li>';   	
		    	// 渲染当前
		    	if (n.isCurrent){
		    		currentIndex = i;
		    		initLeftMenu(n.id);
		    	}
	        });
	    	
	    	$('.pf-nav').html(menuStr);
	        $('.pf-nav-item').eq(currentIndex).addClass('current');
	    }
	}); 
}

function createLeftMenu(obj, appId) {
	$('.pf-nav-item').removeClass('current');
    $(obj).parent().addClass('current');
    $('#west').html('<div id="nav" class="easyui-accordion" fit="true" border="false"></div>');
	initLeftMenu(appId);
}

//初始化左侧
function initLeftMenu(appId) {
    $("#nav").accordion({animate: false});//为id为nav的div增加手风琴效果，并去除动态滑动效果
    var _menus;
    $.ajax({
	    url: API_PATH + "/user/current/menuTree",
	    type: "GET",
	    data: {"appId": appId},
	    success: function (result) {
	    	result = JSON.parse(result);
	    	_menus = result.entry;
	    	
	    	$.each(_menus, function (i, n) {//$.each 遍历_menu中的元素
	        	var menulist = '';
	            var sub_menulist = "";
	            sub_menulist += '<ul>';
	            
	            if(n.children != null) {
	            	$.each(n.children, function (j, o) {
	            		if(o.text == '订单管理') {
	            			sub_menulist += '<li><div><a href="#" id="a_'+o.id+'" onclick="clickMenu(\''+o.id+'\', \''+o.url+'\', \''+o.icon+'\', this)" ><span class="'+o.icon+'" style="padding:0px 7px;">&nbsp;</span><span class="nav">' + o.text + '</span></a></div></li> ';
	            			var obj = '<a href="#" onclick="clickMenu(\''+o.id+'\', \''+o.url+'\', \''+o.icon+'\', this)" ><span class="'+o.icon+'" style="padding: 0px 7px;">&nbsp;</span><span class="nav">' + o.text + '</span></a>';
	            			clickMenu(o.id, o.url, o.icon, obj);
	            		}else{
	            			sub_menulist += '<li><div><a href="#" id="a_'+o.id+'" onclick="clickMenu(\''+o.id+'\', \''+o.url+'\', \''+o.icon+'\', this)"><span class="'+o.icon+'" style="padding: 0px 7px;">&nbsp;</span><span class="nav">' + o.text + '</span></a></div></li> ';
	            		}
	            	});
	            }
	            sub_menulist += '</ul>';
	            
	            menulist += sub_menulist;
	            var selected = false;
	            if(n.text == "销售订单"){
	            	selected = true;
	            }
	            
	    		$('#nav').accordion('add', {
	                title: n.text,
	                content: menulist,
	                iconCls: n.icon,
	                selected: selected
	            });
	        });
	    }
	}); 

    $('.easyui-accordion li a').hover(function () {
        $(this).parent().addClass("hover");
    }, function () {
        $(this).parent().removeClass("hover");
    });
}

function clickMenu(id, url, icon, obj) {
	var tabTitle = $(obj).children('.nav').text();//获取超链里span中的内容作为新打开tab的标题
    addTab(tabTitle, url, icon);//增加tab
    $('.easyui-accordion li div').removeClass("selected");
    $(obj).parent().addClass("selected");
}

function addTab(subtitle, url, icon) {
	if(icon == 'null')
		icon = 'icon icon-log';
			
    if (!$('#tabs').tabs('exists', subtitle)) {
        $('#tabs').tabs('add', {
            title: subtitle,
            content: createFrame(url),
            closable: true,
            icon: icon
        });
    } else {
        $('#tabs').tabs('select', subtitle);
        $('#mm-tabupdate').click();
    }
    tabClose();
}

function createFrame(url) {
	var id = "frame-"+ new Date().getTime() 
    var s = '<iframe id="'+ id +'" scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    return s;
}

function tabClose() {
    /*双击关闭TAB选项卡*/
    $(".tabs-inner").dblclick(function () {
        var subtitle = $(this).children(".tabs-closable").text();
        $('#tabs').tabs('close', subtitle);
    });
    
    /*为选项卡绑定右键*/
    $(".tabs-inner").bind('contextmenu', function (e) {
        $('#mm').menu('show', {
            left: e.pageX,
            top: e.pageY
        });

        var subtitle = $(this).children(".tabs-closable").text();

        $('#mm').data("currtab", subtitle);
        $('#tabs').tabs('select', subtitle);
        return false;
    });
}

/**
 * 关闭当前tab
 */
function closeCurrTab(callback){
	
	//关闭当前tab
	var currTab = $('#tabs').tabs('getSelected');
	var currtab_title = currTab.panel('options').title;
	$('#tabs').tabs('close', currtab_title);
	
	currTab = $('#tabs').tabs('getSelected');
	currtab_title = currTab.panel('options').title;	
	var id = $(currTab.panel('options').content).attr('id');
	var funcName = "document.getElementById('"+ id +"').contentWindow."+ callback;	
	clickFunName(funcName);	
}

//刷新当前标签Tabs
function refreshCurrTab() {
	var currTab = $('#tabs').tabs('getSelected');
    $('#tabs').tabs('update', {
         tab: currTab,
         options: {
        	 
         }
    });
    //currTab.panel('refresh');
}

/**
 * 重新渲染当前tab
 */
function updateCurrTab(url, title, icon){
	
	//关闭当前tab
	var currTab = $('#tabs').tabs('getSelected');
	
	var oldtitle = currTab.panel('options').title;
	if(oldtitle != title){
		$('#tabs').tabs('close', title);
	}	
	$('#tabs').tabs('update', {
		tab: currTab,
		options: {
			title: title,
            content: createFrame(url),
            closable: true,
            icon: icon          
		}
	});
	//currTab.panel('refresh');
}

/**
 * 通过方法明细执行方法
 * @param fn
 * @param args
 */
function clickFunName(fn,args){ 
    try {
        fn = eval(fn);
    } catch(e) {
        console.log(e);
        console.log(fn + '方法不存在！');
    }
    if (typeof fn === 'function'){
        fn.call(this); 
    }    
}

//绑定右键菜单事件
function tabCloseEven() {
    //刷新
    $('#mm-tabupdate').click(function () {
        var currTab = $('#tabs').tabs('getSelected');
        var url = $(currTab.panel('options').content).attr('src');
        $('#tabs').tabs('update', {
            tab: currTab,
            options: {
                content: createFrame(url)
            }
        });
    });
    //关闭当前
    $('#mm-tabclose').click(function () {
        var currtab_title = $('#mm').data("currtab");
        $('#tabs').tabs('close', currtab_title);
    });
    //全部关闭
    $('#mm-tabcloseall').click(function () {
        $('.tabs-inner span').each(function (i, n) {
            var t = $(n).text();
            $('#tabs').tabs('close', t);
        });
    });
    //关闭除当前之外的TAB
    $('#mm-tabcloseother').click(function () {
        $('#mm-tabcloseright').click();
        $('#mm-tabcloseleft').click();
    });
    //关闭当前右侧的TAB
    $('#mm-tabcloseright').click(function () {
        var nextall = $('.tabs-selected').nextAll();
        if (nextall.length == 0) {
            //msgShow('系统提示','后边没有啦~~','error');
            alert('后边没有啦~~');
            return false;
        }
        nextall.each(function (i, n) {
            var t = $('a:eq(0) span', $(n)).text();
            $('#tabs').tabs('close', t);
        });
        return false;
    });
    //关闭当前左侧的TAB
    $('#mm-tabcloseleft').click(function () {
        var prevall = $('.tabs-selected').prevAll();
        if (prevall.length == 0) {
            alert('到头了，前边没有啦~~');
            return false;
        }
        prevall.each(function (i, n) {
            var t = $('a:eq(0) span', $(n)).text();
            $('#tabs').tabs('close', t);
        });
        return false;
    });

    //退出
    $("#mm-exit").click(function () {
        $('#mm').menu('hide');
    });
}

//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
    $.messager.alert(title, msgString, msgType);
}

//设置修改密码窗口
function openPwd() {
    $('#w').window({
        title: '修改密码',
        width: 300,
        modal: true,
        shadow: true,
        closed: true,
        height: 200,
        resizable: false
    });
}

//关闭修改密码窗口
function closePwd() {
    $('#w').window('close');
}

/**
 * 去字符串空格
 * @param str
 * @returns
 */
function trim(str) {
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

//修改密码
function modifyPassword() {
	var userId = trim($('#userId').val());
    var oldPassword = trim($('#txtOldPass').val());
    var newPassword = trim($('#txtNewPass').val());
    var repeatPassword = trim($('#txtRePass').val());
    if (oldPassword == '') {
        msgShow('系统提示', '请输入原密码！', 'warning');
        return false;
    }
    if (newPassword == '') {
        msgShow('系统提示', '请输入密码！', 'warning');
        return false;
    }
    if (repeatPassword == '') {
        msgShow('系统提示', '请再一次输入密码！', 'warning');
        return false;
    }
    if (newPassword != repeatPassword) {
        msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
		$('#txtNewPass').val("");
		$('#txtRePass').val("");
        return false;
    }
    var param = {"userId": userId, "password": oldPassword, "newPassword": newPassword};
    $.ajax({
        type: "post",
        url: API_PATH + "/user/editPassword",
        dataType: "json",
        data: param,
        success: function (res) {
        	console.log(res);
            if (res.status) {
            	$.messager.alert("系统提示",'恭喜，密码修改成功！',"info", function(){
            		location.href = 'login.jsp';
            		$('#txtOldPass').val("");
            		$('#txtNewPass').val("");
            		$('#txtRePass').val("");
                    close();
		    	});
            } else {
            	$.messager.alert("系统提示", res.msg, "error", function(){
            		$('#txtOldPass').val("");
            		$('#txtNewPass').val("");
            		$('#txtRePass').val("");
                    close();
		    	});
            }
        }
    })
}
