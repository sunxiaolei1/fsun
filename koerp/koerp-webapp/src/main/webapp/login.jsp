<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	
	//去除页面缓存
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", -10);
%>

<!DOCTYPE html>
<html>
	<head>
		<!-- 声明文档使用的字符编码-->
		<meta charset="utf-8">
		<!--360,以webkit内核进行渲染-->
		<meta name="renderer" content="webkit">
		<!--以最新内核进行渲染。-->
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<!--百度禁止转码-->
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>登录</title>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
		<link href="jquery-easyui/commons/css/login2.css" rel="stylesheet">
		<script type="text/javascript" src="jquery-easyui/jquery.min.js"></script>
		<script type="text/javascript" src="jquery-easyui/jquery.cookie.js"></script>
	</head>
	<body>
		<div class="wrap">
			<div class="head-wrap">
				<div class="head-icon">
					<img src="jquery-easyui/images/main/logo2.png"/>					
				</div>
				<!-- <span class="head-txt">订单管理系统</span> -->
			</div>
			
			
			<div class="login-wrap">
				<p class="login-title">用户登录</p>
				<div class="login-div">
					<input type="text" name="username" id="username" placeholder="请输入用户名"/>
				</div>
				<div class="login-div">
					<input type="password" name="password" id="password" placeholder="密码"/>
				</div>
				<div class="user-div">
					<label><input type="checkbox" name="checkbox" >记住用户名</label>
				</div>
				<div class="login-div">
					<input type="button" id="loginButton" class="btn-sub" value="登 录" style="cursor: pointer;"/>
				</div>
			</div>
		</div>
	</body>
	
	<script type="text/javascript">
		if (window != top)   
			top.location.href = location.href;  
		
	    /**
		 * 去字符串空格
		 * @param str
		 * @returns
		 */
	    function trim(str) {
			return str.replace(/(^\s*)|(\s*$)/g, "");
		}
	    
	    function setCookie(){ //设置cookie  
	         var loginCode = $("#username").val(); //获取用户名信息  
	         var pwd = $("#password").val(); //获取登陆密码信息  
	         var checked = $("[name='checkbox']:checked");//获取“是否记住密码”复选框  
	         if(checked && checked.length > 0){ //判断是否选中了“记住密码”复选框  
	            $.cookie("username",loginCode);//调用jquery.cookie.js中的方法设置cookie中的用户名  
	            $.cookie("password",pwd);//调用jquery.cookie.js中的方法设置cookie中的登陆密码，并使用base64（jquery.base64.js）进行加密  
	         }else{   
	            $.cookie("password", null);   
	         }    
	    }   
	    function getCookie(){ //获取cookie  
	         var loginCode = $.cookie("username"); //获取cookie中的用户名  
	         var pwd =  $.cookie("password"); //获取cookie中的登陆密码  
	         if(pwd){//密码存在的话把“记住用户名和密码”复选框勾选住  
	            $("[name='checkbox']").attr("checked","true");  
	         }  
	         if(loginCode){//用户名存在的话把用户名填充到用户名文本框  
	            $("#username").val(loginCode);  
	         }  
	         if(pwd){//密码存在的话把密码填充到密码文本框  
	            $("#password").val(pwd);  
	         }  
	    }  
		
		//改变登录按钮信息
		function changeLoginButtonProperties(properties){
			//获取登录按钮
	        var loginButton = $("#loginButton");
	        //设置登录提示信息
	        loginButton.attr("value", properties[0]);
	        loginButton.attr("disabled", properties[1]);
		}

	    $(function () {
	    	//登录页面输入框数组
	    	var inputArray = ["username", "password"];
	    	
	    	//从cookie中获取账号和密码
	    	getCookie();
	    	
	    	//加载页面时默认使用户名输入框获取焦点
	    	$("#" + inputArray[0]).focus();
	    	//点击登录事件
	        $("#loginButton").click(function () {
	            var username = trim($("#" + inputArray[0]).val());
	            if (username == null || username == "" || typeof(username) == "undefined") {
	            	alert('请输入用户名！');
	                
	                $("#" + inputArray[0]).focus();
	                return false;
	            }
	            var password = trim($("#" + inputArray[1]).val());
	            if (password == null || password == "" || typeof(password) == "undefined") {
	            	alert('请输入密码！');
	                
	                $("#" + inputArray[1]).focus();
	                return false;
	            }
	            
	            //设置用户名和密码的值
	            var param = {"username": username, "password": password};
	            //改变登录按钮信息
	            changeLoginButtonProperties(["正在登录...", true]);
	            $.ajax({
					type: "post",
			        url: "<%=request.getContextPath()%>/login",
			        dataType: "json",
			        data: param,
		    	 	success: function(data) {
					    if (data.status) {
					    	//记住密码
					    	setCookie();
					    	
	                        window.location.href = "<%=request.getContextPath()%>/center";
	                        if (parent.reloadWindow) {
	                            parent.reloadWindow();
	                        }
	                    } else {
	                    	alert(data.message);
	                    	
					    	var errorCode = data.responseCode;
					    	if(errorCode == 703){
					    		$("#" + inputArray[0]).val("");
					    		$("#" + inputArray[1]).val("");
					    		$("#" + inputArray[0]).focus();
					    	}else if(errorCode == 702){
					    		$("#" + inputArray[1]).val("");
					    		$("#" + inputArray[1]).focus();
					    	}
					    	//还原登录按钮信息
	            			changeLoginButtonProperties(["登录", false]);
					    }
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
					    $.messager.alert('错误', errorThrown);
					    $("#" + inputArray[0]).val("");
					    $("#" + inputArray[1]).val("");
					    $("#" + inputArray[0]).focus();
					    //还原登录按钮信息
	            		changeLoginButtonProperties(["登录", false]);
					}
	     		});
	        });
	        
	        //给用户名和密码输入框注册回车键登录事件
	        $.each(inputArray, function(){
	        	var inputName = this;
	        	$("#" + inputName).keyup(function(event){
		        	if(event.keyCode == 13){
		        		$("#loginButton").click();
		        	}
	        	});
			});
	    });
	</script>
</html>