<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<style type="text/css">

.skutitle{
	margin: 0px 18px 0px 4px;
    padding-top: 0px;
    padding-bottom: 0px;
    height: 22px;
    line-height: 22px;
    width: 182px;
    font-size: 12px;
    font-weight: bold;
    color: #575765;
}

</style>

<!-- BasSku dialog -->
<div id="chooseSkuDialog" class="alert">
	<div class="easyui-layout" style="height:100%;">		
		<div data-options="region:'east',split:true,border:false"  style="width:230px;">
			<table id="reasonidDatagrid"></table>
		</div>			
		<div data-options="region:'center',border:false">			
			<table id="skusDatagrid"></table>
		</div>		
	</div>
</div>
<!-- BasSku dialog -->

<div id="skuToolbar" style="dispaly:none;" >	
	<span style="float:right;padding-top:2px;">	
		<input id="sysorderidText" class="easyui-searchbox" style="width:240px"
		data-options="searcher:queryOrderdetail,prompt:'输入订单号...'"  />
		
		<input id="returnreasonText" class="easyui-searchbox" style="width:240px"
		data-options="disabled:true,searcher:updateReturnreason,prompt:'输入退货理由...'"  />
		
	</span>		
	<div style="height:27px;"><span class="skutitle" >商品列表</span></div>		
</div>

<script type="text/javascript">	

var currSkusDatagrid;
var newSysorderid;
var currRefundDetails = [];
var currReasonidArr = [];

$(function() {	
	
	//回显使用数据
	currSkusDatagrid = $("#skusDatagrid");
	
	//加载SKU
	currSkusDatagrid.datagrid({			
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    method: "GET",
	    sortName:"sku",
        sortOrder:"desc",	
        pagination:false,       
	    singleSelect:true,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
		columns: [[
			//{field: 'skuid', checkbox: true},						
			{field:"sku",title:"SKU",width:120,align:"center",sortable:true},
			{field:"materialname",title:"商品名称",width:200,align:"center",sortable:true},
			//{field:"materialcode",title:"商品货号",width:90,align:"center",sortable:true},	
			{field:"isbuy",title:"商品类型",width:70,align:"center", 
				formatter:function(value, row){
					return formatter(value, window.parent.ecIsbuy); 
				}
			},
			{field:"materialproperty",title:"商品属性",width:140,align:"center"},				
			{field:"payprice",title:"实付单价",width:70,align:"center",formatter:numBaseFormat},
			{field:"orderqty",title:"下单数量",width:70,align:"center",formatter:numBaseFormat},
			{field:"totalprice",title:"实付总价",width:70,align:"center",formatter:numBaseFormat},
			/* {field:"aftersalestatus",title:"售后状态",width:60,align:"center", formatter:function(value, row){				
				if(value==10){
					return '<span style="font-weight:bold;color:green;">'+ formatter(value, window.parent.ecAftersalestatus) +'</span>';
				}
				return '<span style="font-weight:bold;color:#FF6600;">'+ formatter(value, window.parent.ecAftersalestatus) +'</span>';
			}}, */
			{field:"reasonid",title:"退货理由",width:120,align:"center", 
				formatter:function(value, row){
					return formatter(value, window.parent.ecReturnReason); 
				}	
			}		
		]],	
		onLoadSuccess: function(data){
			if(data!=null && data.rows!=null){
				currRefundDetails = data.rows;
			}else{
				$("#returnreasonText").searchbox("disable");
			}		
		},
		loadFilter: function(result){				
			var entry = result.entry;
			if(entry!=null && entry.details!=null){	
				//格式化商品明细
				var details = formatDetails(entry.details);									
				if(details.length==0){
					$("#returnreasonText").searchbox("clear");
					$("#returnreasonText").searchbox("disable");
					return [];
				}
				
				var header = entry.header;	
				if(header!=null && header.shopid!=null && header.shopid!=''){
					$.ajax({  
				    	async:false,  
				        cache:false,  
				        type:'GET', 			    
				        dataType: "json",  
				        url: "${api}/ecorder/config/getRefundReasons/"+ header.shopid,		         
				        success:function(result) { //请求成功后处理函数。  
				        	if (result.status) {				        					        			        		
				        		var reasonidArr = [];
				        		$.each(result.entry, function(){			        			
				        			var that = this;
				        			$.each(window.parent.ecReturnReasonData, function(){
				        				if(this.codeCode==that.codecode){
				        					reasonidArr.push(this);
				        					return;
				        				}
				        			});			        			
				        		});
				        		currReasonidArr = reasonidArr; 
				        		$("#reasonidDatagrid").datagrid("loadData",currReasonidArr);
				        		$("#returnreasonText").searchbox("enable");
				        		$("#returnreasonText").next('span').find('input').focus();
							}
				        }
					});
				}				
				return details;
			}
			return result;
		},
		toolbar: "#skuToolbar",
		loadMsg: "数据加载中请稍后……"
	});
	
	
	//初始化退货理由集合
	$.each(window.parent.ecReturnReasonData, function(){ 
		if(this.codeCode != ""){
			currReasonidArr.push(this);	
		}											
	});
	$("#reasonidDatagrid").datagrid({			
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:false,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,	   
	    sortName:"sortCode",
        sortOrder:"asc",	
        pagination:false,       
	    singleSelect:true,//是否单选   
	    rownumbers:false,//行号
	    fitColumns:true,
	    showFooter:false,
		columns: [[					
			{field:"sortCode",title:"退货理由快捷方式如下",width:160,align:"center",sortable:true,
				formatter:function(value, row){					
					return row.codeCode + "--" + row.codeName; 
				}	
			}					
		]]
	}).datagrid("loadData", currReasonidArr);
	
});

//查询单号对应的明细
function queryOrderdetail() {		
	newSysorderid = trim($("#sysorderidText").searchbox("getValue"));	
	$("#returnreasonText").searchbox("clear")
	currSkusDatagrid.datagrid("clearSelections");
	currSkusDatagrid.datagrid("options").url = "${api}/ecaftersale/order/base/"+ newSysorderid;
	currSkusDatagrid.datagrid("load");	
}

/**
 * 更新退货理由
 */
function updateReturnreason(){
	var reasonid = trim($("#returnreasonText").searchbox("getValue"));	
	if(reasonid!=''){
		var hasExist = false;
		$.each(currReasonidArr,function(){
			if(this.codeCode == reasonid){
				hasExist = true;
				return;
			}
		});
		if(!hasExist){
			$("#returnreasonText").searchbox("clear");
			$.each(currRefundDetails,function(){
				this.reasonid = '';
			});
			currSkusDatagrid.datagrid("loadData", currRefundDetails);
			$.messager.show({ title: '提示信息', msg : "输入的退货理由不可使用！" });
		}else{
			$.each(currRefundDetails,function(){
				this.reasonid = reasonid;
			});				
			var saveData = getSaveData();
			console.log(saveData);
			if(saveData!=null){
				commonPost(saveData.saveUrl, JSON.stringify(saveData.params), null, afterSaveFunc);						
			}	
		}	
	}
}

/*********************************  私有方法       ***********************************/
 
/**
 * 保存成功后操作
 */
function afterSaveFunc(){
	$.messager.show({ title: '提示信息', msg : "单号:"+ newSysorderid +"退单操作成功!" });
	$("#returnreasonText").searchbox("disable");
	$("#sysorderidText").next('span').find('input').focus().select();
	currSkusDatagrid.datagrid("loadData", currRefundDetails);	
}

/**
 * 获取提交的数据
 */
function getSaveData(){
		
	if(newSysorderid==null || newSysorderid==''){
		$.messager.alert("错误", "订单号不存在!", "error");  
		return null;
	}
	
	var refundDetails = [];
	$.each(currRefundDetails,  function(){
		var rowdata = cloneObj(this); 
	    rowdata.oldorderqty = this.orderqty;
	    rowdata.oldtotalprice = this.totalprice;
	    delete rowdata.returnreason;
	    delete rowdata.aftersalestatusname;
	    //delete rowdata.aftersalestatus;
	    delete rowdata.giftname;
	    delete rowdata.nid;
	    refundDetails.push(rowdata);
	});
	
	var saveData = {
	     "params": {
			 "header": {
				 "sysorderid": newSysorderid
			 },
			 "details": refundDetails
			},
	     "saveUrl": "${api}/ecaftersale/refund/onekey"
	}
	return saveData;
}

/**
 * 格式化商品明细
 */
function formatDetails(currdDetails){
	var details = [];
	//保留售后正常状态的商品
	$.each(currdDetails, function(){
		if(this.aftersalestatus==10){
			details.push(this);
		}
	});	
	return details;
}

</script>