<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<!-- 查询条件 -->
<%@include file="../../busCommon/commonOrderViewToolbar.jsp"%>
	
<div class="fsun-wrap">
	<form id="orderfm">
		<span class="title" style="top: 35px;">单据基本信息</span>	
		<input id="sellerId" name="sellerId" hidden="true" />
		<input id="buyerId" name="buyerId" hidden="true" />	
		<input id="shopId" name="shopId" hidden="true" />		
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">单据编号</th>
				<td>
					<input id="takeId" name="takeId" class="easyui-textbox" style="width:180px;"  readOnly />
				</td>
				<th width="12%">寄存单号</th>
				<td>
					<input id="orderId" name="orderId" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">所属店仓</th>
				<td colspan="3" >
					<input id="shopName" name="shopName" 
						class="easyui-textbox" style="width:400px;" readOnly />								
				</td>																				
	        </tr>	
	        <tr>		        		        		        		
				<th width="12%">提货人</th>
				<td>
					<input id="takeName" name="takeName" class="easyui-textbox" style="width:180px;" />
				</td>
	        	<th width="12%">提货时间</th>
				<td>
					<input id="takeTime" name="takeTime" class="easyui-datetimebox" />
				</td>
				<th width="12%">客户名称</th>
				<td colspan="3" >
					<input id="buyerName" name="buyerName" 
						class="easyui-textbox" style="width:400px;" readOnly />								
				</td>				        		            													        						        									
	        </tr>	        
	        <tr>
	        	<th width="12%">备注</th>
				<td colspan="7">
					<input id="memo" name="memo"  data-options="multiline:true" 
						class="easyui-textbox" style="width:800px;height:46px;"/>	
				</td>	        	
	        </tr>
		</table>
	</form>			
</div>	

<div style="height: 320px; width: 100%;">
	<div id="detailskutoolbar" style="display:none;">
		<%@include file="./detailskusigntoolbar.jsp"%>
	</div>
	<table id="orderDetailDataGrid"></table>
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
	{field:"oriQty",title:"原订单数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"maxQty",title:"可提货数量", width:80,align:"center",
		styler: function(value, rowData, rowIndex){
	    	return 'font-weight:bold;color:green;';
	    },
	    formatter:intNumBaseFormat
	},
	{field:"qty",title:"提货数量", width:80,align:"center",
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