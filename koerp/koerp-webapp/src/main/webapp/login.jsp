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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name=" viewport" content="width=device-width   initial-scale=1.0  minimum-scale=1.0  miximum=1.0  user-scalable=yes" />  
    <title>登录系统</title>
    <link href="jquery-easyui/login/static/css/login.css" rel="stylesheet">
    <link href="jquery-easyui/login/static/css/style.css" rel="stylesheet">
    <link href="jquery-easyui/login/static/css/style1536672475627.css" rel="stylesheet">
    <script type="text/javascript" src="jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" >
        $(function () {

            $(document).keydown(function (e) {
                var ev = document.all ? window.event : e;
                if (ev.keyCode == 13 || (ev.ctrlKey && ev.keyCode == 13)) {
                    $("#send-btn").click();
                    return false;
                }
            });

            $("#send-btn").click(function () {
                dologin();
                return false;
            });

            $("#message-btn").click(function () {
                $("#modal-dialog").hide();
            })

            function dologin() {
                // 1:校验
                var userid = $("#username").val();
                var pwd = $("#password").val();
                if (userid == "" || userid == "输入用户名") {
                    $("#errorMessage").html("用户名不能为空");
                    $("#modal-dialog").show();
                    $("#username").focus();
                    return false;
                }
                if (pwd == "") {
                    $("#errorMessage").html("密码不能为空");
                    $("#modal-dialog").show();
                    $("#password").focus();
                    return false;
                }
                // 2:提交登陆
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/login",
                    data: { "username": userid, "password": pwd },
                    dataType: "json",
                    cache: false,
                    success: function (data) {
                        if (data.status) {
                        	window.location.href = "<%=request.getContextPath()%>/center";
                        }
                        else {
                            $("#errorMessage").html(data.message);
                            $("#modal-dialog").show();
                        }
                    }
                });  //end if $.ajax
                return false;
            }
        });

    </script>
    
</head>
<body onselectstart="return false">
  <div class="login-content">
   <div class="header">
    <div class="evcard_logo"></div> 
    <span class="one-line"></span> 
    <span>润数新零售中台系统</span>
   </div> 
   <div class="login">
    <div class="title">
     <h1>登录</h1>
    </div> 
    <div class="form">
     <form>
      <ul>
       <li>
           <input id="username" type="text" maxlength="20" placeholder="请输入用户名" required="required" class="inputMaterial false" /> 
           <span class="highlight"></span> 
           <span class="bar"></span> 
           <label>用户名</label> 
       </li> 
       <li>
           <input id="password" type="password" placeholder="请输入密码" required="required" class="inputMaterial false" /> 
           <span class="highlight"></span> 
           <span class="bar"></span> 
           <label>密码</label>  
       </li>               
      </ul> 
      <div class="save-code short">
       <input id="send-btn" type="button" value="登录" class="btnlg grey" />
      </div>
     </form>
    </div> 
    <div>     
     <div transition="fade" class="modal-backup" style="display: none;"></div>
    </div>
   </div>
  </div>
  <div id="particles-js">
   <canvas class="particles-js-canvas-el" width="1288" height="696" style="width: 100%; height: 100%;"></canvas>
  </div>
  <script type="text/javascript" src="jquery-easyui/login/static/js/velocity.min.js"></script>
  <script type="text/javascript" src="jquery-easyui/login/static/js/particles.min.js"></script>
  <script type="text/javascript" src="jquery-easyui/login/static/js/index.js"></script>
  <script type="text/javascript" src="jquery-easyui/login/static/js/manifest.js"></script>
  <script type="text/javascript" src="jquery-easyui/login/static/js/vendor.js"></script>
  <script type="text/javascript" src="jquery-easyui/login/static/js/login.js"></script>
  <script type="text/javascript" src="jquery-easyui/login/static/js/iframe.js"></script>

  <div id="modal-dialog" class="modal fade" role="dialog" aria-labelledby="modalLabel" style="top:2px;display: none;">
      <div class="modal-dialog modal-sm">
       <div class="modal-content"> 
        <div class="modal-header">
            <i class="icon1 false"></i> 
            <b id="errorMessage">请输入帐户和密码</b>        
        </div>               
        <div class="modal-footer">         
         <div id="message-btn" class="button">
          <span>确 定</span>
         </div>
        </div>
       </div>
      </div>
     </div> 

 </body>
</html>