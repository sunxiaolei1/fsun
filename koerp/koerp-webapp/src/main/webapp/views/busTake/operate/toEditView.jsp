<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<div class="easyui-layout" data-options="fit:true" >
	<!-- 查询条件 -->
	<%@include file="../../busCommon/commonOrderViewToolbar.jsp"%>
	
	<div data-options="region:'center',split:true, border:false" >
		<div class="easyui-layout" data-options="fit:true" >
			<div data-options="region:'north',split:true, border:false" style="height:180px;">	
				<div class="fsun-wrap">
					<form id="orderfm">
						<span class="title" style="top: 1px;">单据基本信息</span>	
						<input id="sellerId" name="sellerId" hidden="true" />
						<input id="sellerName" name="sellerName" hidden="true" />
						<input id="buyerId" name="buyerId" hidden="true" />	
						<input id="shopId" name="shopId" hidden="true" />		
						<table class="nb-formTable" style="width:100%;">
					        <tr>
					            <th width="8%">单据编号</th>
								<td style="width:32%;">
									<input id="takeId" name="takeId" class="easyui-textbox" style="width:95%;" readOnly />
								</td>
								<th width="8%">提货人</th>
								<td>
									<input id="takeName" name="takeName" class="easyui-textbox" style="width:95%;" />
								</td>
								<th width="8%">所属店仓</th>
								<td colspan="3" style="width:22%;">
									<input id="shopName" name="shopName" 
										class="easyui-textbox" readOnly style="width:90%;"/>								
								</td>																				
					        </tr>	
					        <tr>
					        	<th width="8%">寄存单号</th>
								<td style="width:32%;">
									<input id="orderId" name="orderId" class="easyui-textbox" style="width:95%;" readOnly />
								</td>		        		        		        										
					        	<th width="8%">提货时间</th>
								<td>
									<input id="takeTime" name="takeTime" class="easyui-datetimebox" style="width:95%;"/>
								</td>
								<th width="8%">客户名称</th>
								<td colspan="3" >
									<input id="buyerName" name="buyerName" 
										class="easyui-textbox" readOnly style="width:90%;"/>							
								</td>				        		            													        						        									
					        </tr>	        
					        <tr>
					        	<th width="8%">备注</th>
								<td colspan="7" style="width:88%;">
									<input id="memo" name="memo"  data-options="multiline:true" 
										class="easyui-textbox" style="width:70%;height:46px;"/>	
								</td>	        	
					        </tr>
						</table>
					</form>			
				</div>
			</div>
					
			<div data-options="region:'center',split:true, border:false" >
				<div id="detailskutoolbar" style="display:none;">
					<%@include file="./detailskusigntoolbar.jsp"%>
				</div>
				<table id="orderDetailDataGrid"></table>
			</div>
		</div>	
	</div>
</div>					

<!-- datagrid可编辑单元格 -->
<%@include file="../../busCommon/commonEdatagridCellediting.jsp"%>

<!-- datagrid操作公共方法 -->
<%@include file="./baseView.jsp"%>

<script type="text/javascript">

var currDetailData = []; 
var currOrderDetailDataGrid  = $("#orderDetailDataGrid");
var $orderfm = $("#orderfm");
var columns = [[
	{field:'ck',checkbox:true},
	{field:"sku",title:"SKU", width:80,align:"center"},
	{field:"goodsName",title:"商品名称", width:200,align:"center"},
	{field:"barCode",title:"条形码", width:140,align:"center"},
	{field:'brandCode',title:'品牌',width:80,align:'center',sortable:true, formatter:function(value, row){
		return formatter(value, window.parent.brandCode); 
	}},
	{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.categoryCode); 
	}},
	{field:'property',title:'规格',width:120,align:'center',sortable:true},
	{field:"unit",title:"单位",width:70,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.unitCode); 
	}},
	{field:"oriQty",title:"原订单数量", width:95,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"maxQty",title:"可提货数量", width:95,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"qty",title:"提货数量", width:85,align:"center",
		styler: function(value, rowData, rowIndex){
			var style = 'font-weight:bold;color:green;';
			if(rowData.maxQty!=value){
				style = 'font-weight:bold;color:#FF9933;';
			}
	    	return style;
	    },
	    formatter:intNumBaseFormat,
	    editor:{
			type:'numberbox',
			options:{					
				min:0,
				precision:0,
				required: true
			}
		}
	}
]];

$(function () { 
	
	$.ajax({
		type : "GET",
		url : "${api}/bus/take/getInitData",
		data:{
			"takeId":"${takeId}",
			"orderId": "${orderId}"
		},
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var docTakeDto = result.entry;
			
			/***************************              基本信息初始化                        ************************/			
			var header = docTakeDto.header;
			if(header!=null){
				$orderfm.form("load", header);	
				if(header.takeStatus!=null && header.takeStatus!=''){
					$("#signedGoodsBtn").css("visibility", "hidden");
					$("#rejectedGoodsBtn").css("visibility", "hidden");
				}
			}
			
			var details = docTakeDto.details;	
			if(details!=null && details.length>0){
				currDetailData = details;				
				//添加行编辑结束事件
				currOrderDetailDataGrid.datagrid({					
					onAfterEdit: function(rowIndex, rowData, changes){	
										
				    }
				}).datagrid("loadData", currDetailData);
			}	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});	
     
});


</script>