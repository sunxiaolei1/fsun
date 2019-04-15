<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<style>
.toolbar{
	height:30px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	background: #f3f3f3;
	padding-top:2px;
}

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

<div id="addtoolbar" class="toolbar" data-options="region:'center'">	
	<a href="#" class="easyui-linkbutton" iconCls="icon-cog_add" plain="true" onclick="toPayAccount()">结帐</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="cancel()">取消</a>			
</div> 

<script type="text/javascript">

/**
 * 预览单据
 */
function toPayAccount(){
	
	var saveData = getSaveData();
	if(saveData!=null){
		var paramsData = saveData.params;
		var isTrue = toPayAccountWin(paramsData);
		if(isTrue){
			initPayModes(paramsData);
			$("#payAccountWin").window("open");
		}		
	}	
}

/**
 * 初始化支付方式
 */
function initPayModes(paramsData){
	var details = paramsData.details;
	var isAllSmoke = true;
	if(details!=null && details.length>0){
		$.each(details, function(){
			if(this.categoryCode!='110'){
				isAllSmoke = false;
			}
		});
	}
	if(!isAllSmoke){
		$("#discountBtn").hide();
	}else{
		$("#discountBtn").show();
	}
}

/**
 * 初始化支付信息
 */
function initPayAccountData(paramsData){
	//清空
	currPayAccountData = [];	
	var header = paramsData.header;
	var toZeroPrice = header.toZeroPrice;	
	if(toZeroPrice!=null && toZeroPrice>0){
        currPayAccountData.push({
        	"payMode": 900,
        	"receptPrice": toZeroPrice,
        	"dibPrice": 0,
        	"payPrice": 0,
        	"discountAmount": toZeroPrice
        });
	}
	
	var balancePrice = Number(header.orderPrice) - Number(header.toZeroPrice);
	if(balancePrice==0){
		currPayAccountData.push({
        	"payMode": 2,
        	"receptPrice": 0,
        	"dibPrice": 0,
        	"payPrice": 0,
        	"discountAmount": 0
        });
	}
	
	
}

/**
 * 打开结帐界面
 */
function toPayAccountWin(paramsData){

	//初始化支付信息
	initPayAccountData(paramsData);
	
	var header = paramsData.header;
	$payAccountfm.form("load", header);
	//初始支付余额
	$("#balancePrice",$payAccountfm).val(header.orderPrice-header.toZeroPrice);
	
	currPayAccountDataGrid.datagrid({
		view:footerStyleView,
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,
	    sortName:"payMode",
        sortOrder:"asc",	
        //pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    singleSelect:false,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    showFooter:true,
	    toolbar: "#payAccountToolbar",
	    columns: payAccountColumns,
	    loadFilter:function(data) {     		
    		var fields = ["receptPrice","payPrice","dibPrice","discountAmount"];       		
    		//排序拦截器
    		sortFilter($(this), data);		
    	    //分页拦截器
    	    var data = pagerFilter($(this), data, fields, "payMode"); 

    	    //同步订单头金额信息   	       	    		
   	    	$("#payPrice", $payAccountfm).numberbox("setValue", Number(data.footer[0].payPrice));
   	    	$("#dibPrice", $payAccountfm).numberbox("setValue", Number(data.footer[0].dibPrice));
    	    $("#discountPrice", $payAccountfm).numberbox("setValue", 
   	    		Number(data.footer[0].discountAmount) - $("#toZeroPrice", $payAccountfm).numberbox("getValue"));   	    	
   	    	$("#receptPrice", $payAccountfm).numberbox("setValue", 
   	    		Number(data.footer[0].receptPrice)-Number(data.footer[0].discountAmount));
			return data; 
        },
        rowStyler:function(index,row){	    		    	
    		if (row.payMode=="合计:"){//这里是判断哪些行
                return 'font-weight:bold;';  
            }	
    		return "";
		},
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    selectOnCheck: true,
	    checkOnSelect: true
	}).datagrid("loadData", currPayAccountData);
	
	return true;
}



/**
 * 保存单据
 */
function saveData(){
	//获取保存数据
	var saveData = getSaveData();
	if(saveData!=null){		
		if(typeof afterSaveFunc === 'function'){	
			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), null, afterSaveFunc);
		}else{
			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), cancel);
		}		
	}	
}


/**
 * 取消
 */
function cancel(){
	parent.closeCurrTab();
}

</script>