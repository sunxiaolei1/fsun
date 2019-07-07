<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	request.setAttribute("api", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() + request.getContextPath());
%>

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache"> 
	<meta http-equiv="Cache-Control" content="no-cache"> 
	<meta http-equiv="Expires" content="0">
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui/commons/css/base.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui/commons/css/table.css" />
  	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui/themes/gray/easyui.css" /> 
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui/commons/css/IconExtension.css" />
    <!-- 去除链接周围的虚线框 -->
   	<style type="text/css">
	    :focus { outline: 0;}
	</style>
	
    <script>var API_PATH = '${api}';</script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/plugins/datagrid-cellediting.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/commons/js/global.js"></script> 
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/commons/js/loading.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/commons/js/ecorderoperate.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/commons/js/enumtype.js"></script>
    
	<script type="text/javascript"> 
		//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外 
		function banBackSpace(e){
			//获取event对象
			var ev = e || window.event;
			//获取事件源
			var obj = ev.target || ev.srcElement;
			//获取事件源类型
			var t = obj.type || obj.getAttribute("type");
			//获取作为判断条件的事件类型 
			var vReadOnly = obj.getAttribute("readonly");
			var vEnabled = obj.getAttribute("enabled");
			//处理null值情况 
			vReadOnly = (vReadOnly == null) ? false : vReadOnly;
			vEnabled = (vEnabled == null) ? true : vEnabled;
			//当敲Backspace键时，事件源类型为密码或单行、多行文本的， 
			//并且readonly属性为true或enabled属性为false的，则退格键失效 
			var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea") && 
				(vReadOnly==true || vEnabled!=true))?true:false;
			
			//当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效 
			var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea") ? true:false;
			
			//判断 
			if(flag2){ 
				return false; 
			} 
			if(flag1){ 
				return false; 
			} 
		}  
	
		//禁止后退键 作用于Firefox、Opera 
		document.onkeypress=banBackSpace;
		//禁止后退键 作用于IE、Chrome 
		document.onkeydown=banBackSpace;
		
		//全局的ajax访问，处理ajax清求时sesion超时 
		$(function(){
		    $.ajaxSetup({
		    	aysnc: false,
		        contentType: "application/x-www-form-urlencoded;charset=utf-8",
		        cache: false,
		        complete: function(XHR, TS){
		            var resText = XHR.responseText;
		            var sessionstatus = XHR.getResponseHeader("sessionStatus");
		            debugger
		            if ((911 == XHR.status && "timeout" == sessionstatus)) {
		            	$.messager.alert("提示", "对不起，您的会话已经过期，请重新登录后继续操作！", "info", function(){
		            		var timestmp = (new Date()).valueOf();  
		            		var top = getTopWinow();
		                    top.location.href = API_PATH + "/logout";
						});
						$(".panel-tool-close").css("display","none");
		                return;
		            }
		        }
		    });
		});
    </script>
</head>
