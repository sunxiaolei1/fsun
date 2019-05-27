<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	
	//去除页面缓存
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", -10);
%>
 
<!DOCTYPE HTML>
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
		<link href="css/login2.css" rel="stylesheet">
		<script type="text/javascript" src="js/jquery.min.js"></script>
	</head>
 

	<style>
		body {background-color: #CBE0C9;}
		#msg {padding:20px; margin-bottom:10px;}
		#msg.errors {border:1px dotted #BB0000; color:#BB0000; padding-left:100px; background:url(${ctx}/images/error.gif) no-repeat 20px center;}
	</style>

	
	<body>
		<div class="wrap">
			<div class="head-wrap">
				<div class="head-icon">
					<img src="images/login/logo2.png"/>					
				</div>
				<!-- <span class="head-txt">订单管理系统</span> -->
			</div>
			
			<form:form method="post" commandName="${commandName}" htmlEscape="true">
				<input type="hidden" name="lt" value="${loginTicket}"/>
    			<input type="hidden" name="execution" value="${flowExecutionKey}"/>
    			<input type="hidden" name="_eventId" value="submit"/>
				<div class="login-wrap">
					<p class="login-title">用户登录</p>
					<div class="login-div">
						<input type="text" name="username" id="username" placeholder="请输入用户名"/>
					</div>
					<div class="login-div">
						<input type="password" name="password" id="password" placeholder="密码"/>
					</div>
					<div class="user-div">
						<label><input type="checkbox" name="rememberMe" value="true"/>记住用户名</label>
					</div>
					<div class="login-div">
						<input type="submit" id="loginButton" class="btn-sub" value="登 录" style="cursor: pointer;"/>
					</div>
				</div>
			</form:form>
		</div>
	</body>
</html>