<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%> 

<style type="text/css">

.easyui-textbox, .easyui-combogrid, .easyui-datebox, .easyui-combobox, .easyui-numberbox, .easyui-datetimebox {
	width: 162px;
}

.fsun-wrap {
	border: 1px solid #ccc;
	padding: 15px 0px 5px 10px;
	margin-top: 10px;
}

.fsun-wrap .title {
	position: absolute;
	color: #416AA3;
	font-weight: bold;
	left: 2%;
	line-height: 2em;
	padding: 0 1em;
	background-color: #fff;
}
</style> 

<!-- 查询条件 -->
<%@include file="./detailtoolbar.jsp"%>

<form id="fm">
	<div class="easyui-tabs" >
		<div title="基本信息" style="padding:6px;">	
			<table class="nb-formTable" style="width:100%;">
		        <tr>
		        	<th width="12%">系统单号</th>
					<td>
						<input name="sysorderid" id="sysorderid" class="easyui-textbox" editable="false"/>
					</td>
		            <th width="12%">外部单号</th>
					<td>
						<input class="easyui-textbox" name="extorderid" id="extorderid" editable="false" />
					</td>				
					<th width="12%">交易状态</th>
					<td>
						<input id="tradestatus" name="tradestatus" class="easyui-textbox" editable="false"/>
					</td>
					<th width="12%">系统状态</th>
					<td>
						<input id="systemstatus" name="systemstatus" class="easyui-textbox" editable="false"/>
					</td>
		        </tr>
		        <tr>
		        	<th width="12%">仓储状态</th>
					<td>
						<input name="stockstatus" id="stockstatus" class="easyui-textbox" editable="false"/>
					</td>
					<th width="12%">配送状态</th>
					<td>
						<input name="despatchstatus" id="despatchstatus" class="easyui-textbox" editable="false"/>
					</td>
					<th width="12%">退款状态</th>
					<td>
						<input id="refundstatus" name="refundstatus" class="easyui-textbox" editable="false"/>
					</td>
					<th width="12%">售后状态</th>
					<td>
						<input id="salestatus" name="salestatus" class="easyui-textbox" editable="false"/>
					</td>			        	
		        </tr>
		        <tr>
		        	<th width="12%">订单类型</th>
					<td>
						<input name="ordertype" id="ordertype" class="easyui-textbox" editable="false" />
					</td>
		        	<th width="12%">所属店铺</th>
		        	<td>
						<input id="shopname" name="shopname" class="easyui-textbox" editable="false"/>
					</td>
					<th width="12%">所属仓库</th>
					<td>
						<input name="stockname" id="stockname" class="easyui-textbox" editable="false"/>
					</td>		        					
					<th width="12%">订单来源</th>
					<td>
						<input id="channelcode" name="channelcode" class="easyui-textbox" editable="false"/>
					</td>
		        </tr>		        
		        <tr>	
		        	<th width="12%">待审原因</th>
					<td>
						<input name="auditflag" id="auditflag" class="easyui-textbox" editable="false"/>
					</td>            
					<th width="12%">下单时间</th>
					<td>
						<input name="orderdatetime" id="orderdatetime" class="easyui-datetimebox" readonly />
					</td>					
					<th width="12%">付款时间</th>
					<td>
						<input id="paymentdatetime" name="paymentdatetime" class="easyui-datetimebox" readonly />
					</td>	
					<th width="12%">用户名</th>
					<td>
						<input id="username" name="username" class="easyui-textbox" editable="false"/>
					</td>						
		        </tr>		        
		        <tr>
		        	<th width="12%">买家留言</th>
					<td colspan="3">
						<input name="buyerremark" id="buyerremark" data-options="multiline:true" class="easyui-textbox" style="width:400px;height:46px;" editable="false"/>
					</td>			            				       
		        	<th width="12%">客服备注</th>
					<td colspan="3">
						<input name="sellerremark" id="sellerremark" data-options="multiline:true" class="easyui-textbox" style="width:400px;height:46px;" editable="false"/>
					</td>			           	
		        </tr>
			</table>
			<div style="height: 238px;width: 100%;">
				<div id="detailskutoolbar" style="display:none;">
					<%@include file="./detailskutoolbar.jsp"%>
				</div>
				<table id="orderDetailDataGrid"></table>
			</div>
		</div>
		<div title="配送信息" closable="false" style="padding:6px;">			
		    <div class="fsun-wrap">
		        <span class="title" style="top: 68px;">收货信息</span>			   
				<table class="nb-formTable">
					<tr>
			            <th width="12%">收货人</th>
						<td>
							<input name="receivename" id="receivename" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">手机号</th>
						<td>
							<input name="mobileno" id="mobileno" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">固定电话</th>
						<td>
							<input id="tel" name="tel" class="easyui-textbox" editable="false"/>
						</td>
						<th width="12%">邮编</th>
						<td>
							<input id="zipcode" name="zipcode" class="easyui-textbox" editable="false"/>
						</td>
			        </tr>
					<tr>
			            <th width="12%">省份</th>
						<td>
							<input name="provincename" id="provincename" class="easyui-textbox"  editable="false" />
						</td>
						<th width="12%">城市</th>
						<td>
							<input name="cityname" id="cityname" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">县区</th>
						<td colspan="3">
							<input id="regionname" name="regionname" class="easyui-textbox" editable="false"/>
						</td>						
			        </tr>
			        <tr>
			        	<th width="12%">详细地址</th>
						<td colspan="7">
							<input id="address" name="address" class="easyui-textbox" editable="false" style="width:800px;height:50px;"/>
						</td>
			        </tr>
			  	</table>
		  	</div>
		  	<div class="fsun-wrap">
		       	<span class="title" style="top: 240px;">配送信息</span>		
			   	<table class="nb-formTable">			   		
			        <tr>			          
						<th width="12%">配送类型</th>
						<td>
							<input name="shippingtype" id="shippingtype" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">发货仓库</th>
						<td>
							<input id="stockcode" name="stockcode" hidden="true" />
							<input id="deliverstockname" name="deliverstockname" class="easyui-textbox" editable="false"/>
						</td>					
						<th width="12%">指定快递</th>
						<td>
							<input name="pointexpresscode" id="pointexpresscode" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">配送快递</th>
						<td>
							<input id="expresscode" name="expresscode" class="easyui-textbox" editable="false"/>								
						</td>
			        </tr>
			        <tr>
			        	<th width="12%">发货时间</th>
			        	<td>
							<input id="deliverydatetime" name="deliverydatetime" class="easyui-datetimebox" readonly />
						</td>
						<th width="12%">配送时间</th>
						<td>
							<input name="assigntime" id="assigntime" class="easyui-textbox" editable="false" />
						</td>			            						
						<th width="12%">快递单号</th>
						<td colspan="3">
							<input id="expressno" name="expressno" class="easyui-textbox" editable="false" style="width:440px;"/>
						</td>						
			        </tr>
				</table>
			</div>
		</div>
		<div title="支付信息" closable="false" style="padding:6px;">
			<div class="fsun-wrap">
		        <span class="title" style="top: 68px;">支付信息</span>			   
				<table class="nb-formTable">
					<tr>
			            <th width="12%">订单金额</th>
						<td>
							<input name="orderprice" id="orderprice" class="easyui-numberbox" data-options="min:0,precision:2" editable="false" />
						</td>
						<th width="12%">实付金额</th>
						<td>
							<input name="payprice" id="payprice" class="easyui-numberbox" data-options="min:0,precision:2" editable="false" />
						</td>
						<th width="12%">积分数</th>
						<td>
							<input id="integralamount" name="integralamount" class="easyui-numberbox" data-options="min:0,precision:0" editable="false"/>
						</td>
						<th width="12%">红包金额</th>
						<td>
							<input id="bonusamount" name="bonusamount" class="easyui-numberbox" data-options="min:0,precision:2" editable="false"/>
						</td>						
			        </tr>
					<tr>			            
						<th width="12%">已付金额</th>
						<td>
							<input name="alreadyprice" id="alreadyprice" class="easyui-numberbox" data-options="min:0,precision:2" editable="false" />
						</td>
						<th width="12%">未付金额</th>
						<td>
							<input id="unpayprice" name="unpayprice" class="easyui-numberbox" data-options="min:0,precision:2" editable="false"/>
						</td>
						<th width="12%">商家优惠</th>
						<td>
							<input id="sellercouponprice" name="sellercouponprice" class="easyui-numberbox" data-options="min:0,precision:2" editable="false"/>
						</td>	
						<th width="12%">商品优惠</th>
						<td>
							<input id="discountprice" name="discountprice" class="easyui-numberbox" data-options="min:0,precision:2" editable="false"/>
						</td>											
			        </tr>
			        <tr>	
			        	<th width="12%">配送费用</th>
						<td>
							<input name="shippingprice" id="shippingprice" class="easyui-numberbox" data-options="min:0,precision:2"  editable="false" />
						</td>
			        	<th width="12%">发票抬头</th>
						<td>
							<input name="invoicestop" id="invoicestop" class="easyui-textbox" editable="false" />
						</td>						
						<th width="12%">是否开票</th>
						<td>
							<input id="isbilling" name="isbilling" class="easyui-textbox" editable="false"/>
						</td>
			            <th width="12%">货票同行</th>
						<td>
							<input name="istrave" id="istrave" class="easyui-textbox"  editable="false" />
						</td>												
			        </tr>
			        <tr>
			        	<th width="12%">支付方式</th>
						<td>
							<input id="paymode" name="paymode" class="easyui-textbox" editable="false"/>
						</td>			            
						<th width="12%">支付账号</th>
						<td>
							<input name="bankaccount" id="bankaccount" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">流水号</th>
						<td>
							<input name="serialnum" id="serialnum" class="easyui-textbox"  editable="false" />
						</td>
						<th width="12%">财务状态</th>
						<td>
							<input id="financialstatus" name="financialstatus" class="easyui-textbox" editable="false"/>
						</td>					
			        </tr>
			  	</table>
		  	</div>
		  	<div class="fsun-wrap">
		        <span class="title" style="top: 248px;">补退款信息</span>	
				  	<div style="height: 230px;">
						<table id="cashordersDataGrid"></table>
					</div>
		    </div>
		</div>
		<div title="操作日志" closable="false" style="padding:6px;">
		    <div style="width:100%;height:440px;">
		    	<table id="orderLogDataGrid"></table>
		    </div>				
		</div>
		<div title="关联单据" closable="false" style="padding:6px;">
		    <div style="width:100%;height:440px;">
		    	<table id="refundordersDataGrid"></table>
		    </div>				
		</div>
	</div>		
</form>

<!-- datagrid可编辑单元格 -->
<%@include file="../ecCommon/commonEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currOrderDetailDataGrid;
var currDetailData;

$(function () { 
	
	var $fm = $("#fm");   		
	var sysorderid = '${sysorderid}';
	
	currOrderDetailDataGrid = $("#orderDetailDataGrid"); 
	currOrderDetailDataGrid.datagrid({
		view:footerStyleView,
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    sortName:"sku",
        sortOrder:"desc",	
        pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,  
	    singleSelect:true,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    toolbar: "#detailskutoolbar",
	    columns:[[
			{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
			{field:"materialname",title:"商品名称",width:240,align:"center",sortable:true},
			{field:"materialcode",title:"商品货号",width:90,align:"center",sortable:true},	
			{field:"isbuy",title:"商品类型",width:70,align:"center", sortable:true, 
				formatter:function(value, row){
					return formatter(value, window.parent.ecIsbuy); 
				}
			},
			{field:"materialproperty",title:"商品属性",width:140,align:"center", sortable:true},			
			{field:"saleprice",title:"销售单价",width:70,align:"center", sortable:true,formatter:numBaseFormat},
			{field:"payprice",title:"实付单价",width:70,align:"center", sortable:true,formatter:numBaseFormat},
			{field:"orderqty",title:"下单数量",width:70,align:"center", sortable:true,formatter:numBaseFormat},
			{field:"totalprice",title:"实付总价",width:70,align:"center", sortable:true,formatter:numBaseFormat},
			{field:"invstatus",title:"库存状态",width:70,align:"center", sortable:true, 
				formatter:function(value, row){
					return formatter(value, window.parent.ecINVstatus); 
				}
			},
			{field:"memo",title:"备注",width:170,align:"center", sortable:true}       
	    ]],
    	loadFilter:function(data) {
    		var fields = ["totalprice","orderqty"];
    		//排序拦截器
    		sortFilter($(this), data);
    		//分页拦截器
    		return pagerFilter($(this), data, fields, "sku");   
    		/* var resultData = commonListFormat(data, fields, "sku");			            
            return resultData; */
        },
        rowStyler:function(index,row){	    		    	
    		if (row.sku=="合计"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	    	       	
        	return "";
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
	
	$("#cashordersDataGrid").datagrid({
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    sortName:"adddatetime",
        sortOrder:"desc",	   
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	    
	    fitColumns:true,
	    showFooter:true,
	    columns:[[
	      		//{field:'cashid',checkbox:true},
	    		{field:"adddatetime",title:"操作时间",width:180,align:"center"},
	    		{field:"refundcashstatus",title:"退款状态",width:140,align:"center",formatter:function(value, row){	    			
	    			return formatter(value, window.parent.ecRefundcashstatus);
	    		}},
	    		{field:"refundprice",title:"退款金额",width:140,align:"center",formatter:numBaseFormat},	    		
	    		{field:"addcname",title:"操作人",width:160,align:"center"},
	    		{field:"remark",title:"备注",width:400,align:"center"}
	    	]],
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
	
	$("#orderLogDataGrid").datagrid({
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    sortName:"adddatetime",
        sortOrder:"desc",
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	    
	    fitColumns:true,
	    showFooter:true,
	    columns:[[
	    		{field:"adddatetime",title:"操作时间",width:200,align:"center"},
	    		{field:"addcname",title:"操作人",width:200,align:"center"},
	    		//{field:"typeid",title:"类别",width:200,align:"center"},
	    		{field:"typename",title:"操作类别",width:200,align:"center"},
	    		{field:"remark",title:"操作事件",width:460,align:"center"}
	    	]],
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
	
	$("#refundordersDataGrid").datagrid({
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    sortName:"adddatetime",
        sortOrder:"desc",
	    singleSelect:true,//是否单选	   
	    rownumbers:true,//行号	   
	    fitColumns:true,
	    showFooter:true,
	    columns:[[
	    		{field:"ischangeorder",title:"单据类型",width:160,align:"center",formatter:function(value, row){
	    			var refundtype = "未知类型";
	    			if(value==1){
	    				refundtype = "换发单";
	    			}else if(value==0){
	    				refundtype = "退货单";
	    			}	    			
	    			return refundtype;
	    		}},
	    		{field:"sysorderid",title:"系统订单号",width:200,align:"center"},
	    		{field:"refundstatus",title:"状态",width:130,align:"center"},
	    		{field:"addcname",title:"创建人",width:130,align:"center"},
	    		{field:"adddatetime",title:"创建时间",width:160,align:"center"},
	    		{field:"remark",title:"备注",width:260,align:"center"}
	    	]],
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
	
	
	$.ajax({
		type : "GET",
		url : "${api}/ecorder/"+ sysorderid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {			
			if(result.status){
				var ecorderDto = result.entry;
				var header = ecorderDto.header;
				//$fm.form("load", header);
				
				/***************************              基本信息初始化                        ************************/
				
				$("#ordertype", $fm).textbox("setValue", formatter(header.ordertype, window.parent.ecOrdertype));
				$("#tradestatus", $fm).textbox("setValue", formatter(header.tradestatus, window.parent.ecTradestatus));
				$("#systemstatus", $fm).textbox("setValue", formatter(header.systemstatus, window.parent.ecSystemstatus));
				$("#stockstatus", $fm).textbox("setValue", formatter(header.stockstatus, window.parent.ecStockstatus));
				$("#despatchstatus", $fm).textbox("setValue", formatter(header.despatchstatus, window.parent.ecDespatchstatus));
				$("#refundstatus", $fm).textbox("setValue", formatter(header.refundstatus, window.parent.ecRefundstatus));
				$("#salestatus", $fm).textbox("setValue", formatter(header.salestatus, window.parent.ecSalestatus));
				$("#auditflag", $fm).textbox("setValue", formatter(header.auditflag, window.parent.ecAuditflag));
				$("#shippingtype", $fm).textbox("setValue",formatter(header.shippingtype, window.parent.ecShippingtype));
				$("#channelcode", $fm).textbox("setValue", formatter(header.channelcode, window.parent.ecChannelcode));
				
				$("#extorderid", $fm).textbox("setValue", header.extorderid);
				$("#buyerremark", $fm).textbox("setValue", header.buyerremark);
				$("#sellerremark", $fm).textbox("setValue", header.sellerremark);
				$("#sysorderid", $fm).textbox("setValue", header.sysorderid);			
				$("#username", $fm).textbox("setValue", header.username);		
				$("#shopname", $fm).textbox("setValue", header.shopname);
				
				if(header.orderdatetime!=null && header.orderdatetime!=''){
					$("#orderdatetime", $fm).datetimebox("setValue", header.orderdatetime);
				}
				if(header.paymentdatetime!=null && header.paymentdatetime!=''){
					$("#paymentdatetime", $fm).datetimebox("setValue", header.paymentdatetime);
				}			
				if(header.deliverydatetime!=null && header.deliverydatetime!=''){
					$("#deliverydatetime", $fm).datetimebox("setValue", header.deliverydatetime);
				}		
				
				currDetailData = ecorderDto.details;
				currOrderDetailDataGrid.datagrid("loadData", currDetailData);
				
				
				/***************************              配送信息初始化                        ************************/
				
				var stockInfo = ecorderDto.stockInfo;
				$("#receivename", $fm).textbox("setValue", header.receivename);
				$("#mobileno", $fm).textbox("setValue", header.mobileno);
				$("#tel", $fm).textbox("setValue", header.tel);
				$("#zipcode", $fm).textbox("setValue", header.zipcode);
				$("#provincename", $fm).textbox("setValue", header.provincename);
				$("#cityname", $fm).textbox("setValue", header.cityname);
				$("#regionname", $fm).textbox("setValue", header.regionname);
				$("#address", $fm).textbox("setValue", header.address);
				
				$("#stockname", $fm).textbox("setValue", stockInfo.stockname);
				$("#stockcode", $fm).val(header.stockcode);
				$("#deliverstockname", $fm).textbox("setValue", stockInfo.stockname);
				
				$("#expresscode", $fm).textbox("setValue", formatter(header.expresscode, window.parent.expressCode));
				$("#assigntime", $fm).textbox("setValue", formatter(header.assigntime, window.parent.ecAssigntime));
				$("#pointexpresscode", $fm).textbox("setValue", formatter(header.pointexpresscode, window.parent.expressCode));
				$("#expressno", $fm).textbox("setValue", header.expressno);
				
				/***************************              支付信息初始化                               ************************/	
				
				$("#orderprice", $fm).numberbox("setValue", header.orderprice);
				$("#payprice", $fm).numberbox("setValue", header.payprice);
				$("#integralamount", $fm).numberbox("setValue", header.integralamount);
				$("#sellercouponprice", $fm).numberbox("setValue", header.sellercouponprice);
				$("#discountprice", $fm).numberbox("setValue", header.couponprice-header.sellercouponprice);
				$("#shippingprice", $fm).numberbox("setValue", header.shippingprice);

				$("#invoicestop", $fm).textbox("setValue", header.invoicestop);
				$("#paymode", $fm).textbox("setValue", header.paymode);
				$("#isbilling", $fm).textbox("setValue", formatter(header.isbilling, window.parent.isEnable));
				$("#istrave", $fm).textbox("setValue", formatter(header.istrave, window.parent.isEnable));
				$("#alreadyprice", $fm).numberbox("setValue", header.alreadyprice);
				
				$("#unpayprice", $fm).numberbox("setValue", header.unpayprice);
				$("#bonusamount", $fm).numberbox("setValue", header.bonusamount);
				$("#serialnum", $fm).textbox("setValue", header.serialnum);
				$("#bankaccount", $fm).textbox("setValue", header.bankaccount);
				$("#financialstatus", $fm).textbox("setValue", formatter(header.financialstatus, window.parent.ecFinancialstatus));

				var cashorders = ecorderDto.cashorders;			
				$("#cashordersDataGrid").datagrid("loadData", cashorders);
				
				/***************************              操作日志信息初始化                               ************************/
				
				var ecOrderLogs = ecorderDto.ecOrderLogs;
				$("#orderLogDataGrid").datagrid("loadData", ecOrderLogs);
				
				
				/***************************              关联单信息初始化                               ************************/

				var ecRefundorders = ecorderDto.ecRefundorders;
				$("#refundordersDataGrid").datagrid("loadData", ecRefundorders);
			}else{
				$.messager.alert("错误", result.message, "error");
			}		
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});

</script>