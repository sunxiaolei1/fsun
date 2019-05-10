<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" >

$(function () { 
	
	currOrderDetailDataGrid.datagrid({
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    idField:"sku",
	    sortName:"sku",
        sortOrder:"asc",	
        pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    toolbar: "#detailskutoolbar",
	    columns: siColumns,
	    onBeforeLoad:function(param){
	    	debugger
	    	if('1' == '${hasEditPricePower}'){
	    		var columnOption = $(this).datagrid("getColumnOption", "price");
	    		columnOption.editor = {
	    			type:'numberbox',
	    			options:{					
	    				min:0,
	    				precision:2,
	    				required: true
	    			}
	    		};
		    	columnOption.styler = function(value, rowData, rowIndex){
	    	    	return 'font-weight:bold;color:green;';
	    	    };
	    	}else{
	    		$(this).datagrid("hideColumn", "price");
	    	}    	
	    },	
	    loadFilter:function(data) { 
	    	//排序拦截器
    		sortFilter($(this), data);
    		//分页拦截器
    		return pagerFilter($(this), data);   
        },
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
     
});


//显示签收明细确认dialog
function showSignView(){

	$("<div></div>").dialog({
		id:"showSignDialog",
	    title:"调拨单【"+ $("#asnNo",$orderfm).val() +"】签收明细",
	    width:1100,
	    height:450,
	    closed:false,
	    cache:false,
	    href:"${api}/doc/asn/toShowSignView",
	    modal:true,
	    minimizable:false,
        maximizable:false,
        closable:true,
        collapsible:false,
        resizable:true,
        buttons:[
        	{
                text:"确认",
                iconCls:"icon-disk",
                handler:function(){
                    orderSign();
                }
            },
            {
                text:"返回",
                iconCls:"icon-cancel",
                handler:function(){
                    $("#showSignDialog").dialog("destroy");
                }
            }
        ],
        onLoad:function(){
     		//$('#showSignDialog').window('center');  
			$("#docAsnDetailsConfirmDataGrid").datagrid({
				width:"auto",
			    height:"auto",
			    nowrap:false,
			    striped:true,
			    border:true,
			    collapsible:false,//是否可折叠的
			    fit:true,//自动大小	   
			    remoteSort:false,
			    idField:"sku",
			    sortName:"sku",
		        sortOrder:"asc",	
		        pagination:false,		       
			    singleSelect:true,//是否单选   
			    rownumbers:true,//行号
			    fitColumns:true,
			    showFooter:true,			   
			    columns: siViewColumns,
			    /* loadFilter:function(data) { 
			    	//排序拦截器
		    		sortFilter($(this), data);		    	
		    		return data;
		        }, */
		        groupField:'signType',
	            view: groupview,
	            groupFormatter:function(value, rows){	            	
	            	if(rows.length>0){
	            		var receiveQty = 0;
	            		var rejectedQty = 0;
	            		var damagedQty = 0;
	            		$.each(rows, function(){
	            			receiveQty = CalcAmount.add(receiveQty, this.receiveQty);
	            			damagedQty = CalcAmount.add(damagedQty, this.damagedQty);
	            			rejectedQty = CalcAmount.add(rejectedQty, this.rejectedQty);
	            		});
	            		//var prifix = "[签收合计："+ receiveQty + ", 残次合计："+ damagedQty +", 退货合计："+ rejectedQty +"]";
	            		var prifix = "[签收合计："+ receiveQty + ", 退货合计："+ rejectedQty +"]";
	            		return formatter(value, window.parent.docAsnSignType) + ' - ' + rows.length + '条明细' + prifix;
	            	}
	                return "";
	            },
	            rowStyler: function(index,row){
	            	if(row && typeof row.signType != "undefined"){
	            		if(row.signType=='10'){ 		                
		                    return 'color:green;font-weight:bold;';  
		                }else if(row.signType=='20'){ 
		                	return 'color:#FF9933;font-weight:bold;';  
		                }else if(row.signType=='30'){ 
		                	return 'color:red;font-weight:bold;';  
		                } 
	            	}                 
			   	},
			    loadMsg:"数据加载中请稍后……",
			    emptyMsg:"没有符合条件的记录"
			}).datagrid("loadData", currDetailData);    		
		},
		onClose:function(){
       		$(this).dialog("destroy");
       	}
	});
}


/**
 * 删除单个
 */
function delOne(rowIndex){	
	var rowData = currOrderDetailDataGrid.datagrid('getRows')[rowIndex];	
	for(var i in currDetailData) {	
		if(existSku(currDetailData[i], rowData.sku)) {
			currDetailData.splice(i,1);	
			break;
		}
	}	
	currOrderDetailDataGrid.datagrid("deleteRow",rowIndex).datagrid("loadData", currDetailData);
}


//商品列表刷新
function skuListReLoad() {
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);
}

/**
 * 校验并组装保存的数据 
 */
function getSaveData(){
	
	var isValid0 = currOrderDetailDataGrid.datagrid("isValid");		
	var isValid = $orderfm.form('validate');
	if (!isValid || !isValid0){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}			
	
	var baseInfo = formJson($orderfm);
	
	var saveData = {
	     "params": {
	    	 "asnNo": $("#asnNo",$orderfm).val(),
			 "header": baseInfo,
			 "details": currDetailData
			},
	     "saveUrl": "${api}/doc/asn/saveEntity"
	}
	return saveData;
}

//获取取消订单的参数
function getOrderCancelData(){
	var saveData = {
	     "params": {
	    	"memo":  $("#memo",$orderfm).textbox("getValue")
	      },
	     "saveUrl": "${api}/doc/asn/status/${cancelStatus}?asnNos="+ $("#asnNo",$orderfm).val()
	}
	return saveData;
	
}

/**
 * 校验并组装保存的数据 
 */
function getSignData(){
	
	var isValid0 = currOrderDetailDataGrid.datagrid("isValid");		
	var isValid = $orderfm.form('validate');
	if (!isValid || !isValid0){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}				
	var baseInfo = formJson($orderfm);	
	var saveData = {
	     "params": {
	    	 "asnNo": $("#asnNo",$orderfm).val(),
			 "header": baseInfo,
			 "details": currDetailData
			},
	     "saveUrl": "${api}/doc/asn/saveEntity"
	}
	return saveData;
}

/**
 * 保存成功后触发
 */
function afterSaveFunc(){
	parent.closeCurrTab("reflushDataGrid");
}



/******************************    供选择商品的子页面使用      ********************************/


/**
 * 获取一行中sku的数量
 */
function getSkuQty(skuDto){
	return skuDto.receiveQty;
}

/**
 * 更新一行中sku的数量
 */
function setRowSkuQty(targetRow, sourceRow){
	targetRow.receiveQty = sourceRow.qty;
}


/**
 * 获取一行中sku的单价
 */
function getSkuPrice(skuDto){
	return skuDto.price;
}

/**
 * 补发商品列表中是否存在该sku对应的商品
 */
function existSku(skuData, sku){		
	if(skuData.sku == sku) {		
		return true;				
	}
	return false;
}

</script>