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
	    columns: columns,
	    loadFilter:function(data) { 
	    	//排序拦截器
    		sortFilter($(this), data);
    		//分页拦截器
    		return pagerFilter($(this), data);   
        },
        onAfterEdit: function(rowIndex, rowData, changes){	
        	if(rowData.maxQty < changes.qty){
        		rowData.qty = rowData.maxQty;
        	}
        	$(this).datagrid("refreshRow", rowIndex);				
	    },
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录"
	});
     
});


//显示寄提明细确认dialog
function showTakeOutView(){

	$("<div></div>").dialog({
		id:"showSoDialog",
	    title:"寄提单【"+ $("#takeId",$orderfm).textbox("getValue") +"】出库明细",
	    width:"95%",
	    height:"360px",
	    closed:false,
	    cache:false,
	    href:"${api}/bus/take/toShowTakeOutView",
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
                    orderTakeOut();
                }
            },
            {
                text:"返回",
                iconCls:"icon-cancel",
                handler:function(){
                    $("#showSoDialog").dialog("destroy");
                }
            }
        ],
        onLoad:function(){
        	
        	currOrderDetailDataGrid.datagrid("isValid");	
        	var viewDetailData = [];
     		$.each(currDetailData, function(){
     			var that = cloneObj(this);
     			if(that.qty>0){
     				if(that.maxQty==that.qty){
         				that.takeTypeName = "完全寄提";
         			}else if(that.maxQty>that.qty){
         				that.takeTypeName = "部分寄提";
         			}
         			viewDetailData.push(that);
     			}	
     		}); 
			$("#busTakeDetailsConfirmDataGrid").datagrid({
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
			    columns: columns,
		        groupField:'takeTypeName',
	            view: groupview,
	            groupFormatter:function(value, rows){	            	
	            	if(rows.length>0){
	            		var qty = 0;
	            		$.each(rows, function(){
	            			qty += Number(this.qty);
	            		});
	            		var prifix = "[寄提合计："+ qty +"]";
	            		return value + ' - ' + rows.length + '条明细' + prifix;
	            	}
	                return "";
	            },
	            rowStyler: function(index,row){
	            	if(row && typeof row.takeTypeName != "undefined"){
	            		if(row.takeTypeName=='完全寄提'){ 		                
		                    return 'color:green;font-weight:bold;';  
		                }else if(row.takeTypeName=='部分寄提'){ 	
		                	return 'color:#FF9933;font-weight:bold;';  
		                }
	            	}                 
			   	},
			    loadMsg:"数据加载中请稍后……",
			    emptyMsg:"没有符合条件的记录"
			}).datagrid("loadData", viewDetailData);    		
		},
		onClose:function(){
       		$(this).dialog("destroy");
       	}
	});
}


//商品列表刷新
function skuListReLoad() {
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);
}

/**
 * 校验并组装保存的数据 
 */
function getTakeOutData(){
	
	var isValid0 = currOrderDetailDataGrid.datagrid("isValid");		
	var isValid = $orderfm.form('validate');
	if (!isValid || !isValid0){
		$.messager.alert("错误", "提交的数据不正确!", "error");  
		return null;
	}				
	var baseInfo = formJson($orderfm);	
	var saveData = {
	     "params": {
	    	 "takeId": $("#takeId",$orderfm).textbox("getValue"),
			 "header": baseInfo,
			 "details": currDetailData
			},
	     "saveUrl": "${api}/bus/take/saveEntity"
	}
	return saveData;
}

//获取取消订单的参数
function getOrderCancelData(){
	var saveData = {
	     "params": {
	    	"memo":  $("#memo",$orderfm).textbox("getValue")
	      },
	     "saveUrl": "${api}/bus/take/status/${cancelStatus}?takeIds="+ $("#takeId",$orderfm).textbox("getValue")
	}
	return saveData;
	
}

/**
 * 保存成功后触发
 */
function afterSaveFunc(){
	
	var requestFrom = "${requestFrom}";
	if(requestFrom=='take'){
		parent.closeCurrTab("reflushDataGrid");
	}else{
		parent.closeCurrTab("parent.refreshCurrTab");	
	}		
}



/******************************    供选择商品的子页面使用      ********************************/


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