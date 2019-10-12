<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/highcharts/highcharts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/highcharts/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/highcharts/exporting.js"></script>

<style type="text/css">

.overview{
	text-align:center; 
	line-height:19px;
	height:45px;
	padding:2px 2px;
	background: url('./images/overview.png') repeat-x scroll center center rgba(0, 0, 0, 0);
}

.overview p {
    top:20px;
	font-family:serif;
	font-style:italic ;
	width:80%;
	text-align:right;
	margin-bottom:2px; 
	font-size:15px;
	background-color:transparent;
}

.tablebox {
    height: 100%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin: 0px auto;
    background-color: #FFFFFF;
}

.tbl-header {
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 999;
}

.tbl-body {
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
}
.tablebox table {
    width: 100%;
}

.tablebox table tr th {
    font-size: 14px;
    line-height: 30px;
    text-align: center;
    background-color: rgba(135, 206, 235, 1.0);
}
.tablebox table tr td {
	font-size: 13px;
    line-height: 28px;
    text-align: center;
    background-color: #FFFFFF transparent;
    cursor: pointer;
    font-weight: bold;
    
}

.tbl-body tr:nth-child(even) td,.tbl-body1 tr:nth-child(even) td {
    background-color: rgba(68, 170, 213, 0.1);
}

</style>

<!--  导航 -->
<div id="west" region="west" hide="true" split="true" title="导航菜单" style="width:180px;font-size:15px;">
    <div id="nav" class="easyui-accordion" fit="true" border="false">
    </div>
</div>

<!-- 内容 -->
<div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden;">
    <div id="tabs" class="easyui-tabs" data-options="fit:true,border:false">
    	<div class="easyui-layout" title="首页" data-options="fit:true">
    		<!-- <div region="north" class="overview" data-options="striped: true,collapsible:false,border:true">
				<div style="margin-top:10px;text-align:center;">
					<b style="display:inline;font-size:22px;font-family:serif;margin:10px 60px;">金瓯酒业销售业绩及库存预警总览</b>
					<p style="display:inline;">态度决定一切   细节决定成败</p>
				</div>				
			</div> -->
			<div region="center" data-options="striped: true,collapsible:false,border:false,fit:true">
				<div class="easyui-layout" fit="true">			
					<div region="west" data-options="striped: true,collapsible:false" 
							style="width:36%;height:100%;overflow-y:hidden;">
						<div class="tablebox">      
					        <div class="tbl-header">
					            <table border="0" cellspacing="0" cellpadding="0">
					                <thead>
					                    <tr>
					                        <th>SKU</th>
					                        <th>商品名称</th>
					                        <th>所属店仓</th>
					                        <th>库存不足</th>
					                    </tr>
					                </thead>
					                <tbody style="opacity:0;"></tbody>
					            </table>
					        </div>					        
					        <div class="tbl-body">
					            <table border="0" cellspacing="0" cellpadding="0">
					                <thead>
					                    <tr>
					                        <th>SKU</th>
					                        <th>商品名称</th>
					                        <th>所属店仓</th>
					                        <th>库存不足</th>
					                    </tr>
					                </thead>
					                <tbody></tbody>
					            </table>
					        </div>
					    </div>						
					</div>	
					
					<div region="center" data-options="striped: true,collapsible:false,border:false" 
						style="width:64%;height:100%;overflow-y:hidden;">
						<iframe id="invSkuDetails" frameBorder="0" width="100%" scrolling="yes" height="100%"></iframe>
					</div>				
				</div>	
			</div>
        </div>
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
	
	reflushData();
});

var currFirstReflush = true;

/**
 * 刷新数据
 */
function reflushData(){		
	$.ajax({
        type: "GET",
        dataType: "JSON",
        async:false,
        url: "${api}/overview/getInitData",
        data: {},
        success: function(result) {   
        	if(result.status){
        		var initData = result.entry;
        		var invSkus = initData.invSkus;
            	if(invSkus!=null && invSkus.length>0){ 
            		initInvSku(invSkus);
            		if(currFirstReflush){
            			var sku = invSkus[0].sku;
                		var shopId = invSkus[0].shop_id;
                		var shopName = invSkus[0].shop_name;
                	    var goodsName = invSkus[0].goods_name;
                		toInvSkuDetailsView(sku, shopId, shopName, goodsName);
                		currFirstReflush = false;
            		}
            		
            	}else{
            		$('.tbl-body tbody').empty();
            		$('.tbl-header tbody').empty();
            	} 
            	
        	}      	
        }
    });
	//window.setTimeout(reflushData, 15000);   //表示延时5秒执行page_list()函数
}

var MyMarhq = '';

function initInvSku(Items){
	clearInterval(MyMarhq);
	$('.tbl-body tbody').empty();
	$('.tbl-header tbody').empty();
	var str = '';
	$.each(Items, function (i, item) {
	    str = '<tr onclick="toInvSkuDetailsView(\''+ item.sku +'\',\''+ item.shop_id +'\',\''+ item.shop_name +'\',\''+ item.goods_name +'\')">'+
	        '<td>'+ item.sku +'</td>'+
	        '<td>'+ item.goods_name +'</td>'+
	        '<td>'+ item.shop_name +'</td>'+
	        '<td><span style="color:red;">'+ item.qty +'</span></td>'+
	        '</tr>';
	    $('.tbl-body tbody').append(str);
	    $('.tbl-header tbody').append(str);
	});

	if(Items.length > 10){
	    $('.tbl-body tbody').html($('.tbl-body tbody').html()+$('.tbl-body tbody').html());
	    $('.tbl-body').css('top', '0');
	    var tblTop = 0;
	    var speedhq = 50; // 数值越大越慢
	    var outerHeight = $('.tbl-body tbody').find("tr").outerHeight();
	    function Marqueehq(){
	        if(tblTop <= -outerHeight*Items.length){
	            tblTop = 0;
	        } else {
	            tblTop -= 1;
	        }
	        $('.tbl-body').css('top', tblTop +'px');
	    }
	    MyMarhq = setInterval(Marqueehq,speedhq);
	    //鼠标移上去取消事件
	    $(".tbl-header tbody").hover(
	    	function (){
	        	clearInterval(MyMarhq);
	    	},function (){
	        	clearInterval(MyMarhq);
	        	MyMarhq = setInterval(Marqueehq, speedhq);
	    	}
	    );
	}	
}

function toInvSkuDetails(obj){
	debugger
	toInvSkuDetailsView(obj.sku, obj.shop_id, obj.shop_name, obj.goods_name);
}

//查看明细
function toInvSkuDetailsView(sku, shopId, shopName, goodsName){
	var title = "店仓[<b style='color:red;'>"+ shopName +"</b>]下的商品[<b style='color:red;'>"+ 
		goodsName +"("+ sku +")</b>]出入库交易明细";
	var url = "${api}/bus/invSku/toDetailOverView?sku="+ sku +"&shopId="+ shopId +"&title="+ title;
	$("#invSkuDetails").attr("src", url); 
}

</script>

<%@include file="footer.jsp" %>