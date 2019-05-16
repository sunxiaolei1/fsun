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
    		<div region="north" class="overview" data-options="striped: true,collapsible:false,border:true">
				<div style="margin-top:10px;text-align:center;">
					<b style="display:inline;font-size:22px;font-family:serif;margin:10px 60px;">金瓯酒业销售业绩及库存预警总览</b>
					<p style="display:inline;">态度决定一切   细节决定成败</p>
				</div>				
			</div>
			<div region="center" data-options="striped: true,collapsible:false,border:false,fit:true">
				<div class="easyui-layout" fit="true">			
					<div region="east" data-options="striped: true,collapsible:false" 
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
						<div class="easyui-layout" data-options="fit: true">	
							<div region="center" data-options="striped: true,collapsible:false,border:false">
								<div id="saleContainer" style="min-width:400px;width:100%;height:45%"></div>
								<div style="width:100%;height:55%">
									<div id="skusContainer" style="height:88%" ></div>
								</div>
							</div>
														
						</div>
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
            	}else{
            		$('.tbl-body tbody').empty();
            		$('.tbl-header tbody').empty();
            	} 
            	//加载销售业绩页面图
            	var saleSeriesData = initData.saleSeriesData;
            	var seriesYear = initData.seriesYear;
            	if(maxSeries <= initData.maxSeries){
            		maxSeries = initData.maxSeries;
            	}
            	if(saleSeriesData!=null && saleSeriesData.length>0){  
            		if(firstSaleChart){
            			initSaleChart(seriesYear, saleSeriesData);
            			firstSaleChart = false;
                	}else{
                		updateSaleChart(seriesYear, saleSeriesData);
                	}
            	}
            	//加载商品销量饼图
            	var skusSeriesData = initData.skusSeriesData;
            	if(skusSeriesData!=null && skusSeriesData.length>0){  
            		if(firstSkusChart){
            			initSkusChart(seriesYear, skusSeriesData);
            			firstSkusChart = false;
                	}else{
                		updateSkusChart(seriesYear, skusSeriesData);
                	}
            	}
        	}      	
        }
    });
	window.setTimeout(reflushData, 15000);   //表示延时5秒执行page_list()函数
}

var MyMarhq = '';

function initInvSku(Items){
	clearInterval(MyMarhq);
	$('.tbl-body tbody').empty();
	$('.tbl-header tbody').empty();
	var str = '';
	$.each(Items, function (i, item) {
	    str = '<tr>'+
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

var maxSeries = 30;
var firstSaleChart = true;
var saleChart = null;

/**
 * 初始化销售业绩页面图
 */
function initSaleChart(seriesYear, seriesData){	
	saleChart = Highcharts.chart('saleContainer', {
		chart: {
			type: 'spline'
		},
		exporting:{
		    enabled:false //用来设置是否显示‘打印’,'导出'等功能按钮，不设置时默认为显示
		},
		credits: {  
            enabled: false  
        },
		title: {
			text: "<span style='color:red;font-size:12px;font-weight:bold;'>"+ seriesYear +'年各门店销售业绩走势</span>'
		},
		subtitle: {
			text: ''
		},
		xAxis: {
	        categories: ['一月', '二月', '三月', '四月', '五月', '六月',
	                     '七月', '八月', '九月', '十月', '十一月', '十二月']
	    },
		yAxis: {
			title: {
				text: '销售额(万元)'
			},
			min: 0,
			minorGridLineWidth: 0,
			gridLineWidth: 0,
			alternateGridColor: null,
			tickPositioner: function () {
				return [0,10,20, maxSeries];
			},
			plotBands: [{ 
				from: 0.0,            					
				to: 10.0,
				color: 'rgba(255, 140, 0, 0.5)',
				label: {
					text: '惨淡',
					style: {color: '#606060'}
				}
			}, { 
				from: 10.0,
				to: 20.0,
				color: 'rgba(68, 170, 213, 0.1)',
				label: {
					text: '较好',
					style: {color: '#606060'}
				}
			}, { 
				from: 20.0,
				to: 200.0,
				color: 'rgba(124, 252, 0, 0.5)',
				label: {
					text: '很火',
					style: {color: '#606060'}
				}
			}]
		},
		tooltip: {
			valueSuffix: '万元'
		},
		plotOptions: {
			spline: {
				lineWidth: 2,
				states: {
					hover: {
						lineWidth: 2
					}
				},
				marker: {
					enabled: false
				}
			}
		},
		series: seriesData,
		navigation: {
			menuItemStyle: {
				fontSize: '10px'
			}
		}
	});
}

/**
 * 更新销售业绩页面图
 */
function updateSaleChart(seriesYear, seriesData){		
	var diff = saleChart.series.length - seriesData.length;
    if(diff > 0){
    	for (var i = saleChart.series.length; i > diff; i--){
    		saleChart.series[i-1].remove(true);
      	}
    }else if (diff < 0){
    	for (var i = saleChart.series.length; i < seriesData.length; i ++){
    		saleChart.addSeries({});
      	}
    }
	saleChart.update({
    	series: seriesData,
    	tickPositioner: [0, 10, 20, maxSeries],
    	title:{
    		text: "<span style='color:red;font-size:12px;font-weight:bold;'>"+ seriesYear +'年各门店销售业绩走势</span>'
    	}
	});
}


var firstSkusChart = true;
var skusChart = null;

/**
 * 初始化商品销量饼图
 */
function initSkusChart(seriesYear, seriesData){	
	skusChart = Highcharts.chart('skusContainer', {
   		exporting:{
   		    enabled:false //用来设置是否显示‘打印’,'导出'等功能按钮，不设置时默认为显示
   		},
   		credits: {  
               enabled: false  
           },
   		chart: {
   			plotBackgroundColor: null,
   			plotBorderWidth: null,
   			plotShadow: false,
   			type: 'pie'
   		},	
   		title: {
   			text: "<span style='color:red;font-size:12px;font-weight:bold;'>"+ seriesYear +'年商品销量占比</span>'
   		},
   		tooltip: {
   			pointFormat: '销量 : <b>{point.z}(万元)</b><br/>' + '{series.name}: <b>{point.percentage:.1f}%</b>'
   		},
   		plotOptions: {
   			pie: {
   				allowPointSelect: true,
   				cursor: 'pointer',
   				dataLabels: {
   					enabled: true,
   					format: '<b>{point.name}</b>: {point.percentage:.1f} %',
   					style: {
   						color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
   					}
   				}
   			}
   		},
   		series:  [{
   			name: '占比',
   			colorByPoint: true,
   			data: seriesData
   		}]
   	});
}

/**
 * 更新商品销量饼图
 */
function updateSkusChart(seriesYear, seriesData){		
	var diff = skusChart.series.length - seriesData.length;
    if(diff > 0){
    	for (var i = skusChart.series.length; i > diff; i--){
    		skusChart.series[i-1].remove(true);
      	}
    }else if (diff < 0){
    	for (var i = skusChart.series.length; i < seriesData.length; i ++){
    		skusChart.addSeries({});
      	}
    }
    skusChart.update({
    	title:{
    		text: "<span style='color:red;font-size:12px;font-weight:bold;'>"+ seriesYear +'年商品销量占比</span>'
    	},
    	series:  [{
   			name: '占比',
   			colorByPoint: true,
   			data: seriesData
   		}]   	
	});
}


</script>

<%@include file="footer.jsp" %>