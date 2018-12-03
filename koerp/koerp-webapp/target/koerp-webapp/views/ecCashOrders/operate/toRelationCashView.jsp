<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<div class="easyui-layout" fit=true  id="base_layout" >	 
	<div data-options="region:'north'" style="height:38%;" title="基本信息">		
 	 	<form id="cashheaderfm">
 	 		<table class="nb-formTable" style="width:100%;" >		   	 		
		         <tr>
		         	<th width="12%">外部单号</th>
					<td>
						<input name="extorderid" class="easyui-textbox" readonly />								
					</td>		         	
		         	<th width="12%">关联订单号</th>
					<td>
						<input name="sysorderid" class="easyui-textbox" readonly />								
					</td>									
					<th width="12%">订单类型</th>
					<td>	
					    <input id="ordertype" name="ordertype" class="easyui-combobox" readonly />					    
					</td>	
					<th width="12%">销售状态</th>
					<td>	
					    <input id="salestatus" name="salestatus" class="easyui-combobox" readonly />					    
					</td>																		         														
				</tr>
				<tr>
					<th width="12%">订单金额</th>
					<td>	
					    <input name="orderprice" class="easyui-numberbox" readonly
						  data-options="min:0,precision:2, formatter: priceFormat" />					    
					</td>
					<th width="12%">实付金额</th>
					<td>	
					    <input name="payprice" class="easyui-numberbox" readonly
						  data-options="min:0,precision:2, formatter: priceFormat" />					    
					</td>
				  	<th width="12%">积分</th>
					<td>
						<input name="integralamount" class="easyui-numberbox" readonly
						  data-options="min:0,precision:0, formatter: intNumBaseFormat" />								
					</td>			          
					<th width="12%">红包金额</th>
					<td>	
					    <input name="bonusamount" class="easyui-numberbox" readonly
						  data-options="min:0,precision:2, formatter: priceFormat" />					    
					</td>																				
				</tr>
				<tr>
					<th width="12%">所属门店</th>
					<td colspan="3">
						<input name="shopname" class="easyui-textbox" style="width:360px;" readonly/>								
					</td>
		         	<th width="12%">买家用户名</th>
					<td colspan="3">
						<input name="username" class="easyui-textbox" style="width:360px;" readonly />								
					</td>			         									         																						
				</tr>								         	
	   	 	</table>
 	 	</form>
 	</div>
	<div data-options="region:'center'" title="相关明细" >		
 	 	<table id="cashOrderDataGrid"></table>
 	</div> 	 	
</div>				

<script type="text/javascript">

var cashheaderfm;
var cashOrderDataGrid;
var currCashOrderData = [];
var columns = 
    [[	
		{field:'cashid',title:'补退款单号',width:200, align:"center"},		  		
		{field:"refundcashstatus",title:"补退款状态",width:100,align:'center',sortable:true,formatter:function(value, row){
			return formatter(value, window.parent.ecRefundcashstatus);
		}},		
		{field:'isrefund',title:'交易类型',width:70,align:"center",sortable:true,formatter:function(value, row){
			return formatter(value, window.parent.ecIsrefund);
		}},
		{field:"refundprice",title:"补退金额",width:70,align:'center',formatter:numBaseFormat},		
		{field:"refundreason",title:"退款原因",width:100,align:'center',formatter:function(value, row){
			return formatter(value, window.parent.ecRefundreason);
		}},
		{field:"remark",title:"备注",align:'center', width:180},
		{field:"returnmode",title:"退款方式",width:80,align:'center',formatter:function(value, row){
			return formatter(value, window.parent.ecReturnmode);
		}},
		{field:"bankaccount",title:"退款账户",align:'center', width:140},
		{field:"realname",title:"真实姓名",align:'center', width:80},
		{field:"bankname",title:"开户银行",align:'center', width:140},		
		{field:"addcname",title:"创建人",align:'center', width:60},
		{field:"adddatetime",title:"创建时间",align:'center', width:130, sortable:true}		
		//{field:"modyfycname",title:"修改人",align:'center',sortable:true, width:80},
		//{field:"modifydatetime",title:"修改时间",align:'center',sortable:true, width:130}
				
	]];
	
$(function () { 

	$cashheaderfm = $("#cashheaderfm");
	cashOrderDataGrid = $("#cashOrderDataGrid");	
	cashOrderDataGrid.datagrid({		
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,	   
	    sortName:"isrefund",
        sortOrder:"asc",	
        pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:true,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,	    
	    columns:columns,   
	    loadFilter:function(data) { 	    		    	     		
    		//排序拦截器
    		sortFilter($(this), data);		  	   
    		return pagerFilter($(this), data);   
        },
	    rowStyler:function(index,row){	    		    		    	
        	var rowStyle = "background-color:#e0ecff;";     	
        	if(row.isrefund==1){
				rowStyle = "background-color:#FF9933;";
			}
        	return rowStyle;
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
	
	$('#ordertype', $cashheaderfm).combobox({ 		
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.ecOrdertypeData
   	});	
	
	$('#salestatus', $cashheaderfm).combobox({ 		
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',  	  
   	  	data: window.parent.ecSalestatusData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($cashheaderfm, "");
	
	var relationid = "${relationid}";
	if(relationid!=''){
		$.ajax({
			type : "GET",
			url : "${api}/eccash/findRelationCash/"+ relationid,
			contentType:"application/json;charset=utf-8",
			dataType : "json",
			success : function(result) {		
				var relationCashDto = result.entry;				
				if(result.status && relationCashDto!=null){
					//头信息
					var cashheader = relationCashDto.header;
					$cashheaderfm.form("load", cashheader);
					//明细信息
					currCashOrderData = relationCashDto.cashDetails;					
					cashOrderDataGrid.datagrid("loadData", currCashOrderData);
				}					
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert("错误", errorThrown, "error");
			}
		});  		
	}
	
});


</script>