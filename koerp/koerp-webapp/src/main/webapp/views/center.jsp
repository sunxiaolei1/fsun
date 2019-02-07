<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<!--  导航 -->
<div id="west" region="west" hide="true" split="true" title="导航菜单" style="width:180px;font-size:15px;">
    <div id="nav" class="easyui-accordion" fit="true" border="false">
    </div>
</div>

<!-- 内容 -->
<div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden;">
    <div id="tabs" class="easyui-tabs" fit="true" border="false">
    </div>
</div>

<div id="mm" class="easyui-menu" style="width:150px;display: none;">
    <div id="mm-tabupdate">刷新</div>
    <div class="menu-sep"></div>
    <div id="mm-tabclose">关闭</div>
    <div id="mm-tabcloseall">全部关闭</div>
    <div id="mm-tabcloseother">除此之外全部关闭</div>
    <div class="menu-sep"></div>
    <div id="mm-tabcloseright">当前页右侧全部关闭</div>
    <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
    <div class="menu-sep"></div>
    <div id="mm-exit">退出</div>
</div>

<script type="text/javascript">
$(window).resize(function(){
    $('.tabs-panels').height($("#pf-page").height()-46);
    $('.panel-body').height($("#pf-page").height()-76)
}).resize();

var page = 0,
pages = ($('.pf-nav').height() / 70) - 1;

if(pages === 0){
	$('.pf-nav-prev,.pf-nav-next').hide();
}

$(document).on('click', '.pf-nav-prev,.pf-nav-next', function(){
	if($(this).hasClass('disabled')) return;
	if($(this).hasClass('pf-nav-next')){
		page++;
	  	$('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
	  	if(page == pages){
	    	$(this).addClass('disabled');
	    	$('.pf-nav-prev').removeClass('disabled');
	  	}else{
	   	 	$('.pf-nav-prev').removeClass('disabled');
	  	}
	}else{
		page--;
	  	$('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
	  	if(page == 0){
	    	$(this).addClass('disabled');
	    	$('.pf-nav-next').removeClass('disabled');
	  	}else{
	    	$('.pf-nav-next').removeClass('disabled');
	  	}
	}
})

$(function(){
	$('.pf-user').click(function (e) {
		var topY = $(this).height() - 5;
		var leftX = e.pageX - 65;
		$('#userMenu').menu('show', {
			left: e.pageX,
	        top: topY
	    });
	});
});
</script>

<%@include file="footer.jsp" %>