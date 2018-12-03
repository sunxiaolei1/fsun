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
	padding: 15px 5px 5px 5px;
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

<div class="easyui-tabs" >		
	<div title="订单信息" style="padding:2px 6px 0px 6px;">
		<div class="fsun-wrap">
			<span class="title" style="top: 65px;">基本信息[差异单号:${diffid}]</span>	
			<form id="fm">				
				<table class="nb-formTable" style="width:100%;">
			        <tr>
			            <th width="12%">外部单号</th>
						<td>
							<input class="easyui-textbox" name="extorderid" id="extorderid" editable="false" />
						</td>
						<th width="12%">原系统单号</th>
						<td>
							<input name="sysorderid" id="sysorderid" class="easyui-textbox" editable="false"/>
						</td>
						<th width="12%">差异单号</th>
						<td>
							<input name="diffid" id="diffid" class="easyui-textbox" editable="false" />
						</td>
						<th width="12%">所属店铺</th>
			        	<td>
							<input id="shopname" name="shopname" class="easyui-textbox" editable="false"/>
						</td>					
			        </tr>
			        <tr>
			        	<th width="12%">原订单金额</th>
						<td>
							<input id="originalorderprice" name="originalorderprice" class="easyui-numberbox" 
							 	data-options="min:0,precision:2,formatter: priceFormat" editable="false"/>
						</td>
						<th width="12%">新订单金额</th>
						<td>
							<input name="neworderprice" id="neworderprice" class="easyui-numberbox" 
								data-options="min:0,precision:2,formatter: priceFormat" editable="false"/>
						</td>						
						<th width="12%">商家优惠</th>
						<td>
							<input name="sellercouponprice" id="sellercouponprice" class="easyui-numberbox" 
								data-options="min:0,precision:2,formatter: priceFormat" editable="false"/>
						</td>
						<th width="12%">商品优惠</th>
						<td>
							<input name="discountprice" id="discountprice" class="easyui-numberbox" 
								data-options="min:0,precision:2,formatter: priceFormat" editable="false"/>
						</td>	            								
			        </tr>
			        <tr>
			        	<th width="12%">原实付金额</th>
						<td>
							<input id="originalpayprice" name="originalpayprice" class="easyui-numberbox" 
							 	data-options="min:0,precision:2,formatter: priceFormat" editable="false"/>
						</td>
						<th width="12%">新实付金额</th>
						<td>
							<input name="newpayprice" id="newpayprice" class="easyui-numberbox" 
								data-options="min:0,precision:2,formatter: priceFormat" editable="false"/>
						</td>
						<th width="12%">金额差异</th>
						<td>
							<input id="difforderprice" name="difforderprice" class="easyui-numberbox" 
								data-options="precision:2,formatter: priceFormat" editable="false"/>
						</td>
						<th width="12%">配送费用</th>
						<td>
							<input name="shippingfee" id="shippingfee" class="easyui-numberbox" 
								data-options="min:0,precision:2,formatter: priceFormat" editable="false"/>
						</td>			        	
			        </tr>
			        <tr>
			        	<th width="12%">积分数</th>
						<td>
							<input id="integralamount" name="integralamount" class="easyui-numberbox" 
								data-options="formatter: intNumBaseFormat" editable="false"/>
						</td>
						<th width="12%">红包金额</th>
						<td>
							<input name="bonusamount" id="bonusamount" class="easyui-numberbox" 
								data-options="min:0,precision:2,formatter: priceFormat" editable="false"/>
						</td>
			        	<th width="12%">创建人</th>
						<td>
							<input name="addcname" id="addcname" class="easyui-textbox" editable="false" />
						</td>			
						<th width="12%">创建时间</th>
						<td>
							<input id="adddatetime" name="adddatetime" class="easyui-datetimebox" readonly />
						</td>
			        </tr>			        			        
			        <tr>	        			            				       
			        	<th width="12%">客服备注</th>
						<td colspan="7">
							<input name="remark" id="remark" data-options="multiline:true" class="easyui-textbox" style="width:800px;height:60px;" editable="false"/>
						</td>			           	
			        </tr>        
				</table>
			</form>
		</div>
	</div>
	<div title="订单商品" closable="false" style="padding:6px;">
		<div style="height: 42%;width: 100%;">
			<table title="原订单商品" id="oldOrderDetailDataGrid"></table>
		</div>
		<div style="height: 42%;width: 100%;margin-top:6px;">
			<table title="差异单商品" id="newOrderDetailDataGrid"></table>
		</div>	
	</div>	
</div>		


<script type="text/javascript">

var columns = [[
	//{field:'ck',checkbox:true},	    		
	{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
	{field:"materialname",title:"商品名称",width:220,align:"center"},
	{field:"materialcode",title:"商品货号",width:80,align:"center"},	
	{field:"isbuy",title:"商品类型",width:60,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.ecIsbuy); 
	}},
	{field:"materialproperty",title:"商品属性",width:140,align:"center"},
	{field:"saleprice",title:"销售单价",width:60,align:"center",formatter:numBaseFormat},
	{field:"payprice",title:"实付单价",width:60,align:"center",formatter:numBaseFormat},	
	{field:"orderqty",title:"下单数量",width:60,align:"center",formatter:numBaseFormat},
	{field:"totalprice",title:"实付总价",width:60,align:"center",formatter:numBaseFormat},
	{field:"invstatus",title:"库存状态",width:60,align:"center", formatter:function(value, row){
		return formatter(value, window.parent.ecINVstatus); 
	}},
	{field:"memo",title:"备注",width:200,align:"center"}                   
     ]];

$(function () { 
	
	var $fm = $("#fm");   		
	var diffid = '${diffid}';
	
	$("#oldOrderDetailDataGrid").datagrid({
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
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	   
	    fitColumns:true,	    
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    showFooter:true,
	    rowStyler:function(index,row){  
	    	if (row.sku=="合计"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }
        	if(row.iscolor==1){
				return "background-color:#FF9933;";
			}
        	return "";
		},
	    loadFilter:function(data) {	    	
	    	var fields = ["totalprice","orderqty"];
	    	return commonListFormat(data, fields, "sku");			                      
	    }
	});
	
	$("#newOrderDetailDataGrid").datagrid({
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
	    singleSelect:true,//是否单选	    
	    rownumbers:true,//行号	   
	    fitColumns:true,	    
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    showFooter:true,
	    rowStyler:function(index,row){
	    	if (row.sku=="合计"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }
	    	if(row.iscolor==1){
				return "background-color:#42cc06;";
			}
        	return "";      	
		},
	    loadFilter:function(data) {
	    	var fields = ["totalprice","orderqty"];
	    	return commonListFormat(data, fields, "sku");
        }
	});
	
	
	
	$.ajax({
		type : "GET",
		url : "${api}/ecdiff/order/"+ diffid +"?timestamp=" + new Date().getTime(),
		contentType:"application/json;charset=utf-8",	   
		dataType : "json",
		success : function(result) {		
			var ecdifforderDto = result.entry;
			var newHeader = ecdifforderDto.newHeader;	
			var oldHeader = ecdifforderDto.oldHeader;	
			
			/***************************              基本信息初始化                        ************************/
			
			$("#extorderid", $fm).textbox("setValue", newHeader.extorderid);			
			$("#sysorderid", $fm).textbox("setValue", newHeader.sysorderid);			
			$("#diffid", $fm).textbox("setValue", newHeader.diffid);	
			$("#shopname", $fm).textbox("setValue", newHeader.shopname);
			
			$("#originalorderprice", $fm).numberbox("setValue", newHeader.originalorderprice);
			$("#neworderprice", $fm).numberbox("setValue", newHeader.neworderprice);
			$("#originalpayprice", $fm).numberbox("setValue", newHeader.originalpayprice);
			$("#newpayprice", $fm).numberbox("setValue", newHeader.newpayprice);
			$("#difforderprice", $fm).numberbox("setValue", newHeader.difforderprice);
			$("#shippingfee", $fm).numberbox("setValue", newHeader.shippingfee);
			$("#sellercouponprice", $fm).numberbox("setValue", newHeader.sellercouponprice);
			$("#discountprice", $fm).numberbox("setValue", newHeader.couponfee-newHeader.sellercouponprice);
			$("#bonusamount", $fm).numberbox("setValue", newHeader.bonusamount);
			$("#integralamount", $fm).numberbox("setValue", oldHeader.integralamount);
			
					
			$("#addcname", $fm).textbox("setValue", newHeader.addcname);	
			if(newHeader.adddatetime!=null && newHeader.adddatetime!=''){
				$("#adddatetime", $fm).datetimebox("setValue", newHeader.adddatetime);
			}	
			$("#remark", $fm).textbox("setValue", newHeader.remark);	
			
			var oldDetails = ecdifforderDto.oldDetails;
			$("#oldOrderDetailDataGrid").datagrid("loadData", oldDetails);
			
			var newDetails = ecdifforderDto.newDetails;
			$("#newOrderDetailDataGrid").datagrid("loadData", newDetails);
	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
	
     
});

</script>