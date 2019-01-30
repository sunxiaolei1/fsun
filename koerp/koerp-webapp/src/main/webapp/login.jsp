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
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>五芳斋后台信息管理系统</title> 
    <link href="jquery-easyui/commons/css/login2.css" rel="stylesheet">
    <script type="text/javascript" src="jquery-easyui/jquery.min.js"></script>
    
    <script>
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
		
		//改变登录按钮信息
		function changeLoginButtonProperties(properties){
			//获取登录按钮
	        var loginButton = $("#loginButton")[0];
	        //设置登录提示信息
	        loginButton.innerText = properties[0];
	        loginButton.disabled = properties[1];
		}

	    $(function () {
	    	//登录页面输入框数组
	    	var inputArray = ["username", "password"];
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
					    	if($('#rememberUser').is(":checked")){
					    		localStorage.username=username;
				    		    localStorage.password=password;
					    	}
					    	
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
	        
	        if(localStorage.username) {
		        $("#username").val(localStorage.username);
		    	$("#password").val(localStorage.password);
	        }
	    });
	</script>

</head> 
<body>
	<div class="wrap">
		<div class="head-wrap">
			<div class="head-icon">
				<img src="jquery-easyui/images/img/icon.png"/>					
			</div>
			<span class="head-txt">五芳斋后台管理系统</span>
		</div>
		
		<div class="login-wrap">
			<p class="login-title">用户登录</p>
			<div class="login-div">
				<input type="text" name="username" id="username" value="" placeholder="请输入用户名"/>
			</div>
			<div class="login-div">
				<input type="password" name="password" id="password" value="" placeholder="密码"/>
			</div>
			<div class="user-div">
				<label for="isRemember" >		   
					<input id="isRemember" type="checkbox" id="rememberUser"style="zoom:130%;vertical-align:middle;" />
					<span style="font-size:13px;">记住用户名</span>
				</label>	
			</div>
			<div class="login-div">
				<input type="button" id="loginButton" class="btn-sub" value="登 录"/>
			</div>
		</div>
	</div>
</body>
</html>