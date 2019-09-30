<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<%
	request.setAttribute("api", request.getContextPath());
%>

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache"> 
	<meta http-equiv="Cache-Control" content="no-cache"> 
	<meta http-equiv="Expires" content="0">
    <title>订单管理平台</title>
	<%@include file="headerJS.jsp" %>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/commons/js/codeFormatter.js"></script>
	
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/commons/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/commons/js/md5.js"></script>

<body class="easyui-layout" style="overflow-y: hidden" scroll="no">

<!--头部--> 
<div id="pf-hd" region="north" split="true" border="false" style="overflow: hidden; background-color: rgb(65, 105, 225); width: 1366px; height: 65px;"> 
	<div class="pf-logo" style="border-right: 0px solid;">
        <img src="<%=request.getContextPath()%>/jquery-easyui/images/main/logo2.png" style="height:70%;" alt="logo">
    </div>
    
    <div class="pf-nav-wrap" style="display:none;">
    	<div class="pf-nav-ww">
        	<ul class="pf-nav">	
         	</ul>
       	</div>
    </div>
    
    <div class="pf-user" style="font-size:125%;width:auto;">	
	    	<span style="color:#FFF;" >欢迎 [${user.shopName} - ${user.realname}]</span>
			&nbsp;&nbsp; <span id="editpass" style="cursor:pointer;color:#FFF;" >修改密码&nbsp;&nbsp;|</span>
			 <span id="loginOut" style="cursor:pointer;color:#FFF;" >退出</span> 
		  
	</div>
</div>

<!--修改密码窗口-->
<div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
     maximizable="false" icon="icon-save" style="display: none;width: 300px; height: 150px; background: #fafafa;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
            <table cellpadding=3>
                <tr>
                    <td>原密码：</td>
                    <td>
		            	<input type="hidden" id="userId" value="${user.id}" />
                    	<input id="txtOldPass" type="Password" class="txt01"/>
                    </td>
                </tr>
                <tr>
                    <td>新密码：</td>
                    <td><input id="txtNewPass" type="Password" class="txt01"/></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td><input id="txtRePass" type="Password" class="txt01"/></td>
                </tr>
            </table>
        </div>
        <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
        	<a id="btnEp" class="easyui-linkbutton" icon="icon-disk" href="javascript:void(0)">确定</a> 
            <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
        </div>
    </div>
</div>

<script type="text/javascript">



</script>
