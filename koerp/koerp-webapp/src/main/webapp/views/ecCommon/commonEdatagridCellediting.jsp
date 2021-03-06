<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="${api}/views/ecCommon/js/commonEdatagridCellediting.js"></script>

<style type="text/css">

.datagrid-row-over, .datagrid-header td.datagrid-header-over {
    background: #eaf2ff;
    color: #000000;
    cursor: default;
}

.datagrid-row-selected {
  background: #ffe48d;
  color: #000000;
}

</style> 


<script type="text/javascript">

var currPageNumber =1;
var currPageSize =15;
var fixedPageSize =15;


/****************************************    门店商品库存做缓存       ******************************************/
var enableSkuArr = [];

/**
 * 远程获取可用商品库存
 */
function remoteEnableSkuQty(url, params){
	var enableQty = 0;
	$.ajax({
		type : "GET",
		async: false,
		url : url,
		contentType:"application/json;charset=utf-8",
		data: params,
		dataType : "json",
		success : function(result) {
			if(result.status){
				enableQty = result.entry;
			}				
		}				
	}); 
	return enableQty;
}

//本地获取可用商品对应的存库
function localEnableSkuQty(companyShopSku){
	var enableQty = null;
	$.each(enableSkuArr,function(){
		if(this.companyShopSku == companyShopSku){
			enableQty = this.enableQty;
			return;
		}
	});
	return enableQty;
}

//存储可用商品对应的存库
function pushEnableSkuQty(companyShopSku, enableQty){
	enableSkuArr.push({
		"companyShopSku": companyShopSku,
		"enableQty": enableQty
	});
}

//清空可用商品对应的存库
function clearEnableSkuQty(){
	enableSkuArr = [];
}

/****************************************    门店商品库存做缓存       ******************************************/
 




/**
 * 判别某行是否被选中状态
 */
function rowSelected($grid, rowIndex, rowData){
	console.log(rowIndex);
	var rows = $grid.datagrid("getSelections");
	for (var row in rows) {
		var currIndex = $grid.datagrid("getRowIndex", row);
		if(rowIndex == currIndex){
			return true;
		}
	}
	return false;
}

/**
 * 结束行编辑
 */
function endRowEditing($grid){
	var opts = $grid.datagrid("options");
	if(opts.editCellIndex != undefined && opts.editCellField != undefined){
		return endEditing(opts.editCellField);
	}
	return true;
}

/**
 * 排序拦截器
 */
function sortFilter($grid, data){
	
	var sortColumn = $grid.datagrid("options").sortName;
	var orderby = $grid.datagrid("options").sortOrder;
	
	var originalRows = data.originalRows;
	//列表加载数据第2次及以后排序
	if(typeof originalRows !="undefined" && originalRows.length>0){				   			
		originalRows.sort(arrayCompare(sortColumn, orderby));    			
	}else{
		//列表第一次加载数据排序初始化
		if (typeof data.length == 'number' && typeof data.splice == 'function'){
			if(data.length>0){
				data.sort(arrayCompare(sortColumn, orderby)); 
			}			 
		}		  	
	}
}

/**
 * 分页及查询过滤器
 */
function pagerFilter($grid, data, fields, totalcolumn){

	if (typeof data.length == 'number' && typeof data.splice == 'function'){
        data = {
            total: data.length,
            rows: data,
            originalTotal: data.length
        }
    }
 
    var opts = $grid.datagrid('options');
    if (!data.originalRows){
        data.originalRows = data.rows;      
    }

    if (opts.searchValue) {
    	data.currOriginalRows = [];
    	$.each(data.originalRows,function(){
    		var row = this;
    		if((row.materialname && row.materialname.match(opts.searchValue)!=null)
    			|| (row.materialcode && row.materialcode.match(opts.searchValue)!=null)
	    		   || (row.sku && row.sku.match(opts.searchValue)!=null)) {
    			data.currOriginalRows.push(row);
    		}
    	});
    	//获取首页的数据(需要初始化分页数据，即回到第一页)
    	data.total = data.currOriginalRows.length;
    	
    	//获取下一页的数据
        var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);       
    	if(data.total>start){     	
            data.rows = data.currOriginalRows.slice(start, end);
    	}else{   		
    		data.rows = data.currOriginalRows.slice(0, fixedPageSize);
    		$grid.datagrid({
    			pageNumber:1,
                pageSize:fixedPageSize   			
    		});           
    	}
          
    } else {  	
    	data.currOriginalRows = data.originalRows;
    	data.total = data.originalTotal;

    	//获取下一页的数据
        var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);
        data.rows = data.currOriginalRows.slice(start, end);
    }

    if(typeof fields != "undefined" && fields.length>0){
    	//添加合计行
        data.footer = commonGetFooter(data.currOriginalRows, fields, totalcolumn);
    }   

    //初始化下一页的翻页监听事件
    var pager = $grid.datagrid('getPager');
    pager.pagination({
        onSelectPage:function(pageNum, pageSize){
        	//当前页编辑单元格校验判别
        	if(endRowEditing($grid)){
        		
                //记录当前页的分页参数
                currPageNumber = pageNum;
                currPageSize = pageSize;            

                //刷新到下一页的分页参数
                opts.pageNumber = pageNum;
                opts.pageSize = pageSize;
                pager.pagination('refresh',{
                    pageNumber:pageNum,
                    pageSize:pageSize
                });
                $grid.datagrid('loadData',data);
        	}else{        		
        		//刷新到当前页的分页参数
        		pager.pagination('refresh',{
                    pageNumber:currPageNumber,
                    pageSize:currPageSize
                });
        	}
        }
    });
    return data;
}



/**************************          私有方法                        ******************************/


/**
 * 初始化补发单
 */
function initReissueDetails(currDetail){
	var reissueDetail = {};
	reissueDetail.aftersalestatus = currDetail.aftersalestatus;
	reissueDetail.bandid = currDetail.bandid;
	reissueDetail.bandname = currDetail.bandname;
	reissueDetail.categoryid = currDetail.categoryid;
	reissueDetail.categoryname = currDetail.categoryname;
	reissueDetail.companycode = currDetail.companycode;
	reissueDetail.discountprice = currDetail.discountprice;
	reissueDetail.giftsid = currDetail.giftsid;
	reissueDetail.isbuy = currDetail.isbuy;
	reissueDetail.materialcode = currDetail.materialcode;
	reissueDetail.materialname = currDetail.materialname;
	reissueDetail.materialproperty = currDetail.materialproperty;
	reissueDetail.materialweight = currDetail.materialweight;
	reissueDetail.memo = currDetail.memo;
	reissueDetail.orderlineid = currDetail.orderlineid;
	reissueDetail.orderqty = currDetail.orderqty;
	reissueDetail.payprice = currDetail.payprice;
	reissueDetail.saleprice = currDetail.saleprice;
	reissueDetail.sku = currDetail.sku;
	reissueDetail.totalprice = currDetail.totalprice;	
	return reissueDetail;
}

</script>