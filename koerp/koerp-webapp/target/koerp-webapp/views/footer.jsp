<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--  底层 -->
<div region="south" split="true" style="height: 30px;">
    <div class="footer">
    	<span id="localTime" style="float:middle;"></span>
    </div>
</div>

<script type="text/javascript">

//显示系统时间
function showLocale(objD){
	var now = new Date();
    var year = now.getYear() + addyear();
    var month = now.getMonth();
    var date = now.getDate();
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month+1;
    if(month<10)month="0"+month;
    if(date<10)date="0"+date;
    if(hour<10)hour="0"+hour;
    if(minu<10)minu="0"+minu;
    if(sec<10)sec="0"+sec;
    var arr_week = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
    week = arr_week[day];
    var time = "";
    time = " "+year+"年"+month+"月"+date+"日  "+week+" "+hour+":"+minu+":"+sec;
  	return(time);
}

function addyear(){
	var addyear = 0;
	if(navigator.userAgent.indexOf("MSIE") != -1) {
		if(navigator.appVersion.match(/6./i)=="6."
			|| navigator.appVersion.match(/6./i)=="7."
				|| navigator.appVersion.match(/6./i)=="8."){
			addyear = 0;
		}else if(navigator.appVersion.match(/9./i)=="9."){
			addyear = 1900;
		}else{
			addyear = 1900;
		}
	}else{
		addyear = 1900;
	} 
	return addyear;
}  

  	
//设置系统时间
function tick(){
    var today = new Date();
    document.getElementById("localTime").innerHTML = showLocale(today);
    window.setTimeout("tick()", 1000);
}   

//调用显示系统时间
tick();


</script>


</body>
</html>